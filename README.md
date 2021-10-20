# MovieToGif
PowerShell module calling ffmpeg to convert a movie to gif

## Import module for development and testing
```powershell
Import-Module -Path ".\modules\MovieToGif"
```

## Setup local repository
```powershell
New-Item -Path C:\ -Name "PSModuleRepository" -ItemType Directory
Register-PSRepository -Name 'PSModuleRepository' -SourceLocation 'C:\PSModuleRepository' -PublishLocation 'C:\PSModuleRepository' -InstallationPolicy Trusted
```

## Publish Module to local repository
```powershell
Publish-Module -Path ".\modules\MovieToGif" -Repository LocalPSModuleRepository
```

## Install Module from local repository
```powershell
Install-Module -Name MovieToGif -Repository LocalPSModuleRepository
Import-Module MovieToGif
```
