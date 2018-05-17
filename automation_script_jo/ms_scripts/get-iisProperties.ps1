function get-iisProperties {  
<#    
.SYNOPSIS    
    Retrieves IIS properties for Virtual and Web Directories residing on a server. 
.DESCRIPTION  
    Retrieves IIS properties for Virtual and Web Directories residing on a server. 
.PARAMETER name 
    Name of the IIS server you wish to query.  
.PARAMETER UseDefaultCredentials  
    Use the currently authenticated user's credentials    
.NOTES    
    Name: Get-iisProperties 
    Author: Marc Carter 
    DateCreated: 18Mar2011          
.EXAMPLE    
    Get-iisProperties -server "localhost"  
      
Description  
------------  
Returns IIS properties for Virtual and Web Directories residing on a server.  
#>   
[cmdletbinding(  
    DefaultParameterSetName = 'server',  
    ConfirmImpact = 'low'  
)]  
Param(  
    [Parameter(  
        Mandatory = $True,  
        Position = 0,  
        ParameterSetName = '',  
        ValueFromPipeline = $True)]  
        [string][ValidatePattern(".{2,}")]$server 
)  
    Begin{       
        $error.clear() 
        $server = $server.toUpper() 
        $array = @() 
    } 
 
    Process{ 
        #define ManagementObjectSearcher, Path and Authentication 
        $objWMI = [WmiSearcher] "Select * From IIsWebServer" 
        $objWMI.Scope.Path = "\\$server\root\microsoftiisv2" 
        $objWMI.Scope.Options.Authentication = [System.Management.AuthenticationLevel]::PacketPrivacy 
        $server 
 
        trap { 'An Error occured: {0}' -f $_.Exception.Message; break } 
 
        #Get System.Management.ManagementObjectCollection 
        $obj = $objWMI.Get() 
     
        #Iterate through each object 
        $obj | % {  
            $Identifier = $_.Name 
            [string]$adsiPath = "IIS://$server/"+$_.name 
            $iis = [adsi]$("IIS://$server/"+$_.name) 
            #Enum Child Items but only IIsWebVirtualDir & IIsWebDirectory 
            $iis.Psbase.Children | where { $_.SchemaClassName -eq "IIsWebVirtualDir" -or $_.SchemaClassName -eq "IIsWebDirectory" } | % { 
                $currentPath = $adsiPath+"/"+$_.Name 
                #Enum Subordinate Child Items  
                $_.Psbase.Children | where { $_.SchemaClassName -eq "IIsWebVirtualDir" } | Select Name, AppPoolId, SchemaClassName, Path | % { 
                    $subIIS = [adsi]$("$currentPath/"+$_.name) 
                    foreach($mapping in $subIIS.ScriptMaps){ 
                        if($mapping.StartsWith(".aspx")){ $NETversion = $mapping.substring(($mapping.toLower()).indexOf("framework\")+10,9) } 
                    } 
                    #Define System.Object | add member properties 
                    $tmpObj = New-Object Object 
                    $tmpObj | add-member -membertype noteproperty -name "Name" -value $_.Name 
                    $tmpObj | add-member -membertype noteproperty -name "Identifier" -value $Identifier 
                    $tmpObj | add-member -membertype noteproperty -name "ASP.NET" -value $NETversion 
                    $tmpObj | add-member -membertype noteproperty -name "AppPoolId" -value $($_.AppPoolId) 
                    $tmpObj | add-member -membertype noteproperty -name "SchemaClassName" -value $_.SchemaClassName 
                    $tmpObj | add-member -membertype noteproperty -name "Path" -value $($_.Path) 
                     
                    #Populate Array with Object properties 
                    $array += $tmpObj 
                } 
            } 
        } 
    }#End process 
    End{ 
        #Display results 
        $array | ft -auto 
    } 
}#End function 
 
 
get-iisProperties -server localhost