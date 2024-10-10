-- Qual o departamento com maior número de pessoas?
SELECT departamento, COUNT(*) AS num_pessoas 
FROM empregados 
GROUP BY departamento 
ORDER BY num_pessoas DESC 
LIMIT 1;
-- Índice sugerido: Criar um índice na coluna departamento, já que essa coluna é utilizada tanto para agrupamento (GROUP BY) quanto para contagem de empregados.
CREATE INDEX idx_departamento ON empregados(departamento);

-- Quais são os departamentos por cidade?
SELECT cidade, departamento 
FROM empregados 
GROUP BY cidade, departamento;
-- Índice sugerido: Criar um índice composto nas colunas cidade e departamento, pois são usadas na cláusula GROUP BY.
CREATE INDEX idx_cidade_departamento ON empregados(cidade, departamento);

-- Relação de empregados por departamento 
SELECT departamento, nome_empregado 
FROM empregados 
ORDER BY departamento;
-- Índice sugerido: Criar um índice na coluna departamento para facilitar a ordenação.
CREATE INDEX idx_departamento_nome ON empregados(departamento);

-- Parte 2 - Utilização de Procedures para Manipulação de Dados
-- A procedure será usada para manipular os dados de acordo com a operação solicitada. O exemplo abaixo contém as instruções de inserção, atualização e remoção de dados, utilizando uma variável de controle para determinar a operação a ser realizada.
-- Exemplo de Procedure:
DELIMITER $$

CREATE PROCEDURE manipular_dados_universidade_ecommerce(
    IN opcao INT, 
    IN id INT, 
    IN nome VARCHAR(255), 
    IN valor DECIMAL(10, 2)
)
BEGIN
    -- Variável de controle define a ação a ser realizada
    CASE opcao
        WHEN 1 THEN -- Inserção
            INSERT INTO universidade (id, nome, valor) VALUES (id, nome, valor);
            INSERT INTO ecommerce (id, nome, valor) VALUES (id, nome, valor);

        WHEN 2 THEN -- Atualização
            UPDATE universidade SET nome = nome, valor = valor WHERE id = id;
            UPDATE ecommerce SET nome = nome, valor = valor WHERE id = id;

        WHEN 3 THEN -- Remoção
            DELETE FROM universidade WHERE id = id;
            DELETE FROM ecommerce WHERE id = id;

        ELSE -- Opção inválida
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Opção inválida';
    END CASE;
END$$

DELIMITER ;
-- A chamada da procedure seria feita de acordo com a ação desejada. Exemplo para inserção:
CALL manipular_dados_universidade_ecommerce(1, 101, 'Novo Curso', 500.00);
