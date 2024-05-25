function catl {
    <#   
    .SYNOPSIS
        This function takes a file as input and displays its content with line numbers.
 
    .DESCRIPTION
        This function accepts a file path as input and displays the file's content, each line prefixed with its corresponding line number

    .PARAMETER Path
        Specifies the path of the file.

    .EXAMPLE
        catl -path ./test.txt
    #>
    [CmdletBinding()]
    param (
        # Specifies a path to one or more locations.
        [Parameter(Mandatory=$false,
                   Position=1,
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true,
                   HelpMessage="Path to one or more locations.")]
        [Alias("PSPath")]
        [ValidateNotNullOrEmpty()]
        [String]$path 
    )

    process {
        if (Test-Path -Path $path) {
            $i = 0
            $content = Get-Content -Path $path
	    Write-Output ""
            $content | ForEach-Object {
                if ($i -in 0..9) {
                    Write-Output " $i $_"
                } else {
                    Write-Output "$i $_"
                }
                $i++
            }
        } else {
            Write-Error "The specified path '$path' does not exist."
        }
    }
}
