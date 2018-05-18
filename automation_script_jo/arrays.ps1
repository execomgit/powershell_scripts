################################
# PowerShell ARRAYS examples  #
################################

# // =================== VARIABLES ================ //


# Clears the screen
cls


# Initialize empty Array 
# (The array sub-expression operator creates an array, even if it contains zero or one object)
$arrayOfProcesses = @()


$Processes = Get-Process

Write-Host "`n--- List of processes ---"
$Processes

Write-Host "`n//////////////////////////////////////////////////////////////////////////////////////`n"

foreach($processElement in $Processes)
{
    if ($processElement.WS/1mb -gt 100) {
        
    }
        $arrayOfProcesses += New-Object psobject -Property @{
            'Process ID' = $processElement.id;
            'ProcessName' = $processElement.name;
            'WorkingSet' = $processElement.ws;
            'Processor' = $processElement.s;
        }
}

$arrayOfProcesses

# Originale value is unchanged 


Write-Host "`n--- IndexOf command output ---"