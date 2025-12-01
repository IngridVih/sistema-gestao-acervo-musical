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


-- ==========================================================
-- 2. INSERÇÃO DE DADOS (DML)
-- ==========================================================

-- ARTISTAS
INSERT INTO ARTISTA (nome, nacionalidade) VALUES
('Legião Urbana', 'Brasil'),
('The Beatles', 'Reino Unido'),
('Renato Russo', 'Brasil'),
('Paul McCartney', 'Reino Unido'),
('John Lennon', 'Reino Unido');

-- ÁLBUNS
INSERT INTO ALBUM (titulo, ano_lancamento, duracao_total) VALUES
('Dois', 1986, '00:45:00'),
('Abbey Road', 1969, '00:47:00');

-- MÚSICAS (MUSICA)
INSERT INTO MUSICA (titulo, duracao, id_album) VALUES
('Tempo Perdido', '00:05:02', 1),
('Eduardo e Mônica', '00:04:32', 1),
('Come Together', '00:04:19', 2),
('Something', '00:03:03', 2);

-- PARTICIPAÇÕES
INSERT INTO PARTICIPACAO (id_artista, id_album) VALUES
(1, 1), -- Legião Urbana → Dois
(2, 2); -- Beatles → Abbey Road

INSERT INTO AUTORIA (id_artista, id_musica) VALUES
(3, 1),
(3, 2),
(5, 3),
(4, 4);


-- ==========================================================
-- 3. CONSULTAS (SELECT)
-- ==========================================================

-- 3.1 Todas as músicas com seus álbuns
SELECT m.titulo AS Musica,
       m.duracao,
       a.titulo AS Album
FROM MUSICA m
JOIN ALBUM a ON m.id_album = a.id_album;

-- 3.2 Artistas que participaram de Abbey Road
SELECT art.nome AS Artista,
       alb.titulo AS Album
FROM ARTISTA art
JOIN PARTICIPACAO p ON art.id_artista = p.id_artista
JOIN ALBUM alb ON p.id_album = alb.id_album
WHERE alb.titulo = 'Abbey Road';

-- 3.3 Todas as autorias
SELECT m.titulo AS Musica,
       ar.nome AS Artista
FROM AUTORIA au
JOIN ARTISTA ar ON au.id_artista = ar.id_artista
JOIN MUSICA m ON au.id_musica = m.id_musica;

-- 3.4 Listar artistas brasileiros (Filtro simples)
SELECT * FROM ARTISTA 
WHERE nacionalidade = 'Brasil';

-- ==========================================================
-- 4. MANIPULAÇÃO (UPDATE / DELETE)
-- ==========================================================
SET SQL_SAFE_UPDATES = 0;

-- === UPDATES (Total: 3) ===
-- 1. Corrigir o ano de lançamento de um álbum
UPDATE ALBUM
SET ano_lancamento = 1987
WHERE titulo = 'Dois';

-- 2. Atualizar a duração de uma música específica
UPDATE MUSICA 
SET duracao = '00:04:20' 
WHERE titulo = 'Come Together';

-- 3. Corrigir a nacionalidade de um artista
UPDATE ARTISTA 
SET nacionalidade = 'Inglaterra' 
WHERE nome = 'The Beatles';

-- ----------------------------------------------------------
-- VISUALIZAR AS MUDANÇAS DOS UPDATES
-- ----------------------------------------------------------
SELECT * FROM ALBUM;   -- Veja o ano mudar para 1987
SELECT * FROM MUSICA;  -- Veja a duração mudar
SELECT * FROM ARTISTA; -- Veja a nacionalidade mudar

-- === DELETES (Total: 3) ===

-- 1. Deletar uma música específica
DELETE FROM MUSICA
WHERE titulo = 'Eduardo e Mônica';

-- 2. Remover uma participação de um artista em um álbum
DELETE FROM PARTICIPACAO 
WHERE id_artista = 1 AND id_album = 1;

-- 3. Remover um artista do sistema (Renato Russo)
-- Isso apagará automaticamente suas autorias devido ao ON DELETE CASCADE
DELETE FROM ARTISTA 
WHERE nome = 'Renato Russo';

-- ----------------------------------------------------------
-- VISUALIZAR AS MUDANÇAS DOS DELETES
-- ----------------------------------------------------------
SELECT * FROM MUSICA;       -- "Eduardo e Mônica" deve ter sumido
SELECT * FROM PARTICIPACAO; -- A linha (1,1) deve ter sumido
SELECT * FROM ARTISTA;      -- "Renato Russo" deve ter sumido
SELECT * FROM AUTORIA;      -- As autorias do Renato (id 3) devem ter sumido (Cascade)
