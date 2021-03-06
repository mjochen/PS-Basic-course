# the folders?
$firstFolder = Get-Item "C:\tmp\StartFolder"
$secondFolder = Get-Item "C:\tmp\SecondFolder"

# the files in the folders?
$firstList = Get-ChildItem $firstFolder
$secondList = Get-ChildItem $secondFolder

# make a list of files to remove
$delete = Compare-Object -ReferenceObject $firstList -DifferenceObject $secondList -ExcludeDifferent -IncludeEqual

# putting...
# ForEach-Object { Remove-Item $_.InputObject.FullName }
# at the end of the previous line would delete the files in the first folder, not the second


foreach ($file in $delete) {
    $item = Join-Path $secondFolder.FullName $file.InputObject.Name
    Remove-Item $item
}
