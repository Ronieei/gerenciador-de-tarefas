-- src/main/resources/data.sql

-- Criação da tabela de usuários
CREATE TABLE usuarios (
                          id BIGINT PRIMARY KEY AUTO_INCREMENT,
                          nome VARCHAR(255) NOT NULL,
                          login VARCHAR(100) NOT NULL UNIQUE,
                          telefone VARCHAR(20),
                          email VARCHAR(255),
                          senha VARCHAR(255) NOT NULL,
                          admin BOOLEAN NOT NULL DEFAULT FALSE
);

-- Inserção de dados na tabela de usuários
INSERT INTO usuarios (nome, login, telefone, email, senha, admin) VALUES
                                                                      ('Admin', 'admin', '123456789', 'admin@example.com', '123', true),
                                                                      ('U1', 'u1', '987654321', 'usuario1@example.com', '123', false),
                                                                      ('U2', 'u2', '456789123', 'usuario2@example.com', '321', false),
                                                                      ('U3', 'u3', '654321987', 'usuario3@example.com', '231', false),
                                                                      ('U4', 'u4', '321654987', 'usuario4@example.com', '312', false),
                                                                      ('U5', 'u5', '789456123', 'usuario5@example.com', '132', false),
                                                                      ('U6', 'u6', '852963741', 'usuario6@example.com', '213', false),
                                                                      ('U7', 'u7', '951753486', 'usuario7@example.com', '342', false),
                                                                      ('U8', 'u8', '456123789', 'usuario8@example.com', '543', false),
                                                                      ('U9', 'u9', '987123654', 'usuario9@example.com', '654', false),
                                                                      ('U10', 'u10', '321987654', 'usuario10@example.com', '765', false),
                                                                      ('U11', 'u11', '654321456', 'usuario11@example.com', '876', false),
                                                                      ('U12', 'u12', '789654123', 'usuario12@example.com', '987', false),
                                                                      ('U13', 'u13', '123456456', 'usuario13@example.com', '198', false),
                                                                      ('U14', 'u14', '456789654', 'usuario14@example.com', '219', false),
                                                                      ('U15', 'u15', '987654321', 'usuario15@example.com', '321', false),
                                                                      ('U16', 'u16', '654123789', 'usuario16@example.com', '432', false),
                                                                      ('U17', 'u17', '321456987', 'usuario17@example.com', '543', false),
                                                                      ('U18', 'u18', '987321456', 'usuario18@example.com', '654', false),
                                                                      ('U19', 'u19', '456987321', 'usuario19@example.com', '765', false),
                                                                      ('U20', 'u20', '321654123', 'usuario20@example.com', '876', false),
                                                                      ('U21', 'u21', '789123456', 'usuario21@example.com', '987', false),
                                                                      ('U22', 'u22', '456321789', 'usuario22@example.com', '198', false),
                                                                      ('U23', 'u23', '654987123', 'usuario23@example.com', '219', false),
                                                                      ('U24', 'u24', '123789654', 'usuario24@example.com', '321', false),
                                                                      ('U25', 'u25', '321987123', 'usuario25@example.com', '432', false),
                                                                      ('U26', 'u26', '456123987', 'usuario26@example.com', '543', false),
                                                                      ('U27', 'u27', '789456321', 'usuario27@example.com', '654', false),
                                                                      ('U28', 'u28', '987654321', 'usuario28@example.com', '765', false),
                                                                      ('U29', 'u29', '654321987', 'usuario29@example.com', '876', false),
                                                                      ('U30', 'u30', '321654456', 'usuario30@example.com', '987', false);

-- Criação da tabela de tarefas
CREATE TABLE tarefa (
                         id INT PRIMARY KEY AUTO_INCREMENT,
                         titulo VARCHAR(255) NOT NULL,
                         descricao TEXT,
                         concluido BOOLEAN NOT NULL DEFAULT FALSE,
                         usuario_id BIGINT,
                         FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE SET NULL
);

-- Inserção de dados na tabela de tarefas
INSERT INTO tarefa (titulo, descricao, concluido, usuario_id) VALUES
-- Tarefas para o usuário 1
('Tarefa 1.1', 'Descrição da tarefa 1.1', false, 1),
('Tarefa 1.2', 'Descrição da tarefa 1.2', true, 1),
('Tarefa 1.3', 'Descrição da tarefa 1.3', false, 1),
('Tarefa 1.4', 'Descrição da tarefa 1.4', true, 1),
('Tarefa 1.5', 'Descrição da tarefa 1.5', false, 1),
-- Tarefas para o usuário 2
('Tarefa 2.1', 'Descrição da tarefa 2.1', false, 2),
('Tarefa 2.2', 'Descrição da tarefa 2.2', true, 2),
('Tarefa 2.3', 'Descrição da tarefa 2.3', false, 2),
('Tarefa 2.4', 'Descrição da tarefa 2.4', true, 2),
('Tarefa 2.5', 'Descrição da tarefa 2.5', false, 2),
-- Tarefas para o usuário 3
('Tarefa 3.1', 'Descrição da tarefa 3.1', false, 3),
('Tarefa 3.2', 'Descrição da tarefa 3.2', true, 3),
('Tarefa 3.3', 'Descrição da tarefa 3.3', false, 3),
('Tarefa 3.4', 'Descrição da tarefa 3.4', true, 3),
('Tarefa 3.5', 'Descrição da tarefa 3.5', false, 3),
-- Tarefas para o usuário 4
('Tarefa 4.1', 'Descrição da tarefa 4.1', false, 4),
('Tarefa 4.2', 'Descrição da tarefa 4.2', true, 4),
('Tarefa 4.3', 'Descrição da tarefa 4.3', false, 4),
('Tarefa 4.4', 'Descrição da tarefa 4.4', true, 4),
('Tarefa 4.5', 'Descrição da tarefa 4.5', false, 4),
-- Tarefas para o usuário 5
('Tarefa 5.1', 'Descrição da tarefa 5.1', false, 5),
('Tarefa 5.2', 'Descrição da tarefa 5.2', true, 5),
('Tarefa 5.3', 'Descrição da tarefa 5.3', false, 5),
('Tarefa 5.4', 'Descrição da tarefa 5.4', true, 5),
('Tarefa 5.5', 'Descrição da tarefa 5.5', false, 5),
-- Tarefas para o usuário 6
('Tarefa 6.1', 'Descrição da tarefa 6.1', false, 6),
('Tarefa 6.2', 'Descrição da tarefa 6.2', true, 6),
('Tarefa 6.3', 'Descrição da tarefa 6.3', false, 6),
('Tarefa 6.4', 'Descrição da tarefa 6.4', true, 6),
('Tarefa 6.5', 'Descrição da tarefa 6.5', false, 6),
-- Tarefas para o usuário 7
('Tarefa 7.1', 'Descrição da tarefa 7.1', false, 7),
('Tarefa 7.2', 'Descrição da tarefa 7.2', true, 7),
('Tarefa 7.3', 'Descrição da tarefa 7.3', false, 7),
('Tarefa 7.4', 'Descrição da tarefa 7.4', true, 7),
('Tarefa 7.5', 'Descrição da tarefa 7.5', false, 7),
-- Tarefas para o usuário 8
('Tarefa 8.1', 'Descrição da tarefa 8.1', false, 8),
('Tarefa 8.2', 'Descrição da tarefa 8.2', true, 8),
('Tarefa 8.3', 'Descrição da tarefa 8.3', false, 8),
('Tarefa 8.4', 'Descrição da tarefa 8.4', true, 8),
('Tarefa 8.5', 'Descrição da tarefa 8.5', false, 8),
-- Tarefas para o usuário 9
('Tarefa 9.1', 'Descrição da tarefa 9.1', false, 9),
('Tarefa 9.2', 'Descrição da tarefa 9.2', true, 9),
('Tarefa 9.3', 'Descrição da tarefa 9.3', false, 9),
('Tarefa 9.4', 'Descrição da tarefa 9.4', true, 9),
('Tarefa 9.5', 'Descrição da tarefa 9.5', false, 9),
-- Tarefas para o usuário 10
('Tarefa 10.1', 'Descrição da tarefa 10.1', false, 10),
('Tarefa 10.2', 'Descrição da tarefa 10.2', true, 10),
('Tarefa 10.3', 'Descrição da tarefa 10.3', false, 10),
('Tarefa 10.4', 'Descrição da tarefa 10.4', true, 10),
('Tarefa 10.5', 'Descrição da tarefa 10.5', false, 10),
-- Tarefas para o usuário 11
('Tarefa 11.1', 'Descrição da tarefa 11.1', false, 11),
('Tarefa 11.2', 'Descrição da tarefa 11.2', true, 11),
('Tarefa 11.3', 'Descrição da tarefa 11.3', false, 11),
('Tarefa 11.4', 'Descrição da tarefa 11.4', true, 11),
('Tarefa 11.5', 'Descrição da tarefa 11.5', false, 11),
-- Tarefas para o usuário 12
('Tarefa 12.1', 'Descrição da tarefa 12.1', false, 12),
('Tarefa 12.2', 'Descrição da tarefa 12.2', true, 12),
('Tarefa 12.3', 'Descrição da tarefa 12.3', false, 12),
('Tarefa 12.4', 'Descrição da tarefa 12.4', true, 12),
('Tarefa 12.5', 'Descrição da tarefa 12.5', false, 12),
-- Tarefas para o usuário 13
('Tarefa 13.1', 'Descrição da tarefa 13.1', false, 13),
('Tarefa 13.2', 'Descrição da tarefa 13.2', true, 13),
('Tarefa 13.3', 'Descrição da tarefa 13.3', false, 13),
('Tarefa 13.4', 'Descrição da tarefa 13.4', true, 13),
('Tarefa 13.5', 'Descrição da tarefa 13.5', false, 13),
-- Tarefas para o usuário 14
('Tarefa 14.1', 'Descrição da tarefa 14.1', false, 14),
('Tarefa 14.2', 'Descrição da tarefa 14.2', true, 14),
('Tarefa 14.3', 'Descrição da tarefa 14.3', false, 14),
('Tarefa 14.4', 'Descrição da tarefa 14.4', true, 14),
('Tarefa 14.5', 'Descrição da tarefa 14.5', false, 14),
-- Tarefas para o usuário 15
('Tarefa 15.1', 'Descrição da tarefa 15.1', false, 15),
('Tarefa 15.2', 'Descrição da tarefa 15.2', true, 15),
('Tarefa 15.3', 'Descrição da tarefa 15.3', false, 15),
('Tarefa 15.4', 'Descrição da tarefa 15.4', true, 15),
('Tarefa 15.5', 'Descrição da tarefa 15.5', false, 15),
-- Tarefas para o usuário 16
('Tarefa 16.1', 'Descrição da tarefa 16.1', false, 16),
('Tarefa 16.2', 'Descrição da tarefa 16.2', true, 16),
('Tarefa 16.3', 'Descrição da tarefa 16.3', false, 16),
('Tarefa 16.4', 'Descrição da tarefa 16.4', true, 16),
('Tarefa 16.5', 'Descrição da tarefa 16.5', false, 16),
-- Tarefas para o usuário 17
('Tarefa 17.1', 'Descrição da tarefa 17.1', false, 17),
('Tarefa 17.2', 'Descrição da tarefa 17.2', true, 17),
('Tarefa 17.3', 'Descrição da tarefa 17.3', false, 17),
('Tarefa 17.4', 'Descrição da tarefa 17.4', true, 17),
('Tarefa 17.5', 'Descrição da tarefa 17.5', false, 17),
-- Tarefas para o usuário 18
('Tarefa 18.1', 'Descrição da tarefa 18.1', false, 18),
('Tarefa 18.2', 'Descrição da tarefa 18.2', true, 18),
('Tarefa 18.3', 'Descrição da tarefa 18.3', false, 18),
('Tarefa 18.4', 'Descrição da tarefa 18.4', true, 18),
('Tarefa 18.5', 'Descrição da tarefa 18.5', false, 18),
-- Tarefas para o usuário 19
('Tarefa 19.1', 'Descrição da tarefa 19.1', false, 19),
('Tarefa 19.2', 'Descrição da tarefa 19.2', true, 19),
('Tarefa 19.3', 'Descrição da tarefa 19.3', false, 19),
('Tarefa 19.4', 'Descrição da tarefa 19.4', true, 19),
('Tarefa 19.5', 'Descrição da tarefa 19.5', false, 19),
-- Tarefas para o usuário 20
('Tarefa 20.1', 'Descrição da tarefa 20.1', false, 20),
('Tarefa 20.2', 'Descrição da tarefa 20.2', true, 20),
('Tarefa 20.3', 'Descrição da tarefa 20.3', false, 20),
('Tarefa 20.4', 'Descrição da tarefa 20.4', true, 20),
('Tarefa 20.5', 'Descrição da tarefa 20.5', false, 20),
-- Tarefas para o usuário 21
('Tarefa 21.1', 'Descrição da tarefa 21.1', false, 21),
('Tarefa 21.2', 'Descrição da tarefa 21.2', true, 21),
('Tarefa 21.3', 'Descrição da tarefa 21.3', false, 21),
('Tarefa 21.4', 'Descrição da tarefa 21.4', true, 21),
('Tarefa 21.5', 'Descrição da tarefa 21.5', false, 21),
-- Tarefas para o usuário 22
('Tarefa 22.1', 'Descrição da tarefa 22.1', false, 22),
('Tarefa 22.2', 'Descrição da tarefa 22.2', true, 22),
('Tarefa 22.3', 'Descrição da tarefa 22.3', false, 22),
('Tarefa 22.4', 'Descrição da tarefa 22.4', true, 22),
('Tarefa 22.5', 'Descrição da tarefa 22.5', false, 22),
-- Tarefas para o usuário 23
('Tarefa 23.1', 'Descrição da tarefa 23.1', false, 23),
('Tarefa 23.2', 'Descrição da tarefa 23.2', true, 23),
('Tarefa 23.3', 'Descrição da tarefa 23.3', false, 23),
('Tarefa 23.4', 'Descrição da tarefa 23.4', true, 23),
('Tarefa 23.5', 'Descrição da tarefa 23.5', false, 23),
-- Tarefas para o usuário 24
('Tarefa 24.1', 'Descrição da tarefa 24.1', false, 24),
('Tarefa 24.2', 'Descrição da tarefa 24.2', true, 24),
('Tarefa 24.3', 'Descrição da tarefa 24.3', false, 24),
('Tarefa 24.4', 'Descrição da tarefa 24.4', true, 24),
('Tarefa 24.5', 'Descrição da tarefa 24.5', false, 24),
-- Tarefas para o usuário 25
('Tarefa 25.1', 'Descrição da tarefa 25.1', false, 25),
('Tarefa 25.2', 'Descrição da tarefa 25.2', true, 25),
('Tarefa 25.3', 'Descrição da tarefa 25.3', false, 25),
('Tarefa 25.4', 'Descrição da tarefa 25.4', true, 25),
('Tarefa 25.5', 'Descrição da tarefa 25.5', false, 25),
-- Tarefas para o usuário 26
('Tarefa 26.1', 'Descrição da tarefa 26.1', false, 26),
('Tarefa 26.2', 'Descrição da tarefa 26.2', true, 26),
('Tarefa 26.3', 'Descrição da tarefa 26.3', false, 26),
('Tarefa 26.4', 'Descrição da tarefa 26.4', true, 26),
('Tarefa 26.5', 'Descrição da tarefa 26.5', false, 26),
-- Tarefas para o usuário 27
('Tarefa 27.1', 'Descrição da tarefa 27.1', false, 27),
('Tarefa 27.2', 'Descrição da tarefa 27.2', true, 27),
('Tarefa 27.3', 'Descrição da tarefa 27.3', false, 27),
('Tarefa 27.4', 'Descrição da tarefa 27.4', true, 27),
('Tarefa 27.5', 'Descrição da tarefa 27.5', false, 27),
-- Tarefas para o usuário 28
('Tarefa 28.1', 'Descrição da tarefa 28.1', false, 28),
('Tarefa 28.2', 'Descrição da tarefa 28.2', true, 28),
('Tarefa 28.3', 'Descrição da tarefa 28.3', false, 28),
('Tarefa 28.4', 'Descrição da tarefa 28.4', true, 28),
('Tarefa 28.5', 'Descrição da tarefa 28.5', false, 28),
-- Tarefas para o usuário 29
('Tarefa 29.1', 'Descrição da tarefa 29.1', false, 29),
('Tarefa 29.2', 'Descrição da tarefa 29.2', true, 29),
('Tarefa 29.3', 'Descrição da tarefa 29.3', false, 29),
('Tarefa 29.4', 'Descrição da tarefa 29.4', true, 29),
('Tarefa 29.5', 'Descrição da tarefa 29.5', false, 29),
-- Tarefas para o usuário 30
('Tarefa 30.1', 'Descrição da tarefa 30.1', false, 30),
('Tarefa 30.2', 'Descrição da tarefa 30.2', true, 30),
('Tarefa 30.3', 'Descrição da tarefa 30.3', false, 30),
('Tarefa 30.4', 'Descrição da tarefa 30.4', true, 30),
('Tarefa 30.5', 'Descrição da tarefa 30.5', false, 30);
