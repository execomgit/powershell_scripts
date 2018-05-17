###############################
# File Manipulation examples  #
###############################

# VARIABLES
$fileLocation = "d:\" 


# Clears the screen
cls

Write-Host "//////////////////////////////////////////////////////////////////////////////////////"

# Return ALL properties and round them to two decimals (("{0:N2}" -f )
Get-Alias md
Get-Alias dir

cd $fileLocation

# Create folder in designated location
New-Item -ItemType Directory "Temp_Folder"

# Create file in designate location
New-Item -ItemType File "test.txt"

dir

Write-Host "//////////////////////////////////////////////////////////////////////////////////////"

# Copy items with power shell
Copy-Item .\test.txt .\Temp_Folder


# Move item with Power Shell - Recurse -Force
Move-Item .\test.txt .\Temp_Folder -force
