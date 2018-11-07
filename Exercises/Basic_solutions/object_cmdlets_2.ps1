Get-Command –name *object* | Where-Object { $_.ModuleName -like "*Utility" –or $_.ModuleName -like "*Core" }

# In the Utility class, the “Module” and “ModuleName” are filled in
# In the Core class, only the “ModuleName” is filled in
# The -Module parameter with Get-Command has no difficulty with that

# also works:
Get-Command –name *object* | Where-Object { $_.Module -like "*Utility" –or $_.ModuleName -like "*Core" }

# doesn't work:
Get-Command –name *object* | Where-Object { $_.ModuleName -like "*Utility" –or $_.Module -like "*Core" }

# the problem
Get-Command –name *object* -Module "*Utility", "*Core" | Format-Table Name, module, modulename

# another way:
Get-Command –name *object* | Where-Object { $_.ModuleName -in "Microsoft.PowerShell.Utility", "Microsoft.PowerShell.Core" }

# same, but reversed:
Get-Command –name *object* | Where-Object { "Microsoft.PowerShell.Utility", "Microsoft.PowerShell.Core" -contains $_.ModuleName }
