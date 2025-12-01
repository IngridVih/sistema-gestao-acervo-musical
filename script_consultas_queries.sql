USE MusicDB;

-- Consulta 1: Listar todas as músicas e seus respectivos álbuns (JOIN)
SELECT m.titulo AS Musica, m.duracao, a.titulo AS Album
FROM MUSICA m
JOIN ALBUM a ON m.id_album = a.id_album;

-- Consulta 2: Listar álbuns lançados após 1980 ordenados pelo ano (WHERE e ORDER BY)
SELECT titulo, ano_lancamento
FROM ALBUM
WHERE ano_lancamento > 1980
ORDER BY ano_lancamento ASC;

-- Consulta 3: Contar quantas músicas cada álbum possui (GROUP BY e JOIN)
SELECT a.titulo, COUNT(m.id_musica) AS total_musicas
FROM ALBUM a
LEFT JOIN MUSICA m ON a.id_album = m.id_album
GROUP BY a.titulo;

-- Consulta 4: Buscar artistas brasileiros (WHERE com LIKE)
SELECT * FROM ARTISTA 
WHERE nacionalidade LIKE 'Brasil';