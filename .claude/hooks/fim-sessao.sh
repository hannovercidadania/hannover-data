#!/bin/sh
# FIM DE RESPOSTA (31.10.2026). Se ficou trabalho fora do GitHub, mostra um aviso ao Fabio:
# a outra máquina e o site só veem o que foi enviado.
cd "$CLAUDE_PROJECT_DIR" 2>/dev/null || exit 0
git rev-parse --git-dir >/dev/null 2>&1 || exit 0
sujo=$(git status --porcelain | wc -l | tr -d ' ')
frente=0
git rev-parse -q --verify '@{u}' >/dev/null 2>&1 && frente=$(git rev-list --count '@{u}..HEAD')
msg=""
[ "$sujo" -gt 0 ] && msg="$sujo arquivo(s) alterado(s) sem commit"
[ "$frente" -gt 0 ] && msg="${msg:+$msg e }$frente commit(s) sem push"
[ -z "$msg" ] && exit 0
printf '{"systemMessage":"Fora do GitHub: %s. A outra máquina e o site não veem isso até publicar (/publicar)."}\n' "$msg"
exit 0
