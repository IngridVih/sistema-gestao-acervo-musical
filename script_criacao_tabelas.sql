-- Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS MusicDB;
USE MusicDB;

-- Tabela ARTISTA
CREATE TABLE ARTISTA (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50)
);

-- Tabela ALBUM
CREATE TABLE ALBUM (
    id_album INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    ano_lancamento INT,
    duracao_total TIME
);

-- Tabela MUSICA (com chave estrangeira para Album)
CREATE TABLE MUSICA (
    id_musica INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    duracao TIME,
    id_album INT,
    FOREIGN KEY (id_album) REFERENCES ALBUM(id_album)
);

-- Tabela Associativa PARTICIPACAO (Artista <-> Album)
CREATE TABLE PARTICIPACAO (
    id_artista INT,
    id_album INT,
    PRIMARY KEY (id_artista, id_album),
    FOREIGN KEY (id_artista) REFERENCES ARTISTA(id_artista),
    FOREIGN KEY (id_album) REFERENCES ALBUM(id_album)
);

-- Tabela Associativa AUTORIA (Artista <-> Musica)
CREATE TABLE AUTORIA (
    id_artista INT,
    id_musica INT,
    PRIMARY KEY (id_artista, id_musica),
    FOREIGN KEY (id_artista) REFERENCES ARTISTA(id_artista),
    FOREIGN KEY (id_musica) REFERENCES MUSICA(id_musica)
);