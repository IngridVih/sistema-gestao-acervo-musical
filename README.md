# 🎵 SGAM – Sistema de Gestão de Acervo Musical
Projeto acadêmico de modelagem, normalização e implementação de banco de dados relacional para gerenciamento de artistas, álbuns, músicas e suas relações de autoria e participação. Este repositório contém os scripts SQL desenvolvidos para a **Experiência Prática IV** da disciplina de Modelagem de Banco de Dados.

----

## 📁 Estrutura do Repositório

├── script_criacao_tabelas.sql<br>
├── script_insercao_dados.sql<br>
├── script_consultas_queries.sql<br>
├── script_manipulacao.sql<br>
└── README.md<br>

* `script_criacao_tabelas.sql`: Comandos DDL para criação do banco e das tabelas normalizadas (com Chaves Primárias e Estrangeiras).
* `script_insercao_dados.sql`: Comandos INSERT para povoar o banco com dados fictícios de teste.
* `script_consultas_queries.sql`: Consultas SELECT utilizando JOINs, filtros e ordenação para gerar relatórios.
* `script_manipulacao.sql`: Comandos UPDATE e DELETE demonstrando a manutenção dos dados.

----

## 🧱 Modelo Lógico (resumo)

**Entidades principais:**
- ARTISTA
- ALBUM
- MUSICA

**Tabelas associativas (resolução N:N):**
- PARTICIPACAO (Artista ↔ Álbum)
- AUTORIA (Artista ↔ Música)

**Principais regras:**
- Uma música pertence a exatamente um álbum  
- Um artista pode participar de vários álbuns  
- Uma música pode ter vários autores/intérpretes  

----

## 🛠️ Tecnologias Utilizadas

* SQL (Padrão ANSI/MySQL)
* Ferramenta sugerida para execução: MySQL Workbench.

----

## 🚀 Como executar

1.  Abra sua ferramenta de SQL.
2.  Execute o arquivo `script_criacao_tabelas.sql` para montar a estrutura.
3.  Execute o arquivo `script_insercao_dados.sql` para carregar os dados.
4.  Execute o arquivo `script_consultas_queries.sql` para consultar informações.
5.  Execute o arquivo `script_manipulacao.sql` para fazer manipulações (UPDATE/DELETE).

----

## 👤 Autora

Projeto desenvolvido com dedicação por:

* **Ingrid Vitória Guimarães Rodrigues**
