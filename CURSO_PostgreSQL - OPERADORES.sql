-- Aula de Operadores Atitiméticos
-- Eles servem para executar operações matemáticas
-- Muito utilizados para criar colunas Calculadas
-- ==============================================================
-- Tipos
-- +
-- -
-- *
-- /
-- ^
-- %
-- || -> não é um operador aritimético
-- ==============================================================

-- EX. Crie uma coluna calculada com a idade do clientes da tabela sales.customers

Select *
From sales.customers
Limit 10


Select 
	email,
	birth_date,
	(current_date - birth_date) / 365 as "Idade do Cliente"
From sales.customers
Limit 10

-- EX. 2 Listar os 10 clientes mais novos que tenho na tabela customers

Select 
	email,
	birth_date,
	(current_date - birth_date) / 365 as "Idade do Cliente"
From sales.customers
order by "Idade do Cliente" asc 
Limit 10

-- Ex. 3 Crie uma coluna "nome_completo" que retorna o nome completo do cliente

Select 
first_name || ' ' || last_name as nome_completo
From sales.customers
limit 10


-- Operadores de comparação
-- ==============================================================
--EX. Crie uma coluna que retorne TRUE sempre que o profissional for um funcionário CLT
Select 
	customer_id,
	first_name,
	professional_status,
	'clt' = professional_status as cliente_clt
From sales.customers
limit 10

-- Operadores lógicos
-- Usados para unit expressões simples em uma comporta
-- ==============================================================
-- TIPOS ==============================================================
-- AND
-- OR
-- NOT
-- BETWEEN
-- IN ou NOT IN
-- LIKE
-- ILIKE
-- IS NULL

-- ==============================================================
-- Uso do comando BETWEEN
-- Selecione veículos que custam entre 100k e 200k na tabela products

Select *
From sales.products
where price >= 100000 and price <= 200000 
-- limit 10


Select *
From sales.products
where price between 100000 and 200000 

-- usando o comando not
-- Selecione os veículos que custam abaixo de 100k ou acima de 200k na tabela products

Select *
From sales.products
where price < 100000 or price > 200000 

Select *
From sales.products
where price not between 100000 and 200000 

-- usando o comando in
-- selecionar os produtos que sejam da marca HONDA, TOYOTA ou RENAULT

Select *
From sales.products
where brand = 'HONDA' or brand ='TOYOTA' or brand = 'RENAULT'  

Select *
From sales.products
where brand in ('HONDA','TOYOTA','RENAULT')

Select *
From sales.products
where brand not in ('HONDA','TOYOTA','RENAULT')

-- Uso do comando LIKE (matche imperfeitos)
-- Selecione os primeiros nomes distintos da tabela customers que começam
-- com as iniciais ANA
-- ==============================================================

Select first_name
From sales.customers
where first_name = 'ANA'
Limit 10

Select first_name
From sales.customers
where first_name like 'ANA%'
-- Limit 10

Select first_name
From sales.customers
where first_name like '%ANA'
-- Limit 10

-- Uso do comando ILIKE (ignora as letras maíusculas e mínusculas)
-- Selecione os primeiros nomes distintos da tabela customers que começam
-- com as iniciais ANA

Select first_name
From sales.customers
where first_name ilike 'ana%'
-- Limit 10	

-- Uso do comando IS NULL
-- selecionar as linha que nulo no campo "popupation" na tabela
-- temp_tables.regions

select *
from temp_tables.regions
limit 10


select *
from temp_tables.regions
where population is null