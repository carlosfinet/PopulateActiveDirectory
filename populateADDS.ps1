Import-Module ActiveDirectory
$totalusers = 100
for ($i=0; $i -lt $totalusers; $i++) 
{ 
 $userID = "{000:000}" -f ($i + 1)
 $userName = "Student$userID"
 
 Write-Host "Creating AD user" ($i + 1) "of" $totalusers ":" $userName
 
New-ADUser `
 -Name $userName  `
 -Path  "OU=Schiller,DC=Sched,DC=Local" `
 -SamAccountName $userName `
 -AccountPassword (ConvertTo-SecureString "Password1" -AsPlainText -Force) `
 -Enabled $true
 Add-ADGroupMember "Schiller_Students" $userName;
 }
