-- ####################################################
-- 1) INSERTS: dados de exemplo em todas as tabelas
-- ####################################################

-- Usuarios
INSERT INTO Usuarios (
    Email, Nome, Sobrenome, Ativo, NivelAcesso, Telefone, DataNascimento, FotoUrl
) VALUES
('alice@example.com', 'Alice', 'Silva', 1, 1, '(11) 99999-0001', '1990-05-12', 'http://ex.com/alice.jpg'),
('bob@example.com',   'Bob',   'Souza', 1, 0, '(11) 99999-0002', '1985-11-23', 'http://ex.com/bob.jpg'),
('carlos@example.com','Carlos','Oliveira',1, 0, '(11) 99999-0003', '1992-07-30', 'http://ex.com/carlos.jpg');

-- Ministerios
INSERT INTO Ministerios (
    Nome, Descricao, LiderId, Ativo
) VALUES
('Louvor',  'Minist�rio de m�sica e adora��o', 1, 1),
('Ensino',  'Minist�rio de ensino e estudos b�blicos', 2, 1);

-- Membros
INSERT INTO Membros (
    UsuarioId, MinisterioId, DataEntrada, PapelNoMinisterio
) VALUES
(1, 1, GETDATE(), 'Cantor'),
(2, 1, GETDATE(), 'Instrumentista'),
(2, 2, GETDATE(), 'Professor'),
(3, 2, GETDATE(), 'Assistente');

-- Papeis
INSERT INTO Papeis (Nome, Descricao) VALUES
('L�der',     'Respons�vel pelo minist�rio'),
('Membro',    'Membro regular'),
('Assistente','Auxilia o l�der');

-- UsuarioPapeis
INSERT INTO UsuarioPapeis (
    UsuarioId, MinisterioId, PapelId
) VALUES
(1, 1, 1),   -- Alice � L�der do Louvor
(2, 1, 2),   -- Bob � Membro do Louvor
(2, 2, 1),   -- Bob � L�der do Ensino
(3, 2, 3);   -- Carlos � Assistente do Ensino

-- ConfiguracoesMinisterio
INSERT INTO ConfiguracoesMinisterio (MinisterioId, Chave, Valor) VALUES
(1, 'prazo_inscricao',   '2 dias antes'),
(2, 'canal_comunicacao', 'WhatsApp');


-- LogsAuditoria
INSERT INTO LogsAuditoria (NomeTabela, RegistroId, UsuarioId, Acao, Detalhes) VALUES
('Usuarios', 1, 1, 'INSERT', 'Criou usu�rio Alice'),
('Usuarios', 2, 2, 'INSERT', 'Criou usu�rio Bob'),
('Ministerios',1,1,'INSERT','Criou minist�rio Louvor');


select * from LogsAuditoria;
select * from ConfiguracoesMinisterio;
select * from UsuarioPapeis;
select * from Papeis;
select * from Membros;
select * from Ministerios;
select * from Usuarios;


DROP TABLE LogsAuditoria;
DROP TABLE ConfiguracoesMinisterio;
DROP TABLE UsuarioPapeis;
DROP TABLE Papeis;
DROP TABLE Membros;
DROP TABLE Ministerios;
DROP TABLE Usuarios;


