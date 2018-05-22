#######################################
# PowerShell ForEach object examples  #
#######################################

# // =================== VARIABLES ================ //
$TotalNumber = 0

# Store the values imported from CSV to ARRAY
$csvArray = Import-Csv .\csv\file_colors.csv
$csvArray

# Display values from "ObjectPropertyName" row
Write-Host "`n********* Display values from "ObjectPropertyName" row *********"
foreach($Container in $csvArray){
    Write-Host "The name is:" $Container.ObjectPropertyName
}

# Display values from "ObjectPropertyName" colorized by "ObjectPropertyColor"
Write-Host "`n********* Display values from ObjectPropertyName colorized by ObjectPropertyColor *********"
foreach($Container in $csvArray){
    Write-Host "The name is:" $Container.ObjectPropertyName -ForegroundColor $Container.ObjectPropertyColor;
    $TotalNumber = $TotalNumber + $Container.ObjectPropertyNumber

    if($Container.ObjectPropertyNumber -gt 100){
        Write-Host "This Entries of ObjectPropertyNumber are greater than 100:" $Container.ObjectPropertyNumber
    }
}

# Display the sum of Array "ObjectPropertyNumber"
Write-Host "`n********* Display the sum of Array "ObjectPropertyNumber" *********"
$TotalNumber

