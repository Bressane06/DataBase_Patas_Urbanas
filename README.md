# Sistema de Gerenciamento de Abrigo de Animais 🏡

Este projeto foi desenvolvido como parte da disciplina de **Banco de Dados** da **UFMS/CPTL**.  
O sistema simula um banco de dados relacional para um abrigo de animais, contemplando o cadastro de animais, pessoas (voluntários, funcionários, adotantes), clínicas veterinárias, recursos, adoções, consultas, dependentes e muito mais.

---

## 🎯 Objetivo

O objetivo do projeto é proporcionar aos alunos uma experiência prática de **modelagem**, **implementação** e **manipulação de dados** em banco de dados, utilizando comandos de inserção, atualização, remoção e consultas SQL.

---

## 📐 Estrutura do Banco de Dados

O banco de dados é composto pelas seguintes tabelas principais:

### 🐾 1. Animal
- **codigo** (PK)
- nome
- sexo
- especie
- raca
- data
- porte
- estadoSaude
- castrado

### 👤 2. Pessoa
- **CPF** (PK)
- primeiroNome
- meioNome
- ultimoNome
- dataNasc
- idade
- sexo
- numeroLocal
- cep
- logradouro

#### Subtipos de Pessoa:
- **Voluntario** (CPF, CPFsupervisor, especialidade, ...)
- **Funcionario** (CPF, dataContratacao, remuneracao, tipoContrato, cargo, horasSemana)
- **Adotante** (CPF)

### 👶 3. Dependente (tabela separada)
- **CPF** (PK)
- CPF_funcionario (FK para Funcionario)
- idade
- primeiroNome
- meioNome
- ultimoNome
- sexo
- numeroLocal
- cep
- logradouro

### 🏥 4. ClinicaVeterinaria
- **CNPJ** (PK)
- nome
- especialidade
- numeroLocal
- cep
- logradouro

### 💸 5. Recurso
- **codigo** (PK)
- descricao
- origem
- data

#### Subtipos de Recurso:
- **Dinheiro** (codigo, cifra, valor)
- **Alimento** (codigo, tipo, unidade, qtdd, dtValidade)
- **Objeto** (codigo, nome, tipo, obs)

### 🩺 6. ConsultaAnimal
- codigoAnimal (FK para Animal)
- CNPJclinica (FK para ClinicaVeterinaria)
- CPF_responsavel (FK para Voluntario)
- prescricao
- descricao
- data

### 🤝 7. AjudaAnimal
- CPFvoluntario (FK para Voluntario)
- codigoAnimal (FK para Animal)

### 🏠 8. Adocao
- CPF_adotante (FK para Adotante)
- codigoAnimal (FK para Animal)
- data
- obs

### 📞 9. TelefonePessoa
- CPF (FK para Pessoa)
- telefone

### 📞 10. TelefoneClinica
- CNPJ (FK para ClinicaVeterinaria)
- telefone

### 📧 11. EmailPessoa
- CPF (FK para Pessoa)
- email

### 📧 12. EmailClinica
- CNPJ (FK para ClinicaVeterinaria)
- email

### 🗂️ 13. Gerencia
- CPF_funcionario (FK para Funcionario)
- codigoRecurso (FK para Recurso)

---

## 🛠️ Scripts de Manipulação

O projeto inclui scripts para:
- ➕ Inserção de dados em todas as tabelas (com exemplos para cada entidade)
- 🔄 Atualização e remoção de dados (para fins de prática e teste)

---

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
