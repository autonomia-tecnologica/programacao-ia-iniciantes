#!/usr/bin/env bash
# Starts opencode inside a container that only sees ./projetos.
set -euo pipefail
cd "$(dirname "$0")"

IMAGE=programacao-ia-iniciantes
docker image inspect "$IMAGE" >/dev/null 2>&1 || docker build -t "$IMAGE" .

exec docker run --rm -it \
  --cap-drop ALL --security-opt no-new-privileges \
  --memory 2g --pids-limit 256 \
  --user "$(id -u):$(id -g)" -e HOME=/home/student \
  -v "$PWD/projetos:/work" \
  -v opencode-data:/home/student/.local/share/opencode \
  "$IMAGE"
