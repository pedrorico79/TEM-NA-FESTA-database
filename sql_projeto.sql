Create database if not exists projeto;
Use projeto;

CREATE TABLE endereco (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    cep VARCHAR(8),
    logradouro VARCHAR(150),
    numero VARCHAR(10),
    complemento VARCHAR(100),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado CHAR(2)
);

CREATE TABLE cliente (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    whatsapp VARCHAR(20),
    instagram VARCHAR(50),
    data_cadastro DATE,
    anotacoes TEXT,
    endereco_id INT,
    FOREIGN KEY (endereco_id) REFERENCES endereco(Id)
);

CREATE TABLE status_producao (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE pedido (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATETIME,
    data_entrega DATETIME,
    valor_total DECIMAL(10,2),
    observacao TEXT,
    cliente_id INT,
    status_producao_id INT,
    FOREIGN KEY (cliente_id) REFERENCES cliente(Id),
    FOREIGN KEY (status_producao_id) REFERENCES status_producao(Id)
);

CREATE TABLE pagamento (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    valor DECIMAL(10,2),
    data_pagamento DATETIME,
    metodo VARCHAR(50),
    pedido_id INT,
    FOREIGN KEY (pedido_id) REFERENCES pedido(Id)
);

CREATE TABLE produto (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    preco_venda DECIMAL(10,2),
    is_ativo TINYINT
);

CREATE TABLE pedido_produto (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (pedido_id) REFERENCES pedido(Id),
    FOREIGN KEY (produto_id) REFERENCES produto(Id)
);

CREATE TABLE campanha (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    data_inicio DATE,
    data_fim DATE,
    is_ativa TINYINT
);

CREATE TABLE cardapio (
    IdCardapio INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    observacoes TEXT,
    is_ativo TINYINT,
    campanha_id INT,
    FOREIGN KEY (campanha_id) REFERENCES campanha(Id)
);

CREATE TABLE cardapio_produto (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    cardapio_id INT,
    produto_id INT,
    ordem_exibicao INT,
    FOREIGN KEY (cardapio_id) REFERENCES cardapio(IdCardapio),
    FOREIGN KEY (produto_id) REFERENCES produto(Id)
);
