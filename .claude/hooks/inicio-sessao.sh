#!/bin/sh
# INÍCIO DE SESSÃO (31.10.2026). O GitHub é a fonte da verdade entre os dois Macs e a Nuvem.
# Alinha esta cópia com o GitHub antes de qualquer trabalho e conta ao Claude o que achou.
# Nunca puxa por cima de alteração local: nesse caso só avisa.
cd "$CLAUDE_PROJECT_DIR" 2>/dev/null || exit 0
git rev-parse --git-dir >/dev/null 2>&1 || exit 0
ramo=$(git branch --show-current)
if ! git fetch -q origin 2>/dev/null; then
  echo "Aviso: sem conexão com o GitHub. Não deu para conferir se esta cópia está atualizada."
  exit 0
fi
if ! git rev-parse -q --verify '@{u}' >/dev/null 2>&1; then
  echo "Ramo $ramo sem par no GitHub: pull não feito."
  exit 0
fi
atras=$(git rev-list --count 'HEAD..@{u}')
frente=$(git rev-list --count '@{u}..HEAD')
sujo=$(git status --porcelain | wc -l | tr -d ' ')
if [ "$sujo" -gt 0 ]; then
  echo "ATENÇÃO: $sujo arquivo(s) alterado(s) sem commit nesta cópia ($ramo), que está $atras commit(s) atrás do GitHub. Pull NÃO feito. Avise o Fabio antes de qualquer alteração."
  git status --short | head -15
  exit 0
fi
if [ "$atras" -gt 0 ]; then
  if git pull --rebase -q 2>/dev/null; then
    echo "Cópia atualizada com o GitHub: $atras commit(s) novo(s) em $ramo."
  else
    git rebase --abort 2>/dev/null
    echo "ATENÇÃO: o git pull --rebase deu conflito e foi desfeito. Avise o Fabio antes de prosseguir."
    exit 0
  fi
fi
if [ "$frente" -gt 0 ]; then
  echo "ATENÇÃO: $frente commit(s) desta cópia ainda não foram enviados ao GitHub ($ramo)."
fi
exit 0
