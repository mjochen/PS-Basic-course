# oneliner
$profile | Get-Member -MemberType NoteProperty | ForEach-Object { Remove-Item -Path $profile.$($_.Name) -WhatIf -ErrorAction SilentlyContinue }

# script
$allMembers = $profile | Get-Member -MemberType NoteProperty

foreach($member in $allMembers)
{
Remove-Item -Path $profile.$($member.Name) -WhatIf -ErrorAction SilentlyContinue
}
