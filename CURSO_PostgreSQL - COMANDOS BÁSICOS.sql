-- 1° Exemplo de Select
SELECT *
FROM sales.customers
LIMIT 10


SELECT email AS "Emails dos Clientes" 
FROM sales.customers
LIMIT 10

-- ========================================================
-- 1º Exemplo de Select usando a função "DISTINCT"
SELECT DISTINCT brand
FROM sales.products
-- LIMIT 10

-- 2º Exemplo de Select usando a função "DISTINCT"
SELECT DISTINCT brand, model_year
FROM sales.products
-- LIMIT 10

-- ==========================================================
-- 1° Exemplo de Select com o comando "WHERE"
-- imagine que seu chefe peça uma lista com os emails dos clientes que moram em "Santa Catariana"
SELECT 
	first_name,
	state,
	city,
	email
FROM sales.customers
WHERE state = 'SC'
-- LIMIT 10

-- 2° Exemplo de Select com o comando "WHERE"
-- imagine que seu chefe peça uma lista com os emails dos clientes que moram em "Santa Catariana" ou "Mato Grosso do Sul"
SELECT 
	first_name,
	state,
	city,
	email
FROM sales.customers
WHERE state = 'SC' or state = 'MS'

-- ==========================================================
-- 3° Exemplo de Select com o comando "WHERE"
-- imagine que seu chefe peça uma lista com os emails dos clientes que moram em "Santa Catariana" ou "Mato Grosso do Sul"
-- Tenha mais de 30 anos
SELECT 
	first_name,
	state,
	city,
	email,
	birth_date,
	DATE_PART('YEAR', AGE(CURRENT_DATE, birth_date)) AS "idade"
	
FROM sales.customers
WHERE (state = 'SC' or state = 'MS') and DATE_PART('YEAR', AGE(CURRENT_DATE, birth_date)) >= 30
ORDER BY DATE_PART('YEAR', AGE(CURRENT_DATE, birth_date)) ASC -- CRESCENTE

-- Mesma consulta anterior como um personalição, criação de uma coluna cálculada que mostra a idade atual do clientes
SELECT
	state,
	email,
	birth_date
FROM sales.customers
WHERE (state = 'SC' or state = 'MS') and birth_date < '1991-12-28'

-- ==========================================================
1° -- 3° Exemplo de Select com o comando "LIMIT"
-- imagine que seu chefe peça uma lista com os 10 produtos mais caros da nossa empresa
SELECT *
FROM sales.products
ORDER BY price DESC
LIMIT 10


-- ========================================================== COMANDOS QUE PODEM AJUDAR NAS ANALISES ==========================================================
-- CLASSIFICAÇÃO DE COLUNAS
ORDER BY sales.customers.state ASC -- CRESCENTE
ORDER BY sales.customers.state DESC -- DECRESCENTE
-- DATA ATUAL
CURRENT_DATE  -- VOCÊ PODE CRIAR UMA COLUNA DE DATA ATUAL NA SUA CONSULTA
-- DIFERENÇA DE ANOS ENTRE DATAS
DATE_PART('YEAR', AGE(CURRENT_DATE, birth_date)) AS "idade" -- VOCÊ PODE FAZER UM CÁLCULO DE DATA PARA SABER A IDADE PELA "DATA DE NASCIMENTO"


