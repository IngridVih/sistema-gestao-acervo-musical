-- ==========================================================
-- 1. CRIAÇÃO DO BANCO DE DADOS E TABELAS (DDL)
-- ==========================================================

DROP DATABASE IF EXISTS SGAM_MusicDB;
CREATE DATABASE SGAM_MusicDB;
USE SGAM_MusicDB;

-- ==========================================================
-- TABELA: ARTISTA
-- ==========================================================
CREATE TABLE ARTISTA (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50)
);

-- ==========================================================
-- TABELA: ALBUM
-- ==========================================================
CREATE TABLE ALBUM (
    id_album INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    ano_lancamento INT NOT NULL,
    duracao_total TIME DEFAULT '00:00:00'
);

-- Índice (boa prática para consultas por ano)
CREATE INDEX idx_album_ano ON ALBUM(ano_lancamento);

-- ==========================================================
-- TABELA: MUSICA
-- ==========================================================
CREATE TABLE MUSICA (
    id_musica INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    duracao TIME NOT NULL,
    id_album INT NOT NULL,

    CONSTRAINT fk_musica_album 
        FOREIGN KEY (id_album) 
        REFERENCES ALBUM(id_album)
        ON DELETE RESTRICT  -- impede excluir álbum com músicas
        ON UPDATE CASCADE
);

-- Índice de performance para FKs
CREATE INDEX idx_musica_album ON MUSICA(id_album);

-- ==========================================================
-- TABELA ASSOCIATIVA: PARTICIPACAO (Artista ↔ Álbum)
-- ==========================================================
CREATE TABLE PARTICIPACAO (
    id_artista INT NOT NULL,
    id_album INT NOT NULL,

    PRIMARY KEY (id_artista, id_album),

    CONSTRAINT fk_participacao_artista 
        FOREIGN KEY (id_artista) 
        REFERENCES ARTISTA(id_artista)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_participacao_album
        FOREIGN KEY (id_album)
        REFERENCES ALBUM(id_album)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ==========================================================
-- TABELA ASSOCIATIVA: AUTORIA (Artista ↔ Música)
-- ==========================================================
CREATE TABLE AUTORIA (
    id_artista INT NOT NULL,
    id_musica INT NOT NULL,

    PRIMARY KEY (id_artista, id_musica),

    CONSTRAINT fk_autoria_artista 
        FOREIGN KEY (id_artista)
        REFERENCES ARTISTA(id_artista)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_autoria_musica
        FOREIGN KEY (id_musica)
        REFERENCES MUSICA(id_musica)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Índice opcional de performance
CREATE INDEX idx_autoria_musica ON AUTORIA(id_musica);
