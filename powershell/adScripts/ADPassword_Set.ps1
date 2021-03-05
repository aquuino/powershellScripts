Import-Module ActiveDirectory
# Set the new password
$newPassword = ConvertTo-SecureString -AsPlainText "Welcome!" -Force
# Import users from CSV
Import-Csv "C:\reset.csv" | ForEach-Object {
$samAccountName = $_."samAccountName"
 
# Reset user password.
Set-ADAccountPassword -Identity $samAccountName -NewPassword $newPassword -Reset
 
# Force user to reset password at next logon.
Set-AdUser -Identity $samAccountName -ChangePasswordAtLogon $true
Write-Host " AD Password has been reset for: "$samAccountName
}