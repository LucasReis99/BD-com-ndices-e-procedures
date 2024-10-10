# Projeto de Banco de Dados - Índices e Procedures

## Descrição do Projeto
Este repositório contém a implementação de um banco de dados fictício para uma empresa, com foco em otimização de consultas por meio da criação de índices e uso de procedures para manipulação de dados. O objetivo principal é melhorar a performance nas operações de leitura e escrita no banco, aplicando boas práticas no uso de índices e procedures.

## Estrutura do Projeto
O projeto está dividido em duas partes principais:

### Parte 1 - Criação de Índices
Nesta seção, foram criados índices para tabelas relacionadas ao cenário de empregados e departamentos. Os índices foram definidos com base nas consultas mais frequentes e importantes, de modo a otimizar a performance das operações no banco de dados.

### Consultas (Queries)
#### Qual o departamento com maior número de pessoas?
#### Quais são os departamentos por cidade?
#### Relação de empregados por departamento?

Cada consulta foi acompanhada da criação de índices apropriados para as tabelas envolvidas. Os índices foram definidos utilizando as instruções CREATE INDEX e ALTER TABLE, conforme a necessidade.

### Índices criados:

Índice na coluna departamento para otimizar as consultas que agrupam ou ordenam por departamento.
Índice composto nas colunas cidade e departamento para consultas que envolvem cidades e departamentos.
Índice para otimizar a ordenação e a contagem de empregados por departamento.
Motivo da escolha dos índices:
Os índices foram criados para melhorar a eficiência nas consultas mais frequentes e que envolvem agrupamentos (GROUP BY) e ordenações (ORDER BY), reduzindo o tempo de busca nas tabelas.

## Parte 2 - Procedures para Manipulação de Dados
Foi criada uma procedure para realizar operações de inserção, atualização e remoção de dados de forma condicional. A procedure utiliza uma variável de controle que determina a ação a ser executada (opções de SELECT, UPDATE e DELETE). A ideia é automatizar o processo de manipulação dos dados de forma segura e eficiente.

### Exemplo de Procedure
A procedure permite operações no banco de dados de universidade e e-commerce, e pode ser chamada para realizar:

Inserção de novos dados.
Atualização de dados existentes.
Remoção de registros.

As operações estão encapsuladas dentro de um CASE, que define qual ação será realizada com base na opção informada.

### Tecnologias Utilizadas
MySQL: Sistema de gerenciamento de banco de dados relacional.
SQL: Linguagem de consulta estruturada para manipulação dos dados.
