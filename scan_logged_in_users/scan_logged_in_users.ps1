$network = Read-Host 'Witch network? e.g(65):'
for ($i=2; $i -le 254; $i++){
cls
Write-Progress -Activity "Doing my job, just leave me:  $i%" -status "Ping hostname 10.100.$network.$i"  -percentComplete ($i / 256 * 100)

	if (Test-Connection 10.100.$network.$i -Count 1 -ErrorAction SilentlyContinue){
    Write-Output "10.100.$network.$i" | Out-File -Append c:\Scripts\scan_logged_in_users\active.txt
	$active = Get-content "C:\Scripts\scan_logged_in_users\active.txt"
		foreach ($user in $active){
			$loggedinuser = wmic /node: 10.100.$network.$i computersystem get username 
			$ErrorAction= 'silentlycontinue'
			$ipaddress = Write-Output "10.100.$network.$i"
			$result = $loggedinuser + $ipaddress | Out-File -Append c:\Scripts\scan_logged_in_users\inprogress.txt
			Set-ItemProperty 'C:\Scripts\scan_logged_in_users\inprogress.txt' -name Attributes -Value "Hidden"
			$hash = @{}
			gc c:\Scripts\scan_logged_in_users\inprogress.txt | %{if($hash.$_ -eq $null) { $_ }; $hash.$_ = 1} > c:\Scripts\scan_logged_in_users\loggedin_users.txt
		} 
  }
  else{
    Write-Output "10.100.$network.$i" | Out-File -Append c:\Scripts\scan_logged_in_users\nonactive.txt
  }
}

