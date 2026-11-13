FROM node:22.12.0-bookworm-slim

RUN apt-get update \
 && apt-get install -y --no-install-recommends python3 git micro ca-certificates \
 && rm -rf /var/lib/apt/lists/* \
 && npm install -g opencode-ai@1.19.5

# Non-root user: the student never runs as root inside the container.
RUN useradd --create-home --shell /bin/bash student
USER student

COPY --chown=student:student config/opencode.json /home/student/.config/opencode/opencode.json

WORKDIR /work
CMD ["opencode"]
