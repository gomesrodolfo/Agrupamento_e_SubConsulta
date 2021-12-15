-- Exercícios de Agrupamento:
-- Exercicio 1
select relacao 
from dependente Group by relacao;

-- Exercicio 2
select sexo 
from dependente Group by sexo;

-- Exercicio 3
select sexo, count(*) 
from dependente group by sexo;

-- Exercicio 4
select max(salario) from empregado;
select nome, max(salario) 
as maior_salario 
from empregado 
group by nome having max(salario) > 5999; -- para aparecer somente o maior salario e o nome do dono

-- Exercicio 5
select min(salario) from empregado;
select nome, min(salario) 
as menor_salario 
from empregado 
group by nome having max(salario) < 1301; -- para aparecer somente o menor salario e o nome do dono

-- Exercicio 6
select sum(salario) 
from empregado;

-- Exercicio 7
select distinct numero 
from departamento;

SELECT D.nome, sum(salario)
FROM empregado E
INNER JOIN
departamento D
ON (E.depto=D.numero)
WHERE E.depto IN (
 select numero
 from departamento
 )
GROUP BY D.nome;

-- Exercicio 8
select D.Nome, 
sum(salario), avg(salario), min(salario), max(salario), stddev(salario) from empregado E 
inner join departamento D on(E.depto = D.numero) 
where E.depto in (select distinct numero from departamento) GROUP BY D.Nome;


-- Exercícios de Agrupamento com Junção
-- Exercicio 1
select empregado.rg, empregado.nome, dependente.rg_responsavel, dependente.nome_dependente
from empregado as empregado 
join dependente as dependente 
on empregado.rg = dependente.rg_responsavel;

select empregado.rg, empregado.nome, count(dependente.nome_dependente) as numero_dependentes
from empregado as empregado 
join dependente as dependente 
on empregado.rg = dependente.rg_responsavel 
group by empregado.rg, empregado.nome;

-- Exercicio 2
select empregado.rg, empregado.nome, count(empregado_projeto.numero_projeto) as numero_projetos
from empregado as empregado
join empregado_projeto as empregado_projeto
on empregado.rg = empregado_projeto.rg_empregado
group by empregado.rg, empregado.nome;

-- Exercicio 3
select empregado.nome, empregado.rg, sum(empregado_projeto.horas) as horas_projeto
from empregado as empregado
join empregado_projeto as empregado_projeto
on empregado.rg = empregado_projeto.rg_empregado
group by empregado.nome, empregado.rg order by sum(empregado_projeto.horas);

--Exercicio 4
select departamento.numero, count(empregado.rg) as numero_empregados
from departamento as departamento
join empregado as empregado
on departamento.numero = empregado.depto
group by departamento.numero;

--Exercicio 5
select departamento.nome, departamento.numero, count(empregado.rg) as numero_empregados
from departamento as departamento
join empregado as empregado
on departamento.numero = empregado.depto
group by departamento.nome, departamento.numero
having count(empregado.rg) >= 3;

--Exercicio 6
select departamento.nome, departamento.numero, sum(empregado.salario) as soma_salarios
from departamento as departamento
join empregado as empregado
on departamento.numero = empregado.depto
group by departamento.nome, departamento.numero
having sum(empregado.salario) >= 6000;
