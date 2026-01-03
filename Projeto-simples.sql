CREATE TABLE Alunos (
    id INT IDENTITY PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    idade INT
);

INSERT INTO Alunos (nome, email, idade)
VALUES
('João Silva', 'joao@email.com', 18),
('Maria Santos', 'maria@email.com', 17);

SELECT * FROM Alunos;

SELECT * FROM Alunos WHERE idade >= 18;

UPDATE Alunos SET idade = 19 WHERE id = 1;

DELETE FROM Alunos WHERE id = 2;
