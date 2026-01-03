CREATE DATABASE EscolaTI;
GO
USE EscolaTI;
GO

CREATE TABLE Cursos (
    id INT IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL
);

CREATE TABLE Alunos (
    id INT IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    idade INT NOT NULL
);

CREATE TABLE Matriculas (
    id INT IDENTITY PRIMARY KEY,
    aluno_id INT NOT NULL,
    curso_id INT NOT NULL,
    data_matricula DATE NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES Alunos(id),
    FOREIGN KEY (curso_id) REFERENCES Cursos(id)
);

INSERT INTO Cursos (nome, carga_horaria) VALUES
('Programação em Python', 120),
('Banco de Dados SQL', 100),
('Desenvolvimento Web', 140);

INSERT INTO Alunos (nome, email, idade) VALUES
('Eduardo Lucas', 'eduardo@email.com', 17),
('Ana Silva', 'ana@email.com', 18),
('Carlos Santos', 'carlos@email.com', 19);

INSERT INTO Matriculas (aluno_id, curso_id, data_matricula) VALUES
(1, 1, '2025-01-10'),
(1, 2, '2025-01-15'),
(2, 3, '2025-02-01'),
(3, 1, '2025-02-05');

SELECT * FROM Alunos;

SELECT nome, email FROM Alunos WHERE idade >= 18;

SELECT nome FROM Cursos ORDER BY carga_horaria DESC;

SELECT A.nome, C.nome
FROM Alunos A
JOIN Matriculas M ON A.id = M.aluno_id
JOIN Cursos C ON C.id = M.curso_id;

SELECT A.nome, COUNT(M.id)
FROM Alunos A
JOIN Matriculas M ON A.id = M.aluno_id
GROUP BY A.nome;

UPDATE Alunos SET idade = 18 WHERE id = 1;

DELETE FROM Matriculas WHERE id = 4;

CREATE PROCEDURE InserirAluno
    @nome VARCHAR(100),
    @email VARCHAR(100),
    @idade INT
AS
BEGIN
    INSERT INTO Alunos (nome, email, idade)
    VALUES (@nome, @email, @idade)
END;
