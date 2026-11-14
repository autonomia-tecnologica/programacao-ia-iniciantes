# Gestão de Conhecimento e Programação com IA para iniciantes

Comece por [`PREREQUISITOS.md`](PREREQUISITOS.md). Material das aulas: [`aula-1/`](aula-1/README.md).

Ambiente pronto para aprender a programar com IA usando o [opencode](https://opencode.ai) e um modelo
grátis, dentro de um **contêiner Docker**. O único programa que você instala é o Docker Desktop.

## O que o ambiente garante

- O opencode roda **dentro de um contêiner**. Ele enxerga só a pasta `projetos/` (montada dentro do
  contêiner); o resto do seu computador fica fora do alcance dele, mesmo se ele rodar comandos.
- O contêiner roda com usuário sem privilégios, sem as capacidades extras do Linux, com limite de memória e
  de processos, e sem acesso ao Docker do seu computador.
- As regras do ambiente (`ambiente/AGENTS.md`), a permissão do opencode (`ambiente/opencode.json`) e o
  servidor das páginas (`ambiente/serve.py`) ficam **dentro da imagem do Docker**, fora da pasta `projetos/`.
  Por isso valem mesmo que a sua pasta `projetos/` tenha um `AGENTS.md` ou `opencode.json` próprios. Para
  mudar isso, edite a pasta `ambiente/`; o `start` refaz a imagem sozinho.
- A **internet está liberada**, porque a IA precisa pesquisar e instalar pacotes (pip, npm). Isso significa
  que o agente pode enviar o que estiver em `projetos/` para outro lugar. Por isso, não coloque nada
  sensível lá.
- Por limite do próprio Docker, o contêiner alcança os serviços que rodam no seu computador pelo endereço
  `host.docker.internal`. Não deixe programas com senhas abertos no computador enquanto a aula estiver
  rodando, ou feche-os antes.
- Importante: o isolamento é de contêiner, não de máquina virtual dedicada. O Docker Desktop roda os
  contêineres numa VM própria do Docker, que separa o contêiner do sistema do seu computador. Esse é o
  limite que você tem.

## O que você precisa

- **Docker Desktop** instalado e aberto. Siga a instalação oficial para o seu sistema:
  <https://docs.docker.com/desktop/>.
- Um terminal (PowerShell no Windows, Terminal no Linux ou macOS).

Detalhes e teste estão em [`PREREQUISITOS.md`](PREREQUISITOS.md).

## Como usar

Abra o Docker Desktop e espere ele ficar pronto. Depois:

Linux ou macOS:

```
./start.sh
```

Windows: dê dois cliques em `start.bat`. Ou, no PowerShell, digite `.\start.bat`.

Também dá para usar `.\start.ps1` no PowerShell. Se o PowerShell disser que a execução de scripts está desabilitada, use o `start.bat`.

O script confere que o Docker está respondendo, faz um backup, monta a imagem (na primeira vez demora mais),
mostra o endereço da página e abre o opencode. Dentro do opencode, escolha um modelo grátis com `/models`.
Seus arquivos ficam em `projetos/`; abra-os com qualquer editor.

Para ver o que a IA criou, abra no navegador **http://localhost:8080**. Cada projeto fica numa pasta e
aparece em **http://localhost:8080/<pasta>/**.

### Se a porta 8080 estiver ocupada

O `start` avisa e para. Feche o programa que usa a 8080 e rode de novo, ou rode
`docker compose run --rm -p 18080:8080 agente` (no PowerShell, o mesmo comando) e abra **http://localhost:18080**.

## Onde ficam seus arquivos e o backup

- Tudo o que você e a IA criam fica na pasta **`projetos/`** do seu computador. O contêiner só a enxerga
  por uma montagem: apagar ou recriar o contêiner **não apaga** seus arquivos.
- A montagem é de leitura e escrita, então a IA **pode apagar ou estragar** arquivos de `projetos/`.
- Por isso, **a cada vez que você roda `start`, o script faz um backup antes** em `backups/`, fora da pasta
  que a IA vê: `.tar.gz` no Linux/macOS e `.zip` no Windows. Ficam os 10 mais recentes.
- Para fazer um backup na hora: `./backup.sh` (Linux/macOS) ou `.\backup.ps1` (Windows).
- Para recuperar, abra o arquivo de `backups/` e copie o que precisa de volta para `projetos/`.
- O backup fica no mesmo computador. **Copie a pasta `backups/` de vez em quando para um pendrive ou
  nuvem**, senão um defeito no disco leva tudo.

## Aviso

Modelos grátis podem usar o que você escreve para treinamento. Não cole senhas, documentos nem dados
pessoais. O contêiner reduz o estrago, mas não garante que nada nunca dê errado, e a internet liberada
significa que a IA pode enviar dados para fora: use só com arquivos que você pode perder.

## Licença

Código: MIT (`LICENSE`). Textos: CC BY 4.0 (`LICENSE-CONTENT`).
