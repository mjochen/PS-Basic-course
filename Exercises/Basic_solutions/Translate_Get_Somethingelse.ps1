$allGet = Get-Command -verb "Get"
$list = @()

foreach($get in $allGet)
{
    $text = "New-Alias "
    $text += $get.Name.Replace("Get", "HaalOp").Replace("Windows","venster")
    $text += " "
    $text += $get.Name

    $list += $text
}

$list