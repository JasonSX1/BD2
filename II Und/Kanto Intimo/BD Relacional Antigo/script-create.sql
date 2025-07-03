CREATE DATABASE IF NOT EXISTS KantoIntimo;
USE KantoIntimo;

CREATE TABLE Endereco (
    idEndereco INT AUTO_INCREMENT PRIMARY KEY,
    logradouro VARCHAR(255) NOT NULL,
    bairro VARCHAR(100),
    numero VARCHAR(5) NOT NULL,
    CEP VARCHAR(8) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    UF VARCHAR(2) NOT NULL
);

CREATE TABLE Cliente (
    CPF VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    dataNasc DATE NOT NULL,
    email VARCHAR(255),
    idEndereco INT,
    FOREIGN KEY (idEndereco) REFERENCES Endereco(idEndereco) ON DELETE CASCADE
);

CREATE TABLE Vendedor (
    CPF VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    dataNasc DATE NOT NULL,
    email VARCHAR(255),
    idEndereco INT,
    FOREIGN KEY (idEndereco) REFERENCES Endereco(idEndereco) ON DELETE CASCADE
);

CREATE TABLE Pedido (
    codPedido INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    valorTotal DECIMAL(7,2) NOT NULL,
    CPF_cliente VARCHAR(11),
    CPF_vendedor VARCHAR(11),
    FOREIGN KEY (CPF_cliente) REFERENCES Cliente(CPF) ON DELETE CASCADE,
    FOREIGN KEY (CPF_vendedor) REFERENCES Vendedor(CPF) ON DELETE CASCADE
);

CREATE TABLE Categoria (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(11) NOT NULL
);

CREATE TABLE Promocao (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255),
    dataInicio DATE NOT NULL,
    dataTermino DATE NOT NULL,
    percentualDesconto DECIMAL(3,2) NOT NULL
);

CREATE TABLE Produto (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    tamanho VARCHAR(5) NOT NULL,
    cor VARCHAR(20) NOT NULL,
    preco DECIMAL(7,2) NOT NULL,
    qtdEstoque INT,
    idCategoria INT,
    idPromocao INT,
    qtdMinima INT,
    FOREIGN KEY (idCategoria) REFERENCES Categoria(ID),
    FOREIGN KEY (idPromocao) REFERENCES Promocao(ID)
);

CREATE TABLE Fornecedor (
    CNPJ VARCHAR(14) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    idEndereco INT,
    FOREIGN KEY (idEndereco) REFERENCES Endereco(idEndereco) ON DELETE CASCADE
);

CREATE TABLE telefones_cli (
    telefone CHAR(11) NOT NULL,
    CPF_cliente VARCHAR(11),
    PRIMARY KEY (telefone, CPF_cliente),
    FOREIGN KEY (CPF_cliente) REFERENCES Cliente(CPF) ON DELETE CASCADE
);

CREATE TABLE telefones_forn (
    telefone CHAR(15) NOT NULL,
    CNPJ VARCHAR(14),
    PRIMARY KEY (telefone, CNPJ),
    FOREIGN KEY (CNPJ) REFERENCES Fornecedor(CNPJ) ON DELETE CASCADE
);

CREATE TABLE telefones_Vendedor (
    telefone CHAR(15) NOT NULL,
    CPF_vendedor VARCHAR(11),
    PRIMARY KEY (telefone, CPF_vendedor),
    FOREIGN KEY (CPF_vendedor) REFERENCES Vendedor(CPF) ON DELETE CASCADE
);

CREATE TABLE Fornecedor_Produto (
    CNPJ VARCHAR(14) NOT NULL,
    idProduto INT NOT NULL,
    data DATE,
    quantidade INT NOT NULL,
    valor DECIMAL(7,2) NOT NULL,
    PRIMARY KEY (data, CNPJ, idProduto),
    FOREIGN KEY (CNPJ) REFERENCES Fornecedor(CNPJ) ON DELETE RESTRICT,
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto) ON DELETE CASCADE
);

CREATE TABLE Pedido_Produto (
    codPedido INT,
    idProduto INT,
    quantidadeProduto INT NOT NULL,
    precoUnitario DECIMAL(7,2) NOT NULL,
    FOREIGN KEY (codPedido) REFERENCES Pedido(codPedido) ON DELETE CASCADE,
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto) ON DELETE CASCADE
);
