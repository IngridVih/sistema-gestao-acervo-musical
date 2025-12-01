# Sistema de Gestão de Acervo Musical (SGAM) - Projeto de Banco de Dados

Este repositório contém os scripts SQL desenvolvidos para a **Experiência Prática IV** da disciplina de Modelagem de Banco de Dados. O projeto simula um sistema de gerenciamento de artistas, álbuns e músicas.

## 📁 Estrutura do Repositório

* `script_criacao_tabelas.sql`: Comandos DDL para criação do banco e das tabelas normalizadas (com Chaves Primárias e Estrangeiras).
* `script_insercao_dados.sql`: Comandos INSERT para povoar o banco com dados fictícios de teste.
* `script_consultas_queries.sql`: Consultas SELECT utilizando JOINs, filtros e ordenação para gerar relatórios.
* `script_manipulacao.sql`: Comandos UPDATE e DELETE demonstrando a manutenção dos dados.

## 🛠️ Tecnologias Utilizadas

* SQL (Padrão ANSI/MySQL)
* Ferramenta sugerida para execução: MySQL Workbench ou DBeaver.

## 🚀 Como executar

1.  Abra sua ferramenta de SQL.
2.  Execute o arquivo `script_criacao_tabelas.sql` para montar a estrutura.
3.  Execute o arquivo `script_insercao_dados.sql` para carregar os dados.
4.  Utilize os demais scripts para testar consultas e manipulações.

## 📋 Modelo Lógico

O banco segue a estrutura normalizada (3FN) contendo as tabelas:
* **ARTISTA** e **ALBUM** (Entidades Fortes)
* **MUSICA** (Entidade dependente do Álbum)
* **PARTICIPACAO** e **AUTORIA** (Tabelas Associativas para relações N:N)
