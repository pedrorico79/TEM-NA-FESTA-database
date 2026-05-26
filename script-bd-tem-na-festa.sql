-- DROP DATABASE IF EXISTS tem_na_festa;
-- CREATE DATABASE IF NOT EXISTS tem_na_festa;
USE tem_na_festa;

CREATE TABLE endereco (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cep VARCHAR(8) NOT NULL,
    logradouro VARCHAR(150) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(100),
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL
);

CREATE TABLE cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    whatsapp VARCHAR(20),
    instagram VARCHAR(50),
    data_cadastro DATE NOT NULL,
    anotacoes TEXT,
    endereco_id INT,
    is_ativo BOOLEAN NOT NULL,
    FOREIGN KEY (endereco_id) REFERENCES endereco(id)
);

CREATE TABLE perfil (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT
);

CREATE TABLE usuario (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    is_ativo BOOLEAN NOT NULL,
    data_criacao DATETIME NOT NULL,
    perfil_id INT NOT NULL,
    FOREIGN KEY (perfil_id) REFERENCES perfil(id)
);

CREATE TABLE evento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    is_ativa BOOLEAN NOT NULL
);

CREATE TABLE status_producao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATETIME NOT NULL,
    data_entrega DATETIME NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    observacao TEXT,
    status_producao_id INT NOT NULL,
    cliente_id INT NOT NULL,
    usuario_id INT NOT NULL,
    evento_id INT NOT NULL,
    is_ativo BOOLEAN NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (evento_id) REFERENCES evento(id),
    FOREIGN KEY (status_producao_id) REFERENCES status_producao(id)
);

CREATE TABLE metodo_pagamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE pagamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATETIME NOT NULL,
    metodo_pagamento_id INT NOT NULL,
    pedido_id INT NOT NULL,
    usuario_id INT NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedido(id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (metodo_pagamento_id) REFERENCES metodo_pagamento(id)
);

CREATE TABLE historico_status_pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_alteracao DATETIME NOT NULL,
    observacao TEXT,
    status_producao_id INT NOT NULL,
    pedido_id INT NOT NULL,
    usuario_id INT NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedido(id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (status_producao_id) REFERENCES status_producao(id)
);

CREATE TABLE produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    preco_venda DECIMAL(10,2),
    is_ativo BOOLEAN
);

CREATE TABLE item_pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (pedido_id) REFERENCES pedido(id),
    FOREIGN KEY (produto_id) REFERENCES produto(id)
);

CREATE TABLE lembrete (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao TEXT NOT NULL,
    data_criacao DATE NOT NULL,
    data_limite DATE NOT NULL,
    usuario_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

-- CREATE USER user_festa IDENTIFIED BY "Sptech#2024";
-- GRANT ALL privileges ON tem_na_festa.* TO user_festa;
-- FLUSH PRIVILEGES;

