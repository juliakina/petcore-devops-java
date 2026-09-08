# 🐾 PetCore – Challenge 2026

## 🗣️ Desenvolvedoras do Projeto

### Emanuelly Ventura Do Nascimento
**RM562339 - 2TDSPJ**

### Carolina Nascimento Gonçalves
**RM564786 - 2TDSPJ**

### Julia Sayuri Kina
**RM564555 - 2TDSPJ**

---

# 📌 Descrição do Projeto

O **PetCore** é um sistema web de gerenciamento veterinário desenvolvido com **Java e Spring Boot**. O objetivo da aplicação é centralizar informações dos pets e seus registros clínicos, facilitando o acompanhamento do histórico médico dos animais.

A aplicação possui interface web desenvolvida com **Thymeleaf**, persistência de dados com **Spring Data JPA/Hibernate**, controle de versões do banco de dados com **Flyway** e autenticação e autorização utilizando **Spring Security**.

O sistema possui dois perfis de usuário, **Tutor** e **Médico Veterinário**, com permissões diferentes de acordo com suas responsabilidades dentro da aplicação.

---

# 🎯 Objetivo do Projeto

O principal objetivo do PetCore é facilitar o gerenciamento veterinário por meio de um sistema organizado, seguro e centralizado.

A aplicação permite que tutores acompanhem seus pets e respectivos registros médicos, enquanto médicos veterinários podem gerenciar informações clínicas, como exames, receitas, prontuários, relatórios, medicamentos e clínicas.

---

# ⚙️ Funcionalidades

## 👤 Tutor

O perfil **TUTOR** possui acesso às funcionalidades relacionadas à própria conta e aos seus pets.

Principais funcionalidades:

- Cadastro de uma nova conta;
- Login com e-mail e senha;
- Visualização e atualização da própria conta;
- Cadastro de pets;
- Visualização dos próprios pets;
- Alteração dos dados e da imagem de pets ativos;
- Inativação de pets;
- Visualização do histórico médico dos próprios pets;
- Visualização de exames;
- Visualização de receitas;
- Exclusão da própria conta quando não possuir pets ativos.

Ao cadastrar um Pet, ele é automaticamente associado ao Tutor autenticado e recebe um Histórico médico.

Quando um Pet é inativado, seus dados passam a ser preservados como registro histórico e não podem mais ser alterados.

---

## 🩺 Médico Veterinário

O perfil **MEDICO** possui acesso às funcionalidades clínicas do sistema.

Principais funcionalidades:

- Cadastro de uma nova conta;
- Login com e-mail e senha;
- Visualização e atualização da própria conta;
- Visualização dos pets;
- Visualização dos históricos médicos;
- Cadastro e gerenciamento de exames;
- Cadastro e gerenciamento de receitas;
- Cadastro e gerenciamento de prontuários;
- Cadastro e gerenciamento de relatórios;
- Cadastro e gerenciamento de medicamentos;
- Cadastro e gerenciamento de clínicas.

Nos registros clínicos criados pelo Médico, o profissional autenticado é associado automaticamente ao registro.

---

# 🐶 Pets e Histórico Médico

Cada Pet possui um **Histórico médico criado automaticamente no momento de seu cadastro**.

Na página do Pet são apresentados os registros atuais ou futuros, como:

- Exames agendados;
- Receitas ativas.

Já o Histórico concentra informações passadas:

- Exames realizados;
- Receitas vencidas.

Dessa forma, a aplicação separa informações atuais das informações que fazem parte do histórico clínico do animal.

---

# 🔒 Regras de Negócio

O PetCore possui regras de negócio para preservar a consistência dos dados e dos registros clínicos.

### Pets

- Todo Pet é cadastrado inicialmente como **ATIVO**;
- Um Histórico médico é criado automaticamente junto com o Pet;
- Um Tutor só pode gerenciar seus próprios pets;
- Um Pet pode ser alterado enquanto estiver ativo;
- A alteração de status ocorre de **ATIVO para INATIVO**;
- Depois de inativado, o Pet não pode ser alterado ou reativado;
- Não podem ser criados novos registros clínicos para Pets inativos;
- Os registros clínicos existentes são preservados.

### Exclusão da conta do Tutor

A conta de um Tutor não pode ser excluída enquanto existir algum Pet ativo associado a ela.

Quando todos os Pets associados estiverem inativos, a conta pode ser excluída. A associação entre Tutor e Pet é removida, mas os Pets inativos e seus registros clínicos permanecem armazenados, preservando o histórico médico.

### Exames e Receitas

- Exames são associados a um Pet e ao Médico responsável;
- Receitas são associadas a um Pet, ao Médico responsável e aos medicamentos selecionados;
- Registros associados a Pets inativos não podem ser alterados;
- A aplicação diferencia exames agendados de exames já realizados;
- A aplicação diferencia receitas ativas de receitas vencidas.

### Dados exibidos ao usuário

Os identificadores utilizados internamente pelo sistema não são utilizados como principal informação para o usuário.

Nas telas e seleções são apresentados dados legíveis, como nome do Pet, Tutor e Médico, facilitando a identificação dos registros.

---

# 🔐 Spring Security

A aplicação utiliza **Spring Security** para autenticação e controle de acesso.

Existem dois perfis:

### `TUTOR`

Possui acesso às funcionalidades relacionadas à própria conta, aos próprios pets e à consulta dos respectivos registros clínicos.

### `MEDICO`

Possui acesso às funcionalidades clínicas, incluindo exames, receitas, prontuários, relatórios, medicamentos e clínicas.

As rotas são protegidas de acordo com o perfil autenticado. Dessa forma, esconder uma opção na interface não é a única proteção: o acesso também é validado pelo backend.

As senhas são armazenadas utilizando **BCrypt**.

---

# 🗄️ Flyway

O projeto utiliza **Flyway** para controle de versão e inicialização do banco de dados.

As migrations são executadas automaticamente ao iniciar a aplicação e são responsáveis pela criação da estrutura necessária e pela inserção dos dados iniciais.

As migrations do projeto são divididas em:

- `V1__removendo_tabelas.sql` – preparação do banco;
- `V2__criando_tabelas.sql` – criação das tabelas;
- `V3__criando_constraints.sql` – criação das constraints e relacionamentos;
- `V4__populando_tabelas.sql` – inserção dos dados iniciais.

O Hibernate não é responsável pela criação automática das tabelas, permitindo que a estrutura do banco seja controlada pelo Flyway.

---

# ✅ Validações

Os formulários possuem validações para impedir o cadastro de informações inválidas.

Entre as validações implementadas estão:

- Campos obrigatórios;
- Tamanho mínimo de textos;
- Validação de e-mail;
- Validação de telefone;
- Validação de CEP;
- Validação de CNPJ;
- Validação de URL;
- Validação de datas;
- Data de nascimento válida para Tutor e Médico;
- Verificação de e-mail e telefone já cadastrados;
- Validações específicas para os registros clínicos.

Quando uma informação é inválida, a aplicação retorna a mensagem correspondente no próprio formulário.

---

# 🔄 Principais Fluxos

## Cadastro de Pet

1. O Tutor realiza login;
2. Cadastra um novo Pet;
3. O Pet é associado automaticamente ao Tutor autenticado;
4. O Pet é criado com status `ATIVO`;
5. Um Histórico médico é criado automaticamente para o animal.

## Inativação de Pet

1. O Tutor seleciona um Pet ativo;
2. Altera seu status para `INATIVO`;
3. O Pet deixa de aceitar alterações;
4. Novos registros clínicos deixam de ser permitidos;
5. Os registros anteriores permanecem disponíveis para consulta.

## Registro Clínico

1. O Médico realiza login;
2. Seleciona o Pet desejado por meio de informações legíveis, como nome do Pet e Tutor;
3. Cadastra o registro clínico;
4. O Médico autenticado é associado automaticamente ao registro;
5. O registro passa a integrar as informações clínicas do Pet.

---

# 💻 Tecnologias Utilizadas

## Backend

- Java 21;
- Spring Boot;
- Spring MVC;
- Spring Data JPA;
- Hibernate;
- Spring Security;
- Jakarta Validation;
- Maven.

## Frontend

- Thymeleaf;
- HTML;
- CSS;
- Bootstrap.

## Banco de Dados

- H2 Database;
- Flyway.

## Ferramentas

- Eclipse / IntelliJ IDEA;
- Git;
- GitHub.

---

# ▶️ Como Executar o Projeto

## Pré-requisitos

Para executar a aplicação é necessário possuir:

- **Java 21** instalado;
- Uma IDE compatível com projetos Spring Boot, como Eclipse ou IntelliJ IDEA.

## Execução

1. Clone o repositório;
2. Importe o projeto Maven na IDE;
3. Aguarde o download das dependências;
4. Execute a classe principal `PetCoreApplication`;
5. Acesse a aplicação pelo navegador em `http://localhost:8080`.

Ao iniciar o projeto, o Flyway executará automaticamente as migrations necessárias para preparar e popular o banco H2.

---

# 🔑 Usuários para Teste

O banco é populado pelo Flyway com dados iniciais que permitem testar os diferentes perfis da aplicação.

A senha utilizada pelos usuários de teste populados no banco é:

```text
Petcore123
```

Para testar as permissões, utilize um usuário com perfil **TUTOR** e outro com perfil **MEDICO** presentes nos dados inseridos pela migration `V4__populando_tabelas.sql`.

Também é possível criar novas contas de Tutor e Médico pela página de login.

---

# 📂 Repositório

O código-fonte do projeto está disponível no GitHub:

```text
https://github.com/carolnascgoncalves/PetCore-2SEM-Java.git
```
