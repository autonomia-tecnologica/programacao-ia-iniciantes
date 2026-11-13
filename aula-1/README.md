# Aula 1 — Organizar o ambiente e criar algo do zero

**Curso:** Gestão de Conhecimento e Programação com IA para iniciantes
**Duração:** 2 horas
**Material do professor.** Os alunos trabalham em `projetos/`, não aqui.

## Objetivo

Sair da aula com (1) o ambiente funcionando e protegido, (2) uma ideia da turma transformada em algo que
abre no navegador e (3) o registro do que foi feito, em notas que a própria pessoa consegue reler.

Não há projeto salvo: a ideia vem da turma e o professor constrói junto, ao vivo.

## Regra do tamanho: "um arquivo, abre com dois cliques"

Para dar certo em modelo grátis e em duas horas, o resultado é **uma página web de um arquivo só**
(`index.html`, com o CSS e o JavaScript dentro), sem instalar nada e sem biblioteca externa. Um site, uma
ferramenta, um jogo simples: tudo cabe nisso.

Ideias que cabem (para o caso de a turma travar):
- lista de tarefas ou lista de leituras;
- cronômetro de estudo (pomodoro);
- flashcards para memorizar (liga com gestão de conhecimento);
- quiz sobre um assunto da turma;
- jogo da memória ou jogo da cobrinha;
- calculadora de algo do dia a dia (divisão de conta, receita, treino).

## Como o aluno vê o resultado (e por que a sandbox continua valendo)

A microVM **não tem tela**. O agente escreve os arquivos lá dentro, mas eles ficam na pasta `projetos/` do
computador do aluno. Para ver o resultado:

1. O aluno abre `projetos/<nome-do-projeto>/index.html` com dois cliques; abre no navegador.
2. O navegador **é a sandbox de quem vai usar**: uma página só com HTML, CSS e JavaScript roda dentro do
   isolamento do próprio navegador e não lê os arquivos do computador.

Regras para isso continuar seguro:
- **Só arquivo estático.** Nada de instalar programa, nada de `.exe`, `.bat`, `.sh` gerado pela IA rodando
  no computador do aluno.
- **Sem biblioteca da internet** no arquivo (nada de CDN). Fica mais simples e mais seguro. O
  `projetos/AGENTS.md` já diz isso à IA.
- Não digitar senha nem dado pessoal numa página que a IA acabou de criar.

E os outros casos?
- **Programa Python:** roda **dentro da sandbox**, no terminal do opencode, com texto na saída. Não tem
  janela gráfica. Para ter interface, o resultado vira uma página HTML.
- **Jogo no Godot:** fica fora da Aula 1. O Godot teria de rodar no computador do aluno, e um script gerado
  pela IA rodando fora da sandbox desfaz a proteção. Para jogo, use HTML com canvas.
- **Janela gráfica de dentro da sandbox** (Tkinter, pygame, Godot): a documentação do `sbx` que li não
  descreve nenhum jeito de exibir isso, então não vamos contar com isso.

## Roteiro (120 min)

| Tempo | Bloco | O que acontece |
|---|---|---|
| 0–15 | Abertura | O que é um agente de IA que escreve arquivos. O que pode dar errado. Por que a sandbox. Aviso de privacidade do modelo grátis. |
| 15–35 | Ambiente | Cada um roda `start` (`.sh` ou `.ps1`), confere a política de rede, abre o opencode e escolhe um modelo com `/models`. Mostrar a pasta `projetos/` e a pasta `backups/`. |
| 35–50 | Ideia | A turma propõe, vota, escolhe uma. O grupo escreve a ideia em 5 linhas em `projetos/notas/ideia.md`: quem usa, o que faz, o que **não** faz. |
| 50–95 | Construção | Ciclos de 10 minutos: pedir a versão mínima, abrir no navegador, testar, pedir uma mudança por vez. |
| 95–110 | Registro | Pedir à IA um resumo em `projetos/notas/aula-1.md`: o que foi feito, o que funcionou no pedido, o que deu errado. |
| 110–120 | Fechamento | Conferir o backup, dúvidas, tarefa de casa. |

## Como conduzir a construção (modelo grátis)

- Um pedido pequeno de cada vez. "Faça uma lista de tarefas com adicionar e apagar", não "faça um sistema".
- Sempre peça a **versão mínima primeiro**, abra, teste, e só depois peça melhoria.
- Mande o erro como ele aparece, ou descreva o que viu na tela, em vez de pedir "conserta".
- Se o modelo se perder ou repetir, abra uma conversa nova (`/new`) e cole só o `ideia.md`.
- Modelo grátis é lento e às vezes cai. Tenha a ideia reserva da lista acima pronta.

## Gestão de conhecimento nesta aula

O curso junta as duas coisas, então a aula já pratica o hábito:
- a ideia vira texto em `notas/ideia.md` **antes** de virar código;
- o que se aprendeu vira texto em `notas/aula-1.md` **depois**;
- as notas são arquivos de texto comuns (`.md`), que não dependem de nenhum programa e entram no backup.

## Tarefa de casa

Reabrir o projeto com `start`, pedir **uma** melhoria nova, e escrever em `notas/` o que mudou e por quê.

## Antes da aula (professor)

- Rodar o `start` num computador igual ao dos alunos (Windows 11 e Linux) para checar os hosts de rede.
  Com `deny-all`, o `sbx` pergunta sobre qualquer destino novo; anote quais aparecem e libere só os
  necessários.
- Confirmar que o modelo grátis responde e qual escolher em `/models`.
- Confirmar que o `sbx login` funciona com a conta que os alunos vão usar.
- Confirmar que o `opencode` na sandbox tem o que o seu exemplo precisa (não verifiquei se há Python).
