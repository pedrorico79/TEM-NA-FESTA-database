USE tem_na_festa;
-- ENDERECO
INSERT INTO endereco (cep, logradouro, numero, complemento, bairro, cidade, estado)
VALUES ('12345678', 'Rua das Flores', '123', 'Apto 101', 'Centro', 'São Paulo', 'SP');

-- CLIENTE
INSERT INTO cliente (nome, telefone, whatsapp, instagram, data_cadastro, anotacoes, endereco_id)
VALUES ('Maria Silva', '11999999999', '11988888888', '@mariafestas', '2026-04-01', 'Cliente VIP', 1);

-- PERFIL
INSERT INTO perfil (nome)
VALUES ('Administrador');

-- USUARIO
INSERT INTO usuario (nome, email, senha, is_ativo, data_criacao, perfil_id)
VALUES ('João Admin', 'admin@festa.com', '123456', TRUE, NOW(), 1);

-- STATUS PRODUCAO
INSERT INTO status_producao (nome)
VALUES ('Em produção');

-- PRODUTO
INSERT INTO produto (nome, descricao, preco_venda, is_ativo)
VALUES ('Bolo de Chocolate', 'Bolo grande para festas', 150.00, TRUE);

-- PEDIDO
INSERT INTO pedido (data_pedido, data_entrega, valor_total, observacao, cliente_id, status_producao_id, usuario_id)
VALUES (NOW(), '2026-04-10 15:00:00', 150.00, 'Entrega no período da tarde', 1, 1, 1);

-- PAGAMENTO
INSERT INTO pagamento (valor, data_pagamento, metodo, pedido_id, usuario_id)
VALUES (150.00, NOW(), 'Pix', 1, 1);

-- PEDIDO_PRODUTO
INSERT INTO pedido_produto (pedido_id, produto_id, quantidade, preco_unitario)
VALUES (1, 1, 1, 150.00);

-- CAMPANHA
INSERT INTO campanha (nome, data_inicio, data_fim, is_ativa)
VALUES ('Promoção de Aniversário', '2026-04-01', '2026-04-30', TRUE);

-- CARDAPIO
INSERT INTO cardapio (nome, observacoes, is_ativo, campanha_id)
VALUES ('Cardápio Festa Básica', 'Itens mais pedidos', TRUE, 1);

-- CARDAPIO_PRODUTO
INSERT INTO cardapio_produto (cardapio_id, produto_id, ordem_exibicao, qtd_produto_total, qtd_produto_disponivel)
VALUES (1, 1, 1, 10 , 9);