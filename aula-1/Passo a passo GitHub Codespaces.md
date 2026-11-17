# Como criar um codespace no GitHub Codespaces (passo a passo)

Você vai usar um computador na nuvem, aberto no navegador, com o agente opencode. Não precisa instalar nada no seu computador.

**O que é o GitHub Codespaces?** Um serviço do GitHub que empresta um computador que roda na internet (cada um desses computadores é um "codespace"). Você usa pelo navegador. Se algo der errado lá dentro, seu computador não é afetado: apague e crie outro.

**Você vai precisar de:**

- Um navegador (Chrome, Edge, Firefox ou Safari)
- Um e-mail que você consiga acessar

É grátis: contas pessoais têm 60 horas de uso por mês na máquina padrão.

---

## Passo 1 — Crie sua conta no GitHub

Se já tem conta, pule para o Passo 2.

1. Acesse github.com/signup.
2. Digite e-mail, crie uma senha e escolha um nome de usuário (ex.: maria-silva).
3. Resolva o desafio "não sou um robô".
4. Digite o código que o GitHub enviou por e-mail.
5. Se aparecer a tela de planos, escolha **Free**.

> Anote seu usuário e senha. Você vai usar em toda aula.

---

## Passo 2 — Crie o codespace

Você começa de um projeto em branco. O GitHub cria o projeto na sua conta e abre o codespace.

1. Logado no GitHub, acesse github.com/codespaces/templates.
2. No modelo **Blank**, clique em **Use this template**.
3. Aguarde. Uma aba abre com "Setting up your codespace". Na primeira vez leva de 1 a 3 minutos. Não feche a aba.

Se não achar o modelo Blank: acesse github.com/codespaces, clique em **New codespace** e escolha um modelo em branco.

---

## Passo 3 — Conheça a tela

Quando carregar, você verá o VS Code (um editor de código) no navegador:

| Onde | O que é | Para que serve |
|---|---|---|
| Esquerda | Explorador de arquivos | Ver e abrir os arquivos do projeto |
| Centro | Editor | Ler e editar o arquivo aberto |
| Embaixo | Terminal | Digitar comandos |

Se o terminal não aparecer: menu ☰ (canto superior esquerdo) → **Terminal** → **New Terminal**.

---

## Passo 4 — Instale e abra o opencode

Só na primeira vez você precisa instalar.

1. Clique dentro do terminal.
2. Digite o comando abaixo e aperte Enter. Aguarde terminar.

   ```
   npm install -g opencode-ai
   ```

3. Digite `opencode` e aperte Enter.
4. Digite `/models` e escolha um modelo marcado como gratuito (free).
5. Escreva o que quer construir, em português. Ex.: "crie uma página web com uma lista de tarefas".

Quando o agente criar um site, aparece um aviso no canto inferior direito. Clique em **Open in Browser** para ver o resultado.

---

## Passo 5 — Desligue ao terminar e volte depois

Desligar não apaga nada: seus arquivos continuam lá. Isso economiza suas 60 horas grátis.

**Para desligar:**

1. Acesse github.com/codespaces.
2. Clique nos três pontinhos **…** ao lado do seu codespace.
3. Clique em **Stop codespace**.

Se esquecer, ele desliga sozinho após cerca de 30 minutos parado. Fechar a aba não desliga na hora.

**Para voltar na próxima aula:** acesse github.com/codespaces e clique no nome do seu codespace. Não crie um novo, senão você começa do zero. O opencode já estará instalado: é só digitar `opencode`.

> **Cuidado:** não clique em **Delete**, a não ser que queira apagar tudo de propósito.

---

## Problemas comuns

| O que aconteceu | O que fazer |
|---|---|
| Não vejo o botão **Use this template** | Faça login no GitHub (canto superior direito) e recarregue a página |
| Travado em "Setting up" por mais de 5 minutos | Recarregue (F5). Se continuar, apague esse codespace e crie outro |
| `opencode` deu "command not found" | Rode de novo o comando de instalação do Passo 4. Depois feche o terminal, abra um novo e tente de novo |
| Tela cinza dizendo que desconectou | Clique em **Reconnect** ou recarregue. Seus arquivos não se perdem |
| Aviso de que acabaram as horas grátis | Avise o instrutor. As horas voltam no início do mês seguinte |
| O site que o agente criou não abre | Aba **Ports** (ao lado do Terminal): clique no ícone de globo da porta listada |

Ainda com dúvida? Tire um print da tela e mande para o instrutor.
