
#Defines temporary locations to delete files from

Stop-Service -Name wuauserv

$tempLocation = @(“C:\Windows\Temp\*”`
,“C:\Users\*\Appdata\Local\Temp\*”`
,"C:\Users\*\Downloads"`
,"C:\Windows\SoftwareDistribution\Download")


Remove-Item $tempLocation -Force -Recurse
Start-Service -Name wuauserv