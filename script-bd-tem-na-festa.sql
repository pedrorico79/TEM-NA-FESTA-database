-- O banco temnafesta já é criado pelo RDS através do Terraform.
USE temnafesta;

CREATE TABLE endereco (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    cep VARCHAR(8) NOT NULL,
    logradouro VARCHAR(150) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(100),
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL
);
 
CREATE TABLE cliente (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    whatsapp VARCHAR(20),
    instagram VARCHAR(50),
    data_cadastro DATE NOT NULL,
    anotacoes TEXT,
    endereco_id BIGINT, -- Endereço principal/residencial
    is_ativo BOOLEAN NOT NULL DEFAULT TRUE,
    is_deletado BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (endereco_id) REFERENCES endereco(id)
);
 
CREATE TABLE perfil (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT
);
 
CREATE TABLE usuario (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    is_ativo BOOLEAN NOT NULL DEFAULT TRUE,
    is_deletado BOOLEAN NOT NULL DEFAULT FALSE,
    data_criacao DATETIME NOT NULL,
    perfil_id BIGINT NOT NULL,
    FOREIGN KEY (perfil_id) REFERENCES perfil(id)
);
 
CREATE TABLE evento (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    is_ativo BOOLEAN NOT NULL DEFAULT TRUE,
    is_deletado BOOLEAN NOT NULL DEFAULT FALSE
);
 
CREATE TABLE pedido (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATETIME NOT NULL,
    data_entrega DATETIME NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    taxa_entrega DECIMAL(10,2) DEFAULT 0.00,
    observacao TEXT,
    status_producao VARCHAR(50) NOT NULL,
    cliente_id BIGINT NOT NULL,
    usuario_id BIGINT NOT NULL,
    evento_id BIGINT NULL, -- Opcional: Nem todo pedido pertence a um evento
    endereco_entrega_id BIGINT NULL, -- Opcional: Pode ser retirada no local
    is_ativo BOOLEAN NOT NULL DEFAULT TRUE,
    is_deletado BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (evento_id) REFERENCES evento(id),
    FOREIGN KEY (endereco_entrega_id) REFERENCES endereco(id)
);
 
CREATE TABLE metodo_pagamento (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);
 
CREATE TABLE pagamento (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATETIME NOT NULL,
    tipo_pagamento VARCHAR(30) NOT NULL DEFAULT 'BIGINTEGRAL', -- Ex: SINAL, QUITACAO, BIGINTEGRAL
    status_pagamento VARCHAR(30) NOT NULL DEFAULT 'CONFIRMADO', -- Ex: PENDENTE, CONFIRMADO, CANCELADO
    metodo_pagamento_id BIGINT NOT NULL,
    pedido_id BIGINT NOT NULL,
    usuario_id BIGINT NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedido(id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (metodo_pagamento_id) REFERENCES metodo_pagamento(id)
);
 
CREATE TABLE historico_status_pedido (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    data_alteracao DATETIME NOT NULL,
    observacao TEXT,
    status_producao VARCHAR(50) NOT NULL DEFAULT 'RASCUNHO',
    pedido_id BIGINT NOT NULL,
    usuario_id BIGINT NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedido(id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);
 
CREATE TABLE produto (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco_venda DECIMAL(10,2) NOT NULL,
    is_ativo BOOLEAN DEFAULT TRUE,
    is_deletado BOOLEAN NOT NULL DEFAULT FALSE
);
 
CREATE TABLE item_pedido (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    pedido_id BIGINT NOT NULL,
    produto_id BIGINT NOT NULL,
    quantidade BIGINT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    observacao_item TEXT,
    FOREIGN KEY (pedido_id) REFERENCES pedido(id),
    FOREIGN KEY (produto_id) REFERENCES produto(id)
);
 
CREATE TABLE lembrete (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    descricao TEXT NOT NULL,
    data_criacao DATE NOT NULL,
    data_limite DATE NOT NULL,
    usuario_id BIGINT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);
 

-- CREATE USER user_festa IDENTIFIED BY "Sptech#2024";
-- GRANT ALL privileges ON temnafesta.* TO user_festa;
-- FLUSH PRIVILEGES;
