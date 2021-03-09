#Written by Matthew Aquino 
#Creates an AD User and copies their group membership from the user specified in $copy


# Import active directory module for running AD cmdlets
Import-Module activedirectory
  
#Store the data from ADUsers.csv in the $ADUsers variable | Takes the copy user as a input from the user
$ADUsers = Import-csv C:\bulk_users1.csv
$copy = Read-Host -Prompt "Enter a user to copy group membership from"

#Loop through each row containing user details in the CSV file 
foreach ($User in $ADUsers)
{
	#Read user data from each field in each row and assign the data to a variable as below
		
	$Username 	= $User.username
	$Password 	= $User.password
	$Firstname 	= $User.firstname
	$Lastname 	= $User.lastname
	$OU 		= $User.ou #This field refers to the OU the user account is to be created in
    $email      = $User.email
    $Description = $user.Description
   


	#Check to see if the user already exists in AD
	if (Get-ADUser -F {SamAccountName -eq $Username})
	{
		 #If user does exist, give a warning
		 Write-Warning "A user account with username $Username already exist in Active Directory."
	}
	else
	{
		#User does not exist then proceed to create the new user account
		
        #Account will be created in the OU provided by the $OU variable read from the CSV file
		New-ADUser `
            -SamAccountName $Username `
            -UserPrincipalName "$Username@SANITIZED" `  #Change this to match the domain the user is being created on 
            -Name "$Firstname $Lastname" `
            -GivenName $Firstname `
            -Surname $Lastname `
            -Enabled $True `
            -DisplayName "$Lastname, $Firstname" `
            -Path $OU `
            -EmailAddress $email `
            -Description $description `
			-AccountPassword (convertto-securestring $Password -AsPlainText -Force) -ChangePasswordAtLogon $False
			
		#Gets ADUser membership of copy user            | selects the membership                          | adds the membership to the user
		Get-ADUser -identity $copy -properties MemberOf	| Select-Object MemberOf -ExpandProperty MemberOf | Add-ADGroupMember -members $Username

            
	}
}
