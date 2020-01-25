# initialize the items variable with the
# contents of a directory
$arrayItems = @()
$items = Get-ChildItem -Path "C:\Build"

# enumerate the items array
foreach ($itemElement in $items)
{
    if ($itemElement.Attributes -eq "power")
    {
          Write-Host $itemElement.Name #displaying

          $arrayItems = $itemElement.Name #storing in array

    }

          

      
}

$arrayItems
