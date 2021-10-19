function Convert-MovieToGif
{
	<#
		.SYNOPSIS
		Convert a movie to gif using ffmpeg
		
		.DESCRIPTION
		Convert a movie to gif using ffmpeg

		.EXAMPLE
		Convert-MovieToGif -Path "c:\temp\movies\2021-10-19_23-49-54.mp4" -LogLevel Debug
        
		.EXAMPLE
		Convert-MovieToGif -Path "c:\temp\movies\2021-10-19_23-49-54.mp4" -LogLevel Debug -Options "scale=512:-1:flags=bicubic"

        .EXAMPLE
		Get-ChildItem -Path "C:\temp\movies\*.mp4" | ForEach-Object {$_.FullName} | Convert-MovieToGif -LogLevel Debug

		.NOTES        
		Version:        1.0
		Author:         github/trondr
		Company:        github/trondr
		Repository:     https://github.com/trondr/MovieToGif.git
        Credits:        https://gist.github.com/JaimeStill/8adb695ee46425f1ee9830357cd9c6bb
	#>
	[CmdletBinding()]
	Param (
		[Parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true,ValueFromRemainingArguments=$true)]
        [string[]]
		$Path,
        [ValidateSet("Quiet","Debug","Trace","Verbose","Info","Warning","Error","Fatal","Panic")]
        [string]
        $LogLevel="Panic",
        [string]
        $Options="scale=1024:-1:flags=bicubic"
	)
	
	begin
	{
		Assert-FileExists -Path $($ffmpegExe) -Message "ffmpeg.exe not found"
	}
	process
	{
		foreach($source in $Path)
		{
			try {
                Assert-FileExists -Path $source -Message "Specified movie do not exist: $source"                
                $destination = [System.IO.Path]::Combine([System.IO.Path]::GetDirectoryName($source),[System.IO.Path]::GetFileNameWithoutExtension($source) + ".gif")
                Assert-FileDoesNotExist -Path $destination -Message "Cannot convert movie to gif because destination gif allready exists."				
                $palette = [System.IO.Path]::Combine(${env:TEMP},"palette.png")
                if(Test-Path -LiteralPath $palette)
                {
                    Remove-Item -Path $palette -Force -ErrorAction SilentlyContinue
                }
                $out = Start-MtGProcess -FilePath $($ffmpegExe) -Arguments @("-v","$($LogLevel.ToLower())","-i","`"$source`"","-vf","`"$Options,palettegen`"","-y","`"$palette`"")
                Assert-ProcessSuccess -ExitCode $($out.ExitCode) -Message "ffmpeg.exe failed to create pallete image file '$palette'. Set '-LogLevel Debug' to se more information."
                $out = Start-MtGProcess -FilePath $($ffmpegExe) -Arguments @("-v","$($LogLevel.ToLower())","-i","`"$source`"","-i","`"$palette`"","-lavfi","`"$Options [x]; [x][1:v] paletteuse`"","-y","`"$destination`"")                
                Assert-ProcessSuccess -ExitCode $($out.ExitCode) -Message "ffmpeg.exe failed to create gif file 'destination'. Set '-LogLevel Debug' to se more information."
                Remove-Item -Path $palette -Force -ErrorAction SilentlyContinue
			}
			catch {
				Write-Host "ERROR: Convert-MovieToGif failed processing '$($source)' due to: $($_.Exception.Message)" -ForegroundColor Red
			}
		}
	}
	end
	{
	
	}
}
#TEST:
#Get-ChildItem -Path "C:\temp\movies\*.mp4" | ForEach-Object {$_.FullName} | Convert-MovieToGif
#Get-ChildItem -Path "C:\temp\movies\*.mp4" | ForEach-Object {$_.FullName} | Convert-MovieToGif -LogLevel Debug
