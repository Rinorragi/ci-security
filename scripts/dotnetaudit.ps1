# Remove unneccessary text from output with null
# Run dotnet list package including transitives and output that
$null = dotnet list package --vulnerable --include-transitive | Tee-Object vulnerable.out

function CalculateVulnLines {
  param($RegexString)
  $vulnsResult = get-content .\vulnerable.out | Select-String -Pattern $RegexString
  $vulnCount = $vulnsResult | Measure-Object -Line
  $vulnCount.Lines
}

$vCritical = CalculateVulnLines " Critical "
$vHigh = CalculateVulnLines " High "
$vModerate = CalculateVulnLines " Moderate "
$vLow = CalculateVulnLines " Low "

# Return the amount of vulnerabilities
$vTotal = $vCritical + $vHigh + $vModerate + $vLow
Write-Output $vTotal
