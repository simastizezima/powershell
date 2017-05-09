Dim shell,command
command = "powershell.exe -file ""C:\Scripts\notif\server_monitor.ps1"
Set shell = CreateObject("WScript.Shell")
shell.Run command,0