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
