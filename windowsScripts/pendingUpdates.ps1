#creates a windows update searcher and displays pending updates


try {
        $UpdateSession = New-Object -ComObject Microsoft.Update.Session
        $UpdateSearcher = $UpdateSession.CreateupdateSearcher()
        $Updates = @($UpdateSearcher.Search("IsHidden=0 and IsInstalled=0").Updates)
        $Updates | Select-Object Title
}
#Catches any errors that occur
catch {
        
        Write-Host "Error Fetching Pending Updates"
}
