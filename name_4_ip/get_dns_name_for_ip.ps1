$lista = Get-Content "lista.txt"

$output = @()

foreach ($i in $lista){

	$out = $null
	$currentEAP = $ErrorActionPreference
    $ErrorActionPreference = "silentlycontinue"

	$out = [System.Net.Dns]::gethostentry($i)

	If ($out){
        $blank = "   "
		$output += [string]$out.HostName += $blank += $i
		
		
     }Else{
		$output += "$i   - no hostname found"
	}
}

$output | Out-File outlista.txt

$output


