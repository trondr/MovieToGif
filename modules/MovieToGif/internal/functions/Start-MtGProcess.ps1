$startProcessCode = @"
using System;
using System.Diagnostics;
using System.Threading;
using System.Text;

namespace MovieToGif.CSharp
{    
    public static class ProcessHelper
    {
        public class ProcessResult
        {
            public ProcessResult(int exitCode, string standardOut, string standardError)
            {
                this.ExitCode = exitCode;
                this.StandardOut = standardOut;
                this.StandardError = standardError;
            }
            public int ExitCode {get;set;}
            public string StandardOut {get;set;}
            public string StandardError {get;set;}
        }

        public static ProcessResult StartProcess(string filePath, string[] args, int timeoutInMilliseconds)
        {            
            string arguments = string.Join(" ",args);
            //Source: https://stackoverflow.com/questions/139593/processstartinfo-hanging-on-waitforexit-why/139604
            using (Process process = new Process())
            {
                process.StartInfo.FileName = filePath;
                process.StartInfo.Arguments = arguments;
                process.StartInfo.UseShellExecute = false;
                process.StartInfo.RedirectStandardOutput = true;
                process.StartInfo.RedirectStandardError = true;
                StringBuilder output = new StringBuilder();
                StringBuilder error = new StringBuilder();
                using (AutoResetEvent outputWaitHandle = new AutoResetEvent(false))
                using (AutoResetEvent errorWaitHandle = new AutoResetEvent(false))
                {
                    process.OutputDataReceived += (sender, e) => {
                        if (e.Data == null)
                        {
                            outputWaitHandle.Set();
                        }
                        else
                        {
                            System.Console.WriteLine(e.Data);
                            output.AppendLine(e.Data);
                        }
                    };
                    process.ErrorDataReceived += (sender, e) =>
                    {
                        if (e.Data == null)
                        {
                            errorWaitHandle.Set();
                        }
                        else
                        {
                            System.Console.WriteLine(e.Data);
                            error.AppendLine(e.Data);
                        }
                    };

                    process.Start();

                    process.BeginOutputReadLine();
                    process.BeginErrorReadLine();

                    if (process.WaitForExit(timeoutInMilliseconds) &&
                        outputWaitHandle.WaitOne(timeoutInMilliseconds) &&
                        errorWaitHandle.WaitOne(timeoutInMilliseconds))
                    {
                        return new ProcessResult(process.ExitCode,output.ToString(),error.ToString());
                    }
                    else
                    {
                        return new ProcessResult(258,output.ToString(),"ERROR: Timedout waiting for process to exit:" + filePath  + " " + arguments);
                    }
                }
            }
        }
    }    
}
"@

if (-not ([System.Management.Automation.PSTypeName]'MovieToGif.CSharp.ProcessHelper').Type)
{
    Add-Type -TypeDefinition $startProcessCode
}

function Start-MtGProcess {
    <#
		.SYNOPSIS
		Start process
		
		.DESCRIPTION
		Start process with redirected stdout.

		.EXAMPLE
		Start-MtGProcess "c:\temp\some.exe" -Arguments @("--help","me")

		.NOTES        
		Version:        1.0
		Author:         github/trondr
		Company:        github/trondr
		Repository:     https://github.com/trondr/MovieToGif.git
	#>
    
    [CmdletBinding()]
    param (
        [string]
        $FilePath,
        [string[]]
        $Arguments
    )
    
    begin {
        Assert-FileExists -Path $FilePath -Message "Failed to start process '$FilePath' $Arguments."
    }
    
    process {
        [MovieToGif.CSharp.ProcessHelper]::StartProcess($FilePath, $Arguments,-1)
    }
    
    end {
        
    }
}