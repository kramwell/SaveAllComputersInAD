#Written by kramwell.com - 05/DEC/2017
#Simple script to save all computers in Active Directory and output to text file

Import-Module ActiveDirectory

$LogTime = Get-Date -Format "MM-dd-yyyy_HH-mm-ss"
$CSVFile = "ComputersInAD(" + $LogTime + ").txt"

if(Test-Path $CSVFile) {
	#Remove file before creating a new one.
	Remove-Item -path $CSVFile
}

#here we get ad list in var
$ADComputers = Get-ADComputer -Filter {Name -like "*"} -Property Name

#and loop to csv file
Foreach ($Computer in $ADComputers)
{
	#Write-Host $Computer.Name
	$Computer.Name >> $CSVFile
}

Write-Host File saved!