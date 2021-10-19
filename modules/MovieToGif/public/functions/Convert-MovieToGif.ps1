function Convert-MovieToGif
{
	<#
		.SYNOPSIS
		Convert a movie to gif using ffmpeg
		
		.DESCRIPTION
		Convert a movie to gif using ffmpeg

		.EXAMPLE
		Convert-MovieToGif

		.NOTES        
		Version:        1.0
		Author:         github/trondr
		Company:        github/trondr
		Repository:     https://github.com/trondr/MovieToGif.git
	#>
	[CmdletBinding()]
	Param (
		[Parameter(ValueFromPipeline=$true)]
		$InputObject
	)
	
	begin
	{
		
	}
	process
	{
		foreach($item in $InputObject)
		{
			try {
				Write-Host "TODO: Implemented processing of each item in the pipe line." -ForegroundColor Yellow
			}
			catch {
				Write-Host "Convert-MovieToGif failed processing '$($item)' due to: $($_.Exception.Message)"
			}
		}
	}
	end
	{
	
	}
}