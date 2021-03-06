function Set-ProperCapitalisation
{
    Param (
    [Parameter(Mandatory=$True,Position=1)]
    [string]$text
    )

    $text = $text.Substring(0,1).ToUpper() + $text.Substring(1).ToLower()

    if($text.Contains(" "))
    {
        $text = $text.Substring(0,$text.IndexOf(" ")+1) + ( Set-ProperCapitalisation -text $text.Substring($text.IndexOf(" ")+1) )

    }

    return $text
}

#Or…

function Set-ProperCapitalisation
{
    Param (
        [Parameter(Mandatory=$True,Position=1)]
        [string]$text
    )

    # https://www.powershellmagazine.com/2013/07/24/pstip-how-to-convert-words-to-title-case/
    return (Get-Culture).TextInfo.ToTitleCase($text.ToLower())
}

