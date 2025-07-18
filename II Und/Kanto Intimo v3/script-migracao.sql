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
      SELECT JSON_ARRAYAGG(JSON_OBJECT("numero", tv.telefone))
      FROM telefones_vendedor tv
      WHERE tv.CPF_vendedor = v.CPF
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
      SELECT JSON_ARRAYAGG(JSON_OBJECT("numero", tf.telefone))
      FROM telefones_forn tf
      WHERE tf.CNPJ = f.CNPJ
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
    
    "categoria", JSON_OBJECT(
      "id", c.ID,
      "nome", c.nome
    ),

    "promocao", (
      SELECT JSON_OBJECT(
        "id", pr.ID,
        "descricao", pr.descricao,
        "dataInicio", pr.dataInicio,
        "dataTermino", pr.dataTermino,
        "percentualDesconto", pr.percentualDesconto
      )
      FROM Promocao pr
      WHERE pr.ID = p.idPromocao
    )
  ) AS JSON
FROM Produto p
JOIN Categoria c ON p.idCategoria = c.ID;
