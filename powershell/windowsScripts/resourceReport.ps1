###############################################################################################################
# Language     :  PowerShell
# Filename     :  resourceReport.ps1
# Author       :  matthew-git-hub (https://github.com/Matthew-git-hub)
# Description  :  Queries the target system and sends an email contaitning the free memory and disk space
###############################################################################################################

$hostname = $hostname = (Get-WmiObject -class Win32_ComputerSystem -Property DNSHostName).DNSHostName | Out-String
try 
{
         ###Queries the system Memory formats the size as 1MB 
        $ram = Get-WmiObject -Class Win32_OperatingSystem  | 
        Select-Object DeviceID, 
        @{'Name'="TotalMemory";expression={[Math]::Round($_.TotalVisibleMemorySize / 1MB,0) }},
        @{'Name'="FreeMemory"; expression={[Math]::Round($_.FreePhysicalMemory / 1MB,0) }}

        ###Queries the system Disk formats the size as 1GB 
        $disks = Get-WmiObject Win32_LogicalDisk -Filter DriveType=3 | 
        Select-Object DeviceID, 
        @{'Name'='Size'; 'Expression'={[math]::truncate($_.size / 1GB)}}, 
        @{'Name'='Freespace'; 'Expression'={[math]::truncate($_.freespace / 1GB)}}
        
}
catch {
 
        Write-Host "There was an error fetching resources"
        exit
}

###Creates output and stores as a variable

$memResults = $ram.DeviceID + $ram.FreeMemory.ToString("N0") + "GB / " + $ram.TotalMemory.ToString("N0") + "GB"

try {

###Mail Parameters
$ToAddress = "SANITIZED"
        $FromAddress = "SANITIZED"
        $SMTPServer = "smtp.office365.com"
        $SMTPPort = "587"
        $SMTPPassword = ConvertTo-SecureString "SANITIZED" -AsPlainText -Force
        $SMTPCredentials = New-Object System.Management.Automation.PSCredential ($FromAddress, $SMTPPassword)

        $mailParams = @{

            To = $ToAddress
            From = $FromAddress
            Subject = $hostname.trim() + " Memory/Storage Report"
            SmtpServer = $SMTPServer
            Port = $SMTPPort
            UseSSL = $true
            Credential = $SMTPCredentials
        }


###HTML body of the email unable to use HTMl when part of the $mailParams block
$body = "<b>Memory<b></br>"
$body += ($memResults | Out-String) + "<br>"
$body += "<b>Storage<b></br>"
$body += foreach ($disk in $disks)
{
    $disk.DeviceID + $disk.FreeSpace.ToString("N0") + "GB / " + $disk.Size.ToString("N0") + "GB"

 }

###Sends the email
Send-MailMessage @mailParams -body $body -BodyAsHtml
}

catch {
   Write-Host "There was an error sending the email"     
   exit
}
