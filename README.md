# 📚 Sistema Gerenciador de Biblioteca

Sistema web desenvolvido em Python para gerenciamento completo de biblioteca, permitindo cadastro de alunos, funcionários, cargos e gerenciamento de acervo bibliográfico.

## 🎯 Funcionalidades

- **Cadastro de Alunos**: Cadastro completo com dados pessoais, contatos e endereço
- **Gerenciamento de Funcionários**: Cadastro e listagem de funcionários do sistema
- **Gerenciamento de Cargos**: Cadastro de cargos com salário e carga horária
- **Interface Web**: Interface intuitiva desenvolvida com Streamlit
- **Banco de Dados MySQL**: Armazenamento seguro e estruturado dos dados

## 🛠️ Tecnologias Utilizadas

- **Python 3.x**
- **Streamlit** - Framework para criação da interface web
- **Pandas** - Manipulação e exibição de dados
- **MySQL Connector** - Conexão com banco de dados MySQL
- **MySQL** - Banco de dados relacional

## 📋 Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- Python 3.7 ou superior
- MySQL Server 8.0 ou superior
- pip (gerenciador de pacotes Python)

## 🔧 Instalação

1. Clone o repositório ou baixe os arquivos do projeto

2. Instale as dependências necessárias:

```bash
pip install streamlit pandas mysql-connector-python
```

Ou crie um arquivo `requirements.txt` com o conteúdo:

```
streamlit
pandas
mysql-connector-python
```

E então execute:

```bash
pip install -r requirements.txt
```

## 🗄️ Configuração do Banco de Dados

1. Certifique-se de que o MySQL Server está rodando em sua máquina

2. Importe o schema do banco de dados executando o arquivo `biblioteca.sql`:

```bash
mysql -u root -p < biblioteca.sql
```

Ou através do MySQL Workbench importando o arquivo `biblioteca.sql`

3. Configure as credenciais de conexão no arquivo `conexao.py`:

```python
conexao = mysql.connector.connect(
    host="localhost",
    user="root",
    password="sua_senha_aqui",
    database="biblioteca"
)
```

## 🚀 Como Executar

1. Inicie a aplicação Streamlit:

```bash
streamlit run app.py
```

2. A aplicação será aberta automaticamente no seu navegador padrão no endereço `http://localhost:8501`

3. Utilize o menu lateral para navegar entre as funcionalidades:
   - **Cadastrar Aluno**: Cadastre novos alunos no sistema
   - **Gerenciar Funcionários**: Gerencie funcionários e cargos

## 📁 Estrutura do Projeto

```
Sistema-Gerenciador-de-Biblioteca/
│
├── app.py                      # Arquivo principal da aplicação
├── conexao.py                  # Módulo de conexão com o banco de dados
├── biblioteca.sql              # Script SQL para criação do banco de dados
├── bilbioteca.mwb              # Modelo do banco de dados (MySQL Workbench)
│
└── pages/                      # Páginas da aplicação
    ├── cadastrarAluno.py       # Página de cadastro de alunos
    └── funcionarios.py         # Página de gerenciamento de funcionários
```

## 📊 Estrutura do Banco de Dados

O banco de dados possui as seguintes tabelas principais:

- **aluno**: Armazena informações dos alunos
- **funcionario**: Armazena informações dos funcionários
- **cargos**: Armazena os cargos disponíveis
- **livro**: Armazena informações dos livros
- **editora**: Armazena informações das editoras
- **exemplar**: Armazena exemplares dos livros
- **aluno_has_livro**: Tabela de relacionamento para empréstimos

## 🔐 Segurança

⚠️ **Importante**: O arquivo `conexao.py` contém credenciais do banco de dados em texto plano. Para ambientes de produção, recomenda-se:

- Utilizar variáveis de ambiente
- Implementar um arquivo de configuração separado (não versionado)
- Utilizar credenciais com permissões limitadas

## 📝 Uso

### Cadastrar Aluno

1. Acesse a opção "Cadastrar Aluno" no menu lateral
2. Preencha todos os campos obrigatórios:
   - Dados pessoais (Nome, CPF, Data de nascimento)
   - Contatos (Telefone residencial, Telefone celular, Email)
   - Endereço (Rua, Número, Cidade, Estado, CEP)
3. Clique em "Cadastrar Aluno"

### Gerenciar Funcionários

1. Acesse a opção "Gerenciar Funcionários" no menu lateral
2. Visualize a lista de funcionários cadastrados
3. Para cadastrar um novo funcionário:
   - Clique em "Cadastrar novo Funcionário"
   - Preencha os dados (Nome, ID do cargo, Data de admissão)
   - Consulte os cargos disponíveis na tabela abaixo
4. Para cadastrar um novo cargo:
   - Clique em "Cadastrar novo Cargo"
   - Preencha os dados (Nome do cargo, Salário, Carga horária)
