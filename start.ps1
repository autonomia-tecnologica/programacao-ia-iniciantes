# Starts OpenCode in a Docker Sandbox (microVM) that only sees .\projetos.
# Network is deny-all except opencode.ai:443.
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

if (-not (Get-Command sbx -ErrorAction SilentlyContinue)) {
  Write-Error "sbx not found. Install Docker Sandboxes first (see README.md)."
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

sbx run opencode .\projetos
