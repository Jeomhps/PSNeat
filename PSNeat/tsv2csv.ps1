function tsv2csv {
    <#   
    .SYNOPSIS
        This function 
 
    .DESCRIPTION
        This function 

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
      $csv = Import-Csv $path -Delimiter "`t" | Export-Csv -Path "$HOME\test.csv" -Delimiter ';' -NoTypeInformation 
    }
}
