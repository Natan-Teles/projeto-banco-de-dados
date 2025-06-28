# Projeto de Banco de Dados: Sistema de Gerenciamento de Reforço Escolar Comunitário

**Autor: Natan Alves dos Santos Teles** 
**Data: 27 de junho de 2025** 

## 1. Contexto do Projeto

O banco de dados foi projetado para ser a espinha dorsal de um Sistema de Gerenciamento de Reforço Escolar Comunitário. O seu objetivo principal é criar um ecossistema digital que conecta alunos com dúvidas escolares a professores voluntários dispostos a ajudar.
O modelo foi pensado para ser robusto, escalável e, acima de tudo, para garantir a integridade e a lógica do fluxo de informação, desde a submissão de uma dúvida até à sua transformação em conhecimento pesquisável para a comunidade.

## 2. Sobre o Banco de Dados

O coração deste projeto é o banco de dados relacional, modelado em MySQL. Ele foi estruturado para gerir as principais entidades do sistema:

* **Usuários, Alunos e Professores:** Controle de quem participa na plataforma.
* **Dúvidas e Respostas:** O fluxo principal de interação entre alunos e professores voluntários.
* **Assuntos e Palavras-Chave:** Para categorização e pesquisa do conhecimento.
* **Base de Conhecimento:** Um repositório que armazena as melhores respostas para consulta futura, transformando a ajuda pontual em conhecimento duradouro.

## 3. Como Executar este Projeto

Para recriar e testar esta base de dados, siga os passos abaixo:

1.  **Pré-requisitos:** É necessário ter um Sistema de Gerenciamento de Banco de Dados (SGBD) MySQL instalado.
2.  **Ferramenta:** Utilize um SGBD, como o MySQL Workbench ou o DataGrip(utilizado neste projeto).
3.  **Execução:**
    * Crie um novo banco de dados (schema) com o nome `gerenciamento_rec`.
    * Abra o arquivo `gerenciamento_rec.sql` contido neste repositório.
    * Execute o script completo. Ele irá automaticamente apagar quaisquer estruturas antigas, criar todas as tabelas, inserir os dados de exemplo e configurar as `VIEWS` de visualização.
4.  **Verificação:** Ao final do script, há uma seção com exemplos de consultas (`SELECT`) que podem ser executadas para explorar os dados e demonstrar a funcionalidade do banco de dados.