[CmdletBinding()]
param()

$fileList = git ls-files --others --exclude-standard --modified

Write-Host "These are the files that you have modified or are about to add:" -ForegroundColor Green
$fileList | ForEach-Object { Write-Host $_ -ForegroundColor Green }

exit 1
