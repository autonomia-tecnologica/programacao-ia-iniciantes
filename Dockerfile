# Agent image: opencode + Python 3 on a Node base, running as a non-root user.
# Pinned versions: base image tag and opencode-ai. To upgrade, change both here.
FROM node:22.23.3-bookworm-slim

RUN apt-get update \
 && apt-get install -y --no-install-recommends python3 git ca-certificates \
 && rm -rf /var/lib/apt/lists/*

RUN npm install -g opencode-ai@1.19.5 \
 && npm cache clean --force

# Ambiente do curso, dentro da imagem (root-owned, fora de /work): vale mesmo
# que a pasta do aluno tenha AGENTS.md ou opencode.json próprios.
# Fonte: ./ambiente. Ao mudar estes arquivos, `docker compose build` (o start já faz).
COPY ambiente/AGENTS.md /home/node/.config/opencode/AGENTS.md
COPY ambiente/opencode.json /home/node/.config/opencode/opencode.json
COPY ambiente/serve.py /opt/serve.py

USER node
WORKDIR /work

CMD ["opencode"]
