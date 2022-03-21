function generate-accountname {
    param (
        [string] $firstname,
        [string] $lastname,
        [switch] $isTeacher
    )
    
    $firstname = $firstname.Replace(" ","")
    $lastname = $lastname.Replace(" ","")

    if(($firstname.Length + $lastname.Length) -gt 19)
    {
        $firstname = $firstname[0]
    }

    if(($firstname.Length + $lastname.Length) -gt 19)
    {
        $lastname = $lastname.Substring(0,18)
    }

    if($isTeacher)
    {
        return $firstname + "." + $lastname
    }
    else
    {
        return $lastname + "." + $firstname
    }
}

generate-accountname -firstname "rudi" -lastname "penne" -isTeacher
generate-accountname -firstname "rudi" -lastname "penne"
generate-accountname -firstname "Alejandro Martinez" -lastname "Peeters"
generate-accountname -firstname "Alejandro Martinez" -lastname "Don Quixote de plancha"