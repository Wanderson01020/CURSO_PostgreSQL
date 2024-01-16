--Funções "JOINS"
--Para fazer join entre as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela 2
select * from temp_tables.tabela_1
select * from temp_tables.tabela_2

--EX.1
select 
	t1.cpf,
	t1.name,
	t2.state
from temp_tables.tabela_1 as t1
left join  temp_tables.tabela_2 as t2 on t1.cpf = t2.cpf

--EX.2
select 
	t1.cpf,
	t1.name,
	t2.state
from temp_tables.tabela_1 as t1
inner join  temp_tables.tabela_2 as t2 on t1.cpf = t2.cpf

--EX.3
select 
	t2.cpf,
	t1.name,
	t2.state
from temp_tables.tabela_1 as t1
right join  temp_tables.tabela_2 as t2 on t1.cpf = t2.cpf

--EX.4
select 
	t2.cpf,
	t1.name,
	t2.state
from temp_tables.tabela_1 as t1
full join  temp_tables.tabela_2 as t2 on t1.cpf = t2.cpf

-- Exercicios ####################################################################

-- EX.1 Identifique qual é o status profissional mais frequente nos clientes
-- que compraram automóveis no site
select * from sales.funnel

select 
	cus.professional_status,
	count(fun.paid_date)
from sales.funnel fun
left join sales.customers cus on fun.customer_id = cus.customer_id
group by cus.professional_status
order by count(fun.paid_date) desc

-- EX.2 Identifique qual é o gênero mais frequente nos clientes que compraram
-- automóveis no site, Obs: Utilizar a tabela temp_tables. ibge_genders
select * from temp_tables.ibge_genders limit 10

select
	ibge.gender,
	count(fun.paid_date)
from sales.funnel fun
left join sales.customers cus on fun.customer_id = cus.customer_id
left join temp_tables.ibge_genders ibge on lower(cus.first_name) = ibge.first_name
group by ibge.gender


-- EX.3 Identifique de quais regiões são os clientes que mais visitam o site
-- Obs: Utilizar a tabela temp_tables.regions
select * from sales.customers limit 10
select * from temp_tables.regions limit 10

select
	rg.region,
	count(fun.visit_page_date) as visitas
from sales.funnel fun
left join sales.customers cus on fun.customer_id = cus.customer_id
left join temp_tables.regions rg on lower(cus.city) = lower(rg.city) and lower(cus.state) = lower(rg.state)
group by rg.region
order by visitas desc
