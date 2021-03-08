#DNS Check - DNS server IP you are checking for
$dnsCheck = "IP To check"
# Hostnames
$hostname = (Get-WmiObject -class Win32_ComputerSystem -Property DNSHostName).DNSHostName | Out-String
# DNS Servers
$dnsServers = Get-DnsClientServerAddress | Select-Object -ExpandProperty ServerAddresses

 
For ($i=0 ; $i -lt $dnsServers.Length; $i++) {
    if ($dnsServers[$i] -eq $dnsCheck) {

        # E-mail Output

        $ToAddress = "SANITIZEDm"
        $FromAddress = "SANITIZED"
        $SMTPServer = "smtp.office365.com"
        $SMTPPort = "587"
        $SMTPPassword = ConvertTo-SecureString "SANITIZED" -AsPlainText -Force
        $SMTPCredentials = New-Object System.Management.Automation.PSCredential ($FromAddress, $SMTPPassword)

 

        $mail_parameters = @{

            To = $ToAddress
            From = $FromAddress
            Subject = $hostname.trim() + " has the incorrect DNS server IP"
            Body = $hostname.trim() + " has the incorrect DNS Server IP"
            SmtpServer = $SMTPServer
            Port = $SMTPPort
            Credential = $SMTPCredentials

        }


    Send-MailMessage @mail_parameters -UseSsl

    }

}

 
