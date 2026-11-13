#!/usr/bin/env bash
# Starts OpenCode in a Docker Sandbox (microVM) that only sees ./projetos.
# Network is deny-all except opencode.ai:443. The student opens http://localhost:8080.
set -euo pipefail
cd "$(dirname "$0")"

NAME=aula
PORT=8080

if ! command -v sbx >/dev/null 2>&1; then
  echo "sbx not found. Install Docker Sandboxes first (see PREREQUISITOS.md)." >&2
  exit 1
fi

# Only works before a preset is set; on later runs it fails harmlessly.
sbx policy init deny-all >/dev/null 2>&1 || true
sbx policy allow network opencode.ai:443 >/dev/null 2>&1 || true

# If a preset was already chosen earlier (e.g. balanced), the init above did nothing:
# check the list below, or run `sbx policy reset` and pick Locked Down.
echo "Active network policy:"
sbx policy ls

./backup.sh

# --publish only applies when the sandbox is created; for an existing one use `sbx ports`.
sbx ports "$NAME" --publish "$PORT:$PORT" >/dev/null 2>&1 || true

echo "Para ver o que a IA criar, abra no navegador: http://localhost:$PORT"
exec sbx run --publish "$PORT:$PORT" --name "$NAME" opencode ./projetos
