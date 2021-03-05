    $range = 1..254

    $range | ForEach-Object {

      $address = “192.168.2.$_”

      Write-Progress “Scanning Network” $address -PercentComplete (($_/$range.Count)*100)

      New-Object PSObject -Property @{

        Address = $address

        Ping = Test-Connection $address -Quiet -Count 2

      }

    } | Out-File C:\\IpscanResult.csv