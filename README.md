# Programação com IA para iniciantes

Ambiente pronto para aprender a programar com IA usando o [opencode](https://opencode.ai) e um modelo
grátis, dentro de um **Docker Sandbox**. Cada sandbox é uma microVM com kernel próprio (isolamento por
hipervisor, não um contêiner comum).

## O que o ambiente garante

- O opencode roda **dentro da microVM**. Ele enxerga só a pasta `projetos/`; o resto do seu computador fica
  fora do alcance dele, mesmo se ele rodar comandos.
- A rede começa em **deny-all**: só `opencode.ai:443` está liberado (o servidor dos modelos). O agente não
  consegue enviar seus dados para outro lugar. Se ele tentar acessar um destino novo, o `sbx` pede a sua
  aprovação; diga **não** se você não reconhece o endereço.
- Por isso o `opencode.json` deixa o `bash` liberado: o limite é a microVM, não a pergunta a cada comando.

## O que você precisa

Instale o Docker Sandboxes (`sbx`) seguindo a página oficial
[docs.docker.com/ai/sandboxes/install](https://docs.docker.com/ai/sandboxes/install/). Requisitos que a
documentação lista:

- **Windows 11** com a Windows Hypervisor Platform ativada.
- **Linux**: Ubuntu 24.04 ou mais novo, com KVM e seu usuário no grupo `kvm` (derivados do Ubuntu e outras
  distribuições não são suportados oficialmente).
- **macOS**: Sonoma 14 ou mais novo, em Apple silicon.
- Entrar uma vez com `sbx login` (login pelo navegador). O `sbx` e as sandboxes locais são grátis.

> **Atenção, Windows:** ativar a Windows Hypervisor Platform (em "Ativar ou desativar recursos do Windows")
> normalmente **pede para reiniciar o computador**. Salve seu trabalho antes e reinicie quando o Windows pedir.

> **Atenção, Docker:** o que protege você é o `sbx`, não o Docker Desktop. Ter o Docker Desktop instalado
> **não basta** e **não substitui** o `sbx`. Se o `start` disser que não encontrou o `sbx`, instale-o pela
> página acima.

O `sbx` não depende do Docker Desktop nem do Docker Engine.

Se o seu computador não atende aos requisitos, **não use um contêiner comum como substituto**: ele não dá o
mesmo isolamento. Fale com o professor.

## Como usar

Linux ou macOS:

```
./start.sh
```

Windows (PowerShell):

```
.\start.ps1
```

O script confere que o `sbx` está instalado, aplica a rede deny-all, mostra a política ativa e abre o
opencode em `projetos/`. Dentro do opencode, escolha um modelo grátis com `/models`. Seus arquivos ficam em
`projetos/`; abra-os com qualquer editor.

Precisa instalar pacotes (pip, npm)? Libere o destino de propósito, por exemplo
`sbx policy allow network pypi.org,files.pythonhosted.org`. Veja a política com `sbx policy ls`.

## Onde ficam seus arquivos e o backup

- Tudo o que você e a IA criam fica na pasta **`projetos/`** do seu computador. A sandbox só a enxerga por
  uma montagem: apagar ou recriar a sandbox **não apaga** seus arquivos.
- A montagem é de leitura e escrita, então a IA **pode apagar ou estragar** arquivos de `projetos/`.
- Por isso, **a cada vez que você roda `start`, o script faz um backup antes** em `backups/`, fora da pasta
  que a IA vê: `.tar.gz` no Linux/macOS e `.zip` no Windows. Ficam os 10 mais recentes.
- Para fazer um backup na hora: `./backup.sh` (Linux/macOS) ou `.\backup.ps1` (Windows).
- Para recuperar, abra o arquivo de `backups/` e copie o que precisa de volta para `projetos/`.
- O backup fica no mesmo computador. **Copie a pasta `backups/` de vez em quando para um pendrive ou
  nuvem**, senão um defeito no disco leva tudo.

## Aviso

Modelos grátis podem usar o que você escreve para treinamento. Não cole senhas, documentos nem dados
pessoais. Isolamento reduz o estrago, mas não garante que nada nunca dê errado: use só com arquivos que você
pode perder.

## Licença

Código: MIT (`LICENSE`). Textos: CC BY 4.0 (`LICENSE-CONTENT`).
