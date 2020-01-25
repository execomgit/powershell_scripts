################################
# PowerShell ARRAYS examples  #
################################

# // =================== VARIABLES ================ //


# Clears the screen
cls


# Initialize empty Array 
# (The array sub-expression operator creates an array, even if it contains zero or one object)
$arrayOfFiles = @()
$filePath = "C:\Build"


# $Processes = Get-Process
Set-Location $filePath
$FilesList = Get-ChildItem

Write-Host "`n--- List of Child items ---"

$FilesList

Write-Host "`n//////////////////////////////////////////////////////////////////////////////////////`n"

foreach($FileName in $FilesList)
{
    if ($FileName.Name > 1) {
        $arrayOfFiles = $FileName.Name 
        
    }    
      
}

$arrayOfFiles

