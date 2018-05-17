# Get-Help Where-Object -Examples
# Get-Help Where-Object -online
# Get-Help CommandName -Detailed
# Get-Help CommandName -Full
# CommandName -?

# "$_" represents current object in the pipe
# -gt (greather than) or 
# -eq (equal to)
# -match

cls

# Return properties with value different than 0
Get-PSDrive | Where-Object {$_.free -gt 1}
Write-Host "//////////////////////////////////////////////////////////////////////////////////////"

# Return Selected properties (Root, Free)
Get-PSDrive | Where-Object {$_.free -gt 1} | Select-Object Root, Free
Write-Host "//////////////////////////////////////////////////////////////////////////////////////"

# Return ALL properties
Get-PSDrive | Where-Object {$_.free -gt 1} | Select-Object *
Write-Host "//////////////////////////////////////////////////////////////////////////////////////"

# Return ALL properties and display it in gigabytes (($_.Free/1gb))
Get-PSDrive | Where-Object {$_.free -gt 1} | ForEach-Object {Write-Host "Free space for" $_.root " = " ($_.Free/1gb) "Gb" -foregroundColor green}
Write-Host "//////////////////////////////////////////////////////////////////////////////////////"


# Return ALL properties and round them to two decimals (("{0:N2}" -f )
Get-PSDrive | Where-Object {$_.free -gt 1} | ForEach-Object {Write-Host "Free space for" $_.root " = " ("{0:N2}" -f ($_.Free/1gb)) "Gb" -foregroundColor green}
Write-Host "//////////////////////////////////////////////////////////////////////////////////////"


# Rounding the numbers (("{0:N2}" -f )
"{0:N2}" -f 1000000 # Round to 2 decimals
"{0:C2}" -f 1000000 # Round to curency
"{0:P2}" -f 1000000 # Round to percentage
Write-Host "//////////////////////////////////////////////////////////////////////////////////////"