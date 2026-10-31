# hannover-data (arquivos.passaportealemao.com)

Repositório **PÚBLICO**, servido pelo GitHub Pages em arquivos.passaportealemao.com. Guarda os
acervos que os sites consultam (sobrenomes, matrículas consulares, registros consulares,
Passregister). Sem index.html na raiz: só links profundos.

## Regras
- **Tudo o que entra aqui fica público na internet**, inclusive no histórico do Git. Campos
  sensíveis dos acervos (datas, livro, fólio, número de registro, dados de clientes) ficam só no
  Supabase do CRM. Nada sensível entra aqui sem autorização expressa do Fabio.
- Os dados públicos são exportados das tabelas `indice_*` do Supabase do CRM. Regerar de lá; não
  editar os JSON à mão.
- O site (hannover-site) lê `sobrenomes-alemaes.json` e os demais por URL fixa: não renomear nem
  mover arquivos sem atualizar o site.

## Rotina (dois computadores), automatizada em 31.10.2026
- **O GitHub é a fonte da verdade.** O gancho de início (`.claude/hooks/inicio-sessao.sh`) faz o
  `git pull --rebase` sozinho e avisa se houver alteração local, commit sem push ou conflito:
  se avisar, contar ao Fabio antes de qualquer alteração.
- Ao concluir, perguntar se pode publicar; com autorização, usar `/publicar` (commit, push na
  `main`, que publica produção, e conferência do deploy). O gancho de fim avisa o que ficou fora do GitHub.
- Se o Fabio disser que vai trocar de computador: `/publicar` imediatamente.
- Nunca editar nem versionar `.env*` (travado em `.claude/settings.json`).
