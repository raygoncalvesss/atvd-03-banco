CREATE DATABASE clínica;

CREATE TABLE pacientes (
id_paciente SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
idade INTEGER,
email VARCHAR(100) UNIQUE NOT NULL 
);

SELECT * FROM pacientes;

CREATE TABLE medicos (
id_medico SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
especialidade VARCHAR(140) UNIQUE NOT NULL
);

SELECT * FROM medicos;

INSERT INTO pacientes (nome, idade, email) VALUES
('Vinicius Pereira', '39', 'viniciuspereira@gmail.com'),
('Bruno Quintino', '17', 'brunoquintino@gmail.com'),
('Mateus Marcelino', '20', 'mateusmarcelino@gmail.com'),
('Matheus Couto', '25', 'matheuscouto@gmail.com'),
('Julia Martins', '16', 'juliamartins@gmail.com'),
('Gabriela Fernanda', '20', 'gabrielafernanda@gmail.com'),
('Giovanni Gomes', '18', 'giovanigomes@gmail.com'),
('Bruna Marquezine', '25', 'brunamarquezine@gmail.com'),
('Anna fiochi', '18', 'annafiochi@gmail.com');

SELECT * FROM pacientes;

INSERT INTO medicos (nome, especialidade) VALUES
('Mariana Souza', 'Ginecologista'),
('Pedro Lima', 'Dermatologia'),
('Giovana Ferreira', 'Oftalmologia'),
('Luis Carlos', 'Ortopedia'),
('Marcos Moura', 'Endocrinologia'),
('Renata Lima', 'Pediatria'),
('Joao Vitor', 'Psiquiatra'),
('Fernanda Mazzucchi', 'Neurologia'),
('Eduarda Rizzoo', 'Oncologia');

SELECT * FROM medicos;

CREATE TABLE consultas (
id_consulta SERIAL PRIMARY KEY,
data_consulta DATE NOT NULL DEFAULT CURRENT_DATE,
id_paciente INT NOT NULL,
id_medico INT NOT NULL,
CONSTRAINT fk_paciente FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
CONSTRAINT fk_medico FOREIGN KEY (id_medico) REFERENCES medicos(id_medico)
);


INSERT INTO consultas (id_paciente, id_medico)VALUES (10, 6);
INSERT INTO consultas (id_paciente, id_medico)VALUES (8, 9);
INSERT INTO consultas (id_paciente, id_medico)VALUES (9, 3);

SELECT * FROM consultas;

SELECT
c.id_consulta, 
p.nome AS nome_paciente,
p.idade,
p.email, 
m.nome AS nome_medico,
m.especialidade,
c.data_consulta
FROM 
 consultas c
JOIN 
 pacientes p ON c.id_paciente = p.id_paciente
JOIN 
 medicos m ON c.id_medico = m.id_medico
WHERE c.data_consulta <= '2024-11-05';

SELECT
c.id_consulta, 
p.nome AS nome_paciente,
p.idade,
p.email, 
c.data_consulta
FROM 
 consultas c
JOIN 
 pacientes p ON c.id_paciente = p.id_paciente
WHERE c.data_consulta > '2024-11-05';

SELECT
c.id_consulta, 
m.nome AS nome_medico,
m.especialidade,
c.data_consulta
FROM 
 consultas c
JOIN 
 medicos m ON c.id_medico = m.id_medico
WHERE c.data_consulta > '2024-11-05';