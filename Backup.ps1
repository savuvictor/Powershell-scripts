$sourcePath = "E:\test1"
$destinationBasePath = "E:\priv\backup"

function Copy-Folder {
    while ($true) {
        $timestamp = Get-Date -Format "dd-MM-yyyy-HHmmss"

        $zipPath = Join-Path -Path $destinationBasePath -ChildPath "backup_$timestamp.zip"

        $destinationFolder = Split-Path $zipPath
        if (-not (Test-Path $destinationFolder -PathType Container)) {
            New-Item -ItemType Directory -Path $destinationFolder -Force
        }

        Compress-Archive -Path $sourcePath -DestinationPath $zipPath -Force

        Write-Host "$(Get-Date) - Backup created at $zipPath"

        Start-Sleep -Seconds 10
    }
}

Copy-Folder
