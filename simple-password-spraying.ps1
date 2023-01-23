$password = "1234" #CHANGE
$domainObj = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
$SearchString = "LDAP://"+ ($domainObj.PdcRoleOwner).Name + "/DC=$($domainObj.Name.Replace('.', ',DC='))"
Get-Content .\users.txt | ForEach-Object{$_+" - "+$(New-Object System.DirectoryServices.DirectoryEntry($SearchString,$_,$password)).Name}
