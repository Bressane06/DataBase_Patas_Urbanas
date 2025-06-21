# Sistema de Gerenciamento de Abrigo de Animais 🏡

Este projeto foi desenvolvido como parte da disciplina de **Banco de Dados** da **UFMS/CPTL**.  
O sistema simula um banco de dados relacional para um abrigo de animais, contemplando o cadastro de animais, pessoas (voluntários, funcionários, adotantes), clínicas veterinárias, recursos, adoções, consultas, dependentes e muito mais.

---

## 🎯 Objetivo

O objetivo do projeto é proporcionar aos alunos uma experiência prática de **modelagem**, **implementação** e **manipulação de dados** em banco de dados, utilizando comandos de inserção, atualização, remoção e consultas SQL.

---

### 📄 Relatório Técnico

Para mais detalhes sobre o desenvolvimento, modelagem e implementação do sistema, consulte o [Relatório Técnico](relatorioTecnico).

---

### 🗺️ Diagramas

Para acessar os diagramas do projeto (modelos ER, DER, etc.), consulte a pasta [Diagramas](diagramas).

## 🗃️ Modelagem das Tabelas

O banco de dados foi modelado com as seguintes entidades e relacionamentos principais, conforme os scripts SQL:

---

### 📂 Resumo dos Arquivos SQL

O projeto é composto por quatro arquivos SQL principais, cada um com uma função específica no ciclo de vida do banco de dados:

1. **[Tabelas](tabelasPatasUrbanas.sql)**  
    Responsável pela criação de todas as tabelas do banco de dados, definindo as entidades, atributos, tipos de dados, chaves primárias e estrangeiras, além das restrições de integridade.

2. **[Povoamento](povoamentoPatasUrbanas.sql)**  
    Contém comandos `INSERT` para popular as tabelas com dados iniciais, simulando registros reais de animais, pessoas, clínicas, recursos, entre outros.

3. **[ConsultasRelatorios](consultasRelatorios.sql)**  
    Reúne exemplos de consultas SQL (`SELECT`) para extrair informações relevantes do banco, como listagens, buscas filtradas, relatórios e estatísticas.

4. **[Inserir Atualizar Remover](InserirAtualizarRemover.sql)**  
    Inclui comandos de atualização (`UPDATE`) e remoção (`DELETE`) de dados, demonstrando como modificar ou excluir registros conforme as necessidades do sistema.

Esses arquivos permitem criar, alimentar, consultar e manter o banco de dados do sistema de gerenciamento do abrigo de animais.

---

### 🐾 1. Animal
- **codigo** (PK)
- nome
- sexo (`M` ou `F`)
- especie
- raca
- data
- porte
- estadoSaude (`Saudável` ou `Em tratamento`)
- castrado (0 ou 1)

### 👤 2. Pessoa
- **CPF** (PK)
- primeiroNome
- meioNome
- ultimoNome
- dataNasc
- idade (18 a 150)
- sexo (`M` ou `F`)
- numeroLocal
- cep
- logradouro

#### Subtipos de Pessoa:
- **Voluntario** (CPF, CPFsupervisor, dataIngresso, areaAtuacao)
- **Funcionario** (CPF, dataContratacao, remuneracao, tipoContrato, cargo, horasSemana)
- **Adotante** (CPF)
- **Veterinario** (CPF, especialidade, CRMV)

### 💉 3. Vacina
- **codigo** (PK)
- nome (único)
- tipo
- viaAplicacao (`Oral`, `Injetavel (Subcutanea)`, `Injetavel (Intramuscular)`, `Intranasal`)
- lote
- dataValidade

### 🏥 4. ClinicaVeterinaria
- **CNPJ** (PK)
- nome (único)
- especialidade
- numeroLocal
- cep
- logradouro

### 💸 5. Recurso
- **codigo** (PK)
- descricao
- origem (`Doação`, `Recurso Próprio`, `Eventos`)
- data

#### Subtipos de Recurso:
- **Dinheiro** (codigo, cifra, valor)
- **Alimento** (codigo, tipo, unidade, qtdd, dtValidade)
- **Objeto** (codigo, nome, tipo, obs)

### 🩺 6. ConsultaAnimal
- **id** (PK)
- data
- descricao
- prescricao
- codigoAnimal (FK)
- CNPJclinica (FK)
- CPF_responsavel (FK para Voluntario)
- CPF_veterinario (FK para Veterinario)

### 💉 7. Vacinacao
- codigoVacina (FK)
- codigoAnimal (FK)
- CNPJ_clinica (FK)
- data
- dose
- **PK composta:** (codigoVacina, codigoAnimal, CNPJ_clinica, data)

### 🤝 8. AjudaAnimal
- CPFvoluntario (FK)
- codigoAnimal (FK)
- **PK composta:** (CPFvoluntario, codigoAnimal)

### 🏠 9. Adocao
- CPF_adotante (FK)
- codigoAnimal (FK)
- data
- obs
- **PK composta:** (CPF_adotante, codigoAnimal)

### 📞 10. TelefonePessoa
- CPF (FK)
- telefone
- **PK composta:** (CPF, telefone)

### 📞 11. TelefoneClinica
- CNPJ (FK)
- telefone
- **PK composta:** (CNPJ, telefone)

### 📧 12. EmailPessoa
- CPF (FK)
- email
- **PK composta:** (CPF, email)

### 📧 13. EmailClinica
- CNPJ (FK)
- email
- **PK composta:** (CNPJ, email)

### 🗂️ 14. Gerencia
- CPF_funcionario (FK)
- codigoRecurso (FK)
- **PK composta:** (CPF_funcionario, codigoRecurso)

### 🏥 15. VeterinarioTrabalha
- CPF_veterinario (FK)
- CNPJ_clinica (FK)
- dataInicio
- dataFim
- **PK composta:** (CPF_veterinario, CNPJ_clinica)

--

## ℹ️ Observações

- O banco de dados foi modelado para garantir **integridade referencial** e respeitar as regras de negócios típicas de um abrigo de animais.
- O projeto serve para fins **didáticos**, mas pode ser expandido para uso real.
- Para executar os scripts, utilize um SGBD compatível com SQL padrão (ex: PostgreSQL).

---

**Disciplina:** Banco de Dados  
**Curso:** Sistemas de Informação  
**Instituição:** UFMS/CPTL  
**Ano/Semestre:** 2025/1  
**Autores:**
- Breno Hideki Utimura
- Gabriel Fiorentino Bressane
