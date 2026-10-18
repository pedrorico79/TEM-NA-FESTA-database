USE tem_na_festa;

-- Execute uma vez em bases já criadas. Os valores existentes são preservados;
-- as novas cobranças começam em zero para pedidos e itens antigos.
ALTER TABLE item_pedido
    ADD COLUMN acrescimo DECIMAL(10,2) NOT NULL DEFAULT 0.00;

ALTER TABLE pedido
    ADD COLUMN desconto_pedido DECIMAL(10,2) NOT NULL DEFAULT 0.00;
