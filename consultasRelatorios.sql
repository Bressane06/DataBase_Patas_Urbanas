-- Trabalho BD
-- Breno Hideki Utimura
-- Gabriel Fiorentino Bressane
-- Data: 08/10/2025


-- 1) Exibir os nomes e CPFs dos voluntários:
SELECT 
	P.primeironome, 
	P.ultimonome	
FROM pessoa AS P
	JOIN voluntario AS V ON P.cpf = V.cpf
	
-- 2) Listar todos os animais adotados, com nome do animal, nome do adotante e data de adoção:
SELECT 
	P.primeironome,
	P.ultimonome,
	AN.nome AS nomeAnimal,
	A.data
FROM adocao AS A
	JOIN adotante AS AD ON AD.cpf = A.cpf_adotante
	JOIN pessoa AS P ON P.cpf = AD.cpf
	JOIN animal AS AN ON AN.codigo = A.codigoanimal
	
-- 3) Mostrar o nome dos funcionários e o total de recursos que cada um gerencia:
SELECT 
	P.primeironome,
	P.ultimonome,
	COUNT(*) AS TotalRec
FROM funcionario AS F
	JOIN pessoa AS P ON P.cpf = F.cpf
	JOIN gerencia AS G ON F.cpf = G.cpf_funcionario
	JOIN recurso AS R ON G.codigorecurso = R.codigo
GROUP BY P.primeironome, P.ultimonome

-- 4) Listar todos os animais que já receberam vacinação, indicando a vacina e a data:
-- 5) Qual o veterinário que mais consultou animais:
-- 6) Total de dinheiro Arrecadado no ano de 2025:
-- 7) Mostrar o nome da clínica e quantidade distinta de animais já atendidos nela (consultas realizadas):
-- 8) Animais que nunca foram adotados:
-- 9) Quantidade de supervisionados por supervisor:
-- 10) Total de funcionarios distintos, quantos estão trabalhando e quantos estão parados:

