Import-Csv "C:\reset.csv" | ForEach-Object {
$samAccountName = $_."samAccountName"
Set-AdUser -Identity $samAccountName -ChangePasswordAtLogon $true
Write-Host " The following user will have to change their password at login: "$samAccountName
}