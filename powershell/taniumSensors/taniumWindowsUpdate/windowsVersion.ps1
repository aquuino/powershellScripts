$query = Get-WmiObject -Class win32_OperatingSystem | Select-Object -Property Version,BuildNumber

ConvertTo-Csv -InputObject $query -Delimiter "|" | Select-Object -Skip 2