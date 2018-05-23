#################################
# PowerShell FOR loop examples  #
#################################

# // =================== VARIABLES ================ //
$cow | Get-Member

$math |Get-Member

# Simple FOR loop
$math = 5 + 5
Write-Host "`n********* Simple IF statement *********"
for ($i = 1; $i -lt 10; $i++) {
    Write-Host "Math is: $math";
    Write-Host "I is: $i";
    $math = $math + $i;
    Write-Host "New Math is: $math`n" -ForegroundColor Green;
}



