USE LojaKanto;

INSERT INTO Endereco (logradouro, bairro, numero, CEP, cidade, UF) VALUES
('Rua das Flores', 'Centro', '123', '12345678', 'São Paulo', 'SP'),
('Av. Brasil', 'Jardins', '456', '87654321', 'Rio de Janeiro', 'RJ'),
('Rua A', 'Bairro A', '1', '11111111', 'Salvador', 'BA'),
('Rua B', 'Bairro B', '2', '22222222', 'Fortaleza', 'CE'),
('Rua C', 'Bairro C', '3', '33333333', 'Belo Horizonte', 'MG'),
('Rua D', 'Bairro D', '4', '44444444', 'Porto Alegre', 'RS'),
('Rua E', 'Bairro E', '5', '55555555', 'Curitiba', 'PR'),
('Rua F', 'Bairro F', '6', '66666666', 'Florianópolis', 'SC'),
('Rua G', 'Bairro G', '7', '77777777', 'Manaus', 'AM'),
('Rua H', 'Bairro H', '8', '88888888', 'Belém', 'PA'),
('Rua do Sol', 'Pituba', '321', '40000000', 'Salvador', 'BA'),
('Av Atlântica', 'Copacabana', '55', '20000000', 'Rio de Janeiro', 'RJ');

INSERT INTO Cliente (CPF, nome, dataNasc, email, IdEndereco) VALUES
('12345678901', 'João Silva', '1990-05-15', 'joao@email.com', 1),
('98765432100', 'Maria Souza', '1985-08-22', 'maria@email.com', 2),
('11111111111', 'Carlos Andrade', '1992-02-10', 'carlos@email.com', 3),
('22222222222', 'Ana Paula', '1980-11-30', 'ana@email.com', 4),
('33333333333', 'Bruno Costa', '1975-07-18', 'bruno@email.com', 5),
('44444444444', 'Lucia Alves', '1999-09-09', 'lucia@email.com', 6),
('55555555555', 'Pedro Rocha', '2000-01-01', 'pedro@email.com', 7),
('66666666666', 'Sofia Martins', '1994-03-03', 'sofia@email.com', 8),
('77777777777', 'Marcos Lima', '1988-12-12', 'marcos@email.com', 9),
('88888888888', 'Juliana Faria', '1991-06-06', 'juliana@email.com', 10),
('11111111112', 'Ana Souza', '1990-05-20', 'ana@email.com', 11),
('22222222224', 'João Pedro', '1988-09-15', 'joao@email.com', 12),
('01234567890', 'Novo Cliente Teste', '1990-01-01', 'novo.teste@email.com', 1);

INSERT INTO Vendedor (CPF, nome, dataNasc, email, idEndereco) VALUES
('11122233344', 'Carlos Lima', '1982-03-10', 'carlos@email.com', 1),
('22233344455', 'Marina Reis', '1990-04-04', 'marina@email.com', 2),
('33344455566', 'Roberto Silva', '1987-05-05', 'roberto@email.com', 3),
('44455566677', 'Larissa Souza', '1983-06-06', 'larissa@email.com', 4),
('55566677788', 'Tiago Ramos', '1995-07-07', 'tiago@email.com', 5),
('66677788899', 'Bruna Dias', '1991-08-08', 'bruna@email.com', 6),
('77788899900', 'Marcelo Alves', '1993-09-09', 'marcelo@email.com', 7),
('88899900011', 'Patrícia Nogueira', '1989-10-10', 'patricia@email.com', 8),
('99900011122', 'Fernando Campos', '1994-11-11', 'fernando@email.com', 9),
('00011122233', 'Isabela Freitas', '1996-12-12', 'isabela@email.com', 10);

INSERT INTO Fornecedor (CNPJ, nome, email, idEndereco) VALUES
('12345678000199', 'Fornecedor A', 'fornecedorA@email.com', 1),
('22345678000199', 'Fornecedor B', 'fornecedorB@email.com', 2),
('32345678000199', 'Fornecedor C', 'fornecedorC@email.com', 3),
('42345678000199', 'Fornecedor D', 'fornecedorD@email.com', 4),
('52345678000199', 'Fornecedor E', 'fornecedorE@email.com', 5),
('62345678000199', 'Fornecedor F', 'fornecedorF@email.com', 6),
('72345678000199', 'Fornecedor G', 'fornecedorG@email.com', 7),
('82345678000199', 'Fornecedor H', 'fornecedorH@email.com', 8),
('92345678000199', 'Fornecedor I', 'fornecedorI@email.com', 9),
('10345678000199', 'Fornecedor J', 'fornecedorJ@email.com', 10);

INSERT INTO Categoria (nome) VALUES
('Lingerie'), ('Pijamas'), ('Camisolas'), ('Boxers'), ('Sutiãs'),
('Cuecas'), ('Robes'), ('Conjuntos'), ('Meias'), ('Acessórios');

INSERT INTO Promocao (descricao, dataInicio, dataTermino, percentualDesconto) VALUES
('Promo Verão', '2025-01-01', '2025-01-31', 0.10), -- Inativa (terminou em Jan/2025)
('Promo Inverno', '2025-06-01', '2025-06-30', 0.15), -- Inativa (terminou em Jun/2025)
('Black Friday', '2025-11-25', '2025-11-28', 0.30), -- Futura
('Natal', '2025-12-10', '2025-12-25', 0.25), -- Futura
('Outubro Rosa', '2025-10-01', '2025-10-31', 0.20), -- Futura
('Janeiro Branco', '2025-01-01', '2025-01-15', 0.05), -- Passada
('Aniversário Loja', '2025-03-01', '2025-03-05', 0.40), -- Passada
('Semana do Cliente', '2025-09-15', '2025-09-20', 0.18), -- Futura
('Dia das Mães', '2025-05-01', '2025-05-10', 0.22), -- Passada
('Volta às Aulas', '2025-02-01', '2025-02-10', 0.08), -- Passada
('Promo Primavera', '2025-01-01', '2025-12-31', 0.15), -- ATIVA (Julho/2025)
('Queima de Estoque', '2023-01-01', '2023-12-31', 0.20); -- Passada (para testar CONSULTA 5)

INSERT INTO Produto (nome, tamanho, cor, preco, qtdEstoque, qtdMinima, idCategoria, idPromocao) VALUES
('Calcinha Renda', 'M', 'Vermelho', 29.90, 50, 10, 1, 1), -- Promo Verão (inativa)
('Pijama Algodão', 'G', 'Azul', 49.90, 30, 5, 2, 2), -- Promo Inverno (inativa)
('Camisola Seda', 'P', 'Rosa', 89.90, 20, 3, 3, 3), -- Black Friday (futura)
('Cueca Boxer', 'M', 'Preto', 19.90, 100, 20, 4, 4), -- Natal (futura)
('Sutiã Comfort', 'G', 'Branco', 39.90, 40, 8, 5, 5), -- Outubro Rosa (futura)
('Cueca Slip', 'M', 'Cinza', 15.90, 80, 15, 6, 6), -- Janeiro Branco (passada)
('Robe Cetim', 'U', 'Roxo', 59.90, 15, 4, 7, 7), -- Aniversário Loja (passada)
('Conjunto Luxo', 'M', 'Bordô', 99.90, 12, 3, 8, 8), -- Semana do Cliente (futura)
('Meia Calça', 'U', 'Bege', 9.90, 60, 10, 9, 9), -- Dia das Mães (passada)
('Cinta Modeladora', 'G', 'Preto', 89.90, 10, 2, 10, 10), -- Volta às Aulas (passada)
('Sutiã Floral', 'G', 'Rosa', 39.90, 20, 10, 5, 11), -- Ligado à Promo Primavera (ATIVA)
('Pijama Luxo', 'M', 'Preto', 79.90, 15, 5, 2, 11), -- Ligado à Promo Primavera (ATIVA)
('Cueca Boxer Sport', 'M', 'Azul', 30, 35, 25.00, 4, 3), -- QtdEstoque < QtdMinima, Promo Futura (CONSULTA 5)
('Camisola Renda', 'P', 'Vinho', 99.90, 20, 8, 3, 11), -- Ligado à Promo Primavera (ATIVA)
('Meia Esportiva', 'U', 'Branca', 12.00, 5, 10, 9, 12), -- QtdEstoque < QtdMinima, Promo Passada (CONSULTA 5)
('Top Cropped', 'P', 'Verde', 45.00, 7, 15, 1, NULL); -- QtdEstoque < QtdMinima, Sem Promoção (CONSULTA 5)

INSERT INTO Pedido (data, valorTotal, CPF_cliente, CPF_vendedor) VALUES
-- Pedidos de 2025 (para CONSULTA 6)
('2025-07-01', 59.80, '12345678901', '11122233344'),
('2025-07-02', 49.90, '98765432100', '22233344455'),
('2025-07-03', 89.90, '11111111111', '33344455566'),
('2025-07-04', 39.80, '22222222222', '44455566677'),
('2025-07-05', 119.80, '33333333333', '55566677788'),
('2025-07-06', 59.90, '44444444444', '66677788899'),
('2025-07-07', 75.00, '55555555555', '77788899900'),
('2025-07-08', 89.90, '66666666666', '88899900011'),
('2025-07-09', 129.80, '77777777777', '99900011122'),
('2025-07-10', 49.90, '88888888888', '00011122233'),
('2025-07-02', 349.50, '01234567890', '11122233344'),
-- Pedidos de 2023 (para CONSULTA 1)
('2023-01-15', 150.00, '12345678901', '11122233344'),
('2023-02-20', 75.50, '98765432100', '22233344455'),
('2023-03-01', 200.00, '11111111111', '11122233344'),
('2023-04-10', 90.00, '22222222222', '33344455566'),
('2023-05-05', 120.00, '33333333333', '44455566677'),
('2023-06-25', 65.00, '44444444444', '55566677788'),
('2023-07-12', 180.00, '55555555555', '66677788899'),
('2023-08-01', 40.00, '66666666666', '77788899900'),
('2023-09-18', 110.00, '77777777777', '88899900011'),
('2023-10-03', 250.00, '88888888888', '99900011122'),
('2023-06-20', 89.90, '11111111111', '11122233344'),
('2023-11-05', 75.00, '22222222222', '11122233344'),
('2023-03-15', 139.80, '22222222222', '11122233344');

INSERT INTO telefones_cli (telefone, CPF_cliente) VALUES
('11999999991', '12345678901'),
('77999999999', '12345678901'),
('11999999992', '98765432100'),
('11999999993', '11111111111'),
('11999999994', '22222222222'),
('11999999995', '33333333333'),
('11999999996', '44444444444'),
('11999999997', '55555555555'),
('11999999998', '66666666666'),
('11999999999', '77777777777'),
('11999999990', '88888888888'),
('11999999980', '01234567890');

INSERT INTO telefones_forn (telefone, CNPJ) VALUES
('1133330001', '12345678000199'),
('1133330002', '22345678000199'),
('1133330003', '32345678000199'),
('1133330004', '42345678000199'),
('1133330005', '52345678000199'),
('1133330006', '62345678000199'),
('1133330007', '72345678000199'),
('1133330008', '82345678000199'),
('1133330009', '92345678000199'),
('1133330010', '10345678000199');

INSERT INTO telefones_vendedor (telefone, CPF_vendedor) VALUES
('1191110001', '11122233344'),
('1191110002', '22233344455'),
('1191110003', '33344455566'),
('1191110004', '44455566677'),
('1191110005', '55566677788'),
('1191110006', '66677788899'),
('1191110007', '77788899900'),
('1191110008', '88899900011'),
('1191110009', '99900011122'),
('1191110010', '00011122233');

INSERT INTO Fornecedor_Produto (CNPJ, idProduto, data, quantidade, valor) VALUES
('12345678000199', 1, '2025-06-01', 100, 15.50),
('22345678000199', 2, '2025-06-02', 50, 20.00),
('32345678000199', 3, '2025-06-03', 30, 40.00),
('42345678000199', 4, '2025-06-04', 200, 10.00),
('52345678000199', 5, '2025-06-05', 60, 25.00),
('62345678000199', 6, '2025-06-06', 70, 8.00),
('72345678000199', 7, '2025-06-07', 20, 30.00),
('82345678000199', 8, '2025-06-08', 10, 50.00),
('92345678000199', 9, '2025-06-09', 90, 5.00),
('10345678000199', 10, '2025-06-10', 15, 45.00),
('12345678000199', 11, '2025-06-01', 50, 20.00),
('22345678000199', 12, '2025-06-02', 30, 45.00),
('32345678000199', 13, '2025-06-03', 100, 12.00),
('42345678000199', 14, '2025-06-04', 25, 50.00),
('52345678000199', 15, '2025-06-05', 20, 6.00),
('62345678000199', 16, '2025-06-06', 15, 25.00);

INSERT INTO Pedido_Produto (codPedido, idProduto, quantidadeProduto, precoUnitario) VALUES
-- Pedidos de 2025
(1, 1, 2, 29.90),
(2, 2, 1, 49.90),
(3, 3, 1, 89.90),
(4, 4, 2, 19.90),
(5, 5, 3, 39.90),
(6, 6, 2, 29.95),
(7, 7, 1, 59.90),
(8, 8, 1, 99.90),
(9, 9, 2, 9.90),
(10, 10, 1, 89.90),
(11, 1, 5, 29.90),
(11, 2, 3, 49.90),
(11, 3, 1, 89.90),
-- Pedidos de 2023 (para CONSULTA 1)
(12, 1, 3, 29.90),
(12, 5, 2, 39.90),
(13, 2, 1, 49.90),
(14, 3, 1, 89.90),
(14, 4, 2, 19.90),
(15, 5, 1, 39.90),
(16, 6, 2, 15.90),
(17, 7, 1, 59.90),
(18, 8, 1, 99.90),
(19, 9, 3, 9.90),
(20, 10, 1, 89.90),
(21, 1, 5, 29.90),
(22, 11, 2, 39.90),
(23, 12, 1, 79.90),
(24, 13, 1, 25.00);
