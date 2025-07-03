-- consulta 1
SELECT 
    ROUND(AVG(valorTotal), 2) AS ticket_medio
FROM Pedido
WHERE data BETWEEN '2023-01-01' AND '2023-12-31';

-- consulta 2
SELECT 
    p.idProduto,
    p.nome AS produto,
    p.qtdEstoque,
    p.qtdMinima,
    f.CNPJ,
    f.nome AS fornecedor
FROM Produto p
JOIN Fornecedor_Produto fp ON p.idProduto = fp.idProduto
JOIN Fornecedor f ON fp.CNPJ = f.CNPJ
WHERE p.qtdEstoque < p.qtdMinima;

-- consulta 3
WITH Vendas AS (
    SELECT 
        p.idProduto,
        p.nome AS produto,
        SUM(pp.quantidadeProduto) AS total_vendido,
        SUM(pp.quantidadeProduto * pp.precoUnitario) AS total_revenue,
        SUM((pp.precoUnitario - f.valor) * pp.quantidadeProduto) AS total_lucro
    FROM Pedido_Produto pp
    JOIN Pedido pe ON pp.codPedido = pe.codPedido
    JOIN Produto p ON pp.idProduto = p.idProduto
    JOIN Fornecedor_Produto f ON p.idProduto = f.idProduto
    JOIN Promocao promo ON p.idPromocao = promo.ID
    WHERE promo.ID = 1 AND YEAR(pe.data) = 2023
    GROUP BY p.idProduto, p.nome
)

SELECT 
    produto,
    total_vendido,
    total_revenue,
    total_lucro,
    CASE 
        WHEN total_vendido = (SELECT MAX(total_vendido) FROM Vendas) THEN 'Mais Vendido'
        WHEN total_lucro = (SELECT MAX(total_lucro) FROM Vendas) THEN 'Maior Lucro'
    END AS categoria
FROM Vendas
WHERE total_vendido = (SELECT MAX(total_vendido) FROM Vendas)
   OR total_lucro = (SELECT MAX(total_lucro) FROM Vendas);
   
-- consulta 4
SELECT 
    p.idProduto,
    p.nome AS produto,
    SUM(pp.quantidadeProduto * pp.precoUnitario) AS receita_total
FROM Pedido_Produto pp
JOIN Pedido pe ON pp.codPedido = pe.codPedido
JOIN Produto p ON pp.idProduto = p.idProduto
WHERE pe.data BETWEEN '2023-01-01' AND '2023-12-01'
GROUP BY p.idProduto, p.nome
ORDER BY receita_total DESC;

-- consulta 5
SELECT 
    c.CPF,
    c.nome AS cliente,
    SUM(pe.valorTotal) AS total_gasto
FROM Pedido pe
JOIN Cliente c ON pe.CPF_cliente = c.CPF
WHERE MONTH(pe.data) = 1 AND YEAR(pe.data) = 2023
GROUP BY c.CPF, c.nome
ORDER BY total_gasto DESC
LIMIT 10;

-- consulta 6
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

-- consulta 7
SELECT 
    c.CPF,
    c.nome AS cliente,
    c.email,
    c.dataNasc,
    c.idEndereco
FROM Cliente c
LEFT JOIN Pedido p ON c.CPF = p.CPF_cliente 
    AND p.data BETWEEN '2023-07-01' AND '2023-12-31'
WHERE p.codPedido IS NULL;

-- consulta 8
SELECT 
    v.CPF,
    v.nome AS vendedor,
    SUM(p.valorTotal) AS total_vendas
FROM Pedido p
JOIN Vendedor v ON p.CPF_vendedor = v.CPF
WHERE MONTH(p.data) = 5 AND YEAR(p.data) = 2023
GROUP BY v.CPF, v.nome
ORDER BY total_vendas DESC
LIMIT 5;

-- consulta 9
WITH VendasMensais AS (
    SELECT 
        MONTH(data) AS mes,
        SUM(valorTotal) AS total_vendas
    FROM Pedido
    WHERE YEAR(data) = 2023
    GROUP BY MONTH(data)
)
SELECT 
    v1.mes,
    v1.total_vendas,
    ROUND(COALESCE(((v1.total_vendas - v2.total_vendas) / v2.total_vendas) * 100, 0), 2) AS crescimento_percentual
FROM VendasMensais v1
LEFT JOIN VendasMensais v2 ON v1.mes = v2.mes + 1
ORDER BY v1.mes;

-- consulta 10
SELECT 
    p.idProduto,
    p.nome AS produto,
    p.qtdEstoque
FROM Produto p
LEFT JOIN Pedido_Produto pp ON p.idProduto = pp.idProduto
LEFT JOIN Pedido pe ON pp.codPedido = pe.codPedido 
    AND pe.data >= DATE_SUB('2023-12-01', INTERVAL 6 MONTH)
WHERE pe.codPedido IS NULL
ORDER BY p.qtdEstoque DESC;