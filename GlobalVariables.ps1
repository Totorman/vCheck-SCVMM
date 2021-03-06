# You can change the following defaults by altering the below settings:
#

# Set the following to true to enable the setup wizard for first time run
# Note : do not work with Windows 2012 R2 actually, so do your changes here directly
$SetupWizard =$False

# Start of Settings
# Please Specify the IP address or Hostname of the server to connect to
$Server ="scvmm.mydom.local"
# Please Specify the SMTP server address
$SMTPSRV ="localhost"
# Please specify the email address who will send the vCheck report
$EmailFrom ="scvmm@mydom.local"
# Please specify the email address who will receive the vCheck report
$EmailTo ="techs@mydom.local"
# Please specify an email subject
$EmailSubject="SCVMM Status Report"
# Would you like the report displayed in the local browser once completed ?
$DisplaytoScreen =$true
# Use the following item to define if an email report should be sent once completed
$SendEmail =$false
# If you would prefer the HTML file as an attachment then enable the following:
$SendAttachment =$false
# Use the following area to define the title color
$Colour1 ="D6E7F8"
$Colour1 ="FFFFFF"
# Use the following area to define the Heading color=
$Colour2 ="8080FF"
#$Colour2 ="FFFFFF"
# Use the following area to define the Title text color
$TitleTxtColour ="090736"
$TitleTxtColour ="FFFFFF"
# Set the following setting to $true to see how long each Plugin takes to run as part of the report=
$TimeToRun = $true
# Report an plugins that take longer than the following amount of seconds=
$PluginSeconds = 60
# End of Settings=

$Date = Get-Date
