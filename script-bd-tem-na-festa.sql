-- DROP DATABASE IF EXISTS tem_na_festa;
-- CREATE DATABASE IF NOT EXISTS tem_na_festa;
USE tem_na_festa;

CREATE TABLE endereco (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cep VARCHAR(8),
    logradouro VARCHAR(150),
    numero VARCHAR(10),
    complemento VARCHAR(100),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado CHAR(2)
);

CREATE TABLE cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    whatsapp VARCHAR(20),
    instagram VARCHAR(50),
    data_cadastro DATE,
    anotacoes TEXT,
    endereco_id INT,
    is_ativo BOOLEAN,
    FOREIGN KEY (endereco_id) REFERENCES endereco(id)
);
    
CREATE TABLE usuario (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    senha VARCHAR(255),
    perfil VARCHAR(20),
    is_ativo BOOLEAN,
    data_criacao DATETIME
);
CREATE TABLE status_producao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATETIME,
    data_entrega DATETIME,
    valor_total DECIMAL(10,2),
    status_atual VARCHAR(20),
    observacao TEXT,
    cliente_id INT,
    usuario_id INT,
    is_ativo BOOLEAN,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

CREATE TABLE pagamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    valor DECIMAL(10,2),
    data_pagamento DATETIME,
    metodo VARCHAR(50),
    pedido_id INT,
    usuario_id INT,
    FOREIGN KEY (pedido_id) REFERENCES pedido(id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

CREATE TABLE historico_status_pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    status_producao VARCHAR(20),
    data_alteracao DATETIME,
    observacao TEXT,
    pedido_id INT,
    usuario_id INT,
    FOREIGN KEY (pedido_id) REFERENCES pedido(id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

CREATE TABLE produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    preco_venda DECIMAL(10,2),
    is_ativo BOOLEAN
);

CREATE TABLE pedido_produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (pedido_id) REFERENCES pedido(id),
    FOREIGN KEY (produto_id) REFERENCES produto(id)
);

CREATE TABLE campanha (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    data_inicio DATE,
    data_fim DATE,
    is_ativa BOOLEAN
);

CREATE TABLE cardapio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    observacoes TEXT,
    is_ativo BOOLEAN,
    campanha_id INT,
    FOREIGN KEY (campanha_id) REFERENCES campanha(id)
);

CREATE TABLE cardapio_produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cardapio_id INT,
    produto_id INT,
    ordem_exibicao INT,
    qtd_produto_total INT,
    qtd_produto_disponivel INT,
    FOREIGN KEY (cardapio_id) REFERENCES cardapio(id),
    FOREIGN KEY (produto_id) REFERENCES produto(id)
);

-- CREATE USER user_festa IDENTIFIED BY "Sptech#2024";
-- GRANT ALL privileges ON tem_na_festa.* TO user_festa;
-- FLUSH PRIVILEGES;








