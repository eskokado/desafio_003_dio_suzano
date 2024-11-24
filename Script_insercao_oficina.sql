USE dio_oficina_suzano;

-- Inserção na Tabela cliente
INSERT INTO cliente (nome, cpf, telefone, endereco, email) VALUES
('João Silva', '12345678901', '11987654321', 'Rua A, 123', 'joao@gmail.com'),
('Maria Oliveira', '23456789012', '11976543210', 'Rua B, 456', 'maria@gmail.com'),
('Carlos Souza', '34567890123', '11965432109', 'Rua C, 789', 'carlos@gmail.com'),
('Ana Santos', '45678901234', '11954321098', 'Rua D, 101', 'ana@gmail.com'),
('Luiza Costa', '56789012345', '11943210987', 'Rua E, 202', 'luiza@gmail.com');


-- Inserção na Tabela veiculo
INSERT INTO veiculo (cliente_id, placa, modelo, marca, ano, data_revisao) VALUES
(1, 'ABC1234', 'Gol', 'Volkswagen', 2020, '2024-01-15'),
(2, 'DEF5678', 'Civic', 'Honda', 2019, '2024-02-20'),
(3, 'GHI9012', 'Onix', 'Chevrolet', 2021, '2024-03-10'),
(4, 'JKL3456', 'Palio', 'Fiat', 2018, '2024-04-05'),
(5, 'MNO7890', 'HB20', 'Hyundai', 2022, '2024-05-12');

-- Inserção na Tabela equipe
INSERT INTO equipe (nome, lider, contato) VALUES
('Equipe A', 'Pedro Ferreira', '11999887766'),
('Equipe B', 'Fernanda Lima', '11988776655'),
('Equipe C', 'Lucas Almeida', '11977665544'),
('Equipe D', 'Carla Mendes', '11966554433'),
('Equipe E', 'Rafael Souza', '11955443322');

-- Inserção na Tabela mecanico
INSERT INTO mecanico (equipe_id, nome, codigo, endereco, especialidade, salario) VALUES
(1, 'José da Silva', 'M001', 'Rua A, 200', 'Motor', 2500.00),
(2, 'Rafael Dias', 'M002', 'Rua B, 300', 'Suspensão', 2800.00),
(3, 'Carlos Santos', 'M003', 'Rua C, 400', 'Freios', 2600.00),
(4, 'Mariana Alves', 'M004', 'Rua D, 500', 'Transmissão', 3000.00),
(5, 'Ana Clara', 'M005', 'Rua E, 600', 'Elétrica', 2700.00);

-- Inserção na Tabela orcamento
INSERT INTO orcamento (veiculo_id, equipe_id, data, data_entrega, observacao, status) VALUES
(1, 1, '2024-06-01', '2024-06-05', 'Troca de óleo e revisão geral', 'Em Andamento'),
(2, 2, '2024-06-10', '2024-06-15', 'Manutenção de freios', 'Concluído'),
(3, 3, '2024-06-20', '2024-06-25', 'Revisão elétrica', 'Pendente'),
(4, 4, '2024-07-01', '2024-07-05', 'Troca de amortecedores', 'Em Andamento'),
(5, 5, '2024-07-10', '2024-07-15', 'Alinhamento e balanceamento', 'Concluído');

-- Inserção na Tabela peca
INSERT INTO peca (nome, preco, fabricante, estoque) VALUES
('Filtro de Óleo', 50.00, 'Bosch', 100),
('Pneu 175/65R14', 300.00, 'Michelin', 50),
('Bateria 60Ah', 450.00, 'Moura', 30),
('Velas de Ignição', 20.00, 'NGK', 200),
('Disco de Freio', 120.00, 'Fremax', 80);

-- Inserção na Tabela servico
INSERT INTO servico (nome, preco, descricao) VALUES
('Troca de Óleo', 150.00, 'Troca de óleo e filtro do motor'),
('Revisão Geral', 500.00, 'Revisão completa do veículo'),
('Alinhamento e Balanceamento', 200.00, 'Serviço de alinhamento e balanceamento'),
('Troca de Pastilhas de Freio', 300.00, 'Substituição das pastilhas de freio'),
('Manutenção Elétrica', 400.00, 'Revisão e reparo do sistema elétrico');

-- Inserção na Tabela orcamento_item
INSERT INTO orcamento_item (orcamento_id, peca_id, servico_id, valor, quantidade) VALUES
(1, 1, 1, 200.00, 1),
(2, 2, 2, 800.00, 1),
(3, 3, 3, 700.00, 1),
(4, 4, 4, 500.00, 1),
(5, 5, 5, 1000.00, 1);

-- Inserção na Tabela ordem_servico
INSERT INTO ordem_servico (veiculo_id, equipe_id, data_entrada, data_entrega, valor, status, observacao) VALUES
(1, 1, '2024-08-01', '2024-08-05', 500.00, 1, 'Troca de óleo e revisão geral'),
(2, 2, '2024-08-10', '2024-08-15', 800.00, 0, 'Manutenção de freios'),
(3, 3, '2024-08-20', '2024-08-25', 1000.00, 1, 'Revisão elétrica'),
(4, 4, '2024-09-01', '2024-09-05', 700.00, 0, 'Troca de amortecedores'),
(5, 5, '2024-09-10', '2024-09-15', 1200.00, 1, 'Alinhamento e balanceamento');

-- Inserção na Tabela ordem_servico_item
INSERT INTO ordem_servico_item (ordem_servico_id, servico_id, peca_id, valor, quantidade) VALUES
(1, 1, 1, 200.00, 1),
(1, 2, 2, 800.00, 1),
(2, 3, 3, 700.00, 1),
(2, 3, 4, 500.00, 1),
(2, 5, 5, 1000.00, 1);
