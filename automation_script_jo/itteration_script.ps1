###############################################################################################################
# Language     :  PowerShell 3.0
# Filename     :  itteration_script.ps1
# Autor        :  Nenad Samardzic
# Description  :  Simple script used for itterating defined range of number sequence 
# Repository   :  local
###############################################################################################################

<#
    .SYNOPSIS
    
    .DESCRIPTION
    Simple script used for itterating defined range of number sequence 
    

#>


# // =================== VARIABLES ================ //
$startValue = 45 # Defines the START VALUE for range of the numbers that we want to itterate
$endValue = 125 # Defines the END VALUE (-1) for the range of the numbers that we want to itterate
$itterateEnd = 4 # Defines the NUMBER OF ITTERATIONS (-1) per number that we want to itterate

# Itteration loop
Write-Host "`n********* Itteration start *********"
for ($i = $startValue; $i -lt $endValue; $i++) {    
    for ($count = 1; $count -lt $itterateEnd; $count++) {
        $i;               
    }
    
}


