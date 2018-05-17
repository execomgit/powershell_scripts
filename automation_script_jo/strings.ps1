################################
# PowerShell Strings examples  #
################################

# VARIABLES
$cow = "Shane was here !" 
$upVariable = "House is Red !"

# Clears the screen
cls

$cow.ToUpper()

$cow.ToLower()

Write-Host "`n//////////////////////////////////////////////////////////////////////////////////////`n"

# Updating the variables
$upVariable.Replace("is","was")

# Originale value is unchanged 
$upVariable

Write-Host "`n//////////////////////////////////////////////////////////////////////////////////////`n"

# Updating the variables
$upVariable = $upVariable.Replace("is","was")

# Originale value is changed
$upVariable

Write-Host "`n//////////////////////////////////////////////////////////////////////////////////////`n"

# Replacing the character in filename
Get-ChildItem

Get-ChildItem | Where-Object{$_.name.Contains("T")} | ForEach-Object{
    Rename-Item $_ -NewName $_.name.Replace("T","Z")
    }
   
Get-ChildItem


Get-ChildItem | Where-Object -Property name -Like -Value "*Z*" | ForEach-Object{
    Rename-Item $_ -NewName $_.name.Replace("Z","T")
    }
    
Get-ChildItem
    