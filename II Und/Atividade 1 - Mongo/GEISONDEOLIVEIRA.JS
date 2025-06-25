
// Aluno: Geison de Oliveira Lemos Ferreira

// Conectando ao banco de dados 'empresa'
use empresa

//-----------------------------------------------------------------
// Questão 1: Seleciona os funcionários do departamento 3 cujo salário seja menor ou igual a R$ 1.500,00. Utilizar o operador $and.
db.funcionario.find({
    $and: [
        { depto: 3 },
        { salario: { $lte: 1530.00 } }
    ]
});

//-----------------------------------------------------------------
// Questão 2: Mesma consulta anterior, porém sem utilizar o operador $and.
db.funcionario.find({
    depto: 3,
    salario: { $lte: 1530.00 }
});

//-----------------------------------------------------------------
// Questão 3: Seleciona os funcionários que possuem entre 2 e 4 filhos. Mostrar o nome e a quantidade de filhos. Utilizar o operador $in.
db.funcionario.find(
    { filhos: { $in: [2, 3, 4] } },
    { nome: 1, filhos: 1, _id: 0 }
);

//-----------------------------------------------------------------
// Questão 4: Mesma consulta anterior, porém utilizando os operadores de comparação e lógico.
db.funcionario.find(
    { filhos: { $gte: 2, $lte: 4 } },
    { nome: 1, filhos: 1, _id: 0 }
);

//-----------------------------------------------------------------
// Questão 5: Quantos funcionários do departamento 3 ganham mais de R$ 2.000,00? Utilizar o operador de comparação e o método count.
db.funcionario.find({
    depto: 3,
    salario: { $gt: 2000.00 }
}).count();

//-----------------------------------------------------------------
// Questão 6: Seleciona os funcionários cujo salário não seja igual a R$ 2.050,00. Utilizar operador lógico e/ou de comparação.
db.funcionario.find({
    salario: { $ne: 2050.00 }
});

//-----------------------------------------------------------------
// Questão 7: Quantos funcionários do departamento 3 ganham entre R$ 1.200,50 e R$ 1.600,00? Utilizar os operadores de comparação e lógico, e o método count.
db.funcionario.find({
    depto: 3,
    salario: { $gte: 1200.50, $lte: 1600.00 }
}).count();

//-----------------------------------------------------------------
// Questão 8: Seleciona os funcionários com função de programador e de analista. Mostrar o nome e a função. Colocar em ordem crescente pelo nome do funcionário. Utilizar o operador $in e o método sort.
db.funcionario.find(
    { funcao: { $in: ["PROGRAMADOR", "ANALISTA"] } },
    { nome: 1, funcao: 1, _id: 0 }
).sort({ nome: 1 });

//-----------------------------------------------------------------
// Questão 9: Seleciona os funcionários com função de programador e de analista que ganham acima de R$ 2.000,00. Classificar em ordem crescente pela função e nome do funcionário. Utilizar o operador $in e o método sort.
db.funcionario.find({
    funcao: { $in: ["PROGRAMADOR", "ANALISTA"] },
    salario: { $gt: 2000.00 }
}).sort({ funcao: 1, nome: 1 });

//-----------------------------------------------------------------
// Questão 10: Seleciona o nome, o departamento e a função dos funcionários que não ocupem as funções de programador e de analista. Utilizar o operador $nin.
db.funcionario.find(
    { funcao: { $nin: ["PROGRAMADOR", "ANALISTA"] } },
    { nome: 1, depto: 1, funcao: 1, _id: 0 }
);

//-----------------------------------------------------------------
// Questão 11: Quais os funcionários não possuem nenhuma skill? Utilizar o operador $exists.
// (Esta consulta encontrará funcionários onde o campo "skill" não existe ou é nulo).
db.funcionario.find({
    skill: { $exists: false }
});

//-----------------------------------------------------------------
// Questão 12: Seleciona o nome dos funcionários que não possuem filhos. Mostrar em ordem decrescente pelo nome do funcionário. Utilizar o operador $exists e o método sort.
db.funcionario.find(
    { filhos: { $exists: false } },
    { nome: 1, _id: 0 }
).sort({ nome: -1 });

//-----------------------------------------------------------------
// Questão 13: Mesma consulta anterior, porém utilizando (filhos: null) ao invés do operador $exists.
// (A condição {filhos: null} seleciona documentos onde 'filhos' é nulo ou o campo não existe).
db.funcionario.find(
    { filhos: null },
    { nome: 1, _id: 0 }
).sort({ nome: -1 });

//-----------------------------------------------------------------
// Questão 14: Quais os funcionários possuem algum hobby? Mostrar o nome e o hobby. Utilizar o operador de comparação. Usar a lógica: "Hobbies não é igual a nulo".
db.funcionario.find(
    { hobbies: { $ne: null } },
    { nome: 1, hobbies: 1, _id: 0 }
);

//-----------------------------------------------------------------
// Questão 15: Quais os funcionários possuem hobby e não têm filhos? Mostrar o nome, o hobby e o salário.
db.funcionario.find(
    { hobbies: { $ne: null }, filhos: null },
    { nome: 1, hobbies: 1, salario: 1, _id: 0 }
);

//-----------------------------------------------------------------
// Questão 16: Quantos funcionários moram em Vitória da Conquista e possuem algum hobby? Utilizar consulta por notação ponto para identificar a cidade.
db.funcionario.find({
    "endereco.cidade": "VITÓRIA DA CONQUISTA",
    hobbies: { $ne: null }
}).count();

//-----------------------------------------------------------------
// Questão 17: Qual a primeira opção de hobby dos funcionários? Considerar que o primeiro elemento do array é a primeira opção. Mostrar somente o nome e o hobby. Utilizar o operador $slice.
db.funcionario.find(
    {},
    { nome: 1, hobbies: { $slice: 1 }, _id: 0 }
);

//-----------------------------------------------------------------
// Questão 18: Qual a primeira opção de hobby dos funcionários? Não mostrar os funcionários que não têm nenhum hobby. Mostrar o nome e o hobby. Utilizar o operador $slice.
db.funcionario.find(
    { hobbies: { $ne: null } },
    { nome: 1, hobbies: { $slice: 1 }, _id: 0 }
);

//-----------------------------------------------------------------
// Questão 19: Quais os funcionários têm 3 ou 4 feedbacks? Mostrar o nome e os feedbacks ordenado em ordem decrescente pelo nome. Utilizar o operador $size e o método sort.
db.funcionario.find(
    {
        $or: [
            { feedbacks: { $size: 3 } },
            { feedbacks: { $size: 4 } }
        ]
    },
    { nome: 1, feedbacks: 1, _id: 0 }
).sort({ nome: -1 });

//-----------------------------------------------------------------
// Questão 20: Quais as funções existentes na empresa? Utilizar o método distinct.
db.funcionario.distinct("funcao");