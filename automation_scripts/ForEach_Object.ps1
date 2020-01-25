#######################################
# PowerShell ForEach object examples  #
#######################################

# // =================== VARIABLES ================ //


# Store the values imported from CSV to ARRAY
$csvArray = Import-Csv .\csv\contacts_outlook.csv

# Count the number of items in "csvArray" 
Write-Host "`n********* Count the number of items in "csvArray" *********"
$csvArray.Count

# Count the number of items in "csvArray" 
Write-Host "`n********* Show specific row item in "csvArray" *********"
$csvArray[3]."Last Name"

# Display each item from "csvArray" 
Write-Host "`n********* Display each item from "csvArray" *********`n"
$csvArray | ForEach-Object{
    Write-Host "First Name:" $_."First Name" "Last Name:" $_."Last Name" "Email:" $_."E-mail Address"`n
}

# Export specific array elements to a new CSV file
Write-Host "`n********* Export specific array elements to a new CSV file *********"
$csvArray | select 'First Name', 'Last Name', 'E-mail Address' | Export-Csv .\csv\contacts_export.csv  -NoTypeInformation