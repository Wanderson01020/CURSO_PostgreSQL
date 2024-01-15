-- Funcoes_agregadas
-- Servem para executar operações aritméticas nos registros de uma coluna

-- Tipo de funcões agregadas =========================================
-- COUNT()
-- SUM()
-- MAX()
-- MIN()
-- AVG()

-- -- ==========================================================
-- EX.1 Contagem de todas as linhas de uma tabela
-- Conte todas as visitas realizadas no site da empresa ficticia

Select count(*)
from sales.funnel

-- EX.2 contagem das linhas da coluna
-- conte todos dos os pagamentos registrados na tabala sales.funnel 

Select *
from sales.funnel
limit 10


Select count(paid_date)
from sales.funnel

-- EX. 3 Contagem destinta de uma Coluna
-- Conte todos os produtos destintos visitados em jan/21

Select count(product_id)
from sales.funnel
where visit_page_date between '2021-01-01' and '2021-01-31'


Select count(distinct product_id)
from sales.funnel
where visit_page_date between '2021-01-01' and '2021-01-31'

-- OUTRAS FUNÇÕES ===============================================
-- EX. 4 calcular o preco máximo, mínimo e médio dos produtos da tabela products
select min(price), max(price), avg(price)
from sales.products


-- EX. 5 Informe o veículo mais caro da tabela products

select max(price)
from sales.products

select *
from sales.products
where price = (select max(price) from sales.products)

-- group by - serve para agrupar registros semelhantes de uma coluna
-- Normalmente utilizado em conjunto com as funções de agregação


-- EXEMPLOS #########################################
-- EX. 1 Contagem agrupada de uma coluna
-- calcule o n° de clientes da tabela customers por estado

select state, count(*) as contagem
from sales.customers
group by state
order by contagem desc

-- EX.2 Contagem agrupada de várias colunas
-- Calcule o n° de clientes por estado e status profissional

select state, professional_status, count(*) as contagem
from sales.customers
group by state, professional_status
order by state, contagem desc


-- EX. 3 Seleção de valores distintos
-- selecione os estados distintos na tabela customers utilizando o grup by

Select distinct state
from sales.customers

select state
from sales.customers
group by state

-- Filtro no HAVING
-- Calcule o n° de clientes por estado filtrando apenas estados acima de 100 clientes
select
	state, -- coluna da tabela
	count(*) -- funcão agregada
from sales.customers
group by state
-- where count(*) > 100 não funciona com funções agregadas, somente colunas da tabela
having count(*) > 100

select
	state, -- coluna da tabela
	count(*) -- funcão agregada
from sales.customers
group by state
having count(*) > 100 and state <> 'MG'



