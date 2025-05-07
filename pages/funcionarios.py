import streamlit as st
import pandas as pd
import conexao

def listar_funcionario():
    db = conexao.obter_conexao()
    cursor = db.cursor(dictionary=True)
    cursor.execute('SELECT * FROM funcionario')
    resultado = cursor.fetchall()
    cursor.close()
    db.close()

    df = pd.DataFrame(resultado)

    if not df.empty:
        st.dataframe(df)
    else:
        st.info('Nenhum funcionário cadastrado ainda.')


def listar_cargos():
    db = conexao.obter_conexao()
    cursor = db.cursor(dictionary=True)
    cursor.execute('SELECT * FROM cargos')
    resultado = cursor.fetchall()
    cursor.close()
    db.close()

    df = pd.DataFrame(resultado)

    if not df.empty:
        st.table(df) 
    else:
        st.info('Nenhum cargo cadastrado ainda.')

@st.dialog("Cadastrar Funcionario")
def cadastrar_funcionario():
    nome = st.text_input("Nome:")
    cargo = st.number_input("ID do cargo (Consulte Abaixo):", max_value=10, step=1)
    listar_cargos()
    data_admissao = st.date_input("Data de admissão:")
    col1, col2 = st.columns([4, 1])

    with col1:
        if st.button("Cadastrar Funcionario", key="dialog-btn-cadastrar_funcionario"):
            try:
                conexao_db = conexao.obter_conexao()
                cursor = conexao_db.cursor()

                comando = (
                    "INSERT INTO funcionario (nome, data_admissao, CARGOS_id_cargo) "
                    "VALUES (%s, %s, %s)"
                )
                valores = (nome, data_admissao, cargo)

                cursor.execute(comando, valores)
                conexao_db.commit()
                cursor.close()
                conexao_db.close()
                
                st.success('Funcionário cadastrado com sucesso!')
            except Exception as erro:
                st.error("Erro ao cadastrar o funcionário, tente novamente!")
                st.error(erro)

    with col2:
        if st.button("Fechar", key="dialog-btn-fechar_funcionario"):
            st.rerun()

@st.dialog("Cadastrar Cargo")
def cadastrar_cargo():
    cargo = st.text_input("Nome do cargo:")
    salario = st.number_input("Salário:", step=1)
    carga_horaria = st.number_input("Carga Horária:", max_value=44, step=1)
    col1, col2 = st.columns([4, 1])

    with col1:
        if st.button("Cadastrar Cargo", key="dialog-btn-cadastrar_cargo"):
            try:
                conexao_db = conexao.obter_conexao()
                cursor = conexao_db.cursor()

                comando = (
                    "INSERT INTO cargos (cargo, salario, carga_horaria) "
                    "VALUES (%s, %s, %s)"
                )
                valores = (cargo, salario, carga_horaria)

                cursor.execute(comando, valores)
                conexao_db.commit()
                cursor.close()
                conexao_db.close()
                
                st.success('Cargo cadastrado com sucesso!')
            except Exception as erro:
                st.error("Erro ao cadastrar o cargo, tente novamente!")
                st.error(erro)

    with col2:
        if st.button("Fechar", key="dialog-btn-fechar_cargo"):
            st.rerun()

# Título da página
st.title("Gerenciamento de Funcionários")

# Seção de funcionários
st.subheader("Lista de Funcionários Ativos")
listar_funcionario()

colf1, colf2, colf3 = st.columns([1, 1, 4])

with colf1:
    if st.button("Cadastrar novo Funcionário", key="abrir_dialog_funcionario"):
        cadastrar_funcionario()

with colf2:
    if st.button("Editar Funcionário", key="editar_funcionario"):
        st.info("Função de edição ainda não implementada.")

# Seção de cargos
st.subheader("Cargos Ativos")
listar_cargos()

if st.button("Cadastrar novo Cargo", key="abrir_dialog_cargo"):
    cadastrar_cargo()
