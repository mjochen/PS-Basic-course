$dir = "C:\tmp"

$SubFolders = Get-ChildItem $dir -Directory -Force

foreach ($folder in $SubFolders) {
    $sizeFolder = (Get-ChildItem -path $folder.FullName -Recurse -Force -ErrorAction silentlycontinu |
            Measure-Object -Property length -sum).sum
    "{1,20:N0} KB`t`t{0} " -f $folder.FullName, ($sizeFolder / 1KB)
}
