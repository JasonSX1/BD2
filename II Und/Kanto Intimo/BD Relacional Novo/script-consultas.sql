-- CONSULTA 1 ----------------------------------------------------------------------------------
-- Produtos mais vendidos em 2023
SELECT 
    p.idProduto,
    p.nome AS produto,
    SUM(pp.quantidadeProduto) AS total_vendido
FROM Pedido_Produto pp
JOIN Pedido pe ON pp.codPedido = pe.codPedido
JOIN Produto p ON pp.idProduto = p.idProduto
WHERE pe.data BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY p.idProduto, p.nome
ORDER BY total_vendido DESC;

-- CONSULTA 2 ----------------------------------------------------------------------------------
-- Lucro bruto por categoria
SELECT
    c.nome AS Categoria,
    SUM(pp.quantidadeProduto) AS TotalItensVendidos,
    SUM(pp.quantidadeProduto * pp.precoUnitario) AS ReceitaBruta,
    SUM(pp.quantidadeProduto * Custo.custo_medio_unitario) AS CustoTotal,
    (SUM(pp.quantidadeProduto * pp.precoUnitario) - SUM(pp.quantidadeProduto * Custo.custo_medio_unitario)) AS LucroBruto
FROM Categoria c
JOIN Produto p ON c.ID = p.idCategoria
JOIN Pedido_Produto pp ON p.idProduto = pp.idProduto
JOIN (
    -- Subconsulta para calcular o custo médio de cada produto
    SELECT
        idProduto,
        AVG(valor) AS custo_medio_unitario
    FROM Fornecedor_Produto
    GROUP BY idProduto
) AS Custo ON p.idProduto = Custo.idProduto
GROUP BY c.nome
ORDER BY LucroBruto DESC;

-- CONSULTA 3 ----------------------------------------------------------------------------------
-- Faturamento e ticket médio por vendedor
SELECT
    v.nome AS Vendedor,
    COUNT(p.codPedido) AS TotalPedidos,
    SUM(p.valorTotal) AS FaturamentoTotal,
    AVG(p.valorTotal) AS TicketMedio
FROM Vendedor v
JOIN Pedido p ON v.CPF = p.CPF_vendedor
GROUP BY v.CPF, v.nome
ORDER BY FaturamentoTotal DESC;

-- CONSULTA 4 ----------------------------------------------------------------------------------
-- Clientes que compraram itens em promoção
SELECT
    c.nome AS Cliente,
    c.email,
    COUNT(DISTINCT p.idProduto) AS ItensPromocionaisDistintosComprados
FROM Cliente c
JOIN Pedido ped ON c.CPF = ped.CPF_cliente
JOIN Pedido_Produto pp ON ped.codPedido = pp.codPedido
JOIN Produto p ON pp.idProduto = p.idProduto
WHERE p.idPromocao IS NOT NULL -- Filtra por produtos que têm alguma promoção associada
GROUP BY c.CPF, c.nome, c.email
ORDER BY ItensPromocionaisDistintosComprados DESC;

-- CONSULTA 5 ----------------------------------------------------------------------------------
-- Produtos abaixo do estoque mínimo e que não estão em promoção ativa
SELECT
    p.idProduto,
    p.nome,
    p.qtdEstoque,
    p.qtdMinima,
    (p.qtdMinima - p.qtdEstoque) AS UnidadesFaltantes
FROM Produto p
WHERE
    p.qtdEstoque < p.qtdMinima AND
    p.idProduto NOT IN (
        -- Subconsulta para encontrar produtos em promoções ativas
        SELECT p2.idProduto
        FROM Produto p2
        JOIN Promocao promo ON p2.idPromocao = promo.ID
        WHERE CURDATE() BETWEEN promo.dataInicio AND promo.dataTermino
    );

-- CONSULTA 6 ----------------------------------------------------------------------------------
-- Produtos mais vendidos em um período específico (ex: Julho de 2025)
SELECT 
    p.idProduto,
    p.nome AS produto,
    SUM(pp.quantidadeProduto) AS total_vendido
FROM Pedido_Produto pp
JOIN Pedido pe ON pp.codPedido = pe.codPedido
JOIN Produto p ON pp.idProduto = p.idProduto
WHERE pe.data BETWEEN '2025-07-01' AND '2025-07-31' -- Período de Julho de 2025
GROUP BY p.idProduto, p.nome
ORDER BY total_vendido DESC;