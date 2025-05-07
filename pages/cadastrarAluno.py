import streamlit as st
import conexao 

st.title("Formulario de cadastro de aluno")


st.subheader("Dados Pessoais")

nome = st.text_input("Nome:")
cpf = st.number_input("CPF:", step=1)
data_nascimento = st.date_input("Data de nascimento:")


st.subheader("Contatos")

tel_res = st.number_input("Telefone Residencial:", step=1)
tel_cel = st.number_input("Telefone Celular:", step=1)
email = st.text_input("Email:")

st.subheader("Endereço Residencial")
rua = st.text_input("Rua:")
numero = st.text_input("Numero:")
cidade = st.text_input("Cidade: ")
estado = st.text_input("Estado: ")
cep = st.number_input("CEP:")

if st.button("Cadastrar Aluno"):
    try:
        conexao_db = conexao.obter_conexao()
        cursor = conexao_db.cursor()

        comando = (
            "INSERT INTO aluno (nome, cpf, data_nascimento, tel_res, tel_cel, email, rua, cep, cidade, estado, numero)"
            "VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
        )

        valores = (nome, cpf, data_nascimento, tel_res, tel_cel, email, rua, cep, cidade, estado, numero)
       
        cursor.execute(comando, valores)
        conexao_db.commit()
        cursor.close()
        conexao_db.close()
        
        st.success('Aluno cadastrado com sucesso!')
    except Exception as erro:
        st.error("Erro ao cadastrar o aluno, tente novamente!!")