# Starts OpenCode in a Docker Sandbox (microVM) that only sees .\projetos.
# Network is deny-all except opencode.ai:443. The student opens http://localhost:8080.
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

$Name = "aula"
$Port = 8080

if (-not (Get-Command sbx -ErrorAction SilentlyContinue)) {
  Write-Error "sbx not found. Install Docker Sandboxes first (see PREREQUISITOS.md)."
  exit 1
}

# Only works before a preset is set; on later runs it fails harmlessly.
$ErrorActionPreference = "Continue"
sbx policy init deny-all *> $null
sbx policy allow network opencode.ai:443 *> $null
$ErrorActionPreference = "Stop"

# If a preset was already chosen earlier (e.g. balanced), the init above did nothing:
# check the list below, or run `sbx policy reset` and pick Locked Down.
Write-Host "Active network policy:"
sbx policy ls

.\backup.ps1

# --publish only applies when the sandbox is created; for an existing one use `sbx ports`.
$ErrorActionPreference = "Continue"
sbx ports $Name --publish "${Port}:${Port}" *> $null
$ErrorActionPreference = "Stop"

Write-Host "Para ver o que a IA criar, abra no navegador: http://localhost:$Port"
sbx run --publish "${Port}:${Port}" --name $Name opencode .\projetos
