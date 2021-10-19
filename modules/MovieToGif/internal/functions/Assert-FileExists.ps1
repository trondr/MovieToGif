function Assert-FileExists {
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