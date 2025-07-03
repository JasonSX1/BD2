CREATE DATABASE IF NOT EXISTS LojaKanto;
USE LojaKanto;

DROP TABLE IF EXISTS Pedido_Produto;
DROP TABLE IF EXISTS Fornecedor_Produto;
DROP TABLE IF EXISTS telefones_vendedor;
DROP TABLE IF EXISTS telefones_forn;
DROP TABLE IF EXISTS telefones_cli;
DROP TABLE IF EXISTS Pedido;
DROP TABLE IF EXISTS Produto;
DROP TABLE IF EXISTS Promocao;
DROP TABLE IF EXISTS Categoria;
DROP TABLE IF EXISTS Fornecedor;
DROP TABLE IF EXISTS Vendedor;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Endereco;

CREATE TABLE Endereco (
    idEndereco INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
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
    IdEndereco INT UNSIGNED,
    FOREIGN KEY (IdEndereco) REFERENCES Endereco(idEndereco)
);

CREATE TABLE Vendedor (
    CPF VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    dataNasc DATE NOT NULL,
    email VARCHAR(255),
    idEndereco INT UNSIGNED,
    FOREIGN KEY (idEndereco) REFERENCES Endereco(idEndereco)
);

CREATE TABLE Fornecedor (
    CNPJ VARCHAR(14) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    idEndereco INT UNSIGNED,
    FOREIGN KEY (idEndereco) REFERENCES Endereco(idEndereco)
);

CREATE TABLE Categoria (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE Promocao (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255),
    dataInicio DATE NOT NULL,
    dataTermino DATE NOT NULL,
    percentualDesconto DECIMAL(3,2) UNSIGNED NOT NULL
);

CREATE TABLE Produto (
    idProduto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    tamanho VARCHAR(4) NOT NULL,
    cor VARCHAR(20) NOT NULL,
    preco DECIMAL(7,2) UNSIGNED NOT NULL,
    qtdEstoque INT UNSIGNED,
    qtdMinima INT UNSIGNED NOT NULL,
    idCategoria INT UNSIGNED,
    idPromocao INT UNSIGNED,
    FOREIGN KEY (idCategoria) REFERENCES Categoria(ID),
    FOREIGN KEY (idPromocao) REFERENCES Promocao(ID)
);

CREATE TABLE Pedido (
    codPedido INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    valorTotal DECIMAL(7,2) UNSIGNED NOT NULL,
    CPF_cliente VARCHAR(11),
    CPF_vendedor VARCHAR(11),
    FOREIGN KEY (CPF_cliente) REFERENCES Cliente(CPF),
    FOREIGN KEY (CPF_vendedor) REFERENCES Vendedor(CPF)
);

CREATE TABLE telefones_cli (
    telefone CHAR(11) NOT NULL,
    CPF_cliente VARCHAR(11),
    PRIMARY KEY (telefone, CPF_cliente),
    FOREIGN KEY (CPF_cliente) REFERENCES Cliente(CPF)
);

CREATE TABLE telefones_forn (
    telefone CHAR(15) NOT NULL,
    CNPJ VARCHAR(14),
    PRIMARY KEY (telefone, CNPJ),
    FOREIGN KEY (CNPJ) REFERENCES Fornecedor(CNPJ)
);

CREATE TABLE telefones_vendedor (
    telefone CHAR(15) NOT NULL,
    CPF_vendedor VARCHAR(11),
    PRIMARY KEY (telefone, CPF_vendedor),
    FOREIGN KEY (CPF_vendedor) REFERENCES Vendedor(CPF)
);

CREATE TABLE Fornecedor_Produto (
    CNPJ VARCHAR(14),
    idProduto INT UNSIGNED,
    data DATE,
    quantidade INT UNSIGNED NOT NULL,
    valor DECIMAL(7,2) UNSIGNED NOT NULL,
    PRIMARY KEY (data, CNPJ, idProduto),
    FOREIGN KEY (CNPJ) REFERENCES Fornecedor(CNPJ),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

CREATE TABLE Pedido_Produto (
    codPedido INT UNSIGNED,
    idProduto INT UNSIGNED,
    quantidadeProduto INT UNSIGNED NOT NULL,
    precoUnitario DECIMAL(7,2) UNSIGNED NOT NULL,
    PRIMARY KEY (codPedido, idProduto),
    FOREIGN KEY (codPedido) REFERENCES Pedido(codPedido),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);
