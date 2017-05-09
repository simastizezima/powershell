$ip_list = Get-Content "C:\Scripts\notif\list.txt"
$date = Get-Date -Format g

foreach ($i in $ip_list) {
	
	$a = Test-Connection -computername $i -quiet

	if($a -eq $True){
		Add-Content C:\Scripts\notif\log.txt "--------------------- $date ---------------------"
		Add-Content C:\Scripts\notif\log.txt "$i - $a"
		
		[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

		$objNotifyIcon = New-Object System.Windows.Forms.NotifyIcon 

		$objNotifyIcon.Icon = "C:\Scripts\notif\ico\server.ico"
		$objNotifyIcon.BalloonTipIcon = "Info" 
		$objNotifyIcon.BalloonTipText = "$i server is available" 
		$objNotifyIcon.BalloonTipTitle = "Server available!"
		 
		$objNotifyIcon.Visible = $True 
		$objNotifyIcon.ShowBalloonTip(10000)
		$objNotifyIcon.Visible = $False
		
	} else {
		Add-Content C:\Scripts\notif\log.txt "--------------------- $date ---------------------"
		Add-Content C:\Scripts\notif\log.txt "$i - False"
		
		[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

		$objNotifyIcon = New-Object System.Windows.Forms.NotifyIcon 

		$objNotifyIcon.Icon = "C:\Scripts\notif\ico\server.ico"
		$objNotifyIcon.BalloonTipIcon = "Error" 
		$objNotifyIcon.BalloonTipText = "$i server is unavailable" 
		$objNotifyIcon.BalloonTipTitle = "Server unavailable!"
		 
		$objNotifyIcon.Visible = $True 
		$objNotifyIcon.ShowBalloonTip(10000)
		$objNotifyIcon.Visible = $False
	}
}

