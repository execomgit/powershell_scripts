#####################################
# PowerShell IF Statement examples  #
#####################################

# // =================== VARIABLES ================ //
$varContainer = 3

# if($varContainer -eq 1){
#     Write-Host "We evaluated: TRUE"
# }

# if($varContainer -eq 1){
#     Write-Host "We evaluated: TRUE"
# }
# else{
#     Write-Host "We evaluated: False"
# }

# $varContainer = 5
if($varContainer -gt 1 -and $varContainer -lt 4){
    Write-Host "varContainer value is < 1 and >4"
}


