# MovieToGif
PowerShell module calling ffmpeg to convert a movie to gif

## Development and Testing
```powershell
Import-Module -Path ".\modules\MovieToGif"
```

## Prepare Local Repository
```powershell
New-Item -Path C:\ -Name "PSModuleRepository" -ItemType Directory
PS51> Register-PSRepository -Name 'PSModuleRepository' -SourceLocation 'C:\PSModuleRepository' -PublishLocation 'C:\PSModuleRepository' -InstallationPolicy Trusted
```

## Publish Module
```powershell
Publish-Module -Path ".\modules\MovieToGif" -Repository LocalPSModuleRepository
```

## Install Module
```powershell
Install-Module -Name MovieToGif -Repository LocalPSModuleRepository
Import-Module MovieToGif
```
