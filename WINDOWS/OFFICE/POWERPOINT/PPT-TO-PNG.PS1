# https://gist.github.com/ap0llo/5c5f5aadb885fe918000b248e5dd6e36

# Powershell script to export Powerpoint slides as jpg images using the Powerpoint COM API

function Export-Slide($PPTPath, $slideNumber, $outputFile)
{
	# Load Powerpoint Interop Assembly
	[Reflection.Assembly]::LoadWithPartialname("Microsoft.Office.Interop.Powerpoint") > $null
	[Reflection.Assembly]::LoadWithPartialname("Office") > $null

	$msoFalse =  [Microsoft.Office.Core.MsoTristate]::msoFalse
	$msoTrue =  [Microsoft.Office.Core.MsoTristate]::msoTrue

	# start Powerpoint
	$application = New-Object "Microsoft.Office.Interop.Powerpoint.ApplicationClass" 

	# Make sure inputFile is an absolte path
	$$PPTPath = Resolve-Path $$PPTPath
   
	$presentation = $application.Presentations.Open($PPTPath, $msoTrue, $msoFalse, $msoFalse)
	
	$slide = $presentation.Slides.Item($slideNumber)
	$slide.Export($outputFile, "JPG")
	
	$slide = $null
	
	$presentation.Close()
	$presentation = $null
	
	if($application.Windows.Count -eq 0)
	{
		$application.Quit()
	}
	
	$application = $null     
}

#MESSAGEBOXES FOR FUTURE USE
	#[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')
	#$title = 'User Input'
	#$msg   = 'Please enter address for PowerPoint:'
	#$PPTPath = [Microsoft.VisualBasic.Interaction]::InputBox($msg, $title)

	#[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')
	#$title = 'User Input'
	#$msg   = 'How many slides:'
	#$slideNumber = [Microsoft.VisualBasic.Interaction]::InputBox($msg, $title)

$PPTPath = 'C:\Users\' + $env:UserName + '\Downloads\TARGET.pptx'

try
{
    New-Item ('C:\Users\' + $env:UserName + '\Downloads\PPT-EXPORT\') -itemType Directory
}
catch{}

for ($num = 1; $num -lt 7; $num++)
{
    $outputFile = 'C:\Users\' + $env:UserName + '\Downloads\PPT-EXPORT\' + $num + '.png'
    Export-Slide -PPTPath $PPTPath -slideNumber $num -outputFile $outputFile
}
	# Make sure references to COM objects are released, otherwise powerpoint might not close
	# (calling the methods twice is intentional, see https://msdn.microsoft.com/en-us/library/aa679807(office.11).aspx#officeinteroperabilitych2_part2_gc)
	[System.GC]::Collect();
	[System.GC]::WaitForPendingFinalizers();
	[System.GC]::Collect();
	[System.GC]::WaitForPendingFinalizers();    
