-- Trabalho BD
-- Breno Hideki Utimura
-- Gabriel Fiorentino Bressane
-- Data: 10/06/2025

-- INSERÇÃO

-- INSERIR UM NOVO ANIMAL
INSERT INTO Animal (codigo, nome, sexo, especie, raca, data, porte, estadoSaude, castrado)
VALUES (11, 'Pipoca', 'F', 'Cão', 'Lhasa Apso', '2021-12-05', 'Pequeno', 'Saudável', 1);

-- INSERIR UM NOVO VOLUNTARIO QUE CUIDARÁ DO ANIMAL 10
INSERT INTO Pessoa (CPF, primeiroNome, meioNome, ultimoNome, dataNasc, idade, sexo, numeroLocal, cep, logradouro)
VALUES ('12131314151', 'Marina', 'Oliveira', 'Costa', '2000-05-12', 25, 'F', 11, '13579246', 'Rua do Bem');

INSERT INTO Voluntario (CPF, CPFsupervisor, especialidade, numeroLocal, cep, logradouro) 
VALUES ('12131314151', '11111111111', 'Cuidadora', 11, '13579246', 'Rua do Bem');

INSERT INTO AjudaAnimal (CPFvoluntario, codigoAnimal)
VALUES ('12131314151', 1);

-- INSERIR UM NOVO DEPENDENTE
INSERT INTO Dependente (CPF, CPF_funcionario, idade, primeiroNome, meioNome, ultimoNome, sexo, numeroLocal, cep, logradouro)
VALUES ('14141414141', '66666666666', 10, 'Sofia', 'Martins', 'Mendes', 'F', 61, '11112222', 'Rua das Violetas');

-- CADASTRAR UMA NOVA CONSULTA
INSERT INTO ConsultaAnimal (id, codigoAnimal, CNPJclinica, CPF_responsavel, prescricao, descricao, data)
VALUES (6, 1, '12345678000101', '11111111111', 'Antibiótico por 5 dias', 'Infecção de ouvido', '2025-06-01');


-- ATUALIZAÇÃO 

-- Atualizar o nome de um animal
UPDATE Animal
SET nome = 'Maxwell'
WHERE codigo = 10;

-- Atualizar o estado de saúde de um animal
UPDATE Animal
SET estadoSaude = 'Saudável'
WHERE codigo = 2;

-- Atualizar a especialidade e o endereço de um voluntário
UPDATE Voluntario
SET especialidade = 'Veterinário(a) Sênior', logradouro = 'Rua das Magnólias'
WHERE CPF = '22222222222';

-- Atualizar o endereço completo (logradouro, número e cep) de uma clínica veterinária específica
UPDATE ClinicaVeterinaria
SET logradouro = 'Rua Nova Esperança', numeroLocal = 321, cep = '55556666'
WHERE CNPJ = '23456789000102';

-- REMOÇÃO

-- Remover um telefone de uma pessoa
DELETE FROM TelefonePessoa
WHERE CPF = '11111111111' AND telefone = '11999999999';

-- Remover um voluntário específico
-- 1. Remover registros de AjudaAnimal relacionados ao voluntário
DELETE FROM AjudaAnimal
WHERE cpfvoluntario = '55555555555';

-- 2. Remover registros de ConsultaAnimal relacionados ao voluntário
DELETE FROM ConsultaAnimal
WHERE CPF_responsavel = '55555555555';

-- 3. Remover o voluntário
DELETE FROM Voluntario
WHERE cpf = '55555555555';

-- Remover uma vacina específica pelo seu código
DELETE FROM Vacina
WHERE codigo = 8;

-- Remover uma clínica
DELETE FROM ConsultaAnimal
WHERE CNPJclinica = '12345678000101';

DELETE FROM telefoneclinica
WHERE cnpj = '12345678000101';

DELETE FROM emailclinica
WHERE cnpj = '12345678000101';

DELETE FROM ClinicaVeterinaria
WHERE CNPJ = '12345678000101';
