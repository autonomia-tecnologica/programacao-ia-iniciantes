# Pré-requisitos

**Gestão de Conhecimento e Programação com IA para iniciantes**

Faça tudo isto **antes da Aula 1**. Se algo não funcionar, anote a mensagem de erro e leve para a aula.

## 1. Seu computador

- **Windows** (PowerShell) ou **macOS**, ou **Linux**.
- Espaço livre para a imagem do Docker (alguns gigabytes) e para o backup da pasta `projetos/`.

## 2. Instalar o Docker Desktop

1. Siga a instalação oficial para o seu sistema: <https://docs.docker.com/desktop/>.
2. Quando o Windows ou o macOS pedir, reinicie o computador.
3. **Abra o Docker Desktop** e espere o ícone parar de animar ("Docker Desktop is running").
   O `start` só funciona com o Docker aberto.
   No Windows, o jeito principal é dar dois cliques em `start.bat`. Se o PowerShell disser que a execução de scripts está desabilitada, use o `start.bat`.
No Linux, o Docker Engine com o plugin `docker compose` também serve.

Teste: abra o terminal (PowerShell no Windows) e digite:

```
docker compose version
```

Se aparecer a versão do Docker Compose, está pronto. Se aparecer "comando não encontrado" ou algum erro
de conexão, confira se o Docker Desktop está aberto e repita o teste.

### Virtualização

O Docker Desktop precisa que a virtualização do processador esteja ligada. Confira antes de instalar:

- **Ligada na BIOS/UEFI:** Intel VT-x ou AMD-V (SVM). Costuma vir ligada. Se não estiver, ligue no menu da
  BIOS/UEFI (a tecla para entrar varia: F2, F10, Del ou Esc).
- **WSL2 (Windows):** o instalador do Docker Desktop costuma ativar o WSL2 sozinho. Se ele pedir, reinicie o
  computador e abra o Docker Desktop de novo. O Windows Home funciona.

Como conferir:

- Windows: Gerenciador de Tarefas > Desempenho > CPU > **"Virtualização: Habilitado"**.
- `docker compose version` mostra a versão do Docker Compose.
- `docker run --rm hello-world` mostra a mensagem "Hello from Docker!". Esse teste precisa de internet.

Problemas comuns:

- **"Virtualização: Desabilitado"**: a virtualização está desligada na BIOS/UEFI. Ligue-a e reinicie.
- **VM dentro de VM**: se o Windows roda dentro de uma máquina virtual (VirtualBox, VMware), o Docker não
  funciona sem virtualização aninhada. Use o Windows instalado direto no computador, ou ative a virtualização
  aninhada na máquina virtual.
- **Docker Desktop reclama de WSL ou virtualização ao abrir**: reinicie o computador e confira os itens acima.

## 3. Baixar este kit

Baixe o repositório em <https://github.com/autonomia-tecnologica/programacao-ia-iniciantes> (botão verde
**Code**, depois **Download ZIP**) e extraia numa pasta que você encontre fácil, como `Documentos`.

## 4. Um editor de texto e um navegador

- Navegador: qualquer um atual (Chrome, Firefox, Edge).
- Editor de texto: o Bloco de Notas serve. Se quiser algo melhor, instale um que você já conheça.

## 5. Para a aula

- Internet estável.
- Uma ideia, mesmo vaga, de algo pequeno e útil que você gostaria de ter. Não precisa saber programar.
- **Não coloque senhas nem documentos pessoais** na pasta `projetos/`. Os modelos grátis podem usar o que
  você escreve para treinamento, e a internet fica liberada para a IA.

## Checklist

- [ ] Meu computador é Windows, macOS ou Linux
- [ ] Virtualização ligada: Gerenciador de Tarefas > Desempenho > CPU > "Virtualização: Habilitado"
- [ ] WSL2 ativo, sem pendência de reinício (Windows)
- [ ] Docker Desktop instalado e aberto
- [ ] `docker compose version` mostra a versão
- [ ] `docker run --rm hello-world` mostra "Hello from Docker!"
- [ ] Extraí o kit numa pasta que encontro
- [ ] Tenho navegador e editor de texto
