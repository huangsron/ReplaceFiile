param(
[string]$source =[System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Definition),
[string]$target=$env:ProgramFiles
)

$FileName=[System.IO.Path]::GetFileName($source)

$replaceFiles = get-childitem $target -recurse | where  {[System.IO.Path]::GetFileName($_) -eq $FileName }

Foreach ($f in $replaceFiles)
{
    echo ("Replacing " + $f.FullName + " with " + $FileName)
    copy-item $source -Destination  ( $f.DirectoryName + "\" + $f.Name)
} 
