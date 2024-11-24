USE dio_oficina_suzano;

-- Listar todos os clientes
SELECT * FROM cliente;

-- Listar veículos de um cliente específico
SELECT * FROM veiculo WHERE cliente_id = 1;

-- Listar veículos com os respectivos donos
SELECT v.placa, v.modelo, c.nome AS dono
FROM veiculo v
INNER JOIN cliente c ON v.cliente_id = c.id;

-- Listar orçamentos com a equipe responsável
SELECT o.id AS id_orcamento, o.data, o.status, e.nome AS equipe_responsavel
FROM orcamento o
INNER JOIN equipe e ON o.equipe_id = e.id;

-- Quantidade de serviços realizados por cada equipe
SELECT e.nome AS equipe, COUNT(os.id) AS total_servicos
FROM equipe e
INNER JOIN ordem_servico os ON e.id = os.equipe_id
GROUP BY e.nome
-- HAVING COUNT(os.id) > 1;

-- Total de peças utilizadas em ordens de serviço
SELECT p.nome AS peca, SUM(osi.quantidade) AS total_utilizado
FROM peca p
INNER JOIN ordem_servico_item osi ON p.id = osi.peca_id
GROUP BY p.nome
-- HAVING SUM(osi.quantidade) > 5;

