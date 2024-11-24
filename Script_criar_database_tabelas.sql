-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS dio_ecommerce_suzano;
USE dio_ecommerce_suzano;

-- Tabela: Cliente
CREATE TABLE Cliente (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    cpf VARCHAR(25) UNIQUE,
    email VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(100),
    cidade VARCHAR(45),
    estado VARCHAR(2),
    cep VARCHAR(10)
);

-- Tabela: Pessoa Fisica
CREATE TABLE Pessoa_Fisica (
    id INT NOT NULL PRIMARY KEY,
    cpf VARCHAR(14),
    rg VARCHAR(20),
    data_nascimento DATE,
    genero VARCHAR(10),
    FOREIGN KEY (id) REFERENCES Cliente(id)
);

-- Tabela: Pessoa Juridica
CREATE TABLE Pessoa_Juridica (
    id INT NOT NULL PRIMARY KEY,
    cnpj VARCHAR(18),
    razao_social VARCHAR(100),
    nome_fantasia VARCHAR(100),
    inscricao_estadual VARCHAR(20),
    FOREIGN KEY (id) REFERENCES Cliente(id)
);

-- Tabela: Produto
CREATE TABLE Produto (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR(45),
    descricao VARCHAR(100),
    valor DOUBLE,
    marca VARCHAR(45),
    estoque INT,
    unidade VARCHAR(10)
);

-- Tabela: Pedido
CREATE TABLE Pedido (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    descricao VARCHAR(100),
    status BOOLEAN,
    data DATETIME,
    total DOUBLE,
    desconto DOUBLE,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);

-- Tabela: Pedido_Item
CREATE TABLE Pedido_Item (
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade DOUBLE,
    preco DOUBLE,
    frete DOUBLE,
    subtotal DOUBLE,
    PRIMARY KEY (pedido_id, produto_id),
    FOREIGN KEY (pedido_id) REFERENCES Pedido(id),
    FOREIGN KEY (produto_id) REFERENCES Produto(id)
);

-- Tabela: Forma de Pagamento
CREATE TABLE Forma_Pagamento (
    pedido_id INT NOT NULL,
    forma_pagamento_id INT NOT NULL,
    valor DOUBLE,
    parcela INT,
    juros DOUBLE,
    PRIMARY KEY (pedido_id, forma_pagamento_id),
    FOREIGN KEY (pedido_id) REFERENCES Pedido(id)
);

-- Tabela: Pagamento
CREATE TABLE Pagamento (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    observacao VARCHAR(100),
    valor DOUBLE,
    status_pagamento VARCHAR(45),
    data_pagamento DATE
);

-- Tabela: Entrega
CREATE TABLE Entrega (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    rastreio VARCHAR(45),
    status VARCHAR(45),
    data_entrega DATE,
    tipo_entrega VARCHAR(45),
    endereco_entrega VARCHAR(100)
);

-- Tabela: Entrega_Item_Pedido
CREATE TABLE Entrega_Item_Pedido (
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    entrega_id INT NOT NULL,
    quantidade DOUBLE,
    observacao VARCHAR(100),
    PRIMARY KEY (pedido_id, produto_id, entrega_id),
    FOREIGN KEY (pedido_id) REFERENCES Pedido(id),
    FOREIGN KEY (produto_id) REFERENCES Produto(id),
    FOREIGN KEY (entrega_id) REFERENCES Entrega(id)
);

-- Tabela: Fornecedor
CREATE TABLE Fornecedor (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(100),
    cnpj VARCHAR(18),
    contato VARCHAR(45),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- Tabela: Fornecedor_Produto
CREATE TABLE Fornecedor_Produto (
    fornecedor_id INT NOT NULL,
    produto_id INT NOT NULL,
    preco_custo DOUBLE,
    prazo_entrega INT,
    PRIMARY KEY (fornecedor_id, produto_id),
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor(id),
    FOREIGN KEY (produto_id) REFERENCES Produto(id)
);

-- Tabela: Estoque
CREATE TABLE Estoque (
    fornecedor_id INT NOT NULL,
    produto_id INT NOT NULL,
    local VARCHAR(100),
    capacidade INT,
    quantidade_atual INT,
    data_reposicao DATE,
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor(id),
    FOREIGN KEY (produto_id) REFERENCES Produto(id),
    PRIMARY KEY (fornecedor_id, produto_id)
);

-- Tabela: Produtos_Vendedor
CREATE TABLE Produtos_Vendedor (
    vendedor_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade DOUBLE,
    comissao DOUBLE,
    PRIMARY KEY (vendedor_id, produto_id)
);

-- Tabela: Terceiros_Vendedor
CREATE TABLE Terceiros_Vendedor (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(100),
    local VARCHAR(100),
    telefone VARCHAR(20),
    email VARCHAR(100),
    data_contrato DATE
);
