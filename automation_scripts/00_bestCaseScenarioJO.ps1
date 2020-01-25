######################################################################################
# THIS SCRIPT WILL STOP WHEN IT LOADS DAMAGED XML FILE, YOU CAN CTOP IT WITH CTRL+C  #
######################################################################################

cd C:\Users\uidk2028\Desktop\HIVAL\20180418HiVal\HiVal\Main_Code\Projects\AutomatedTestFramework\AutomatedTest\DebugModuleTest
$exePath = "C:\Users\uidk2028\Desktop\HIVAL\20180418HiVal\HiVal\Main_Code\Projects\AutomatedTestFramework\AutomatedTest\DebugModuleTest\AutomatedTest.exe"
$inputXMLFolder = "C:\Users\uidk2028\Desktop\HIVAL\20180418HiVal\HiVal\Main_Code\Projects\AutomatedTestFramework\AutomatedTest\DebugModuleTest\Sequences\20180514Vazba\"
$xmlFiles = Get-ChildItem -Path $inputXMLFolder -Filter *.xml | Where {$_.Name -notlike "*Results*"} | Foreach-Object {
    $inputXMLFilePath = $inputXMLFolder + $_.Name
    Write-Host $inputXMLFilePath + "START"
    & $exePath -testseq:$inputXMLFilePath
    Write-Host $inputXMLFilePath + "END"
}