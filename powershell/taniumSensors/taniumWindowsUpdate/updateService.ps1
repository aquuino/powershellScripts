$query = Get-Service -Name wuauserv | Select-Object -ExpandProperty Status

Write-Output -InputObject $query