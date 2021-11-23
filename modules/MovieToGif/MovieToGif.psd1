@{
	# Script module or binary module file associated with this manifest
	RootModule = 'MovieToGif.psm1'
	
	# Version number of this module.
	ModuleVersion = '1.0.2'
	
	# ID used to uniquely identify this module
	GUID = '80875c2b-c786-44ff-b7b7-4cc33c07abf7'
	
	# Author of this module
	Author = 'github/trondr'
	
	# Company or vendor of this module
	CompanyName = 'github/trondr'
	
	# Copyright statement for this module
	Copyright = 'Copyright (c) 2021 github/trondr'
	
	# Description of the functionality provided by this module
	Description = 'PowerShell module calling ffmpeg to convert a movie to gif'
	
	# Minimum version of the Windows PowerShell engine required by this module
	PowerShellVersion = '5.1'
	
	# Modules that must be imported into the global environment prior to importing this module
	RequiredModules = @()
	
	# Assemblies that must be loaded prior to importing this module
	RequiredAssemblies = @()
	
	# Type files (.ps1xml) to be loaded when importing this module
	# Expensive for import time, no more than one should be used.
	#TypesToProcess = @('MovieToGif.Types.ps1xml')
	
	# Format files (.ps1xml) to be loaded when importing this module.
	# Expensive for import time, no more than one should be used.
	FormatsToProcess = @('MovieToGif.Format.ps1xml')
	
	# Functions to export from this module
	FunctionsToExport = @('Convert-MovieToGif')
	
	# Cmdlets to export from this module
	CmdletsToExport = @()
	
	# Variables to export from this module
	VariablesToExport = @()
	
	# Aliases to export from this module
	AliasesToExport = @()
	
	# List of all files packaged with this module
	FileList = @('')
	
	# Private data to pass to the module specified in ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
	PrivateData = @{
		
		#Support for PowerShellGet galleries.
		PSData = @{
			
			# Tags applied to this module. These help with module discovery in online galleries.
			Tags = @("Convert-MovieToGif","ffmpeg")
			
			# A URL to the license for this module.
			LicenseUri = 'https://github.com/trondr/MovieToGif/blob/main/LICENSE'
			
			# A URL to the main website for this project.
			ProjectUri = 'https://github.com/trondr/MovieToGif'
			
			# A URL to an icon representing this module.
			# IconUri = ''
			
			# ReleaseNotes of this module
			# ReleaseNotes = ''
			
		} # End of PSData hashtable
		
	} # End of PrivateData hashtable
}