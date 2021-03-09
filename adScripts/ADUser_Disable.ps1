foreach($aduser in (import-csv c:\disable.csv)){
    Get-ADUser -filter "samAccountName -eq '$($aduser.samAccountName)'" |
    Set-ADUser -Enabled $false -Description "Disabled on $(get-date)"
}