$OUpath = 'SANITIZED'
$ExportPath = 'c:\users_in_${OUPath}.csv'
Get-ADUser -Filter * -SearchBase $OUpath | Select-object DistinguishedName,Name,UserPrincipalName | Export-Csv -Path $ExportPath
