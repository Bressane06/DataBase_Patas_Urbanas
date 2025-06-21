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
VALUES('12131314151', 'Marina', 'Oliveira', 'Costa', '2000-05-12', 25, 'F', 11, '13579246', 'Rua do Bem');

INSERT INTO Voluntario(dataIngresso, areaAtuacao, CPF, CPFsupervisor) 
VALUES ('2025-01-01', 'Cuidadora', '12131314151', '11111111111');

INSERT INTO AjudaAnimal (CPFvoluntario, codigoAnimal)
VALUES ('12131314151', 1);

-- CADASTRAR UMA NOVA CONSULTA
INSERT INTO consultaanimal (id, data, descricao, prescricao, codigoAnimal, CNPJclinica, CPF_responsavel, CPF_veterinario)
VALUES(10, '2025-06-01', 'Infecção de ouvido', 'Antibiótico por 5 dias', 1, '12345678000101', '11111111111', '22222222222');

-- ATUALIZAÇÃO 

-- Atualizar o nome de um animal
UPDATE Animal
SET nome = 'Maxwell'
WHERE codigo = 10;

-- Atualizar o estado de saúde de um animal
UPDATE Animal
SET estadoSaude = 'Saudável'
WHERE codigo = 2;

-- Atualizar a área de atuação
UPDATE Voluntario
SET areaatuacao = 'Veterinário(a) Sênior'
WHERE CPF = '22222222222';

-- Atualizar o endereço completo (logradouro, número e cep) de uma clínica veterinária específica
UPDATE ClinicaVeterinaria
SET logradouro = 'Rua Nova Esperança', numeroLocal = 321, cep = '55556666'
WHERE CNPJ = '23456789000102';

-- REMOÇÃO

-- Remover os telefones do Gabriel Bressane
DELETE FROM TelefonePessoa
WHERE CPF IN (
    SELECT CPF
    FROM Pessoa
    WHERE primeiroNome = 'Gabriel' AND ultimoNome = 'Bressane'
)