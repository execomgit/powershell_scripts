######################
# ForEach examples  #
######################

# Clears the screen
cls


Write-Host "//////////////////////////////////////////////////////////////////////////////////////"

# Return ALL properties and round them to two decimals (("{0:N2}" -f )
Get-PSDrive | Where-Object {$_.free -gt 1} | ForEach-Object{
            $c = 0; 
            Write-Host "This step runs only once."
        }{
            $c = $c + 1;
            Write-Host "This section runs for each object in the pipe." $c
        }{
            Write-Host "This step runs once everything is done. The value of C variable is." $c 
        }
    
    

    
Write-Host "//////////////////////////////////////////////////////////////////////////////////////"

# Return ALL properties and round them to two decimals (("{0:N2}" -f )

Get-PSDrive | Where-Object{$_.Free -gt 1} | ForEach-Object{
        $Count = 0; 
        Write-Host "";
    }{ 
        $_.Name + ": Used: " + "{0:N1}" -f ($_.Used/1gb) + " Free: " + "{0:N2}" -f ($_.Free/1gb) + " Total: " + "{0:N2}" -f (($_.Used/1gb) + ($_.Free/1gb)); 
        $Count = $Count + $_.Free;
    }{
        Write-Host "";
        Write-Host "Total free space " ("{0:N2}" -f ($Count/1gb)) -backgroundColor green
        }


Write-Host "//////////////////////////////////////////////////////////////////////////////////////"


