######################################################################################
# List files from Targeted location  #
######################################################################################

# Set "filePath" variable with the targeted location
$filePath = "c:\Build\"

# set output file location
$outputLocation = "d:\output.txt"

# Call the location parameter stored in "filePath" variable
cd $filePath

# List available content
ls >> $outputLocation