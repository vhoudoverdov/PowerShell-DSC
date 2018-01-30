# PowerShell DSC Configuration Script for installing Media Player Classic-Home Cinema (MPC-HC) versions 1.7.9, 1.7.8, and 1.7.7 on Windows'
# Vasken Houdoverdov
#
# See the Example\ directory for sample usage.

 Configuration VH_xMPC
  {
      param
      (
          [ValidateSet("1.7.9","1.7.8","1.7.7")] 
          [string]$VersionNumber = "1.7.9",
          [ValidateSet("x64","x86")] 
          [string]$Architecture = "x64",
          [string]$LocalPath = "$env:SystemDrive\Windows\DtlDownloads\MPC-HC."+$VersionNumber+"."+$Architecture+".exe"
      )

       Import-DscResource -ModuleName PSDesiredStateConfiguration
       Import-DscResource -ModuleName xPSDesiredStateConfiguration

    if($VersionNumber -eq "1.7.9")
    {
        if($Architecture -eq "x64")
        {
        $URI = "https://binaries.mpc-hc.org/MPC%20HomeCinema%20-%20x64/MPC-HC_v"+$VersionNumber+"_"+$Architecture+"/MPC-HC."+$VersionNumber+"."+$Architecture+".exe"
        $Name = "MPC-HC $VersionNumber (64-bit)"
        }
        else
        {
        $URI = "https://binaries.mpc-hc.org/MPC%20HomeCinema%20-%20Win32/MPC-HC_v"+$VersionNumber+"_"+$Architecture+"/MPC-HC."+$VersionNumber+"."+$Architecture+".exe"
        $Name = "MPC-HC $VersionNumber"
        }

    }
    if($VersionNumber -eq "1.7.8")
    {
        if($Architecture -eq "x64")
        {
        $URI = "https://stable.mpc-hc.org/MPC%20HomeCinema%20-%20x64/MPC-HC_v"+$VersionNumber+"_"+$Architecture+"/MPC-HC."+$VersionNumber+"."+$Architecture+".exe"
        $Name = "MPC-HC $VersionNumber (64-bit)"
        }
        else
        {
        $URI = "https://stable.mpc-hc.org/MPC%20HomeCinema%20-%20Win32/MPC-HC_v"+$VersionNumber+"_"+$Architecture+"/MPC-HC."+$VersionNumber+"."+$Architecture+".exe"
        $Name = "MPC-HC $VersionNumber"
        }
    }
    if($VersionNumber -eq "1.7.8")
    {
        if($Architecture -eq "x64")
        {
        $URI = "https://stable.mpc-hc.org/MPC%20HomeCinema%20-%20x64/MPC-HC_v"+$VersionNumber+"_"+$Architecture+"/MPC-HC."+$VersionNumber+"."+$Architecture+".exe"
        $Name = "MPC-HC $VersionNumber (64-bit)"
        }
        else
        {
        $URI = "https://stable.mpc-hc.org/MPC%20HomeCinema%20-%20Win32/MPC-HC_v"+$VersionNumber+"_"+$Architecture+"/MPC-HC."+$VersionNumber+"."+$Architecture+".exe"
        $Name = "MPC-HC $VersionNumber"
        }
    }
        if($VersionNumber -eq "1.7.7")
    {
        if($Architecture -eq "x64")
        {
        $URI = "https://stable.mpc-hc.org/MPC%20HomeCinema%20-%20x64/MPC-HC_v"+$VersionNumber+"_"+$Architecture+"/MPC-HC."+$VersionNumber+"."+$Architecture+".exe"
        $Name = "MPC-HC $VersionNumber (64-bit)"
        }
        else
        {
        $URI = "https://stable.mpc-hc.org/MPC%20HomeCinema%20-%20Win32/MPC-HC_v"+$VersionNumber+"_"+$Architecture+"/MPC-HC."+$VersionNumber+"."+$Architecture+".exe"
        $Name = "MPC-HC $VersionNumber"
        }
    }

      xRemoteFile Downloader
      {
          Uri = $URI      
          DestinationPath = $LocalPath
      }
    
      Package Installer
      {
          Ensure = "Present"
          Path = $LocalPath
          Name = $Name
          ProductId = ''
          Arguments = "/Silent"
          DependsOn = "[xRemoteFile]Downloader"
      }
}