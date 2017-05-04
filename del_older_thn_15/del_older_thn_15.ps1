$limit = (Get-Date).AddDays(-15) #days before
$path = "C:\folder"
$current_date = Get-Date -Format g

#Add new row with current time in log.txt on every start
Add-Content C:\Scripts\log.txt "---------- $current_date -------------"
#Delete all files older than the $limit.
Get-ChildItem -Path $path -Recurse -Force | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt $limit } | Add-Content C:\Scripts\log.txt | Remove-Item -Force 



