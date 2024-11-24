-- Criação da Base de Dados
CREATE DATABASE IF NOT EXISTS dio_oficina_suzano;
USE dio_oficina_suzano;


-- Criar Tabela Cliente
CREATE TABLE cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    endereco VARCHAR(255),
    email VARCHAR(100)
);

-- Criar Tabela Veiculo
CREATE TABLE veiculo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    placa VARCHAR(10) NOT NULL,
    modelo VARCHAR(100),
    marca VARCHAR(50),
    ano INT,
    data_revisao DATE NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

-- Criar Tabela Equipe
CREATE TABLE equipe (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    lider VARCHAR(100),
    contato VARCHAR(15)
);

-- Criar Tabela Mecanico
CREATE TABLE mecanico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipe_id INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    endereco VARCHAR(255),
    especialidade VARCHAR(100),
    salario DECIMAL(10, 2),
    FOREIGN KEY (equipe_id) REFERENCES equipe(id)
);

-- Criar Tabela Peca
CREATE TABLE peca (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    fabricante VARCHAR(100),
    estoque INT DEFAULT 0
);

-- Criar Tabela Servico
CREATE TABLE servico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    descricao TEXT
);

-- Criar Tabela Orcamento
CREATE TABLE orcamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    veiculo_id INT NOT NULL,
    equipe_id INT NOT NULL,
    data DATE NOT NULL,
    data_entrega DATE NOT NULL,
    observacao TEXT,
    status VARCHAR(50),
    FOREIGN KEY (veiculo_id) REFERENCES veiculo(id),
    FOREIGN KEY (equipe_id) REFERENCES equipe(id)
);

-- Criar Tabela Orcamento Item
CREATE TABLE orcamento_item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    orcamento_id INT NOT NULL,
    peca_id INT,
    servico_id INT,
    valor DECIMAL(10, 2) NOT NULL,
    quantidade INT DEFAULT 1,
    FOREIGN KEY (orcamento_id) REFERENCES orcamento(id),
    FOREIGN KEY (peca_id) REFERENCES peca(id),
    FOREIGN KEY (servico_id) REFERENCES servico(id)
);

-- Criar Tabela Ordem de Servico
CREATE TABLE ordem_servico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    veiculo_id INT NOT NULL,
    equipe_id INT NOT NULL,
    data_entrada DATE NOT NULL,
    data_entrega DATE NOT NULL,
    valor DECIMAL(10, 2),
    status BOOLEAN DEFAULT 0,
    observacao TEXT,
    FOREIGN KEY (veiculo_id) REFERENCES veiculo(id),
    FOREIGN KEY (equipe_id) REFERENCES equipe(id)
);

-- Criar Tabela Ordem de Servico Item
CREATE TABLE ordem_servico_item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ordem_servico_id INT NOT NULL,
    servico_id INT,
    peca_id INT,
    valor DECIMAL(10, 2),
    quantidade INT DEFAULT 1,
    FOREIGN KEY (ordem_servico_id) REFERENCES ordem_servico(id),
    FOREIGN KEY (peca_id) REFERENCES peca(id),
    FOREIGN KEY (servico_id) REFERENCES servico(id)
);


