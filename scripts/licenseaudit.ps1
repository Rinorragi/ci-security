$licenseJson = dotnet delice ./ci-security.sln --json | ConvertFrom-Json
$ReturnArray = @()
$licenseJson.Projects | ForEach-Object { $_.licenses | Select-Object -ExpandProperty expression | ForEach-Object { $ReturnArray += $_ } }
$ReturnArray
