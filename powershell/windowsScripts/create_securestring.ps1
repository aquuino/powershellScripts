$user = "USER"
$password = "PWD"
$secureStringPwd = $password | ConvertTo-SecureString -AsPlainText -Force 
$creds = New-Object System.Management.Automation.PSCredential -ArgumentList $user, $secureStringPwd


$secureStringText = $secureStringPwd | ConvertFrom-SecureString 
Set-Content "C:\users\maquino\Password.txt" $secureStringText