# Place all code that should be run after functions are imported here
$global:ffmpegExe = [System.IO.Path]::Combine($global:ModuleRootPath,"internal","tools","ffmpeg-2021-10-18-git-d04c005021-essentials_build","bin","ffmpeg.exe")
Assert-FileExists -Path $($ffmpegExe) -Message "ffmpeg.exe not found"