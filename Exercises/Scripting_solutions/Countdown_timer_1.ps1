# Countdown something between (25 and 50 seconds)
for ($i = 0; $i -lt 100; $i++) {
    if ($i -lt 10) {
        $co = "Just starting"
    }
    elseif ($i -lt 25) {
        $co = "Fully started"
    }
    elseif ($i -lt 75) {
        $co = "Doing the work"
    }
    else {
        $co = "Finishing up"
    }


    Write-Progress -PercentComplete $i -Activity "Time until time is up" -CurrentOperation $co
    Start-Sleep -Milliseconds (Get-Random -Minimum 250 -Maximum 500)
}

# get-help Write-Progress -Online
