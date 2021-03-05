$query = (Get-HotFix | Select-Object -Property HotfixID,Description,InstalledOn)[-1] 

ConvertTo-Csv -InputObject $query -Delimiter "|" | Select-Object -Skip 2