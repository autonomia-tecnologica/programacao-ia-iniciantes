#!/usr/bin/env bash
# Starts OpenCode in a Docker Sandbox (microVM) that only sees ./projetos.
# Network is deny-all except opencode.ai:443.
set -euo pipefail
cd "$(dirname "$0")"

if ! command -v sbx >/dev/null 2>&1; then
  echo "sbx not found. Install Docker Sandboxes first (see README.md)." >&2
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

exec sbx run opencode ./projetos
