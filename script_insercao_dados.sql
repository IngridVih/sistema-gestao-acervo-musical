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
