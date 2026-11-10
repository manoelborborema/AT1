SET NAMES utf8mb4;

DROP DATABASE IF EXISTS ong_sementes_amanha;

CREATE DATABASE ong_sementes_amanha
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE ong_sementes_amanha;

CREATE TABLE doador (
  id_doador INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(150) NOT NULL,
  email VARCHAR(100) UNIQUE,
  telefone VARCHAR(20),
  data_cadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE categoria (
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(60) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE item (
  id_item INT AUTO_INCREMENT PRIMARY KEY,
  id_categoria INT NOT NULL,
  nome VARCHAR(150) NOT NULL,
  unidade VARCHAR(20) NOT NULL DEFAULT 'unidade',
  CONSTRAINT fk_item_categoria
    FOREIGN KEY (id_categoria)
    REFERENCES categoria (id_categoria)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE doacao (
  id_doacao INT AUTO_INCREMENT PRIMARY KEY,
  id_doador INT NOT NULL,
  data_doacao DATE NOT NULL,
  observacao VARCHAR(255),
  CONSTRAINT fk_doacao_doador
    FOREIGN KEY (id_doador)
    REFERENCES doador (id_doador)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE doacao_item (
  id_doacao INT NOT NULL,
  id_item INT NOT NULL,
  quantidade INT NOT NULL,
  PRIMARY KEY (id_doacao, id_item),
  CONSTRAINT chk_doacao_item_quantidade
    CHECK (quantidade > 0),
  CONSTRAINT fk_doacao_item_doacao
    FOREIGN KEY (id_doacao)
    REFERENCES doacao (id_doacao)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  CONSTRAINT fk_doacao_item_item
    FOREIGN KEY (id_item)
    REFERENCES item (id_item)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;
