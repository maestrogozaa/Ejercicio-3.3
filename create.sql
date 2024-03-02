CREATE TABLE jugador (
    jugador_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);

CREATE TABLE partida (
    partida_id SERIAL PRIMARY KEY,
    fecha_termino TIMESTAMP,
    duracion INTERVAL,
    ganador_id INT, 
    FOREIGN KEY (ganador_id) REFERENCES jugador(jugador_id)
);

CREATE TABLE jugador_partida (
    jugador_id INT,
    partida_id INT,
    PRIMARY KEY (jugador_id, partida_id),
    FOREIGN KEY (jugador_id) REFERENCES jugador(jugador_id),
    FOREIGN KEY (partida_id) REFERENCES partida(partida_id)
);

INSERT INTO jugador (username, password) VALUES
('Miguel Angel', '1234'),
('Carlos', '4567'),
('Miriam', '4856');

INSERT INTO partida (fecha_termino, duracion, ganador_id) VALUES
('2024-03-01 15:00:00', '01:30:00', 1),
('2024-03-02 18:30:00', '02:00:00', 2),
('2024-03-03 12:45:00', '01:15:00', 3);

INSERT INTO jugador_partida (jugador_id, partida_id) VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 2),
(1, 3),
(3, 3);
