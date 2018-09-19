$list = @() # init empty array

$item = New-Object PSCustomObject
$item | Add-Member -MemberType NoteProperty -Name NR -Value 1
$item | Add-Member -MemberType NoteProperty -Name name -Value ("Create new")
$list += $item

$item = New-Object PSCustomObject
$item | Add-Member -MemberType NoteProperty -Name NR -Value 2
$item | Add-Member -MemberType NoteProperty -Name name -Value ("Open existing")
$list += $item

$item = New-Object PSCustomObject
$item | Add-Member -MemberType NoteProperty -Name NR -Value 3
$item | Add-Member -MemberType NoteProperty -Name name -Value ("Report problem")
$list += $item

$item = New-Object PSCustomObject
$item | Add-Member -MemberType NoteProperty -Name NR -Value 4
$item | Add-Member -MemberType NoteProperty -Name name -Value ("Exit program")
$list += $item

$chosenItem = $list | Out-GridView -Title "Select" -OutputMode Single

switch($chosenItem.NR)
{
    1
    {
        Write-Host "Creating new file"
    }

    2
    {
        Write-Host "Opening existing file"
    }

    3
    {
        Write-Host "The problem is not the problem, the problem is your attitude towards the problem"
    }

    default
    {
        Write-Host "Exiting"
    }
}