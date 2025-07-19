-- Coleção Cliente
SELECT JSON_OBJECT(
  "_id", c.CPF,
  "nome", c.nome,
  "email", c.email,
  "dataNasc", c.dataNasc,
  "endereco", JSON_OBJECT(
    "logradouro", e.logradouro,
    "bairro", e.bairro,
    "numero", e.numero,
    "CEP", e.CEP,
    "cidade", e.cidade,
    "UF", e.UF
  ),
  "telefones", JSON_ARRAYAGG(
    JSON_OBJECT("numero", t.telefone)
  )
) AS JSON
FROM Cliente c
LEFT JOIN Endereco e ON c.idEndereco = e.idEndereco
LEFT JOIN telefones_cli t ON t.CPF_cliente = c.CPF
GROUP BY c.CPF;

-- Coleção Vendedor
SELECT 
  JSON_OBJECT(
    "_id", v.CPF,
    "nome", v.nome,
    "email", v.email,
    "dataNasc", v.dataNasc,
    "endereco", JSON_OBJECT(
      "logradouro", e.logradouro,
      "bairro", e.bairro,
      "numero", e.numero,
      "CEP", e.CEP,
      "cidade", e.cidade,
      "UF", e.UF
    ),
    "telefones", (
      SELECT JSON_ARRAYAGG(tv2.telefone)
      FROM (
        SELECT DISTINCT tv.telefone
        FROM telefones_vend tv
        WHERE tv.CPF_vendedor = v.CPF
      ) AS tv2
    )
  ) AS JSON
FROM Vendedor v
LEFT JOIN Endereco e ON v.idEndereco = e.idEndereco;

-- Coleção pedido
SELECT 
  JSON_OBJECT(
    "_id", p.codPedido,
    "data", p.data,
    "valorTotal", p.valorTotal,
    "CPF_cliente", p.CPF_cliente,
    "CPF_vendedor", p.CPF_vendedor,
    "itens", (
      SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
          "idProduto", pp.idProduto,
          "quantidade", pp.quantidadeProduto,
          "precoUnitario", pp.precoUnitario
        )
      )
      FROM Pedido_Produto pp
      WHERE pp.codPedido = p.codPedido
    )
  ) AS JSON
FROM Pedido p;

-- Coleção Fornecedor
SELECT 
  JSON_OBJECT(
    "_id", f.CNPJ,
    "nome", f.nome,
    "email", f.email,
    "endereco", JSON_OBJECT(
      "logradouro", e.logradouro,
      "bairro", e.bairro,
      "numero", e.numero,
      "CEP", e.CEP,
      "cidade", e.cidade,
      "UF", e.UF
    ),
    "telefones", (
      SELECT JSON_ARRAYAGG(tf2.telefone)
      FROM (
        SELECT DISTINCT tf.telefone
        FROM telefones_forn tf
        WHERE tf.CNPJ = f.CNPJ
      ) AS tf2
    ),
    "produtos_fornecidos", (
      SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
          "idProduto", fp.idProduto,
          "data", fp.data,
          "quantidade", fp.quantidade,
          "valor", fp.valor
        )
      )
      FROM Fornecedor_Produto fp
      WHERE fp.CNPJ = f.CNPJ
    )
  ) AS JSON
FROM Fornecedor f
LEFT JOIN Endereco e ON f.idEndereco = e.idEndereco;

-- Coleção produto
SELECT 
  JSON_OBJECT(
    "_id", p.idProduto,
    "nome", p.nome,
    "tamanho", p.tamanho,
    "cor", p.cor,
    "preco", p.preco,
    "qtdEstoque", p.qtdEstoque,
    "qtdMinima", p.qtdMinima,

    "categoria", c.nome,

    "promocao", JSON_OBJECT(
      "id", pr.ID,
      "descricao", pr.descricao,
      "dataInicio", pp.dataInicio,
      "dataTermino", pp.dataTermino,
      "percentualDesconto", pr.percentualDesconto
    )
  ) AS JSON
FROM Produto p
JOIN Categoria c ON p.idCategoria = c.ID
LEFT JOIN Produto_Promocao pp ON pp.idProduto = p.idProduto
LEFT JOIN Promocao pr ON pr.ID = pp.idPromocao
LIMIT 0, 1000;
