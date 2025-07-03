-- Inserção de dados nas tabelas
USE KantoIntimo;

INSERT INTO Endereco (logradouro, bairro, numero, CEP, cidade, UF) VALUES
('Rua A', 'Centro', '123', '12345678', 'Cidade1', 'SP'),
('Rua B', 'Bairro B', '456', '87654321', 'Cidade2', 'RJ'),
('Rua C', 'Centro', '789', '13579246', 'Cidade3', 'MG'),
('Rua D', 'Bairro D', '159', '24681357', 'Cidade4', 'BA'),
('Rua E', 'Bairro E', '357', '65432178', 'Cidade5', 'PR'),
('Rua F', 'Bairro F', '951', '98765432', 'Cidade6', 'SC'),
('Rua G', 'Bairro G', '753', '11112222', 'Cidade7', 'RS'),
('Rua H', 'Bairro H', '852', '33334444', 'Cidade8', 'PE'),
('Rua I', 'Bairro I', '369', '55556666', 'Cidade9', 'CE'),
('Rua J', 'Bairro J', '147', '77778888', 'Cidade10', 'AM');

INSERT INTO Cliente (CPF, nome, dataNasc, email, idEndereco) VALUES
('12345678901', 'Cliente 1', '1990-01-01', 'cliente1@email.com', 1),
('23456789012', 'Cliente 2', '1995-02-02', 'cliente2@email.com', 2),
('34567890123', 'Cliente 3', '1992-03-03', 'cliente3@email.com', 3),
('45678901234', 'Cliente 4', '1993-04-04', 'cliente4@email.com', 4),
('56789012345', 'Cliente 5', '1989-05-05', 'cliente5@email.com', 5),
('67890123456', 'Cliente 6', '1987-06-06', 'cliente6@email.com', 6),
('78901234567', 'Cliente 7', '1991-07-07', 'cliente7@email.com', 7),
('89012345678', 'Cliente 8', '1996-08-08', 'cliente8@email.com', 8),
('90123456789', 'Cliente 9', '1998-09-09', 'cliente9@email.com', 9),
('01234567890', 'Cliente 10', '1994-10-10', 'cliente10@email.com', 10);

INSERT INTO Vendedor (CPF, nome, dataNasc, email, idEndereco) VALUES
('34567890123', 'Vendedor 1', '1985-03-03', 'vendedor1@email.com', 1),
('45678901234', 'Vendedor 2', '1988-04-04', 'vendedor2@email.com', 2),
('56789012345', 'Vendedor 3', '1983-05-05', 'vendedor3@email.com', 3),
('67890123456', 'Vendedor 4', '1982-06-06', 'vendedor4@email.com', 4),
('78901234567', 'Vendedor 5', '1980-07-07', 'vendedor5@email.com', 5),
('89012345678', 'Vendedor 6', '1979-08-08', 'vendedor6@email.com', 6),
('90123456789', 'Vendedor 7', '1984-09-09', 'vendedor7@email.com', 7),
('01234567890', 'Vendedor 8', '1978-10-10', 'vendedor8@email.com', 8),
('12345098765', 'Vendedor 9', '1986-11-11', 'vendedor9@email.com', 9),
('23456087654', 'Vendedor 10', '1981-12-12', 'vendedor10@email.com', 10);

INSERT INTO Pedido (data, valorTotal, CPF_cliente, CPF_vendedor) VALUES
('2023-01-10', 150.50, '12345678901', '34567890123'),
('2023-02-20', 200.75, '23456789012', '45678901234'),
('2023-03-15', 120.00, '34567890123', '56789012345'),
('2023-04-22', 180.50, '45678901234', '67890123456'),
('2023-05-30', 220.75, '56789012345', '78901234567'),
('2023-06-10', 95.25, '67890123456', '89012345678'),
('2023-07-25', 310.40, '78901234567', '90123456789'),
('2023-08-05', 130.60, '89012345678', '01234567890'),
('2023-09-18', 260.85, '90123456789', '12345098765'),
('2023-10-29', 140.90, '01234567890', '23456087654');

INSERT INTO Categoria (ID, nome) VALUES
(1, 'Roupas'),
(2, 'Calçados'),
(3, 'Acessórios'),
(4, 'Eletrônicos'),
(5, 'Móveis'),
(6, 'Brinquedos'),
(7, 'Livros'),
(8, 'Esportes'),
(9, 'Alimentos'),
(10, 'Beleza');

INSERT INTO Promocao (ID, descricao, dataInicio, dataTermino, percentualDesconto) VALUES
(1, 'Promoção de Verão', '2023-01-01', '2023-02-01', 0.10),
(2, 'Liquidação de Inverno', '2023-06-01', '2023-07-01', 0.15),
(3, 'Black Friday', '2023-11-01', '2023-11-30', 0.30),
(4, 'Cyber Monday', '2023-12-01', '2023-12-05', 0.25),
(5, 'Desconto para Novos Clientes', '2023-03-01', '2023-03-15', 0.05),
(6, 'Semana do Consumidor', '2023-09-01', '2023-09-07', 0.20),
(7, 'Queima de Estoque', '2023-04-01', '2023-04-10', 0.12),
(8, 'Natal Descontão', '2023-12-20', '2023-12-25', 0.18),
(9, 'Promoção de Páscoa', '2023-04-10', '2023-04-17', 0.22),
(10, 'Mega Saldão', '2023-08-01', '2023-08-15', 0.27);

INSERT INTO Produto (idProduto, nome, tamanho, cor, preco, qtdEstoque, idCategoria, idPromocao, qtdMinima) VALUES
(1, 'Camiseta', 'M', 'Azul', 50.00, 100, 1, 1, 5),
(2, 'Tênis Esportivo', '42', 'Preto', 200.00, 50, 2, 2, 3),
(3, 'Relógio Digital', 'Único', 'Prata', 150.00, 30, 3, 3, 2),
(4, 'Smartphone', 'Único', 'Preto', 1200.00, 20, 4, 4, 1),
(5, 'Sofá 3 Lugares', 'Único', 'Cinza', 2500.00, 10, 5, 5, 1),
(6, 'Bicicleta', 'Único', 'Vermelha', 800.00, 15, 8, 6, 1),
(7, 'Livro de Ficção', 'Único', 'Capa Azul', 35.00, 2, 7, 7, 10),
(8, 'Shampoo Orgânico', '500ml', 'Transparente', 25.00, 100, 10, 8, 5),
(9, 'Tablet', 'Único', 'Prata', 900.00, 25, 4, 9, 2),
(10, 'Cadeira Gamer', 'Único', 'Preto/Vermelho', 1100.00, 12, 5, 10, 1);

INSERT INTO Fornecedor (CNPJ, nome, email, idEndereco) VALUES
('11222333444455', 'Fornecedor A', 'fornecedorA@email.com', 1),
('22333444555566', 'Fornecedor B', 'fornecedorB@email.com', 2),
('33444555666677', 'Fornecedor C', 'fornecedorC@email.com', 3),
('44555666777788', 'Fornecedor D', 'fornecedorD@email.com', 4),
('55666777888899', 'Fornecedor E', 'fornecedorE@email.com', 5),
('66777888999900', 'Fornecedor F', 'fornecedorF@email.com', 6),
('77888999000011', 'Fornecedor G', 'fornecedorG@email.com', 7),
('88999000111122', 'Fornecedor H', 'fornecedorH@email.com', 8),
('99000111222233', 'Fornecedor I', 'fornecedorI@email.com', 9),
('00011122233344', 'Fornecedor J', 'fornecedorJ@email.com', 10);

INSERT INTO telefones_cli (telefone, CPF_cliente) VALUES
('11987654321', '12345678901'),
('21987654322', '23456789012'),
('31987654323', '34567890123'),
('41987654324', '45678901234'),
('51987654325', '56789012345'),
('61987654326', '67890123456'),
('71987654327', '78901234567'),
('81987654328', '89012345678'),
('91987654329', '90123456789'),
('01987654320', '01234567890');

INSERT INTO telefones_forn (telefone, CNPJ) VALUES
('11223344551', '11222333444455'),
('22334455662', '22333444555566'),
('33445566773', '33444555666677'),
('44556677884', '44555666777788'),
('55667788995', '55666777888899'),
('66778899006', '66777888999900'),
('77889900117', '77888999000011'),
('88990011228', '88999000111122'),
('99001122339', '99000111222233'),
('00112233440', '00011122233344');

INSERT INTO telefones_Vendedor (telefone, CPF_vendedor) VALUES
('12987654321', '34567890123'),
('22987654322', '45678901234'),
('33987654323', '56789012345'),
('44987654324', '67890123456'),
('55987654325', '78901234567'),
('66987654326', '89012345678'),
('77987654327', '90123456789'),
('88987654328', '01234567890'),
('99987654329', '12345098765'),
('00987654320', '23456087654');

INSERT INTO Fornecedor_Produto (CNPJ, idProduto, data, quantidade, valor) VALUES
('11222333444455', 1, '2023-01-01', 50, 45.00),
('22333444555566', 2, '2023-02-01', 30, 180.00),
('33444555666677', 3, '2023-03-01', 20, 130.00),
('44555666777788', 4, '2023-04-01', 15, 1100.00),
('55666777888899', 5, '2023-05-01', 8, 2300.00),
('66777888999900', 6, '2023-06-01', 10, 750.00),
('77888999000011', 7, '2023-07-01', 25, 30.00),
('88999000111122', 8, '2023-08-01', 40, 22.00),
('99000111222233', 9, '2023-09-01', 18, 850.00),
('00011122233344', 10, '2023-10-01', 12, 1000.00);

INSERT INTO Pedido_Produto (codPedido, idProduto, quantidadeProduto, precoUnitario) VALUES
(1, 1, 2, 50.00),
(2, 2, 1, 200.00),
(3, 3, 1, 150.00),
(4, 4, 1, 1200.00),
(5, 5, 1, 2500.00),
(6, 6, 1, 800.00),
(7, 7, 1, 35.00),
(8, 8, 3, 25.00),
(9, 9, 1, 900.00),
(10, 10, 1, 1100.00);
