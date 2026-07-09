/*
==========================================================
Consulta: Impacto Logístico por Marca

Objetivo:
Identificar quais marcas possuem maior impacto logístico
com base no peso médio de seus produtos.

Regras de negócio:
- Considerar apenas produtos com estoque disponível.
- Considerar apenas marcas preenchidas.
- Considerar apenas produtos presentes nas duas bases.
- Exibir somente marcas com mais de 15 produtos.

Bases utilizadas:
- base_produtos
- base_marketplace

Autor:
Gabriel Paris

Data:
06/07/2026
==========================================================
*/

SELECT
    bp.marca,
    COUNT(*) AS qtd_produtos,
    ROUND(AVG(bm.peso_kg), 2) AS peso_medio,
    MAX(bm.peso_kg) AS maior_peso_marca,
    MIN(bm.peso_kg) AS menor_peso_marca
FROM base_produtos bp
INNER JOIN base_marketplace bm
    ON bm.sku = bp.sku
WHERE
    bp.estoque_geral > 0
    AND bp.marca <> ''
GROUP BY
    bp.marca
HAVING
    COUNT(*) > 15
ORDER BY
    peso_medio DESC;