-- 10 ANIMAIS
INSERT INTO Animal (codigo, nome, sexo, especie, raca, data, porte, estadoSaude, castrado) VALUES
(1, 'Toby', 'M', 'Cão', 'Labrador', '2022-06-10', 'Grande', 'Saudável', 1),
(2, 'Luna', 'F', 'Gato', 'Siamês', '2023-02-15', 'Pequeno', 'Em tratamento', 0),
(3, 'Thor', 'M', 'Cão', 'Poodle', '2021-11-01', 'Médio', 'Saudável', 1),
(4, 'Mel', 'F', 'Cão', 'Vira-lata', '2020-08-23', 'Pequeno', 'Saudável', 0),
(5, 'Nina', 'F', 'Gato', 'Persa', '2019-04-30', 'Pequeno', 'Em tratamento', 1),
(6, 'Zeus', 'M', 'Cão', 'Pastor Alemão', '2023-01-05', 'Grande', 'Saudável', 1),
(7, 'Maya', 'F', 'Gato', 'Angorá', '2022-12-12', 'Pequeno', 'Saudável', 0),
(8, 'Bento', 'M', 'Cão', 'Bulldog', '2018-02-10', 'Médio', 'Saudável', 1),
(9, 'Sofia', 'F', 'Gato', 'Maine Coon', '2020-10-20', 'Grande', 'Saudável', 1),
(10, 'Max', 'M', 'Cão', 'Beagle', '2021-09-25', 'Médio', 'Em tratamento', 1);

-- 10 PESSOAS (5 voluntários, 5 funcionários, CPFs distintos)
INSERT INTO Pessoa (CPF, primeiroNome, meioNome, ultimoNome, dataNasc, idade, sexo, numeroLocal, cep, logradouro) VALUES
('11111111111', 'Gabriel', 'Fiorentino', 'Bressane', '2006-05-03', 19, 'M', 1, '12345678', 'Rua dos Segredos'),
('22222222222', 'Breno', 'Hideki', 'Utimura', '2003-12-01', 21, 'M', 2, '23456789', 'Rua Dom Pedro I'),
('33333333333', 'João', NULL, 'Santos', '1975-01-10', 50, 'M', 3, '34567890', 'Rua Verde'),
('44444444444', 'Ana', 'Paula', 'Costa', '2000-12-30', 24, 'F', 4, '45678901', 'Alameda Azul'),
('55555555555', 'Pedro', NULL, 'Souza', '1985-05-05', 40, 'M', 5, '56789012', 'Travessa Laranja'),
('66666666666', 'Juliana', NULL, 'Mendes', '1992-11-11', 32, 'F', 6, '67890123', 'Rua dos Pássaros'),
('77777777777', 'Lucas', 'Fernando', 'Pereira', '1988-09-22', 36, 'M', 7, '78901234', 'Av. das Palmeiras'),
('88888888888', 'Beatriz', NULL, 'Ferreira', '1995-05-19', 29, 'F', 8, '89012345', 'Travessa das Acácias'),
('99999999999', 'Rafael', 'A.', 'Lima', '1983-03-03', 42, 'M', 9, '90123456', 'Rua das Hortências'),
('10101010101', 'Paula', NULL, 'Almeida', '1998-08-08', 26, 'F', 10, '01234567', 'Av. dos Jacarandás');

-- 5 CLINICAS
INSERT INTO ClinicaVeterinaria (CNPJ, nome, especialidade, numeroLocal, cep, logradouro) VALUES
('12345678000101', 'Clínica Vet Vida', 'Geral', 101, '12345678', 'Rua das Flores'),
('23456789000102', 'Pet Saúde', 'Cirurgia', 202, '23456789', 'Av. Central'),
('34567890000103', 'Amigos dos Animais', 'Dermatologia', 303, '34567890', 'Rua Verde'),
('45678901000104', 'PetCare', 'Geral', 404, '45678901', 'Alameda Azul'),
('56789012000105', 'Clínica Bicho Feliz', 'Odontologia', 505, '56789012', 'Travessa Laranja');

-- 5 VOLUNTÁRIOS (CPFs exclusivos)
INSERT INTO Voluntario (CPF, CPFsupervisor, especialidade, numeroLocal, cep, logradouro) VALUES
('11111111111', NULL, 'Cuidador', 1, '12345678', 'Rua das Flores'),
('22222222222', '11111111111', 'Veterinário', 2, '23456789', 'Av. Central'),
('33333333333', '11111111111', 'Auxiliar', 3, '34567890', 'Rua Verde'),
('44444444444', '22222222222', 'Adestrador', 4, '45678901', 'Alameda Azul'),
('55555555555', '33333333333', 'Socialização', 5, '56789012', 'Travessa Laranja');

-- 5 FUNCIONÁRIOS (CPFs exclusivos, diferentes dos voluntários)
-- TIPOCONTRATO só aceita: 'CLT', 'PJ', 'meio periodo'
INSERT INTO Funcionario (CPF, dataContratacao, remuneracao, tipoContrato, cargo, horasSemana) VALUES
('66666666666', '2021-06-20', 3100.00, 'CLT', 'Atendente', 44),
('77777777777', '2019-08-15', 3400.00, 'PJ', 'Financeiro', 40),
('88888888888', '2020-01-10', 3500.00, 'meio periodo', 'Financeiro', 20),
('99999999999', '2022-02-13', 2800.00, 'CLT', 'Auxiliar Administrativo', 44),
('10101010101', '2023-03-01', 4100.00, 'CLT', 'Auxiliar Administrativo', 30);

-- 5 ADOTANTES (podem ser voluntários, funcionários ou apenas pessoas)
INSERT INTO Adotante (CPF) VALUES
('11111111111'),   -- voluntário
('66666666666'),   -- funcionário
('10101010101'),   -- funcionário
('22222222222'),   -- voluntário
('33333333333');   -- voluntário

-- 5 DEPENDENTES (vinculados a funcionários)
INSERT INTO Dependente (CPF, CPF_funcionario, idade, primeiroNome, meioNome, ultimoNome, sexo, numeroLocal, cep, logradouro) VALUES
('12121212121', '66666666666', 16, 'Lucas', NULL, 'Silva', 'M', 10, '12345678', 'Rua das Flores'),
('23232323232', '77777777777', 14, 'Julia', 'Maria', 'Oliveira', 'F', 20, '23456789', 'Av. Central'),
('34343434343', '88888888888', 13, 'Rafaela', NULL, 'Santos', 'F', 30, '13572468', 'Rua do Sol'),
('45454545454', '99999999999', 12, 'Vinicius', NULL, 'Costa', 'M', 40, '24681357', 'Rua da Lua'),
('56565656565', '10101010101', 11, 'Beatriz', NULL, 'Souza', 'F', 50, '36925814', 'Rua das Pedras');

-- 15 RECURSOS (5 para cada subclasse)
INSERT INTO Recurso (codigo, descricao, origem, data) VALUES
-- Dinheiro
(1, 'Doação Financeira', 'Doação', '2025-05-01'),
(2, 'Recursos Próprios', 'Recurso Próprio', '2025-05-02'),
(3, 'Arrecadação de Evento', 'Eventos', '2025-05-03'),
(4, 'Campanha Online', 'Doação', '2025-05-04'),
(5, 'Doação Anônima', 'Doação', '2025-05-05'),
-- Alimento
(6, 'Ração para cães', 'Doação', '2025-05-10'),
(7, 'Ração para gatos', 'Doação', '2025-05-11'),
(8, 'Sache para gatos', 'Eventos', '2025-05-12'),
(9, 'Biscoito para cães', 'Doação', '2025-05-13'),
(10, 'Sache para gatos', 'Doação', '2025-05-14'),
-- Objeto
(11, 'Coleira', 'Recurso Próprio', '2025-05-15'),
(12, 'Brinquedo de corda', 'Doação', '2025-05-16'),
(13, 'Caminha', 'Eventos', '2025-05-17'),
(14, 'Comedouro', 'Doação', '2025-05-18'),
(15, 'Bebedouro', 'Doação', '2025-05-19');

-- 5 DINHEIRO (códigos 1-5)
INSERT INTO Dinheiro (codigo, cifra, valor) VALUES
(1, 'BRL', 500.00),
(2, 'BRL', 1200.00),
(3, 'BRL', 300.00),
(4, 'BRL', 750.50),
(5, 'BRL', 200.00);

-- 5 ALIMENTO (códigos 6-10, todos únicos)
INSERT INTO Alimento (codigo, tipo, unidade, qtdd, dtValidade) VALUES
(6, 'Ração Cachorro', 'kg', 10, '2025-09-10'),
(7, 'Ração Gato', 'kg', 5, '2025-09-15'),
(8, 'Sache Gato', 'unidade', 20, '2027-12-31'),
(9, 'Biscoito Cachorro', 'kg', 7, '2025-10-10'),
(10, 'Sache Gato', 'unidade', 3, '2025-10-15');

-- 5 OBJETO (códigos 11-15, todos únicos)
INSERT INTO Objeto (codigo, nome, tipo, obs) VALUES
(11, 'Coleira', 'Acessório', 'Coleira vermelha, tamanho M'),
(12, 'Brinquedo de corda', 'Brinquedo', 'Corda resistente'),
(13, 'Caminha', 'Acessório', 'Caminha grande, azul'),
(14, 'Comedouro', 'Acessório', 'Comedouro de inox'),
(15, 'Bebedouro', 'Acessório', 'Bebedouro automático');

-- 5 CONSULTA ANIMAL
INSERT INTO ConsultaAnimal (codigoAnimal, CNPJclinica, CPF_responsavel, prescricao, descricao, data) VALUES
(1, '12345678000101', '11111111111', 'Antibiótico por 7 dias', 'Infecção tratada', '2024-11-20'),
(2, '23456789000102', '22222222222', 'Vacina V10', 'Vacinação anual', '2025-01-10'),
(3, '34567890000103', '33333333333', 'Vermífugo', 'Prevenção vermes', '2025-03-15'),
(4, '45678901000104', '44444444444', 'Analgésico', 'Dor nas patas', '2025-04-12'),
(5, '56789012000105', '55555555555', 'Limpeza de tártaro', 'Consulta odontológica', '2025-05-25');

-- 5 AJUDA ANIMAL
INSERT INTO AjudaAnimal (CPFvoluntario, codigoAnimal) VALUES
('11111111111', 6),
('22222222222', 7),
('33333333333', 8),
('44444444444', 9),
('55555555555', 10);

-- 5 ADOCAO
INSERT INTO Adocao (CPF_adotante, codigoAnimal, data, obs) VALUES
('11111111111', 1, '2025-05-10', 'Adaptação em andamento'),
('66666666666', 2, '2025-05-11', 'Animal saudável'),
('10101010101', 3, '2025-05-12', 'Primeira adoção'),
('22222222222', 4, '2025-05-13', 'Animal tímido'),
('33333333333', 5, '2025-05-14', 'Família com crianças');

-- 5 TELEFONEPESSOA
INSERT INTO TelefonePessoa (CPF, telefone) VALUES
('11111111111', '11999999999'),
('22222222222', '21988888888'),
('33333333333', '31977777777'),
('44444444444', '41966666666'),
('55555555555', '51955555555');

-- 5 TELEFONECLINICA
INSERT INTO TelefoneClinica (CNPJ, telefone) VALUES
('12345678000101', '1133300011'),
('23456789000102', '2133300012'),
('34567890000103', '3133300013'),
('45678901000104', '4133300014'),
('56789012000105', '5133300015');

-- 5 EMAILPESSOA
INSERT INTO EmailPessoa (CPF, email) VALUES
('11111111111', 'carlos.silva@email.com'),
('22222222222', 'maria.oliveira@email.com'),
('33333333333', 'joao.santos@email.com'),
('44444444444', 'ana.costa@email.com'),
('55555555555', 'pedro.souza@email.com');

-- 5 EMAILCLINICA
INSERT INTO EmailClinica (CNPJ, email) VALUES
('12345678000101', 'vetvida@clinica.com'),
('23456789000102', 'petsaude@clinica.com'),
('34567890000103', 'amigosanimais@clinica.com'),
('45678901000104', 'petcare@clinica.com'),
('56789012000105', 'bichofeliz@clinica.com');

-- 8 GERENCIA
INSERT INTO Gerencia (CPF_funcionario, codigoRecurso) VALUES
('66666666666', 1),
('77777777777', 2),
('77777777777', 5),
('88888888888', 5),
('88888888888', 6),
('88888888888', 8),
('99999999999', 10),
('10101010101', 11);