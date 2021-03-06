function Assert-FileExists {
    <#
		.SYNOPSIS
		Assert that file exist
		
		.DESCRIPTION
		Assert that file exist

		.EXAMPLE
		Assert-FileExists -Path "c:\temp\somefile.txt" -Message "Some file does not exist. Unable to proceed."

		.NOTES        
		Version:        1.0
		Author:         github/trondr
		Company:        github/trondr
		Repository:     https://github.com/trondr/MovieToGif.git
	#>
    
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]
        $Path,
        [Parameter(Mandatory=$true)]
        [string]
        $Message
    )
    
    begin {
        
    }
    
    process {
        if(Test-Path -Path $Path)
        {
            Write-Verbose "File exists: $Path"
        }
        else {
            throw "File does not exist: $Path. $Message"
        }
    }
    
    end {
        
    }
}