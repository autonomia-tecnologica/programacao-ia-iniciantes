# Pré-requisitos

**Gestão de Conhecimento e Programação com IA para iniciantes**

Faça tudo isto **antes da Aula 1**. A instalação pode pedir reinicialização do computador, então não deixe
para o dia. Se algo não funcionar, anote a mensagem de erro e leve para a aula.

## 1. Seu computador

| Sistema | O que a documentação do Docker Sandboxes exige |
|---|---|
| **Windows** | Windows 11, com a **Windows Hypervisor Platform** ativada (pode pedir reinicialização) |
| **Linux** | Ubuntu 24.04 ou mais novo, com KVM e seu usuário no grupo `kvm` (derivados do Ubuntu e outras distribuições não são suportados oficialmente) |
| **macOS** | Sonoma 14 ou mais novo, em Apple silicon |

Se o seu computador não se encaixa, **avise o professor antes da aula**. Não improvise com outro programa:
o isolamento que protege seus arquivos depende do `sbx`.

## 2. Instalar o `sbx` (Docker Sandboxes)

1. Siga a página oficial: <https://docs.docker.com/ai/sandboxes/install/>. Os comandos abaixo são os que
   ela traz.
2. **Windows (PowerShell):**
   - Instalar: `winget install -h Docker.sbx`
   - Ativar a Windows Hypervisor Platform, em PowerShell **como administrador**:
     `Enable-WindowsOptionalFeature -Online -FeatureName HypervisorPlatform -All`
   - **Reinicie** quando o Windows pedir.
3. **Linux (Ubuntu 24.04 ou mais novo):**
   - Instalar só o `sbx`: `curl -fsSL https://get.docker.com | sudo REPO_ONLY=1 sh && sudo apt install docker-sbx`
   - Dar acesso ao KVM: `sudo usermod -aG kvm $USER`, depois saia da sessão e entre de novo.
4. **Conta Docker e login:** o `sbx login` abre o navegador para entrar numa conta Docker. A documentação
   diz que o `sbx` e as sandboxes locais são grátis, mas não diz qual tipo de conta o login exige. Crie
   uma conta gratuita no site da Docker antes da aula e entre com `sbx login`.
5. Ter o Docker Desktop instalado **não basta**: o `sbx` é um programa à parte.

Teste: abra o terminal (PowerShell no Windows) e digite `sbx`. Se aparecer a ajuda do programa, está
instalado. Se aparecer "comando não encontrado", repita o passo 1.

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
  você escreve para treinamento.

## Checklist

- [ ] Meu computador está na tabela da seção 1
- [ ] `sbx` aparece no terminal
- [ ] Tenho uma conta Docker gratuita e fiz `sbx login`
- [ ] Extraí o kit numa pasta que encontro
- [ ] Tenho navegador e editor de texto
