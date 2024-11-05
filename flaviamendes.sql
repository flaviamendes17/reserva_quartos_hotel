CREATE DATABASE reserva_hotel;
\c reserva_hotel;

CREATE TABLE hospedes (
    id_hospede SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL
);

CREATE TABLE quartos (
    id_quarto SERIAL PRIMARY KEY,
    numero_quarto INT NOT NULL,
    disponivel BOOLEAN NOT NULL
);

CREATE TABLE reservas (
    id_reserva SERIAL PRIMARY KEY,
    id_hospede INT NOT NULL,
    id_quarto INT NOT NULL,
    data_entrada DATE NOT NULL DEFAULT CURRENT_DATE,
    data_saida DATE NOT NULL DEFAULT CURRENT_DATE,
    CONSTRAINT fk_hospede_quarto
    FOREIGN KEY (id_hospede) REFERENCES hospedes(id_hospede),
    FOREIGN KEY (id_quarto) REFERENCES quartos(id_quarto)
); 

INSERT INTO hospedes (nome, idade, email) VALUES
('Amanda', 25, 'amandinha@gmail.com'),
('Giovanna', 30, 'gigica@gmail.com'),
('Julia', 22, 'jujuba@gmail.com'),
('Kevin', 28, 'menorp@gmail.com'),
('Ana Julia', 19, 'naju@gmail.com');

INSERT INTO quartos (numero_quarto, disponivel) VALUES
(101, TRUE),
(102, TRUE),
(103, TRUE),
(104, FALSE),
(105, TRUE);

INSERT INTO reservas (id_hospede, id_quarto, data_entrada, data_saida) VALUES
(1, 1, '2024-11-09', '2024-11-11'),
(2, 2, '2024-09-05', '2024-09-09'),
(3, 3, '2024-12-30', '2025-01-02'),
(4, 4, '2024-12-25', '2024-12-30'),
(5, 5, '2025-03-03', '2025-03-05');

SELECT * FROM hospedes;
SELECT * FROM quartos;
SELECT * FROM reservas;

SELECT 
    h.nome AS hospede,
    q.numero_quarto AS quarto,
    r.data_entrada,
    r.data_saida
FROM
    hospedes h
JOIN 
    reservas r ON h.id_hospede = r.id_hospede
JOIN 
    quartos q ON r.id_quarto = q.id_quarto
WHERE
    r.data_entrada BETWEEN '2024-12-30' AND '2025-01-02'; 


INSERT INTO hospedes (nome, idade, email) VALUES
('Thiago', 25, 'thiago@gmail.com'),
('Felipe', 32, 'felipe@gmail.com'),

INSERT INTO quartos (numero_quarto, disponivel) VALUES
(106, NULL),
(107, NULL),

INSERT INTO reservas (id_hospede, id_quarto, data_entrada, data_saida) VALUES
(6, 6, '2024-11-05', '2024-11-05'),
(7, 7, '2024-09-05', '2024-09-05');

ALTER TABLE quartos ALTER COLUMN disponivel DROP NOT NULL;

SELECT
    q.numero_quarto AS quarto,
    q.quarto_disponivel AS disponivel;
FROM
    quartos q
JOIN
    reservas r ON q.id_quarto = r.id_quarto
JOIN
    reservas r ON q.id_quarto = r.id_quarto
WHERE
    r.id_reserva IS NULL;
