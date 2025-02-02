[CmdletBinding()]
param(
  [Parameter(Mandatory = $true, Position = 0)]$commitMsgFile
)

$commitMessage = Get-Content $commitMsgFile
$ticketPrefix = "Lab"
$allowedKeywords = @("Add", "Update", "Remove", "Refactor", "Rename", "Move", "Fix") -join '|'

# match to "<ticketprefix>-<nnn>: <Keyword> something" syntax
$regexString = "^" + $ticketPrefix + "-\d+: ($allowedKeywords) .{2,}"
if (($commitMessage -match $regexString)) {
  exit 0 # success
}

Write-Host "Commit message has to follow '$ticketPrefix-<n>: <$allowedKeywords> something' syntax." -ForegroundColor Red
exit 1 # failure
