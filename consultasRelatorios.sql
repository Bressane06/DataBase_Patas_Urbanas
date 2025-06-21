-- Trabalho BD
-- Breno Hideki Utimura
-- Gabriel Fiorentino Bressane
-- Data: 20/10/2025


-- 1) Exibir os nomes e CPFs dos voluntários:
SELECT 
	P.primeironome, 
	P.ultimonome,
	P.cpf
FROM pessoa AS P
	JOIN voluntario AS V ON P.cpf = V.cpf;
	
-- 2) Listar todos os animais adotados, com nome do animal, nome do adotante e data de adoção:
SELECT 
	P.primeironome,
	P.ultimonome,
	AN.nome AS nomeAnimal,
	A.data
FROM adocao AS A
	JOIN adotante AS AD ON AD.cpf = A.cpf_adotante
	JOIN pessoa AS P ON P.cpf = AD.cpf
	JOIN animal AS AN ON AN.codigo = A.codigoanimal;
	
-- 3) Mostrar o nome dos funcionários e o total de recursos que cada um gerencia:
SELECT 
	P.primeironome,
	P.ultimonome,
	COUNT(*) AS TotalRec
FROM funcionario AS F
	JOIN pessoa AS P ON P.cpf = F.cpf
	JOIN gerencia AS G ON F.cpf = G.cpf_funcionario
	JOIN recurso AS R ON G.codigorecurso = R.codigo
GROUP BY P.primeironome, P.ultimonome;

-- 4) Listar todos os animais que já receberam vacinação, indicando a vacina e a data:
SELECT
	A.nome AS momeAnimal,
	vacina.nome AS nomeVacina,
	V.data
FROM vacinacao AS V
	JOIN animal AS A ON V.codigoanimal = A.codigo
	JOIN vacina ON V.codigovacina = vacina.codigo;

-- 5) Quantidade de animais consultados por cada veterinário
SELECT 
	P.primeironome,
	P.ultimonome,
	COUNT(C.cpf_veterinario) AS qtdAnimaisConsultados
FROM consultaanimal AS C
	JOIN veterinario AS V ON V.cpf = C.cpf_veterinario
	JOIN pessoa AS P ON V.cpf = P.cpf
GROUP BY P.primeironome, P.ultimonome
ORDER BY COUNT(C.cpf_veterinario) DESC;

-- 6) Total de dinheiro arrecadado no ano de 2025:
SELECT
     SUM(D.valor)
FROM dinheiro AS D
    JOIN recurso AS R ON D.codigo = R.codigo
WHERE R.data >= '2025-01-01' AND R.data <= '2025-12-31';

-- 7) Mostrar o nome da clínica e quantidade distinta de animais já atendidos nela (consultas realizadas):
SELECT
	CL.nome,
	COUNT(DISTINCT CO.codigoanimal)
FROM consultaanimal AS CO
	JOIN clinicaveterinaria AS CL ON CO.cnpjclinica = CL.cnpj
GROUP BY CL.nome;

-- 8) Animais que nunca foram adotados:
SELECT codigo
FROM animal
EXCEPT
SELECT AD.codigoanimal
FROM ANIMAL AS A
	JOIN ADOCAO AS AD ON A.codigo = AD.codigoanimal;
	
-- 9) Quantidade de supervisionados por supervisor:
SELECT
    P.primeiroNome,
    P.ultimoNome,
    COUNT(V.cpf) AS qtd_supervisionados
FROM Voluntario AS V
    JOIN Pessoa AS P ON P.cpf = V.cpfSupervisor
GROUP BY V.cpfSupervisor, P.primeiroNome, P.ultimoNome;

-- 10) Total de funcionarios distintos, quantos estão trabalhando e quantos estão parados:
SELECT
    COUNT(DISTINCT F.cpf) AS total_funcionarios,
    COUNT(DISTINCT G.cpf_funcionario) AS estao_trabalhando,
    COUNT(DISTINCT F.cpf) - COUNT(DISTINCT G.cpf_funcionario) AS estao_parados
FROM Funcionario AS F
LEFT JOIN Gerencia AS G ON F.cpf = G.cpf_funcionario;