$servers = Get-Content "serverlist.txt" 
$portToCheck = '902'

foreach ($server in $servers) {

    If ( Test-Connection $server -Count 1 -Quiet) {
    
        try {       
            $null = New-Object System.Net.Sockets.TCPClient -ArgumentList $server,$portToCheck
            $props = @{
                Server = $server
                PortOpen = 'Yes'
            }
        }

        catch {
            $props = @{
                Server = $server
                PortOpen = 'No'
            }
        }
    }

    Else {
        
        $props = @{
            Server = $server
            PortOpen = 'Server did not respond to ping'
        }
    }

    New-Object PsObject -Property $props

}

