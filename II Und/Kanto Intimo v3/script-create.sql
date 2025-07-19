/* CREATE: */
DROP DATABASE IF EXISTS kantointimo;
CREATE DATABASE kantointimo;
USE kantointimo;
/* Esquema Lógico: */

CREATE TABLE Cliente (
    CPF CHAR (11) PRIMARY KEY,
    idEndereco INT UNSIGNED,
    nome VARCHAR(255) NOT NULL,
    dataNasc DATE NOT NULL,
    email VARCHAR(255)
);

CREATE TABLE Endereco (
    idEndereco INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    logradouro VARCHAR(255) NOT NULL,
    bairro VARCHAR(100),
    numero VARCHAR(5) NOT NULL,
    CEP VARCHAR(8) NOT NULL,
    cidade  VARCHAR(30) NOT NULL,
    UF CHAR(2) NOT NULL
);

CREATE TABLE Pedido (
    codPedido INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CPF_cliente CHAR (11),
    CPF_vendedor CHAR(11),
    data DATE NOT NULL,
    valorTotal DECIMAL(7,2) NOT NULL
);

CREATE TABLE Produto (
    idProduto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    idCategoria INT UNSIGNED NOT NULL,
    nome VARCHAR(60) NOT NULL,
    tamanho VARCHAR(4) NOT NULL,
    cor VARCHAR(20) NOT NULL,
    preco DECIMAL(7,2) NOT NULL,
    qtdEstoque INT UNSIGNED NOT NULL,
    qtdMinima INT UNSIGNED NOT NULL
);

CREATE TABLE Fornecedor (
    CNPJ CHAR(14) PRIMARY KEY,
    idEndereco INT UNSIGNED,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) 
);

CREATE TABLE Promocao (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255),
    percentualDesconto DECIMAL(3,2) NOT NULL
);

CREATE TABLE Vendedor (
    CPF CHAR(11) PRIMARY KEY,
    idEndereco INT UNSIGNED,
    nome VARCHAR(255) NOT NULL,
    dataNasc DATE NOT NULL,
    email VARCHAR(255)
);

CREATE TABLE Categoria (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome CHAR (50) NOT NULL
);

CREATE TABLE telefones_cli (
    telefone CHAR(11) NOT NULL,
    CPF_cliente CHAR (11),
    PRIMARY KEY (telefone, CPF_cliente)
);

CREATE TABLE telefones_forn (
    telefone CHAR(15) NOT NULL,
    CNPJ CHAR(14),
    PRIMARY KEY (telefone, CNPJ)
);

CREATE TABLE telefones_vend (
    telefone CHAR(15) NOT NULL,
    CPF_vendedor CHAR(11),
    PRIMARY KEY (telefone, CPF_vendedor)
);

CREATE TABLE Fornecedor_Produto (
    CNPJ CHAR(14) NOT NULL,
    idProduto INT UNSIGNED NOT NULL,
    data DATE,
    quantidade INT UNSIGNED NOT NULL,
    valor DECIMAL(7,2) NOT NULL,
    PRIMARY KEY (data, CNPJ, idProduto)
);

CREATE TABLE Pedido_Produto (
    idProduto INT UNSIGNED NOT NULL,
    codPedido INT UNSIGNED NOT NULL,
    quantidadeProduto INT UNSIGNED NOT NULL,
    precoUnitario DECIMAL(7,2) NOT NULL,
    PRIMARY KEY (idProduto, codPedido)
);

CREATE TABLE Produto_Promocao (
    idProduto INT UNSIGNED NOT NULL,
    idPromocao INT UNSIGNED NOT NULL,
    dataInicio DATE NOT NULL,
    dataTermino DATE NOT NULL,
    PRIMARY KEY (idProduto, idPromocao, dataInicio)
);
 
ALTER TABLE Cliente ADD CONSTRAINT FK_Cliente_2
    FOREIGN KEY (idEndereco)
    REFERENCES Endereco (idEndereco);
 
ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_2
    FOREIGN KEY (CPF_cliente)
    REFERENCES Cliente (CPF)
    ON DELETE CASCADE;
 
ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_3
    FOREIGN KEY (CPF_vendedor)
    REFERENCES Vendedor (CPF)
    ON DELETE CASCADE;
 
ALTER TABLE Produto ADD CONSTRAINT FK_Produto_2
    FOREIGN KEY (idCategoria)
    REFERENCES Categoria (ID);
 
ALTER TABLE Fornecedor ADD CONSTRAINT FK_Fornecedor_2
    FOREIGN KEY (idEndereco)
    REFERENCES Endereco (idEndereco);
 
ALTER TABLE Vendedor ADD CONSTRAINT FK_Vendedor_2
    FOREIGN KEY (idEndereco)
    REFERENCES Endereco (idEndereco);
 
ALTER TABLE telefones_cli ADD CONSTRAINT FK_telefones_cli_2
    FOREIGN KEY (CPF_cliente)
    REFERENCES Cliente (CPF);
 
ALTER TABLE telefones_forn ADD CONSTRAINT FK_telefones_forn_2
    FOREIGN KEY (CNPJ)
    REFERENCES Fornecedor (CNPJ);
 
ALTER TABLE telefones_vend ADD CONSTRAINT FK_telefones_vend_2
    FOREIGN KEY (CPF_vendedor)
    REFERENCES Vendedor (CPF);
 
ALTER TABLE Fornecedor_Produto ADD CONSTRAINT FK_Fornecedor_Produto_2
    FOREIGN KEY (CNPJ)
    REFERENCES Fornecedor (CNPJ);
 
ALTER TABLE Fornecedor_Produto ADD CONSTRAINT FK_Fornecedor_Produto_3
    FOREIGN KEY (idProduto)
    REFERENCES Produto (idProduto);
 
ALTER TABLE Pedido_Produto ADD CONSTRAINT FK_Pedido_Produto_2
    FOREIGN KEY (idProduto)
    REFERENCES Produto (idProduto);
 
ALTER TABLE Pedido_Produto ADD CONSTRAINT FK_Pedido_Produto_3
    FOREIGN KEY (codPedido)
    REFERENCES Pedido (codPedido);
 
ALTER TABLE Produto_Promocao ADD CONSTRAINT FK_Produto_Promocao_2
    FOREIGN KEY (idProduto)
    REFERENCES Produto (idProduto);
 
ALTER TABLE Produto_Promocao ADD CONSTRAINT FK_Produto_Promocao_3
    FOREIGN KEY (idPromocao)
    REFERENCES Promocao (ID);