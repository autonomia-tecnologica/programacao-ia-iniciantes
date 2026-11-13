# Snapshots .\projetos into .\backups\projetos-YYYY-MM-DD_HHMMSS.zip (keeps the last 10).
# .\backups is outside the folder the sandbox mounts, so the agent cannot touch it.
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

$Keep = 10
New-Item -ItemType Directory -Force -Path backups | Out-Null
$stamp = Get-Date -Format "yyyy-MM-dd_HHmmss"
$target = "backups\projetos-$stamp.zip"
Compress-Archive -Path "projetos\*" -DestinationPath $target
Write-Host "Backup salvo em $target"

# Retention: drop everything but the newest $Keep.
Get-ChildItem backups\projetos-*.zip | Sort-Object LastWriteTime -Descending |
  Select-Object -Skip $Keep | Remove-Item -Force
