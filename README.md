# Programação com IA para iniciantes

Ambiente pronto para aprender a programar com IA usando o [opencode](https://opencode.ai) e um modelo
grátis. O opencode roda dentro de um contêiner Docker e enxerga **só a pasta `projetos/`**: o resto do seu
computador fica fora do alcance dele.

## O que você precisa

- [Docker](https://docs.docker.com/get-docker/) (Windows: Docker Desktop com WSL2; Linux: Docker Engine).
- Um editor de texto qualquer para abrir os arquivos de `projetos/`.

## Como usar

Linux ou macOS:

```
./run.sh
```

Windows (PowerShell):

```
.\run.ps1
```

Na primeira vez a imagem é construída (alguns minutos). Dentro do opencode, escolha um modelo grátis com
`/models`.

## Segurança

- O contêiner não é root, não tem privilégios extras e tem limite de memória e de processos.
- O opencode pede confirmação antes de rodar comandos (`bash`) e de acessar a internet (`webfetch`).
- Mesmo que você aprove um comando, ele só alcança a pasta `projetos/` e o próprio contêiner.

## Aviso

Modelos grátis podem usar o que você escreve para treinamento. Não cole senhas, documentos nem dados pessoais.

## Licença

Código: MIT (`LICENSE`). Textos: CC BY 4.0 (`LICENSE-CONTENT`).
