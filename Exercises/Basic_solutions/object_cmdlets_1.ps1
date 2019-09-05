Get-Command –name *object* -Module "*Utility", "*Core"

# or...

Get-Command -Noun object  # Missess Register-ObjectEvent
Get-Command -Noun object*  # Good!