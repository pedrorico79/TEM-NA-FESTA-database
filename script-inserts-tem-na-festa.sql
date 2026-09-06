USE temnafesta;

-- 1. ENDEREÇOS
INSERT INTO endereco (cep, logradouro, numero, complemento, bairro, cidade, estado) VALUES 
('06010000', 'Avenida dos Autonomistas', '1500', 'Apto 42', 'Vila Yara', 'Osasco', 'SP'),
('06020010', 'Rua Antonio Agú', '300', 'Casa 2', 'Centro', 'Osasco', 'SP');

-- 2. CLIENTES
INSERT INTO cliente (nome, telefone, whatsapp, instagram, data_cadastro, anotacoes, endereco_id, is_ativo, is_deletado) VALUES 
('Ana Carolina', '11987654321', '11987654321', '@anacarol', '2026-08-01', 'Cliente prefere bolos sem lactose.', 1, TRUE, FALSE),
('Carlos Eduardo', '11912345678', '11912345678', '@carlosedu', '2026-08-05', 'Sempre pede doces para o escritório.', 2, TRUE, FALSE);

-- 3. PERFIS
INSERT INTO perfil (nome, descricao) VALUES 
('ADMIN', 'Administrador geral do sistema'),
('ATENDENTE', 'Responsável por receber e orquestrar os pedidos via WhatsApp/Balcão'),
('CONFEITEIRO', 'Responsável pela linha de produção e painel da cozinha');

-- 4. USUÁRIOS
-- As senhas abaixo correspondem ao hash Bcrypt exato da string "senha123" (Cost 10)
INSERT INTO usuario (nome, email, senha, is_ativo, is_deletado, data_criacao, perfil_id) VALUES 
('João Silva', 'joao.atendimento@temnafesta.com', '$2a$10$eVcwkkcVKc.Dir1S6iV.p.tUsGHb/Aq5y.AN2Lvc7.pr4rw0VtS6K', TRUE, FALSE, '2026-08-01 08:00:00', 2),
('Maria Souza', 'maria.cozinha@temnafesta.com', '$2a$10$eVcwkkcVKc.Dir1S6iV.p.tUsGHb/Aq5y.AN2Lvc7.pr4rw0VtS6K', TRUE, FALSE, '2026-08-01 08:00:00', 3);

-- 5. EVENTOS
INSERT INTO evento (nome, data_inicio, data_fim, is_ativo, is_deletado) VALUES 
('Dia dos Pais 2026', '2026-08-01', '2026-08-09', TRUE, FALSE),
('Festa da Primavera', '2026-09-01', '2026-09-30', TRUE, FALSE);

-- 7. PRODUTOS / CARDÁPIO
INSERT INTO produto (nome, descricao, preco_venda, is_ativo, is_deletado) VALUES 
('Bolo de Vulcão - Cenoura', 'Bolo caseiro de cenoura com cobertura generosa de brigadeiro', 45.00, TRUE, FALSE),
('Bolo Decorado 2 Andares', 'Bolo de festa com massa de baunilha, recheio de morango e cobertura em chantininho', 250.00, TRUE, FALSE),
('Cento de Brigadeiro', 'Brigadeiros tradicionais de 15g feitos com chocolate belga', 120.00, TRUE, FALSE);

-- 8. MÉTODOS DE PAGAMENTO
INSERT INTO metodo_pagamento (nome) VALUES 
('PIX'),
('Cartão de Crédito'),
('Dinheiro');

-- 9. PEDIDOS
INSERT INTO pedido (data_pedido, data_entrega, valor_total, taxa_entrega, observacao, status_producao, cliente_id, usuario_id, evento_id, endereco_entrega_id, is_ativo, is_deletado) VALUES 
('2026-08-06 14:30:00', '2026-08-09 10:00:00', 165.00, 0.00, 'Entregar na portaria', 'AGUARDANDO_SINAL', 1, 1, 1, NULL, TRUE, FALSE),
('2026-08-08 09:15:00', '2026-08-15 15:00:00', 270.00, 20.00, 'Topo de bolo com nome "Eduardo"', 'EM_PRODUCAO', 2, 1, NULL, 2, TRUE, FALSE); 

-- 10. ITENS DO PEDIDO
INSERT INTO item_pedido (pedido_id, produto_id, quantidade, preco_unitario, observacao_item) VALUES 
(1, 1, 1, 45.00, 'Mandar talheres descartáveis'),
(1, 3, 1, 120.00, 'Metade brigadeiro, metade beijinho'),
(2, 2, 1, 250.00, 'Sem glúten');

-- 11. PAGAMENTOS
INSERT INTO pagamento (valor, data_pagamento, tipo_pagamento, status_pagamento, metodo_pagamento_id, pedido_id, usuario_id) VALUES 
(82.50, '2026-08-06 14:45:00', 'SINAL', 'CONFIRMADO', 1, 1, 1),
(82.50, '2026-08-09 10:05:00', 'QUITACAO', 'PENDENTE', 2, 1, 1);

-- 12. HISTÓRICO DE STATUS DO PEDIDO
INSERT INTO historico_status_pedido (data_alteracao, observacao, status_producao, pedido_id, usuario_id) VALUES 
('2026-08-06 14:30:00', 'Pedido criado como rascunho.', 'RASCUNHO', 1, 1),
('2026-08-06 14:45:00', 'Sinal confirmado. Pedido na fila de produção.', 'CONFIRMADO', 1, 1),
('2026-08-08 09:15:00', 'Pedido criado aguardando pagamento de entrada.', 'AGUARDANDO_SINAL', 2, 1);

-- 13. LEMBRETES (Organização interna)
INSERT INTO lembrete (descricao, data_criacao, data_limite, usuario_id) VALUES 
('Comprar embalagens para bolo de 2 andares', '2026-08-08', '2026-08-10', 2),
('Cobrar o sinal do pedido #2 do Carlos', '2026-08-08', '2026-08-09', 1);




Select * from pedido;
