#!/usr/bin/env bash
# Snapshots ./projetos into ./backups/projetos-YYYY-MM-DD_HHMMSS.tar.gz (keeps the last 10).
# ./backups is outside the folder the contêiner mounts, so the agent cannot touch it.
set -euo pipefail
cd "$(dirname "$0")"

KEEP=10
mkdir -p backups
stamp="$(date +%Y-%m-%d_%H%M%S)"
tar -czf "backups/projetos-$stamp.tar.gz" projetos
echo "Backup salvo em backups/projetos-$stamp.tar.gz"

# Retention: drop everything but the newest $KEEP.
ls -1t backups/projetos-*.tar.gz | tail -n +$((KEEP + 1)) | while read -r old; do rm -f -- "$old"; done
