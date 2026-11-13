# Starts opencode inside a container that only sees .\projetos.
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

$Image = "programacao-ia-iniciantes"
docker image inspect $Image *> $null
if ($LASTEXITCODE -ne 0) { docker build -t $Image . }

docker run --rm -it `
  --cap-drop ALL --security-opt no-new-privileges `
  --memory 2g --pids-limit 256 `
  -v "${PWD}\projetos:/work" `
  -v opencode-data:/home/student/.local/share/opencode `
  $Image
