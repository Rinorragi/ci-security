param(
  [Parameter(Mandatory = $true)]
  [string]$jsonPath
)

$scancodeJson = Get-Content $jsonPath | ConvertFrom-Json
$ReturnArray = @()
$scancodeJson.license_detections | Select-Object -ExpandProperty license_expression_spdx | ForEach-Object { $ReturnArray += $_ }
$ReturnArray | Sort-Object | Get-Unique
