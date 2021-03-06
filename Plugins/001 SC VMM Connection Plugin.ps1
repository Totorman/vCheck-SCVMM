$Title = "SC VMM Connection Plugin"
$Header ="SC VMM Connection Plugin"
$Comments = "SC VMM Connection Plugin"
$Display = "Table"
$Author = "Jan Egil Ring"
$PluginVersion = 1.0
$PluginCategory = "SC VMM"

if (-not (Get-Module virtualmachinemanager) -or (Get-PSSnapin -Name Microsoft.SystemCenter.VirtualMachineManager -ErrorAction silentlycontinue)){
if (-not (Get-Module virtualmachinemanager)) {

if (Get-Module -ListAvailable -Name virtualmachinemanager) {
Import-Module virtualmachinemanager
}

}

if (-not (Get-PSSnapin -Name Microsoft.SystemCenter.VirtualMachineManager -ErrorAction silentlycontinue)) {
	
   if (Get-PSSnapin -Registered -Name Microsoft.SystemCenter.VirtualMachineManager -ErrorAction silentlycontinue) {
   Add-PSSnapin Microsoft.SystemCenter.VirtualMachineManager
}

}

}

if (-not (Get-Module virtualmachinemanager) -or (Get-PSSnapin -Name Microsoft.SystemCenter.VirtualMachineManager -ErrorAction silentlycontinue)){
Write-Warning "SC VMM PowerShell cmdlets not available, the script is terminating"
break
}

if (Get-Command Get-SCVMMServer -CommandType Cmdlet -ErrorAction silentlycontinue) {
$VMMServer = Get-SCVMMServer -ComputerName $Server
}
else {
$VMMServer = Get-VMMServer -ComputerName $Server
}


Write-CustomOut "Collecting VM Host Objects"


switch -wildcard ($VMMServer.ProductVersion) 
    { 
        "2.*" {$VMHosts = Get-VMHost | Sort-Object name} 
        "3.*" {$VMHosts = Get-SCVMHost | Sort-Object name} 
        default {break}
    }


Write-CustomOut "Collecting VM Objects"


switch -wildcard ($VMMServer.ProductVersion) 
    { 
        "2.*" {$VMs = Get-VM | Sort Name} 
        "3.*" {$VMs = Get-SCVirtualMachine | Sort Name} 
        default {break}
    }


Write-CustomOut "Collecting VM Host Cluster Objects"

switch -wildcard ($VMMServer.ProductVersion) 
    { 
        "2.*" {$VMHostClusters = Get-VMHostCluster | Sort-Object name} 
        "3.*" {$VMHostClusters = Get-SCVMHostCluster | Sort-Object name} 
        default {break}
    }