USE MusicDB;

-- === ATUALIZAÇÕES (UPDATES) ===

-- 1. Corrigindo o ano de lançamento de um álbum
UPDATE ALBUM 
SET ano_lancamento = 1987 
WHERE titulo = 'Dois';

-- 2. Atualizando a nacionalidade de um artista
UPDATE ARTISTA 
SET nacionalidade = 'Inglaterra' 
WHERE nome = 'The Beatles';

-- 3. Alterando a duração de uma música específica
UPDATE MUSICA 
SET duracao = '00:04:25' 
WHERE titulo = 'Come Together';


-- === REMOÇÕES (DELETES) ===

-- 1. Removendo uma participação específica (Artista saiu do projeto do álbum)
DELETE FROM PARTICIPACAO 
WHERE id_artista = 1 AND id_album = 1;

-- 2. Removendo uma autoria (Desvinculando compositor da música)
DELETE FROM AUTORIA 
WHERE id_artista = 5 AND id_musica = 3;

-- 3. Removendo uma música específica do sistema
DELETE FROM MUSICA 
WHERE titulo = 'Something';