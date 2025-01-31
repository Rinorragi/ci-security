param(
  [Parameter(Mandatory = $true)]
  [string]$domain
)

$nmapResult = nmap -sV --script ssl-enum-ciphers -p 443 $domain
$ciphers = $nmapResult | Select-String "TLS_" | ForEach-Object { $_[0].Line.Substring(8) }
$gradeRow = ($nmapResult | Select-String "least strength:")[0][0].Line
$grade = $gradeRow.Substring($gradeRow.Length - 1, 1)
$result = @()
$result += $grade
$result += $ciphers
$result
