#!/usr/bin/env bash
# Starts OpenCode in a container (service "agente") that only sees ./projetos.
# The student opens http://localhost:8080 (and http://localhost:8080/<pasta>/).
set -euo pipefail
cd "$(dirname "$0")"

PORT=8080

if ! command -v docker >/dev/null 2>&1; then
  echo "Docker não encontrado. Instale o Docker Desktop (veja PREREQUISITOS.md) e rode de novo." >&2
  exit 1
fi

if ! docker info >/dev/null 2>&1; then
  echo "O Docker não está respondendo. Abra o Docker Desktop, espere ele ficar pronto e rode de novo." >&2
  exit 1
fi

# Porta ocupada? Se algo aceita conexão em 127.0.0.1:$PORT, o `run` não consegue publicá-la.
# Se o teste não puder ser feito, segue sem bloquear.
if (exec 3<>"/dev/tcp/127.0.0.1/$PORT") 2>/dev/null; then
  echo "A porta $PORT já está em uso por outro programa neste computador, então a página não abre." >&2
  echo "Feche o programa que usa a porta $PORT e rode de novo. Ou use outra porta:" >&2
  echo "  docker compose run --rm -p 18080:8080 agente" >&2
  echo "e abra http://localhost:18080 no navegador." >&2
  exit 1
fi

./backup.sh

# Cached after the first run; rebuilds only when the Dockerfile or ./ambiente change
# (regras do curso, permissões e serve.py ficam dentro da imagem).
docker compose build

echo "Abra no navegador: http://localhost:$PORT (cada projeto fica em http://localhost:$PORT/<pasta>/)"
# --service-ports is required: plain `run` does not publish the port.
exec docker compose run --rm --service-ports agente
