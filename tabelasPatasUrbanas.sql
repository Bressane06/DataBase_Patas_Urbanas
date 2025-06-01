-- Tabela Animal
CREATE TABLE Animal (
    codigo INTEGER PRIMARY KEY CHECK (codigo > 0),
    nome VARCHAR(60) NOT NULL,
    sexo CHAR(1) NOT NULL CHECK (sexo IN ('M', 'F')),
    especie VARCHAR(60) NOT NULL,
    raca VARCHAR(60) NOT NULL,
    data DATE NOT NULL,
    porte VARCHAR(60) NOT NULL,
    estadoSaude VARCHAR(20) NOT NULL CHECK (estadoSaude IN ('Saudável', 'Em tratamento')),
    castrado INTEGER NOT NULL DEFAULT 0 CHECK (castrado IN (0, 1))
);

-- Tabela Vacina
CREATE TABLE Vacina (
    codigo INTEGER PRIMARY KEY CHECK (codigo > 0),
    nome VARCHAR(60) UNIQUE NOT NULL,
    tipo VARCHAR(60) NOT NULL,
    viaAplicacao VARCHAR(60) NOT NULL CHECK (viaAplicacao IN ('Oral','Injetavel (Subcutanea)','Injetavel (Intramuscular)','Intranasal')),
    lote VARCHAR(60) NOT NULL,
    dataValidade DATE NOT NULL
);

-- Tabela ClinicaVeterinaria
CREATE TABLE ClinicaVeterinaria (
    CNPJ VARCHAR(14) PRIMARY KEY,
    nome VARCHAR(60) NOT NULL UNIQUE,
    especialidade VARCHAR(60) NOT NULL,
    numeroLocal INTEGER NOT NULL,
    cep CHAR(8) NOT NULL,
    logradouro CHAR(50) NOT NULL
);

-- Tabela Pessoa
CREATE TABLE Pessoa (
    CPF VARCHAR(11) PRIMARY KEY,
    primeiroNome VARCHAR(60) NOT NULL,
	meioNome VARCHAR(60) DEFAULT '',
    ultimoNome VARCHAR(60) NOT NULL,
    dataNasc DATE NOT NULL,
	idade INTEGER NOT NULL CHECK (idade >= 18 AND idade <= 150),
    sexo CHAR(1) NOT NULL CHECK (sexo IN ('M', 'F')),
    numeroLocal INTEGER NOT NULL,
    cep CHAR(8) NOT NULL,
    logradouro CHAR(50) NOT NULL
);

-- Tabela Recurso
CREATE TABLE Recurso (
    codigo INTEGER PRIMARY KEY CHECK (codigo > 0),
    descricao VARCHAR(100) NOT NULL,
    origem VARCHAR(60) NOT NULL CHECK (origem IN ('Doação', 'Recurso Próprio', 'Eventos')),
    data DATE NOT NULL
);

-- Tabela Dinheiro
CREATE TABLE Dinheiro (
    codigo INTEGER PRIMARY KEY REFERENCES Recurso(codigo),
    cifra VARCHAR(3) NOT NULL,
    valor DECIMAL(9,2) NOT NULL DEFAULT 0 CHECK (valor > 0)
);

-- Tabela Alimento
CREATE TABLE Alimento (
    codigo INTEGER PRIMARY KEY REFERENCES Recurso(codigo),
    tipo VARCHAR(60) NOT NULL,
    unidade VARCHAR(60) NOT NULL,
	qtdd INTEGER NOT NULL DEFAULT 0 CHECK (qtdd >= 0),
    dtValidade DATE NOT NULL
);

-- Tabela Objeto
CREATE TABLE Objeto (
    codigo INTEGER PRIMARY KEY REFERENCES Recurso(codigo),
    nome VARCHAR(60) NOT NULL,
    tipo VARCHAR(60) NOT NULL,
    obs VARCHAR(90)
);

-- Tabela Voluntario
CREATE TABLE Voluntario (
    CPF VARCHAR(11) PRIMARY KEY REFERENCES Pessoa(CPF),
    CPFsupervisor VARCHAR(11) REFERENCES Voluntario(CPF),
    especialidade VARCHAR(60) NOT NULL,
    numeroLocal INTEGER NOT NULL,
    cep CHAR(8) NOT NULL,
    logradouro CHAR(50) NOT NULL
);

-- Tabela Adotante
CREATE TABLE Adotante (
    CPF VARCHAR(11) PRIMARY KEY REFERENCES Pessoa(CPF)
);

-- Tabela Funcionario
CREATE TABLE Funcionario (
    CPF VARCHAR(11) PRIMARY KEY REFERENCES Pessoa(CPF),
    dataContratacao DATE NOT NULL,
    remuneracao DECIMAL(9,2) NOT NULL DEFAULT (1518.00),
    tipoContrato CHAR(30) NOT NULL CHECK (tipoContrato IN ('CLT', 'PJ', 'estagio', 'meio periodo')),
    cargo CHAR(60) NOT NULL,
    horasSemana INTEGER NOT NULL CHECK (horasSemana > 0)
);

-- Tabela Dependente
CREATE TABLE Dependente (
    CPF VARCHAR(11) NOT NULL,
    CPF_funcionario VARCHAR(11) NOT NULL,
    idade INTEGER NOT NULL,
    primeiroNome VARCHAR(60) NOT NULL,
    meioNome VARCHAR(60) DEFAULT '',
    ultimoNome VARCHAR(60) NOT NULL,
    sexo CHAR(1) NOT NULL CHECK (sexo IN ('M', 'F')),
    numeroLocal INTEGER NOT NULL,
    cep CHAR(8) NOT NULL,
    logradouro CHAR(50) NOT NULL,
    PRIMARY KEY (CPF, CPF_funcionario),
    FOREIGN KEY (CPF_funcionario) REFERENCES Funcionario(CPF)
);

-- Tabela ConsultaAnimal
CREATE TABLE ConsultaAnimal (
    id INTEGER PRIMARY KEY,
	codigoAnimal INTEGER NOT NULL REFERENCES Animal(codigo),
    CNPJclinica VARCHAR(14) NOT NULL REFERENCES ClinicaVeterinaria(CNPJ),
    CPF_responsavel VARCHAR(11) NOT NULL REFERENCES Voluntario(CPF),
    prescricao VARCHAR(90) NOT NULL,
    descricao VARCHAR(90) NOT NULL,
    data DATE NOT NULL
);

-- Tabela AjudaAnimal
CREATE TABLE AjudaAnimal (
    CPFvoluntario VARCHAR(11) NOT NULL REFERENCES Voluntario(CPF),
    codigoAnimal INTEGER NOT NULL REFERENCES Animal(codigo),
    PRIMARY KEY (CPFvoluntario, codigoAnimal)
);

-- Tabela Adocao
CREATE TABLE Adocao (
    CPF_adotante VARCHAR(11) NOT NULL REFERENCES Adotante(CPF),
    codigoAnimal INTEGER NOT NULL REFERENCES Animal(codigo),
    data DATE NOT NULL,
    obs VARCHAR(60),
	PRIMARY KEY (CPF_adotante, codigoAnimal)
);

-- Tabela TelefonePessoa
CREATE TABLE TelefonePessoa (
    CPF VARCHAR(11) NOT NULL REFERENCES Pessoa(CPF),
    telefone VARCHAR(12) NOT NULL,
    PRIMARY KEY (CPF, telefone)
);

-- Tabela TelefoneClinica
CREATE TABLE TelefoneClinica (
    CNPJ VARCHAR(14) NOT NULL REFERENCES ClinicaVeterinaria(CNPJ),
    telefone VARCHAR(12) NOT NULL,
    PRIMARY KEY (CNPJ, telefone)
);

-- Tabela EmailPessoa
CREATE TABLE EmailPessoa (
    CPF VARCHAR(11) NOT NULL REFERENCES Pessoa(CPF),
    email VARCHAR(40) NOT NULL,
    PRIMARY KEY (CPF, email)
);

-- Tabela EmailClinica
CREATE TABLE EmailClinica (
    CNPJ VARCHAR(14) NOT NULL REFERENCES ClinicaVeterinaria(CNPJ),
    email VARCHAR(40) NOT NULL,
    PRIMARY KEY (CNPJ, email)
);

-- Tabela EVacinado
CREATE TABLE EVacinado (
    codigoVacina INTEGER NOT NULL REFERENCES Vacina(codigo),
    codigoAnimal INTEGER NOT NULL REFERENCES Animal(codigo),
    data DATE NOT NULL,
    PRIMARY KEY (codigoVacina, codigoAnimal)
);

-- Tabela Gerencia
CREATE TABLE Gerencia (
    CPF_funcionario VARCHAR(11) NOT NULL REFERENCES Funcionario(CPF),
    codigoRecurso INTEGER NOT NULL REFERENCES Recurso(codigo),
    PRIMARY KEY (CPF_funcionario, codigoRecurso)
);