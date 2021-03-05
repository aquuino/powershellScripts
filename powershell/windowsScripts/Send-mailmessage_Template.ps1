#Matthew Aquino 2020-09-08
#Project to send an email containing a random string from a list
#May set this up as an automated Job/Response to something

################################################################################################################

#Import Credientials from Securestring Text

$username = "SANITIZEDm"
$pwdTxt = Get-Content "C:\pass.txt"
$securePwd = $pwdTxt | ConvertTo-SecureString 
$credObject = New-Object System.Management.Automation.PSCredential -ArgumentList $username, $securePwd


## Define the Send-MailMessage parameters

$credential = $credObject

$mailParams = @{
    SmtpServer                 = 'smtp.office365.com'
    Port                       = '587' # or '25' if not using TLS
    UseSSL                     = $true ## or not if using non-TLS
    Credential                 = $credential
    From                       = 'SANITIZED'
    To                         = 'SANITIZED'#
    Subject                    = "SMTP Function Test - $(Get-Date -Format g)"
    Body                       = 'This is a test email using SMTP Function'
    DeliveryNotificationOption = 'OnFailure', 'OnSuccess'
}

## Send the message
Send-MailMessage @mailParams

################################################################################################################

#List of Messages that can be sent &&Research how to do this (Array,List,Dict,etc)&&
