-- Função Union

-- A função "UNION" uni duas tabelas ou mais tirando as linha duplicadas
-- já a função "UNION ALL" somente uni as tabelas

Tabela 1 --(Query)

union ou union all

Tabela 2 --(Query)

-- Ex: 1  União simples de duas tabelas
-- Una s tabela sales.products com a tabela temp_products_2

select * from sales.products
union all
select * from temp_tables.products_2


