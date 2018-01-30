# Configuration sample for xMPC.
# Vasken Houdoverdov
#
# Each of the calls to Sample_InstallxMPC below will generate a MOF file which can then be fed into Start-DscConfiguration
#
# Sample_InstallxMPC -VersionNumber "1.7.9" -Architecture "x64" -LocalPath "C:\Windows\DtlDownloads\MPC-HC.1.7.9.x64.exe"
# Sample_InstallxMPC -VersionNumber "1.7.9" -Architecture "x86" -LocalPath "C:\Windows\DtlDownloads\MPC-HC.1.7.9.x86.exe"
#
# Sample_InstallxMPC -VersionNumber "1.7.8" -Architecture "x64" -LocalPath "C:\Windows\DtlDownloads\MPC-HC.1.7.8.x64.exe"
# Sample_InstallxMPC -VersionNumber "1.7.8" -Architecture "x86" -LocalPath "C:\Windows\DtlDownloads\MPC-HC.1.7.8.x86.exe"
#
# Sample_InstallxMPC -VersionNumber "1.7.7" -Architecture "x64" -LocalPath "C:\Windows\DtlDownloads\MPC-HC.1.7.7.x64.exe"
# Sample_InstallxMPC -VersionNumber "1.7.7" -Architecture "x86" -LocalPath "C:\Windows\DtlDownloads\MPC-HC.1.7.7.x86.exe"
#
# Note that the silent installation for OSSEC 2.7.1 does not automatically place shortcuts to the Manage Agent utility in the start menu.

Configuration Sample_InstallxMPC
{
    param
    (
	[Parameter(Mandatory)]
	$VersionNumber,
	[Parameter(Mandatory)]
	$LocalPath,
	[Parameter(Mandatory)]
	$Architecture			
    )
	
    Import-DscResource -module xMPC
	
    VH_xMPC mpc
    {
	VersionNumber = $VersionNumber
	Architecture = $Architecture
	LocalPath = $LocalPath
    }
}