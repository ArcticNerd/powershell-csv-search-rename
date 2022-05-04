$nid = @()
$epid = @()

Import-Csv Z:\Serverfolders\Database\LooneyTunes.csv -Delimiter "," | ForEach-Object {
    $nid += $_.N
    $epid += $_.E
    }

$folder = Get-Item -Path .

ls *`).mkv | Select-Object Name,FullName | ForEach-Object {
    $oldname = $_.FullName
    $findname = ($_.Name.Substring(0,($_.Name.Length - 33))).Substring(51)
    if ($nid -contains $findname) {
        $Where = [array]::IndexOf($nid, $findname)
        Write-Host $oldname " will become: " "Looney Tunes - "  $epid[$Where] " - " $nid[$Where]
        $newname = $folder.FullName + "\" +"Looney Tunes - " + $epid[$Where] + " - " + $nid[$Where] + ".mkv"
        $test = Get-Item -Path $newname
        if ($test.Exists) {
        }
        else {
        Copy-Item -Path $oldname -Destination $newname
        }
    }
}