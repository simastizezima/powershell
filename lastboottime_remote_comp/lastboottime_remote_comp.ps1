$computer = "compname"
$bootUpTime = Get-WmiObject Win32_OperatingSystem -Comp $computer | select -Exp LastBootUpTime

#Converting

[System.Management.ManagementDateTimeConverter]::ToDateTime($bootUpTime)

