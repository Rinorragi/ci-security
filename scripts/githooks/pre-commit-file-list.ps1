[CmdletBinding()]
param()

# Staged files that are about to be committed
$fileList = git diff --cached --name-only

Write-Host "These are the files that you have modified or are about to add:" -ForegroundColor Green
Write-Host "---------------------------------------------------------------"
$fileList | ForEach-Object { Write-Host $_ -ForegroundColor Green }
Write-Host "---------------------------------------------------------------"
Write-Host "You could do some analysis here before commit happens"

exit 0 # Commit succeed
# exit 1 # Commit would fail
