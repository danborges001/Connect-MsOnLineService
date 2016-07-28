Function Connect-MsOnLineService{
	$UserCredential = Get-Credential
	$SessionProperties = @{'ConfigurationName' = 'Microsoft.Exchange'
										'ConnectionUri' = 'https://outlook.office365.com/powershell-liveid/'
										'Credential' = $UserCredential
										'Authentication' = 'Basic'}

	Connect-MSOLService -Credential $UserCredential
	$Session = New-PSSession  @SessionProperties -AllowRedirection
	Import-Module (Import-PSSession $Session -AllowClobber) -Global
}