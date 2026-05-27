use tem_na_festa;

-- 1. Tabela: endereco
INSERT INTO endereco (cep, logradouro, numero, complemento, bairro, cidade, estado) VALUES
('01310200', 'Avenida Paulista', '1578', 'Apto 101', 'Bela Vista', 'São Paulo', 'SP'),
('22041001', 'Avenida Nossa Senhora de Copacabana', '500', 'Bloco B', 'Copacabana', 'Rio de Janeiro', 'RJ'),
('30140010', 'Rua dos Guajajaras', '300', NULL, 'Centro', 'Belo Horizonte', 'MG');

-- 2. Tabela: cliente (Depende de endereco)
INSERT INTO cliente (nome, telefone, whatsapp, instagram, data_cadastro, anotacoes, endereco_id, is_ativo) VALUES
('Mariana Silva', '11999998888', '11999998888', '@mari_silva', '2026-01-15', 'Cliente VIP, prefere doces finos.', 1, TRUE),
('Carlos Eduardo', '21988887777', '21988887777', '@cadu_festas', '2026-02-20', 'Retira sempre no local.', 2, TRUE),
('Ana Beatriz', '31977776666', '31977776666', '@igor_lindo', '2026-03-10', 'Restrição a lactose.', 3, TRUE);

-- 3. Tabela: perfil
INSERT INTO perfil (nome, descricao) VALUES
('Administrador', 'Acesso total ao sistema e configurações.'),
('Vendedor', 'Acesso a pedidos, clientes e produtos.'),
('Produção', 'Acesso apenas ao status e itens dos pedidos.');

-- 4. Tabela: usuario (Depende de perfil)
INSERT INTO usuario (nome, email, senha, is_ativo, data_criacao, perfil_id) VALUES
('Admin Geral', 'admin@temnafesta.com', 'hash_senha_admin_123', TRUE, '2026-01-01 08:00:00', 1),
('Rodrigo Vendas', 'rodrigo@temnafesta.com', 'hash_senha_rod_456', TRUE, '2026-01-10 09:30:00', 2),
('Paulinha Confeiteira', 'paula@temnafesta.com', 'hash_senha_pau_789', TRUE, '2026-01-12 07:00:00', 3);

-- 5. Tabela: evento
INSERT INTO evento (nome, data_inicio, data_fim, is_ativa) VALUES
('Casamento Mariana & Roberto', '2026-06-12', '2026-06-13', TRUE),
('Aniversário Infantil do Dudu', '2026-07-05', '2026-07-05', TRUE),
('Corporativo TechX', '2026-08-20', '2026-08-21', TRUE);

-- 6. Tabela: status_producao
INSERT INTO status_producao (nome) VALUES
('Aguardando Início'),
('Em Produção'),
('Pronto para Entrega'),
('Entregue'),
('Cancelado');

-- 7. Tabela: metodo_pagamento
INSERT INTO metodo_pagamento (nome) VALUES
('Pix'),
('Cartão de Crédito'),
('Cartão de Débito'),
('Dinheiro');

-- 8. Tabela: produto
INSERT INTO produto (nome, descricao, preco_venda, is_ativo) VALUES
('Cento de Brigadeiro Gourmet', 'Brigadeiro feito com chocolate belga.', 150.00, TRUE),
('Bolo de Casamento 3 Andares', 'Bolo decorado com pasta americana, sabor ninho com morango.', 800.00, TRUE),
('Combo Salgadinhos Fritos 500un', 'Coxinha, bolinha de queijo e kibe.', 250.00, TRUE),
('Cupcake Decorado', 'Cupcake com cobertura de chantininho personalizado.', 8.50, TRUE);

-- 9. Tabela: pedido (Depende de status_producao, cliente, usuario, evento)
INSERT INTO pedido (data_pedido, data_entrega, valor_total, observacao, status_producao_id, cliente_id, usuario_id, evento_id, is_ativo) VALUES
('2026-05-20 14:00:00', '2026-06-12 16:00:00', 1100.00, 'Entregar direto no salão de festas.', 1, 1, 2, 1, TRUE),
('2026-05-25 10:30:00', '2026-07-05 12:00:00', 420.00, 'Massa do bolo sem chocolate.', 2, 2, 2, 2, TRUE);

-- 10. Tabela: item_pedido (Depende de pedido, produto)
INSERT INTO item_pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 2, 1, 800.00), -- 1 Bolo de Casamento
(1, 1, 2, 150.00), -- 2 Centos de Brigadeiro
(2, 3, 1, 250.00), -- 1 Combo de Salgadinhos
(2, 4, 20, 8.50);  -- 20 Cupcakes

-- 11. Tabela: pagamento (Depende de metodo_pagamento, pedido, usuario)
INSERT INTO pagamento (valor, data_pagamento, metodo_pagamento_id, pedido_id, usuario_id) VALUES
(550.00, '2026-05-20 14:15:00', 1, 1, 2), -- Sinal de 50% via Pix do pedido 1
(420.00, '2026-05-25 10:45:00', 2, 2, 2); -- Pagamento integral via Crédito do pedido 2

-- 12. Tabela: historico_status_pedido (Depende de status_producao, pedido, usuario)
INSERT INTO historico_status_pedido (data_alteracao, observacao, status_producao_id, pedido_id, usuario_id) VALUES
('2026-05-20 14:00:00', 'Pedido criado inicialmente.', 1, 1, 2),
('2026-05-25 10:30:00', 'Pedido criado inicialmente.', 1, 2, 2),
('2026-05-26 08:00:00', 'Iniciada a produção dos salgados.', 2, 2, 3);

-- 13. Tabela: lembrete (Depende de usuario)
INSERT INTO lembrete (descricao, data_criacao, data_limite, usuario_id) VALUES
('Comprar morangos frescos para o bolo da Mariana.', '2026-05-27', '2026-06-11', 3),
('Confirmar horário de entrega com o cerimonial.', '2026-05-27', '2026-06-10', 2);

