################################
# PowerShell ARRAYS examples  #
################################

# // =================== VARIABLES ================ //
$filePath = "C:\Build"

# Initialize empty Array 
# (The array sub-expression operator creates an array, even if it contains zero or one object)
$arrayOfProcesses = @()

# Clears the screen
cls



$Processes = Get-Process


Write-Host "`n--- List of processes ---"

$Processes

Write-Host "`n//////////////////////////////////////////////////////////////////////////////////////`n"

foreach($processElement in $Processes)
{
    if ($processElement.WS/1mb -gt 100) {
        
    }
        $arrayOfProcesses += New-Object psobject -Property @{
            'ProcessName' = $processElement.name;
            'WorkingSet' = $processElement.ws;
            # 'Process ID' = $processElement.id;           
            # 'Processor' = $processElement.s;
        }
}

# Exporting content of the "arrayOfProcesses" to CSV file
Write-Host "`n********* Export content of the "arrayOfProcesses" to CSV *********"
$arrayOfProcesses | select 'ProcessName', 'WorkingSet' | Export-Csv .\file.csv  -NoTypeInformation

# Import content of the CSV file to new array
Write-Host "`n********* Import content of the CSV file to new array *********"
$CSVImport = Import-Csv .\file.csv

# Process the content of the array
Write-Host "`n`n********* Import content of the CSV file to new array *********"
foreach($dog in $CSVImport){
    Write-Host "ProcessName: " $dog.processname "Working Set: " $dog.Workingset
}

# Modification of the output - looks prettier
Write-Host "`n`n********* Import content of the CSV file to new array *********"
$CSVImport | Format-Table -AutoSize

Write-Host "`n********* Filter out process by array number *********"
$CSVImport[17].ProcessName

Write-Host "`n`n********* Filter out process by name *********"
$CSVImport -match "firefox"




