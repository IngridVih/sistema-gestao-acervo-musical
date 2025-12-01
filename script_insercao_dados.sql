USE MusicDB;

-- 1. Inserindo ARTISTAS
INSERT INTO ARTISTA (nome, nacionalidade) VALUES 
('Legião Urbana', 'Brasil'),
('The Beatles', 'Reino Unido'),
('Renato Russo', 'Brasil'),
('Paul McCartney', 'Reino Unido'),
('John Lennon', 'Reino Unido');

-- 2. Inserindo ALBUMS
INSERT INTO ALBUM (titulo, ano_lancamento, duracao_total) VALUES 
('Dois', 1986, '00:45:00'),
('Abbey Road', 1969, '00:47:00'),
('As Quatro Estações', 1989, '00:50:00');

-- 3. Inserindo MUSICAS (Associadas aos álbuns pelos IDs criados acima)
-- Supondo: Dois (ID 1), Abbey Road (ID 2), As Quatro Estações (ID 3)
INSERT INTO MUSICA (titulo, duracao, id_album) VALUES 
('Tempo Perdido', '00:05:02', 1),
('Eduardo e Mônica', '00:04:32', 1),
('Come Together', '00:04:19', 2),
('Something', '00:03:03', 2),
('Pais e Filhos', '00:05:08', 3);

-- 4. Inserindo PARTICIPACOES (Quais artistas gravaram quais álbuns)
INSERT INTO PARTICIPACAO (id_artista, id_album) VALUES 
(1, 1), -- Legião Urbana participou do album 'Dois'
(1, 3), -- Legião Urbana participou do album 'As Quatro Estações'
(2, 2); -- The Beatles participou do album 'Abbey Road'

-- 5. Inserindo AUTORIA (Quem compôs as músicas)
INSERT INTO AUTORIA (id_artista, id_musica) VALUES 
(3, 1), -- Renato Russo compôs 'Tempo Perdido'
(3, 2), -- Renato Russo compôs 'Eduardo e Mônica'
(5, 3), -- John Lennon compôs 'Come Together'
(4, 4); -- Paul McCartney compôs 'Something'