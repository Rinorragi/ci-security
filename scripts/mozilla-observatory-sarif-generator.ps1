param(
  # Which domain to scan
  [Parameter(Mandatory = $true)]
  $domain,
  # Where to generate the report
  [Parameter()]
  [string]
  $fileName = "mdn.sarif.json"
)

function Strip-String {
  param(
    [Parameter()]
    $stringToStip)
  ($stringToStip + "").Replace("\r", "").Replace("\n", "").Replace("<p>", "").Replace("</p>", "").Trim()
}

$mozillaResultJson = mdn-http-observatory-scan $domain

# Convert JSON to PS Object
$mozillaTestResults =
$mozillaResultJson
| ConvertFrom-Json
| Select-Object -ExpandProperty tests

# Convert PSObject graph into array of custom objects
$testResults =
$mozillaTestResults
| Get-Member -MemberType NoteProperty
| Select-Object -ExpandProperty Name
| ForEach-Object {
  $test = $mozillaTestResults.$_
  [PSCustomObject]@{
    Pass        = $test.pass
    Name        = Strip-String $test.title
    MessageText = Strip-String $test.recommendation
    Score       = $test.score_modifier
    RuleId      = Strip-String $test.result
    Description = Strip-String $test.score_description
    Link        = Strip-String $test.link
  }
}
| Where-Object { $_.Pass -eq $False } # Take only failing results (SARIF does not exactly support pass=true type of results)

$sarifResultJsonTemplate = @"
{
  "version": "2.1.0",
  "`$schema": "https://docs.oasis-open.org/sarif/sarif/v2.1.0/os/schemas/sarif-schema-2.1.0.json",
  "runs": [
    {
      "tool": {
        "driver": {
          "version": "1.0",
          "semanticVersion": "1.0.0",
          "name": "MDN-SARIF",
          "fullName": "Mozilla Observatory SARIF generator",
          "informationUri": "https://github.com/Rinorragi/ci-security/blob/main/scripts/mozilla-observatory-sarif-generator.ps1",
          "rules": []
        }
      },
      "results": []
    }
  ]
}
"@

$sarifResult = $sarifResultJsonTemplate | ConvertFrom-Json
$sarifPhysicalLocationTemplate = [PSCustomObject]@{
  physicalLocation = [PSCustomObject]@{
    artifactLocation = [PSCustomObject]@{
      uri = $domain
    }
    region           = [PSCustomObject]@{
      startLine   = 1
      startColumn = 1
      endLine     = 9999
      endColumn   = 9999
    }
  }
}

$null =
$testResults
| ForEach-Object {
  # Add to results
  $sarifResult.runs[0].results += [PSCustomObject]@{
    ruleId    = ($_.RuleId + "")
    level     = "error"
    kind      = "fail"
    message   = [PSCustomObject]@{
      text = ($_.RuleId + "")
    }
    locations = @($sarifPhysicalLocationTemplate)
  }
  # Add to tool rules
  $sarifResult.runs[0].tool.driver.rules += [PSCustomObject]@{
    id               = ($_.RuleId + "")
    name             = ($_.Name + "")
    shortDescription = [PSCustomObject]@{
      text = ($_.Description + "")
    }
    fullDescription  = [PSCustomObject]@{
      text = ($_.Description + "")
    }
    help             = [PSCustomObject]@{
      text = ($_.Description + "")
    }
    helpUri          = ("https://developer.mozilla.org" + $_.Link)
    properties       = [PSCustomObject]@{
      precision           = "very-high"
      severity            = "error"
      "security-severity" = "6"
    }
  }
}

$null = $sarifResult | ConvertTo-Json -Depth 10 | Out-File $fileName



