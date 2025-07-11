-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS veiculos;
USE veiculos;

-- Tabela base: Veiculo
CREATE TABLE IF NOT EXISTS veiculo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cor VARCHAR(30),
    marca VARCHAR(50),
    modelo VARCHAR(50),
    data_fabricacao VARCHAR(20),
    preco DECIMAL(10,2),
    placa VARCHAR(50),
    tipo ENUM('passeio', 'carga') DEFAULT 'passeio'
);

-- Tabela Veículo de Passeio
CREATE TABLE IF NOT EXISTS veiculo_passeio (
    id INT PRIMARY KEY,
    qtd_portas INT,
    ar_condicionado BOOLEAN,
    tipo_cambio VARCHAR(30),
    tipo_direcao VARCHAR(30),
    freio_abs BOOLEAN,
    tracao_4x4 BOOLEAN,
    qtd_passageiros INT,
    qtd_airbags INT,
    FOREIGN KEY (id) REFERENCES veiculo(id) ON DELETE CASCADE
);

-- Tabela Veículo de Carga
CREATE TABLE IF NOT EXISTS veiculo_carga (
    id INT PRIMARY KEY,
    numero_eixos INT,
    carga DOUBLE,
    tipo_carroceria VARCHAR(50),
    articulada BOOLEAN,
    rastreamento_gps BOOLEAN,
    refrigerada BOOLEAN,
    comprimento_total DOUBLE,
    qtd_compartimentos INT,
    tipo_carga VARCHAR(50),
    FOREIGN KEY (id) REFERENCES veiculo(id) ON DELETE CASCADE
);

-- Inserção de dados na tabela veiculo (Passeio)
INSERT INTO veiculo (cor, marca, modelo, data_fabricacao, preco, tipo, placa)
VALUES ('vermelho', 'Toyota', 'Corolla', '2022-10-05', 105000.00, 'passeio', 'XYZ9876');

-- Supondo que o id gerado para o veículo acima seja 1
INSERT INTO veiculo_passeio (
    id, qtd_portas, ar_condicionado, tipo_cambio, tipo_direcao,
    freio_abs, tracao_4x4, qtd_passageiros, qtd_airbags
) VALUES (
    1, 4, TRUE, 'automático', 'elétrica',
    TRUE, FALSE, 5, 6
);

-- Inserção de dados na tabela veiculo (Carga)
INSERT INTO veiculo (cor, marca, modelo, data_fabricacao, preco, tipo, placa)
VALUES ('azul', 'Scania', 'R500', '2025-01-01', 120000.00, 'carga', 'D4A4');

-- Supondo que o id gerado para o veículo acima seja 2
INSERT INTO veiculo_carga (
    id, numero_eixos, carga, tipo_carroceria, articulada, rastreamento_gps,
    refrigerada, comprimento_total, qtd_compartimentos, tipo_carga
) VALUES (
    2, 3, 8000.0, 'graneleira', TRUE, TRUE,
    FALSE, 12.5, 2, 'grãos'
);
select * from veiculo;
