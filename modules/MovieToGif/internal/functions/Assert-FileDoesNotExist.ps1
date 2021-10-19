function Assert-FileDoesNotExist {
    
    <#
		.SYNOPSIS
		Assert that file does not allready exist
		
		.DESCRIPTION
		Assert that file does not allready exist

		.EXAMPLE
		Assert-FileDoesNotExist -Path "c:\temp\somefile.txt" -Message "Some file allready exists. Unable to proceed."

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
        if((Test-Path -Path $Path) -eq $false)
        {
            Write-Verbose "File does not exist: $Path"
        }
        else {
            throw "File allready exists: $Path. $Message"
        }
    }
    
    end {
        
    }
}