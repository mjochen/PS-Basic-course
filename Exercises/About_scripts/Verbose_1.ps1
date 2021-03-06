Write-Verbose "Showing $type-fact."

Switch ($Type.ToLower()) {
    "cat" {
        $Fact = (ConvertFrom-Json (Invoke-WebRequest -Uri 'https://the-cat-fact.herokuapp.com/api/randomfact')).data.fact
    }
    "dog" {
        $Fact = (ConvertFrom-Json (Invoke-WebRequest -Uri 'https://dog-api.kinduff.com/api/facts')).facts
    }
    "giraffe" {
        $all = (Invoke-WebRequest -Uri 'http://www.randomgiraffefacts.com/index.cgi')
        $Fact = ($all.AllElements | Where-Object tagname -eq "H3" | Select-Object -First 1).innerHTML
    }
    "chuckNorris" {
        $Fact = (ConvertFrom-Json (Invoke-WebRequest -Uri 'https://api.chucknorris.io/jokes/random')).Value
    }
    default {
        $Fact = "A `"$type`" may or may not be a real animal."
    }
}

if ($PlayAudio) {
    Write-Verbose "Playing `"$Fact`" through speakers"
    Add-Type -AssemblyName System.Speech
    $SpeechSynth = New-Object System.Speech.Synthesis.SpeechSynthesizer
    $SpeechSynth.Speak($Fact)
}
else {
    Write-Verbose "Writing to screen"
    Write-Output $Fact
}

