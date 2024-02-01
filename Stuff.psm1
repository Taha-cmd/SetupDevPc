# Required qpdf
function Remove-PdfPassword {
    [CmdletBinding()]
    Param (
     [Parameter(Mandatory, ValueFromPipeline)] [string] $PdfPath,
     [Parameter(Mandatory)] [string] $Password   
    )

    Copy-Item $PdfPath "$PdfPath.backup"
    qpdf --decrypt --replace-input --password=$Password $PdfPath

    return $PdfPath
}

Export-ModuleMember -Function Remove-PdfPassword