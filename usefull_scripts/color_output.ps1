$services = Get-WmiObject -Class Win32_Service | write-output

foreach ($objItem in $services) {
if($objItem.State -eq 'Stopped')
{
      write-host $objItem.DisplayName, $objItem.State  -foregroundcolor "red"
      }
      else
      {
       write-host $objItem.DisplayName, $objItem.State -foregroundcolor "green"
      }
}