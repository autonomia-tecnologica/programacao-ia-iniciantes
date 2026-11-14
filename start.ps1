# Starts OpenCode in a container (service "agente") that only sees .\projetos.
# The student opens http://localhost:8080 (and http://localhost:8080/<pasta>/).
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

$Port = 8080

if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
  Write-Error "Docker não encontrado. Instale o Docker Desktop (veja PREREQUISITOS.md) e rode de novo."
  exit 1
}

# Native command: check the exit code instead of relying on the error preference.
$ErrorActionPreference = "Continue"
docker info *> $null
$dockerOk = ($LASTEXITCODE -eq 0)
$ErrorActionPreference = "Stop"
if (-not $dockerOk) {
  Write-Error "O Docker não está respondendo. Abra o Docker Desktop, espere ele ficar pronto e rode de novo."
  exit 1
}

# Porta ocupada? Se já há uma conexão em escuta na porta, o `run` não consegue publicá-la.
# Se a checagem falhar (ex.: cmdlet indisponível), segue sem bloquear.
$portBusy = $false
try {
  $portBusy = [bool](Get-NetTCPConnection -LocalPort $Port -State Listen -ErrorAction SilentlyContinue)
} catch {
  $portBusy = $false
}
if ($portBusy) {
  Write-Host "A porta $Port já está em uso por outro programa neste computador, então a página não abre." -ForegroundColor Red
  Write-Host "Feche o programa que usa a porta $Port e rode de novo. Ou use outra porta:"
  Write-Host "  docker compose run --rm -p 18080:8080 agente"
  Write-Host "e abra http://localhost:18080 no navegador."
  exit 1
}

.\backup.ps1

# Cached after the first run; rebuilds only when the Dockerfile or .\ambiente change
# (regras do curso, permissões e serve.py ficam dentro da imagem).
docker compose build
if ($LASTEXITCODE -ne 0) { exit 1 }

Write-Host "Abra no navegador: http://localhost:$Port (cada projeto fica em http://localhost:$Port/<pasta>/)"
# --service-ports is required: plain `run` does not publish the port.
docker compose run --rm --service-ports agente
exit $LASTEXITCODE
