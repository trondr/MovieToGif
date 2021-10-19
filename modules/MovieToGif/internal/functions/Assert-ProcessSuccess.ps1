function Assert-ProcessSuccess
{
	<#
		.SYNOPSIS
		Assert that process ran successfully
		
		.DESCRIPTION
		Assert that process ran successfully

		.EXAMPLE
		Assert-ProcessSuccess

		.NOTES        
		Version:        1.0
		Author:         github/trondr
		Company:        github/trondr
		Repository:     https://github.com/trondr/MovieToGif.git
	#>
	[CmdletBinding()]
	Param (
        [Parameter(Mandatory=$true)]
        $ExitCode,		
        $SuccessExitCode=0,
        [string]
        $Message=""
	)
	
	begin
	{
		
	}
	process
	{
		if($ExitCode -eq $SuccessExitCode)
        {
            Write-Verbose "Process exited sucessfully with exit code: $ExitCode"
        }
        else {
            throw "Process failed with exit code: $ExitCode. $Message"
        }
	}
	end
	{
	
	}
}