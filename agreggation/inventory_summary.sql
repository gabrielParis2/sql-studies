/*
==========================================================
Consulta: Resumo de Estoque por Marca

Objetivo: Verificar o estoque por marca considerando apenas produtos ativos no marketplace.

Regras de negócio:
- Considerar produtos com estoque disponível.
- Considerar produtos presentes na base produto e marketplace.
- Exibir marcas com mais de 10 produtos cadastrados.

Bases utilizadas:
- base_produtos
- base_marketplace

Autor:
Gabriel Paris

Data:
05/07/2026
==========================================================
*/
SELECT 
        bp.marca,
        sum(bp.estoque_geral) AS estoque_total_marca 
FROM  base_produtos bp
INNER JOIN base_marketplace bm
        ON bm.sku = bp.sku 
WHERE bp.estoque_geral > 0
        AND bp.marca <> ''
GROUP BY bp.marca
HAVING COUNT(*) > 10
ORDER BY estoque_total_marca DESC
;
