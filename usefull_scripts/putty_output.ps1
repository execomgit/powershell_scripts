#This script read lines on a com port for X Minutes  
# usage:  
# - configure the script parameters  
# - run it using powershell from the command line  
#   to send the results to a text file, redirects the pipeline to a text file like this:  
#   type "powershell" + "enter"  
#   then type ".\ReadCOMPort.ps1 > c:\temp\COMXPortData.txt" + "enter"  
#  
# -- PARAMETERS --  
$DelaySeconds=60  
$PORT='COM17'  
$BAUDRATE=115200  
$Parity=[System.IO.Ports.Parity]::None # System.IO.Ports.Parity  
$dataBits=8  
$StopBits=[System.IO.Ports.StopBits]::one # System.IO.Ports.StopBits  
# END PARAMETERS ---------------------------------  
  
  
$period = [timespan]::FromSeconds($DelaySeconds)  
$port= new-Object System.IO.Ports.SerialPort $PORT,$BAUDRATE,$Parity,$dataBits,$StopBits  
$port.Open()  
  
  
# Debug  
#Write-Output 'PORT OPENED'  
$StartTime = Get-Date  
  
  
# Gets the data from the com port for the specified interval  
while ((Get-Date) - $StartTime -lt $period) {   
  $message=$port.ReadLine()  
  Write-Output $message  
}  
$port.Close()  
  
  
#Debug  
#Write-Output 'PORT CLOSED'  
#--  