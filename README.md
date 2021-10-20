# MovieToGif
PowerShell module calling ffmpeg to convert a movie to gif

## Example
```
Get-ChildItem *.mp4 | Convert-MovieToGif
```
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

## Publish Module to PowerShell Gallery
```powershell
$ApiKey="...api...key...here..."
Publish-Module -Path ".\modules\MovieToGif" -Repository PSGallery -NuGetApiKey $ApiKey
```
