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

## Rotina (dois computadores)
- `git pull --rebase` no início da sessão; perguntar antes de commit e push (push publica).
