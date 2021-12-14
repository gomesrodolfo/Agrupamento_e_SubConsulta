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

