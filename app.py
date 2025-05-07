import streamlit as st
import pandas as pd
import conexao


st.set_page_config(
    page_title='Sistema Bibliotecario',  
    layout='wide' 
)

st.title('Bem-vindo ao Sistema Bibliotecario')

st.sidebar.title("Menu")

if st.sidebar.button("Cadastrar Aluno"):
    st.switch_page('pages/cadastrarAluno.py')

if st.sidebar.button("Gerenciar Funcionarios"):
    st.switch_page('pages/funcionarios.py')
