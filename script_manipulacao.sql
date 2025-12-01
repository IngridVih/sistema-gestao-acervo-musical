USE SGAM_MusicDB;

-- Desativa o modo de atualização segura para permitir UPDATE/DELETE sem chave primária no WHERE
SET SQL_SAFE_UPDATES = 0;

-- ==========================================================
-- 4. MANIPULAÇÃO DE DADOS (UPDATE / DELETE)
-- ==========================================================

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

-- 1. Deletar uma música específica (CASCADE cuidará da tabela Autoria)
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
