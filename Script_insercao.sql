-- Banco de dados
USE dio_ecommerce_suzano;

-- Inserção completa na tabela Cliente
INSERT INTO Cliente (nome, cpf, email, telefone, endereco, cidade, estado, cep) VALUES
('João Silva', '111.111.111-11', 'joao@gmail.com', '(11) 99999-1111', 'Rua A, 123', 'São Paulo', 'SP', '01001-000'),
('Maria Oliveira', '222.222.222-22', 'maria@gmail.com', '(11) 98888-2222', 'Rua B, 456', 'Guarulhos', 'SP', '07001-000'),
('Empresa X', '00.000.000/0001-00', 'contato@empresa.com', '(11) 97777-3333', 'Av. C, 789', 'Campinas', 'SP', '13001-000'),
('Pedro Santos', '333.333.333-33', 'pedro@gmail.com', '(11) 96666-4444', 'Rua D, 321', 'Osasco', 'SP', '06001-000'),
('Ana Paula', '444.444.444-44', 'ana@gmail.com', '(11) 95555-5555', 'Rua E, 654', 'Santos', 'SP', '11001-000');

-- Inserção completa na tabela Pessoa_Fisica
INSERT INTO Pessoa_Fisica (id, cpf, rg, data_nascimento, genero) VALUES
(1, '111.111.111-11', 'MG-12.345.678', '1990-01-15', 'Masculino'),
(2, '222.222.222-22', 'SP-23.456.789', '1985-05-25', 'Feminino'),
(4, '333.333.333-33', 'RJ-34.567.890', '1978-07-30', 'Masculino'),
(5, '444.444.444-44', 'ES-45.678.901', '1992-03-12', 'Feminino');

-- Inserção completa na tabela Pessoa_Juridica
INSERT INTO Pessoa_Juridica (id, cnpj, razao_social, nome_fantasia, inscricao_estadual) VALUES
(3, '00.000.000/0001-00', 'Empresa X', 'Fantasia X', '123.456.789.000');

-- Inserção completa na tabela Produto
INSERT INTO Produto (categoria, descricao, valor, marca, estoque, unidade) VALUES
('Eletrônicos', 'Smartphone', 1500.00, 'Samsung', 50, 'Unidade'),
('Móveis', 'Mesa de Jantar', 800.00, 'Tok&Stok', 20, 'Unidade'),
('Roupas', 'Camiseta', 50.00, 'Hering', 200, 'Peça'),
('Eletrônicos', 'Notebook', 3500.00, 'Dell', 30, 'Unidade'),
('Calçados', 'Tênis Esportivo', 200.00, 'Nike', 100, 'Par');

-- Inserção completa na tabela Pedido
INSERT INTO Pedido (cliente_id, descricao, status, data, total, desconto) VALUES
(1, 'Pedido de smartphone', TRUE, '2024-11-01 10:30:00', 1500.00, 0.00),
(2, 'Pedido de mesa e cadeiras', FALSE, '2024-11-02 14:00:00', 2400.00, 200.00),
(3, 'Pedido corporativo', TRUE, '2024-11-03 09:00:00', 5000.00, 500.00),
(4, 'Pedido de roupas', FALSE, '2024-11-04 16:15:00', 250.00, 0.00),
(5, 'Pedido de tênis esportivo', TRUE, '2024-11-05 11:45:00', 400.00, 20.00);

-- Inserção completa na tabela Pedido_Item
INSERT INTO Pedido_Item (pedido_id, produto_id, quantidade, preco, frete, subtotal) VALUES
(1, 1, 1, 1500.00, 50.00, 1550.00),
(2, 2, 1, 800.00, 100.00, 900.00),
(2, 3, 2, 50.00, 20.00, 120.00),
(3, 4, 1, 3500.00, 200.00, 3700.00),
(5, 5, 2, 200.00, 30.00, 430.00);

-- Inserção completa na tabela Forma_Pagamento
INSERT INTO Forma_Pagamento (pedido_id, forma_pagamento_id, valor, parcela, juros) VALUES
(1, 1, 1550.00, 1, 0.00),
(2, 2, 1200.00, 3, 5.00),
(3, 3, 4500.00, 12, 10.00),
(4, 4, 250.00, 1, 0.00),
(5, 5, 410.00, 2, 2.00);

-- Inserção completa na tabela Pagamento
INSERT INTO Pagamento (observacao, valor, status_pagamento, data_pagamento) VALUES
('Pagamento à vista', 1550.00, 'Concluído', '2024-11-01'),
('Parcelamento em 3x', 1200.00, 'Pendente', NULL),
('Parcelamento em 12x', 4500.00, 'Pendente', NULL),
('Pagamento à vista', 250.00, 'Concluído', '2024-11-04'),
('Parcelamento em 2x', 410.00, 'Concluído', '2024-11-05');

-- Inserção completa na tabela Entrega
INSERT INTO Entrega (rastreio, status, data_entrega, tipo_entrega, endereco_entrega) VALUES
('AB123456789BR', 'Entregue', '2024-11-06', 'Correios', 'Rua A, 123, São Paulo, SP'),
('CD987654321BR', 'Pendente', NULL, 'Transportadora', 'Rua B, 456, Guarulhos, SP'),
('EF123456789BR', 'Em trânsito', '2024-11-08', 'Correios', 'Av. C, 789, Campinas, SP'),
('GH987654321BR', 'Cancelada', NULL, 'Correios', 'Rua D, 321, Osasco, SP'),
('IJ123456789BR', 'Entregue', '2024-11-09', 'Motoboy', 'Rua E, 654, Santos, SP');

-- Inserção completa na tabela Entrega_Item_Pedido
INSERT INTO Entrega_Item_Pedido (pedido_id, produto_id, entrega_id, quantidade, observacao) VALUES
(1, 1, 1, 1, 'Entrega rápida'),
(2, 2, 2, 1, 'Fragilidade'),
(2, 3, 2, 2, 'Pacote com dois itens'),
(3, 4, 3, 1, 'Pedido corporativo'),
(5, 5, 5, 2, 'Embalagem esportiva');

-- Inserção completa na tabela Fornecedor
INSERT INTO Fornecedor (razao_social, cnpj, contato, telefone, email) VALUES
('Fornecedor A', '11.111.111/0001-11', 'Carlos', '(11) 99999-1111', 'contato@fornecedora.com'),
('Fornecedor B', '22.222.222/0001-22', 'Fernanda', '(11) 98888-2222', 'contato@fornecedorb.com'),
('Fornecedor C', '33.333.333/0001-33', 'Joana', '(11) 97777-3333', 'contato@fornecedorc.com'),
('Fornecedor D', '44.444.444/0001-44', 'Roberto', '(11) 96666-4444', 'contato@fornecedord.com'),
('Fornecedor E', '55.555.555/0001-55', 'Paula', '(11) 95555-5555', 'contato@fornecedore.com');

-- Inserção completa na tabela Fornecedor_Produto
INSERT INTO Fornecedor_Produto (fornecedor_id, produto_id, preco_custo, prazo_entrega) VALUES
(1, 1, 1200.00, 7),
(2, 2, 700.00, 5),
(3, 3, 30.00, 2),
(4, 4, 3000.00, 10),
(5, 5, 150.00, 4);

-- Inserção completa na tabela Estoque
INSERT INTO Estoque (fornecedor_id, produto_id, local, capacidade, quantidade_atual, data_reposicao) VALUES
(1, 1, 'Depósito A', 1000, 500, '2024-11-01'),
(3, 1, 'Depósito B', 500, 300, '2024-11-02'),
(1, 2, 'Depósito C', 700, 450, '2024-11-03'),
(3, 2, 'Depósito D', 800, 350, '2024-11-04'),
(3, 3, 'Depósito E', 600, 400, '2024-11-05');
