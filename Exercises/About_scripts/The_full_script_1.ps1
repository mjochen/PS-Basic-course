#Requires -Version 3.0

<#
.SYNOPSIS
Shows a cat fact.
.DESCRIPTION
Show a random cat fact downloaded from the internet. Can be played as audio.
.EXAMPLE
CatFact -Type Cat -PlayAudio
Plays cat fact message through speakers.
.EXAMPLE
CatFact -Type Dog
Displays dog fact on the default output.
.PARAMETER Type
Defines whether you are a cat, dog, giraffe or chuck norris-person.
.PARAMETER PlayAudio
Switch that defines that audio will be played, or output is only output to the screen.
#>

param(
    [Parameter(Mandatory = $True,
        ValueFromPipeline = $true)]
    [ValidateSet("cat", "dog", "giraffe", "chucknorris", "other")]
    [string]$Type,
    [switch]$PlayAudio
)

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
