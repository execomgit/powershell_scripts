#####################################
# PowerShell IF Statement examples  #
#####################################

# // =================== VARIABLES ================ //


# Simple IF statement
$varContainer = 1
Write-Host "`n********* Simple IF statement *********"
if($varContainer -eq 1){
    Write-Host "We evaluated: TRUE"
}


# IF / ELSE statement
$varContainer = 3
Write-Host "`n********* IF / ELSE statement *********"
if($varContainer -eq 1){
    Write-Host "We evaluated: TRUE"
}
else{
    Write-Host "We evaluated: FALSE"
}

# IF / ELSE IF / ELSE statement
$varContainer = 3
Write-Host "`n********* IF / ELSE IF / ELSE statement *********"
if($varContainer -lt 1){
    Write-Host "Entered number is < 1"
}
elseif ($varContainer -gt 10) {
    Write-Host "Entered number is > 10"
}
else {
    Write-Host "We evaluated: Correct"
}



# IF statement additional conditional statements
Write-Host "`n********* Display values from "ObjectPropertyName" row *********"
$varContainer = 5
if($varContainer -gt 1 -and $varContainer -lt 4){
    Write-Host "varContainer value is < 1 and >4"
}
else{
    Write-Host "None of conditions Match."
}


