#Written by Matthew Aquino 
#Polls Servers defined in $servers for free Memory.

$server = @("COMPUTERNAME")


ForEach ($ in $server)
{

$ram = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $server | 
        Select-Object DeviceID, 
        @{'Name'="TotalMemory";expression={[Math]::Round($_.TotalVisibleMemorySize / 1MB,0) }},
        @{'Name'="FreeMemory"; expression={[Math]::Round($_.FreePhysicalMemory / 1MB,0) }}

$server

ForEach ($i in $ram)
    {
    $ram.DeviceID + $ram.FreeMemory.ToString("N0") + "GB / " + $ram.TotalMemory.ToString("N0") + "GB"
    }

}



