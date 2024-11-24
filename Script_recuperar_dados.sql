-- Obter todos os clientes
SELECT * FROM Cliente
ORDER BY nome;

-- Listar produtos com valor maior que R$50
SELECT * FROM Produto WHERE valor > 50
ORDER BY valor DESC;

-- Verificar pedidos concluídos
SELECT * FROM Pedido WHERE status = TRUE;

-- Exibir entregas pendentes
SELECT * FROM Entrega WHERE status = 'Pendente';

-- Listar todos os pagamentos feitos acima de R$100
SELECT * FROM Pagamento WHERE valor > 100;

-- Listar todos os pedidos com os dados dos clientes
SELECT 
    p.id AS pedido_id,
    p.descricao AS descricao_pedido,
    p.data AS data_pedido,
    c.nome AS nome_cliente,
    c.cpf AS cpf_cliente
FROM Pedido p
INNER JOIN Cliente c ON p.cliente_id = c.id;

-- Produtos de cada pedido com preços e quantidade
SELECT 
    pi.pedido_id,
    pr.descricao AS produto_descricao,
    pi.quantidade AS quantidade_produto,
    pr.valor AS preco_unitario,
    (pi.quantidade * pr.valor) AS total_produto
FROM Pedido_Item pi
INNER JOIN Produto pr ON pi.produto_id = pr.id;

-- Exibir as entregas de pedidos e status dos clientes
SELECT 
    e.id AS entrega_id,
    e.rastreio AS codigo_rastreamento,
    e.status AS status_entrega,
    c.nome AS nome_cliente,
    c.cpf AS cpf_cliente,
    p.descricao AS descricao_pedido
FROM Entrega e
INNER JOIN Pedido p ON e.id = p.id
INNER JOIN Cliente c ON p.cliente_id = c.id;

-- Produtos e fornecedores disponíveis no estoque
SELECT 
    f.razao_social AS fornecedor,
    pr.descricao AS produto,
    le.local AS local_estoque,
    le.quantidade_atual AS quantidade_disponivel
FROM Estoque le
INNER JOIN Fornecedor f ON le.fornecedor_id = f.id
INNER JOIN Produto pr ON le.produto_id = pr.id;

-- Pedidos e formas de pagamento associadas
SELECT 
    p.id AS pedido_id,
    p.descricao AS descricao_pedido,
    fp.parcela AS forma_pagamento_parcela,
    fp.valor AS valor_pagamento
FROM Forma_Pagamento fp
INNER JOIN Pedido p ON fp.pedido_id = p.id;

-- Listar pagamentos feitos por vendedores (terceiros)
SELECT 
    t.id as terceiro_vendedor_id,
    t.razao_social AS nome_vendedor,
    pg.id AS pagamento_id,
    pg.valor AS valor_pago
FROM Terceiros_Vendedor t

-- Relatório completo de pedidos, clientes e produtos
SELECT 
    c.nome AS nome_cliente,
    c.cpf AS cpf_cliente,
    p.descricao AS descricao_pedido,
    pr.descricao AS produto_descricao,
    pi.quantidade AS quantidade_produto,
    pr.valor AS preco_unitario,
    (pi.quantidade * pr.valor) AS total_item
FROM Cliente c
INNER JOIN Pedido p ON c.id = p.cliente_id
INNER JOIN Pedido_Item pi ON p.id = pi.pedido_id
INNER JOIN Produto pr ON pi.produto_id = pr.id;

-- Total de pedidos por cliente
SELECT 
    c.nome AS nome_cliente,
    COUNT(p.id) AS total_pedidos
FROM Cliente c
INNER JOIN Pedido p ON c.id = p.cliente_id
GROUP BY c.nome
-- HAVING COUNT(p.id) > 2;

-- Produtos mais vendidos
SELECT 
    pr.descricao AS produto,
    SUM(pi.quantidade) AS total_vendido
FROM Produto pr
INNER JOIN Pedido_Item pi ON pr.id = pi.produto_id
GROUP BY pr.descricao
HAVING SUM(pi.quantidade) >= 2;

-- Valor total dos pedidos por cliente
SELECT 
    c.nome AS nome_cliente,
    SUM(pi.quantidade * pr.valor) AS valor_total_pedidos
FROM Cliente c
INNER JOIN Pedido p ON c.id = p.cliente_id
INNER JOIN Pedido_Item pi ON p.id = pi.pedido_id
INNER JOIN Produto pr ON pi.produto_id = pr.id
GROUP BY c.nome
HAVING SUM(pi.quantidade * pr.valor) > 1000;

-- Quantidade de produtos fornecidos por fornecedor
SELECT 
    f.razao_social AS fornecedor,
    COUNT(fp.produto_id) AS total_produtos_fornecidos
FROM Fornecedor f
INNER JOIN Fornecedor_Produto fp ON f.id = fp.fornecedor_id
GROUP BY f.razao_social
-- HAVING COUNT(fp.produto_id) > 5;

-- Localizações com maior quantidade de estoque
SELECT 
    le.local AS local_estoque,
    SUM(le.quantidade_atual) AS total_estoque
FROM Estoque le
GROUP BY le.local
HAVING SUM(le.quantidade_atual) > 350;

-- Pagamentos agrupados por forma de pagamento
SELECT 
    fp.forma_pagamento_id ,
    SUM(fp.valor) AS total_pago
FROM Forma_Pagamento fp
GROUP BY fp.forma_pagamento_id 
HAVING SUM(fp.valor) > 500;

-- Número de pedidos entregues por status
SELECT 
    e.status AS status_entrega,
    COUNT(p.id) AS total_pedidos
FROM Entrega e
INNER JOIN Entrega_Item_Pedido eip ON e.id = eip.entrega_id
INNER JOIN Pedido p ON eip.pedido_id = p.id
GROUP BY e.status
-- HAVING COUNT(p.id) > 3;

-- Valor médio de produtos por categoria
SELECT 
    pr.categoria AS categoria_produto,
    AVG(pr.valor) AS valor_medio
FROM Produto pr
GROUP BY pr.categoria
HAVING AVG(pr.valor) > 30;

