USE SGAM_MusicDB;

-- ==========================================================
-- 3. CONSULTAS (SELECT)
-- ==========================================================

-- 3.1 Listar todas as músicas e seus respectivos álbuns (JOIN simples)
SELECT m.titulo AS Musica,
       m.duracao,
       a.titulo AS Album
FROM MUSICA m
JOIN ALBUM a ON m.id_album = a.id_album;

-- 3.2 Listar quais artistas participaram do álbum 'Abbey Road' (JOIN triplo com filtro)
SELECT art.nome AS Artista,
       alb.titulo AS Album
FROM ARTISTA art
JOIN PARTICIPACAO p ON art.id_artista = p.id_artista
JOIN ALBUM alb ON p.id_album = alb.id_album
WHERE alb.titulo = 'Abbey Road';

-- 3.3 Listar todas as músicas e seus autores (JOIN triplo)
SELECT m.titulo AS Musica,
       ar.nome AS Autor
FROM AUTORIA au
JOIN ARTISTA ar ON au.id_artista = ar.id_artista
JOIN MUSICA m ON au.id_musica = m.id_musica;

-- 3.4 Listar artistas brasileiros (Filtro simples)
SELECT * FROM ARTISTA 
WHERE nacionalidade = 'Brasil';
