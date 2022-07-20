Import-Csv C:\Users\%USERNAME%\Downloads\OFFICE365USERS.csv |`
    ForEach-Object {
        $UPN = $_.UPN
        $NewAlias = $_.NewAlias
        Write-Host $UPN
        Write-Host $NewAlias
        Set-Mailbox $UPN -EmailAddresses "SMTP:$NewAlias","$UPN"
    }
