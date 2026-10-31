---
name: publicar
description: Publica o trabalho deste repositório na main (que publica produção) e confirma o deploy na Vercel. Use quando o Fabio autorizar com "publicar", "pode publicar", "commit e push", "envia para a main", ou disser que vai trocar de computador.
---

# Publicar

Só com autorização do Fabio na conversa. Sequência única, sem pular etapa:

1. `git status`. Nada alterado e nada sem push: dizer isso e parar.
2. Conferir `git config user.email`: tem que ser `fabio@passaportealemao.com.br`, senão a
   Vercel bloqueia o deploy. Corrigir com `git config user.email fabio@passaportealemao.com.br`.
3. Conferir antes do commit: `npx tsc --noEmit`. Se a mudança mexeu em página, layout ou
   componente cliente, rodar também o build (`npm run build`; no CRM, com as variáveis
   fictícias descritas no CLAUDE.md). Erro: parar e mostrar ao Fabio.
4. Commit em português, primeira linha curta com o efeito da mudança. Nunca `.env*`.
5. Juntar a main: na própria main, `git pull --rebase`; num ramo `claude/...` (Nuvem),
   `git fetch origin main && git merge origin/main`.
6. `git push origin HEAD:main`. A trava de push confere de novo, sozinha.
   - Recusado porque a main mudou ("fetch first", "non-fast-forward", "cannot lock ref"):
     é corrida com outra sessão. Repetir a etapa 5 e reenviar, sem perguntar.
   - Trava acusou erro de tipo ou teste: parar e mostrar.
7. Confirmar o deploy (cerca de 1 minuto depois): ferramenta da Vercel `list_deployments`
   (time `hannover-s-projects`) ou `npx vercel ls <projeto> --scope hannover-s-projects`.
   READY: publicado. ERROR: avisar já, porque produção continua na versão anterior.
   O hannover-data não usa Vercel: lá basta o push (GitHub Pages).
8. Responder em uma linha: commit, estado do deploy.
