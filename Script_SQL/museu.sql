CREATE DATABASE MUSEU;
USE MUSEU;

-- CRIAÇÃO DAS TABELAS

-- AUTORES
CREATE TABLE AUTORES (
    ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Nome VARCHAR(200),
    Nacionalidade VARCHAR(3)
)
GO

-- ASSUNTOS
CREATE TABLE ASSUNTOS (
    ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Assunto VARCHAR(500)
)
GO

-- EDITORA
CREATE TABLE EDITORA (
    ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Nome VARCHAR(200)
)
GO


-- OBRA
CREATE TABLE OBRA (
    ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Titulo_Principal VARCHAR(500),
    Capa VARCHAR(100),
    Local VARCHAR(100),
    Data VARCHAR(20),
    Desc_Fisica VARCHAR(500),
    Numero_Chamada VARCHAR(20),
    Chamada_Local VARCHAR(20),
    Titulo_Uniforme VARCHAR(200),
    ISBN CHAR(13),
    Serie VARCHAR(100), 
    Edicao VARCHAR(50), 
    Colecao VARCHAR(100),
    Notas_Gerais VARCHAR(500),
    ISSN CHAR(8),
    Volume VARCHAR(50), 
    Periodicidade VARCHAR(50),
    Nome VARCHAR(200),
    Tipo VARCHAR(10),    

    FK_Assunto_ID INT NOT NULL,
    FK_Editora_ID INT NOT NULL,
    FK_Autores_ID INT NOT NULL,

    FOREIGN KEY (FK_Assunto_ID) REFERENCES ASSUNTOS(ID),
    FOREIGN KEY (FK_Editora_ID) REFERENCES EDITORA(ID),
    FOREIGN KEY (FK_Autores_ID) REFERENCES AUTORES(ID)
)
GO


-- EXEMPLAR
CREATE TABLE EXEMPLAR (
    Codigo INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Disponibilidade VARCHAR(50),
    Numero INT,
    FK_OBRA_ID INT NOT NULL,
    FOREIGN KEY (FK_OBRA_ID) REFERENCES OBRA(ID)
)
GO


-- SECUNDARIOS
CREATE TABLE SECUNDARIOS (
    ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    FK_OBRA_ID INT NOT NULL,
    FK_AUTORES_ID INT NOT NULL,
    FOREIGN KEY (FK_OBRA_ID) REFERENCES OBRA(ID),
    FOREIGN KEY (FK_AUTORES_ID) REFERENCES AUTORES(ID)
)
GO


--- INSERÇÃO DE DADOS

-- Inserindo autores 
INSERT INTO AUTORES (Nome, Nacionalidade) VALUES
('Gabriel García Márquez', 'COL'), 
('Antoine de Saint-Exupéry', 'FRA'), 
('Adam Smith', 'GBR'), 
('Machado de Assis', 'BRA'), 
('Yuval Noah Harari', 'ISR'), 
('Ian Sommerville', 'GBR'), 
('George Orwell', 'GBR'), 
('Libâneo, J. C.', 'BRA'), 
('Karl Marx', 'GER'), 
('John Rawls', 'USA'); 
GO

-- Inserindo assuntos 
INSERT INTO ASSUNTOS (Assunto) VALUES
('Tecnologia/Informática'), 
('História Geral'),          
('Ciência/Natureza'),       
('Arte/Cultura'),           
('Economia/Finanças'),      
('Literatura Clássica'),    
('Literatura Infantil'),    
('Jornalismo/Notícias'),    
('Pedagogia/Didática'),     
('Filosofia Política');     
GO

-- Inserindo editoras 
INSERT INTO EDITORA (Nome) VALUES
('Record'), 
('Companhia das Letras'), 
('WMF Martins Fontes'), 
('Nova Fronteira'), 
('Arqueiro'), 
('Pearson'), 
('Cortez Editora'), 
('Boitempo'), 
('Martins Fontes'), 
('Editora Abril'); 
GO


--- INSERÇÃO DE OBRAS -> LIVROS 

INSERT INTO OBRA (
    Titulo_Principal, Capa, Local, Data, Desc_Fisica,
    Numero_Chamada, Chamada_Local, Titulo_Uniforme, ISBN,
    Serie, Edicao, Colecao, Notas_Gerais, Volume,
    Nome, Tipo,
    FK_Assunto_ID, FK_Editora_ID, FK_Autores_ID
)
VALUES
('Cem Anos de Solidão', 'l1.png', 'Rio de Janeiro', '2005-01-01', '416 p. ; 23 cm',
 '869.93 G14C', 'LIT.LATIN', 'Cien años de soledad', '9788501015039',
 'Clássicos Modernos', '25. ed.', 'Biblioteca Gabriel García Márquez', 'Tradução de Antônio Houaiss.', '1',
 'Cem Anos de Solidão', 'Livro', 6, 1, 1), 

('O Pequeno Príncipe', 'l2.png', 'São Paulo', '2015-01-01', '96 p. ; 20 cm',
 '843.9 A63P', 'LIT.INFANTIL', 'Le Petit Prince', '9788595990262',
 'Infantojuvenil', '1. ed. bilíngue', 'Clássicos de Ouro', 'Edição com ilustrações originais do autor.', '1',
 'O Pequeno Príncipe', 'Livro', 7, 3, 2), 

('A Riqueza das Nações', 'l3.png', 'Brasília', '2010-01-01', '600 p. ; 24 cm',
 '330.1 S64R', 'ECO.GERAL', 'The Wealth of Nations', '9788522459955',
 'Pensamento Econômico', '3. ed.', 'Clássicos da Economia', 'Obra fundamental da economia clássica.', '1',
 'A Riqueza das Nações', 'Livro', 5, 4, 3), 

('Dom Casmurro', 'l4.png', 'São Paulo', '2018-01-01', '280 p. ; 21 cm',
 '869.9 M18D', 'LIT.BRASIL', 'Dom Casmurro', '9788535911292',
 'Literatura Brasileira', '5. ed. revisada', 'Obras de Machado de Assis', 'Análise crítica de John Gledson.', '1',
 'Dom Casmurro', 'Livro', 6, 2, 4), 

('Sapiens: Uma Breve História da Humanidade', 'l5.png', 'Porto Alegre', '2019-01-01', '464 p. ; 23 cm',
 '909 Y94S', 'HIS.GERAL', 'Sapiens: A Brief History of Humankind', '9788547000100',
 'Não Ficção', '1. ed.', 'Grandes Temas', 'Best-seller internacional sobre a história humana.', '1',
 'Sapiens', 'Livro', 2, 5, 5), 

('Engenharia de Software', 'l6.png', 'Rio de Janeiro', '2022-01-01', '750 p. ; 25 cm',
 '005.1 S63E', 'COMP.SOFT', 'Software Engineering', '9788582601000',
 'Informática Aplicada', '10. ed.', 'Série de Computação', 'Foco em métodos ágeis e DevOps.', '1',
 'Engenharia de Software', 'Livro', 1, 6, 6), 

('1984', 'l7.png', 'São Paulo', '2016-01-01', '336 p. ; 22 cm',
 '823.9 O74O', 'FIC.DISTR.', 'Nineteen Eighty-Four', '9788535909169',
 'Ficção Científica', '1. ed. de bolso', 'Distopias Clássicas', 'Prefácio de Thomas Pynchon.', '1',
 '1984', 'Livro', 6, 2, 7), 

('Didática', 'l8.png', 'Campinas', '2000-01-01', '304 p. ; 22 cm',
 '371.3 L55D', 'EDU.DIDAT', 'Didática', '9788530800665',
 'Pedagogia', '3. ed. revisada', 'Coleção Magistério', 'Referência para formação de professores.', '1',
 'Didática', 'Livro', 9, 7, 8), 

('O Capital: Crítica da Economia Política', 'l9.png', 'São Paulo', '2017-01-01', '896 p. ; 24 cm',
 '335.4 M34C', 'ECO.POLIT', 'Das Kapital', '9788575595332',
 'Teoria Marxista', '1. ed. integral', 'Clássicos da Política', 'Tradução de Rubens Enderle.', '1',
 'O Capital', 'Livro', 5, 8, 9), 

('Uma Teoria da Justiça', 'l10.png', 'São Paulo', '2002-01-01', '816 p. ; 25 cm',
 '340.1 R18T', 'FIL.POLIT', 'A Theory of Justice', '9788533617307',
 'Filosofia Política', '2. ed. revista', 'Pensadores Essenciais', 'Apresenta os princípios de justiça como equidade.', '1',
 'Uma Teoria da Justiça', 'Livro', 10, 9, 10); 
GO

--- INSERÇÃO DE OBRAS -> REVISTAS 

INSERT INTO OBRA (
    Titulo_Principal, Capa, Local, Data, Desc_Fisica,
    ISSN, Volume,
    Periodicidade, Nome, Tipo,
    FK_Assunto_ID, FK_Editora_ID, FK_Autores_ID
)
VALUES
('Revista Pesquisa FAPESP', 'r1.png', 'São Paulo', '2025-01-01', '90 p.', '15198736', '347', 'Mensal', 'Pesquisa FAPESP', 'Revista', 3, 1, 1), 
('Quatro Rodas', 'r2.png', 'São Paulo', '2025-01-01', '130 p.', '00335596', '798', 'Mensal', 'Quatro Rodas', 'Revista', 8, 10, 2), 
('Claudia', 'r3.png', 'São Paulo', '2024-12-01', '140 p.', '00098973', '743', 'Mensal', 'Claudia', 'Revista', 8, 10, 3), 
('The New Yorker', 'r4.png', 'Nova York', '2024-12-23', '75 p.', '0028792X', '100', 'Semanal', 'The New Yorker', 'Revista', 6, 1, 4), 
('Galileu', 'r5.png', 'São Paulo', '2024-12-15', '110 p.', '0103085X', '398', 'Mensal', 'Galileu', 'Revista', 3, 10, 5), 
('Exame', 'r6.png', 'São Paulo', '2025-01-01', '150 p.', '00142563', '1288', 'Quinzenal', 'Exame', 'Revista', 5, 10, 6), 
('Nature', 'r7.png', 'Londres', '2024-12-19', '60 p.', '00280836', '630', 'Semanal', 'Nature', 'Revista', 3, 1, 7), 
('Viagem e Turismo', 'r8.png', 'São Paulo', '2025-01-01', '125 p.', '01041181', '350', 'Mensal', 'Viagem e Turismo', 'Revista', 8, 10, 8), 
('Rolling Stone Brasil', 'r9.png', 'São Paulo', '2024-12-01', '100 p.', '19829609', '200', 'Mensal', 'Rolling Stone Brasil', 'Revista', 4, 1, 9), 
('Arquitetura & Construção', 'r10.png', 'São Paulo', '2024-12-01', '160 p.', '01021454', '420', 'Mensal', 'Arquitetura & Construção', 'Revista', 1, 10, 10); 
GO

--- INSERÇÃO DE OBRAS -> JORNAIS 

INSERT INTO OBRA (
    Titulo_Principal, Capa, Local, Data, Desc_Fisica,
    ISSN,Periodicidade, Nome, Tipo,
    FK_Assunto_ID, FK_Editora_ID, FK_Autores_ID
)
VALUES
('Folha de São Paulo', 'j1.png', 'São Paulo', '2025-01-01', '32 p.', '14145723', 'Diário', 'Folha de São Paulo', 'Jornal', 8, 1, 1), 
('O Globo', 'j2.png', 'Rio de Janeiro', '2025-01-01', '40 p.', '01045853', 'Diário', 'O Globo', 'Jornal', 8, 2, 2), 
('Zero Hora', 'j3.png', 'Porto Alegre', '2025-01-01', '28 p.', '00448723', 'Diário', 'Zero Hora', 'Jornal', 8, 3, 3), 
('Correio Braziliense', 'j4.png', 'Brasília', '2025-01-01', '36 p.', '01045977', 'Diário', 'Correio Braziliense', 'Jornal', 8, 4, 4), 
('O Estado de S. Paulo', 'j5.png', 'São Paulo', '2025-01-01', '48 p.', '15162931', 'Diário', 'O Estado de S. Paulo', 'Jornal', 8, 5, 5), 
('Valor Econômico', 'j6.png', 'São Paulo', '2025-01-01', '32 p.', '15186932', 'Diário', 'Valor Econômico', 'Jornal', 5, 6, 6), 
('Jornal do Commercio', 'j7.png', 'Recife', '2025-01-01', '36 p.', '16774467', 'Diário', 'Jornal do Commercio', 'Jornal', 8, 7, 7), 
('Estado de Minas', 'j8.png', 'Belo Horizonte', '2025-01-01', '42 p.', '01039121', 'Diário', 'Estado de Minas', 'Jornal', 8, 8, 8), 
('The New York Times', 'j9.png', 'Nova York', '2025-01-01', '52 p.', '03624331', 'Diário', 'The New York Times', 'Jornal', 8, 9, 9), 
('Financial Times', 'j10.png', 'Londres', '2025-01-01', '30 p.', '03071766', 'Diário', 'Financial Times', 'Jornal', 5, 10, 10); 
GO

--- INSERÇÃO DE EXEMPLARES 

INSERT INTO EXEMPLAR (Disponibilidade, Numero, FK_OBRA_ID) VALUES
('Disponível', 1, 1), 
('Emprestado', 2, 1),
('Disponível', 1, 2), 
('Emprestado', 2, 2),
('Disponível', 1, 3), 
('Disponível', 1, 11), 
('Emprestado', 2, 14), 
('Disponível', 1, 21), 
('Disponível', 1, 26), 
('Emprestado', 2, 30); 
GO

--- INSERÇÃO DE AUTORES SECUNDÁRIOS 

INSERT INTO SECUNDARIOS (FK_OBRA_ID, FK_AUTORES_ID) VALUES
(1, 2), 
(1, 3), 
(2, 1), 
(11, 4), 
(12, 5), 
(21, 6), 
(22, 7), 
(23, 8), 
(24, 9), 
(25, 10); 
GO

-- EXEMPLOS DE CONSULTAS ESPECÍFICAS NO BANCO

-- 1) Pergunta: Quantos exemplares existem para cada título de obra na coleção?
SELECT
    O.Titulo_Principal,
    O.Tipo,
    COUNT(E.Codigo) AS Total_Exemplares
FROM
    OBRA O
JOIN
    EXEMPLAR E ON O.ID = E.FK_OBRA_ID
GROUP BY
    O.Titulo_Principal, O.Tipo
ORDER BY
    Total_Exemplares DESC;
GO

-- 2) Pergunta: Qual é a distribuição das obras no acervo?
SELECT
    Tipo,
    COUNT(ID) AS Total_Obras
FROM
    OBRA
GROUP BY
    Tipo
ORDER BY
    Total_Obras DESC;
GO

-- 3) Quais obras possuem mais de um exemplar com status 'Disponível'? 
SELECT
    O.Titulo_Principal,
    COUNT(E.Codigo) AS Exemplares_Disponiveis
FROM
    OBRA O
JOIN
    EXEMPLAR E ON O.ID = E.FK_OBRA_ID
WHERE
    E.Disponibilidade = 'Disponível'
GROUP BY
    O.Titulo_Principal
HAVING
    COUNT(E.Codigo) > 1
ORDER BY
    Exemplares_Disponiveis DESC;
GO

-- 4) Pergunta: Qual é a quantidade de obras classificadas em cada Assunto?
SELECT
    A.Assunto,
    COUNT(O.ID) AS Total_Obras_Por_Assunto
FROM
    ASSUNTOS A
JOIN
    OBRA O ON A.ID = O.FK_Assunto_ID
GROUP BY
    A.Assunto
ORDER BY
    Total_Obras_Por_Assunto DESC;
GO

-- 5) Pergunta: Quais autores contribuíram como autores principais e quantas obras eles têm no acervo?
SELECT
    T1.Nome AS Nome_Autor,
    COUNT(T2.ID) AS Total_Obras_Principais
FROM
    AUTORES T1
JOIN
    OBRA T2 ON T1.ID = T2.FK_Autores_ID
GROUP BY
    T1.Nome
ORDER BY
    Total_Obras_Principais DESC;
GO

-- 6) Quais editoras publicaram obras em mais de um assunto diferente?
SELECT
    ED.Nome AS Nome_Editora,
    COUNT(DISTINCT O.FK_Assunto_ID) AS Total_Assuntos_Diferentes
FROM
    EDITORA ED
JOIN
    OBRA O ON ED.ID = O.FK_Editora_ID
GROUP BY
    ED.Nome
HAVING
    COUNT(DISTINCT O.FK_Assunto_ID) > 1
ORDER BY
    Total_Assuntos_Diferentes DESC;
GO

--7) Pergunta: Liste o título principal e o tipo de todas as obras publicadas pela editora "Companhia das Letras".
SELECT
    O.Titulo_Principal,
    O.Tipo,
    E.Nome AS Nome_Editora
FROM
    OBRA O
JOIN
    EDITORA E ON O.FK_Editora_ID = E.ID
WHERE
    E.Nome = 'Companhia das Letras';
GO

--8) Pergunta: Quais livros possuem em sua descrição de edição a string '5. ed.' ou superior?
SELECT
    Titulo_Principal,
    Edicao,
    Data
FROM
    OBRA
WHERE
    Tipo = 'Livro' AND Edicao LIKE '%ed.5'
ORDER BY
    Edicao;
GO

--9) Qual é a obra mais antiga de cada tipo?
CREATE FUNCTION fn_ObterDataMaisAntigaPorTipo (@TipoObra VARCHAR(10))
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @DataMaisAntiga VARCHAR(20);

    SELECT TOP 1
        @DataMaisAntiga = Data
    FROM
        OBRA
    WHERE
        Tipo = @TipoObra
    ORDER BY
        Data ASC;

    RETURN @DataMaisAntiga;
END;
GO

SELECT
    'Livro' AS Tipo,
    (SELECT O.Titulo_Principal FROM OBRA O WHERE O.Tipo = 'Livro' AND O.Data = dbo.fn_ObterDataMaisAntigaPorTipo('Livro')) AS Titulo_Mais_Antigo,
    dbo.fn_ObterDataMaisAntigaPorTipo('Livro') AS Data_Mais_Antiga
UNION
SELECT
    'Revista' AS Tipo,
    (SELECT O.Titulo_Principal FROM OBRA O WHERE O.Tipo = 'Revista' AND O.Data = dbo.fn_ObterDataMaisAntigaPorTipo('Revista')) AS Titulo_Mais_Antigo,
    dbo.fn_ObterDataMaisAntigaPorTipo('Revista') AS Data_Mais_Antiga
UNION 
SELECT
    'Jornal' AS Tipo,
    (SELECT O.Titulo_Principal FROM OBRA O WHERE O.Tipo = 'Jornal' AND O.Data = dbo.fn_ObterDataMaisAntigaPorTipo('Jornal')) AS Titulo_Mais_Antigo,
    dbo.fn_ObterDataMaisAntigaPorTipo('Jornal') AS Data_Mais_Antiga;
GO

-- 10) Qual o título principal, o tipo e o número de exemplares atualmente Emprestados para todas as obras?
CREATE FUNCTION fn_ContarEmprestadosPorObra (@ObraID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Emprestados INT;

    SELECT
        @Emprestados = COUNT(Codigo)
    FROM
        EXEMPLAR
    WHERE
        FK_OBRA_ID = @ObraID
        AND Disponibilidade = 'Emprestado'; 

    RETURN @Emprestados;
END;
GO

SELECT
    O.Titulo_Principal,
    O.Tipo,
    dbo.fn_ContarEmprestadosPorObra(O.ID) AS Total_Emprestados
FROM
    OBRA O
WHERE
    dbo.fn_ContarEmprestadosPorObra(O.ID) > 0 
ORDER BY
    Total_Emprestados DESC, O.Titulo_Principal;
GO

-- EXEMPLOS DE PROCEDURES QUE SERIAM ÚTEIS

-- PROCEDURE 1: Registrar Novo Exemplar
CREATE PROCEDURE sp_RegistrarNovoExemplar
    @FK_OBRA_ID INT,
    @Disponibilidade VARCHAR(50) = 'Disponível' -- Padrão: Disponível
AS
BEGIN
    DECLARE @UltimoNumero INT;

    -- Encontra o próximo número sequencial para o exemplar daquela obra
    SELECT @UltimoNumero = ISNULL(MAX(Numero), 0)
    FROM EXEMPLAR
    WHERE FK_OBRA_ID = @FK_OBRA_ID;

    INSERT INTO EXEMPLAR (Disponibilidade, Numero, FK_OBRA_ID)
    VALUES (@Disponibilidade, @UltimoNumero + 1, @FK_OBRA_ID);
    
    -- Retorna o ID do novo exemplar inserido
    SELECT Codigo AS NovoExemplarID, @UltimoNumero + 1 AS NovoNumero
END
GO

-- Testando a SP 1: Insere um novo exemplar para a Obra ID 1 (Cem Anos de Solidão)
EXEC sp_RegistrarNovoExemplar @FK_OBRA_ID = 1;
GO
SELECT * FROM EXEMPLAR WHERE FK_OBRA_ID = 1;
GO

-- PROCEDURE 2: Atualizar a Disponibilidade de um Exemplar
CREATE PROCEDURE sp_AtualizarDisponibilidade
    @ExemplarCodigo INT,
    @NovoStatus VARCHAR(50)
AS
BEGIN
    
    IF EXISTS (SELECT 1 FROM EXEMPLAR WHERE Codigo = @ExemplarCodigo)
    BEGIN
        UPDATE EXEMPLAR
        SET Disponibilidade = @NovoStatus
        WHERE Codigo = @ExemplarCodigo;
        
        SELECT 'Status atualizado com sucesso.' AS Resultado, @ExemplarCodigo AS CodigoExemplar, @NovoStatus AS NovoStatus;
    END
    ELSE
    BEGIN
        SELECT 'Erro: O Código do Exemplar não foi encontrado.' AS Resultado;
    END
END
GO

-- Testando a SP 2: Altera o status do exemplar de código 1 para 'Emprestado'
EXEC sp_AtualizarDisponibilidade @ExemplarCodigo = 1, @NovoStatus = 'Emprestado';
GO
SELECT Codigo, Disponibilidade FROM EXEMPLAR WHERE Codigo = 1;
GO

-- PROCEDURE 3: Buscar Obras por Assunto e Tipo
CREATE PROCEDURE sp_BuscarObras
    @AssuntoID INT = NULL,
    @TipoObra VARCHAR(10) = NULL
AS
BEGIN
    
    SELECT
        O.Titulo_Principal,
        O.Tipo,
        O.Local,
        A.Assunto
    FROM
        OBRA O
    JOIN
        ASSUNTOS A ON O.FK_Assunto_ID = A.ID
    WHERE
        (O.FK_Assunto_ID = @AssuntoID OR @AssuntoID IS NULL) 
        AND (O.Tipo = @TipoObra OR @TipoObra IS NULL)        
    ORDER BY
        O.Titulo_Principal;
END
GO

-- Testando a SP 3: Busca todas as obras do Tipo 'Livro' com Assunto ID 6 (Literatura Clássica)
EXEC sp_BuscarObras @AssuntoID = 6, @TipoObra = 'Livro';
GO

-- PROCEDURE 4: Adicionar Autor Secundário a uma Obra
CREATE PROCEDURE sp_AdicionarAutorSecundario
    @FK_OBRA_ID INT,
    @FK_AUTORES_ID INT
AS
BEGIN
    
    IF NOT EXISTS (SELECT 1 FROM SECUNDARIOS WHERE FK_OBRA_ID = @FK_OBRA_ID AND FK_AUTORES_ID = @FK_AUTORES_ID)
    BEGIN
        INSERT INTO SECUNDARIOS (FK_OBRA_ID, FK_AUTORES_ID)
        VALUES (@FK_OBRA_ID, @FK_AUTORES_ID);
        
        SELECT 'Autor secundário adicionado com sucesso.' AS Resultado;
    END
    ELSE
    BEGIN
        SELECT 'Atenção: Este autor já está listado como secundário para esta obra.' AS Resultado;
    END
END
GO

-- Testando a SP 4: Adiciona o autor ID 10 (John Rawls) à Obra ID 2 (O Pequeno Príncipe)
EXEC sp_AdicionarAutorSecundario @FK_OBRA_ID = 2, @FK_AUTORES_ID = 10;
GO
SELECT O.Titulo_Principal, A.Nome FROM SECUNDARIOS S
JOIN OBRA O ON S.FK_OBRA_ID = O.ID
JOIN AUTORES A ON S.FK_AUTORES_ID = A.ID
WHERE S.FK_OBRA_ID = 2;
GO

-- PROCEDURE 5: Relatório de Contagem de Exemplares por Obra
CREATE PROCEDURE sp_RelatorioContagemExemplares
    @ObraID INT
AS
BEGIN
    
    SELECT
        O.Titulo_Principal,
        COUNT(E.Codigo) AS Total_Exemplares,
        SUM(CASE WHEN E.Disponibilidade = 'Disponível' THEN 1 ELSE 0 END) AS Disponiveis,
        SUM(CASE WHEN E.Disponibilidade <> 'Disponível' THEN 1 ELSE 0 END) AS Indisponiveis
    FROM
        OBRA O
    LEFT JOIN
        EXEMPLAR E ON O.ID = E.FK_OBRA_ID
    WHERE
        O.ID = @ObraID
    GROUP BY
        O.Titulo_Principal;
END
GO

-- Testando a SP 5: Gera o relatório para a Obra ID 1 (Cem Anos de Solidão), que deve ter 3 exemplares
EXEC sp_RelatorioContagemExemplares @ObraID = 1;
GO

-- CRIANDO TRIGGERS INTERESSANTES PARA O BANCO

-- Trigger AFTER -> Prevenção de Status de Exemplar Inválido
CREATE TRIGGER tr_AfterUpdate_StatusExemplar
ON EXEMPLAR
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Disponibilidade)
    BEGIN
        IF EXISTS (
            SELECT 1
            FROM inserted i
            JOIN deleted d ON i.Codigo = d.Codigo
            WHERE i.Disponibilidade = 'Emprestado' AND d.Disponibilidade = 'Emprestado'
        )
        BEGIN
            ROLLBACK TRANSACTION;
            SELECT 'Erro: Tentativa de reemprestar exemplar já marcado como Emprestado.'
        END
    END
END
GO

-- Trigger AFTER -> Remoção em Cascata de Secundários
CREATE TRIGGER tr_AfterDelete_LimparSecundarios
ON OBRA
AFTER DELETE
AS
BEGIN
    DELETE FROM SECUNDARIOS
    WHERE FK_OBRA_ID IN (SELECT ID FROM deleted);
END
GO

-- Trigger INSTEAD OF -> Evitar duplicidade em editora
CREATE TRIGGER tr_InsteadOfInsert_VerificaEditora
ON EDITORA
INSTEAD OF INSERT
AS
BEGIN
    INSERT INTO EDITORA (Nome)
    SELECT DISTINCT
        UPPER(i.Nome)
    FROM
        inserted i
    WHERE
        NOT EXISTS (SELECT 1 FROM EDITORA e WHERE UPPER(e.Nome) = UPPER(i.Nome));
    
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE EXISTS (SELECT 1 FROM EDITORA e WHERE UPPER(e.Nome) = UPPER(i.Nome))
    )
    BEGIN
        SELECT 'ALERTA: Uma ou mais editoras duplicadas foram ignoradas pelo INSTEAD OF INSERT.';
    END
END
GO

-- Trigger INSTEAD OF -> Validar Inserção em Obra
CREATE TRIGGER tr_InsteadOfInsert_ValidarTipodeObra
ON OBRA
INSTEAD OF INSERT
AS
BEGIN
    INSERT INTO OBRA (
        Titulo_Principal, Capa, Local, Data, Desc_Fisica, Numero_Chamada, Chamada_Local, 
        Titulo_Uniforme, ISBN, Serie, Edicao, Colecao, Notas_Gerais, ISSN, Volume, 
        Periodicidade, Nome, Tipo, FK_Assunto_ID, FK_Editora_ID, FK_Autores_ID
    )
    SELECT
        Titulo_Principal, Capa, Local, Data, Desc_Fisica, Numero_Chamada, Chamada_Local, 
        Titulo_Uniforme, ISBN, Serie, Edicao, Colecao, Notas_Gerais, ISSN, Volume, 
        Periodicidade, Nome, Tipo, FK_Assunto_ID, FK_Editora_ID, FK_Autores_ID
    FROM
        inserted i
    WHERE
        (i.Tipo = 'Livro' AND i.ISBN IS NOT NULL) OR 
        (i.Tipo IN ('Revista', 'Jornal') AND i.ISSN IS NOT NULL);
        
    IF EXISTS (
        SELECT 1 
        FROM inserted i
        WHERE (i.Tipo = 'Livro' AND i.ISBN IS NULL) OR 
              (i.Tipo IN ('Revista', 'Jornal') AND i.ISSN IS NULL)
    )
    BEGIN
        SELECT 'ERRO INSERÇÃO: Obras do tipo Livro requerem ISBN; Obras do tipo Revista/Jornal requerem ISSN.';
    END
END
GO

-- Views
-- VIEW 1: Catálogo Consolidado de Livros
CREATE VIEW vw_CatalogoLivros
AS
SELECT
    O.ID AS ObraID,
    O.Titulo_Principal,
    O.Data AS AnoPublicacao,
    O.ISBN,
    O.Edicao,
    O.Desc_Fisica,
    A.Nome AS AutorPrincipal,
    E.Nome AS Editora,
    ASS.Assunto
FROM
    OBRA O
JOIN
    AUTORES A ON O.FK_Autores_ID = A.ID
JOIN
    EDITORA E ON O.FK_Editora_ID = E.ID
JOIN
    ASSUNTOS ASS ON O.FK_Assunto_ID = ASS.ID
WHERE
    O.Tipo = 'Livro';
GO

SELECT * FROM vw_CatalogoLivros WHERE Editora = 'Companhia das Letras';
GO

-- VIEW 2: Dashboard de Estoque e Disponibilidade
CREATE VIEW vw_EstoqueDisponibilidade
AS
SELECT
    O.ID AS ObraID,
    O.Titulo_Principal,
    O.Tipo,
    COUNT(E.Codigo) AS TotalExemplares,
    SUM(CASE WHEN E.Disponibilidade = 'Disponível' THEN 1 ELSE 0 END) AS DisponiveisParaEmprestimo,
    SUM(CASE WHEN E.Disponibilidade <> 'Disponível' THEN 1 ELSE 0 END) AS Indisponiveis
FROM
    OBRA O
LEFT JOIN
    EXEMPLAR E ON O.ID = E.FK_OBRA_ID
GROUP BY
    O.ID, O.Titulo_Principal, O.Tipo;
GO

-- Lista as 5 obras com maior quantidade de exemplares indisponíveis
SELECT TOP 5 Titulo_Principal, TotalExemplares, Indisponiveis
FROM vw_EstoqueDisponibilidade
WHERE Indisponiveis > 0
ORDER BY Indisponiveis DESC;
GO

-- VIEW 3: Relação de Obras e Autores Secundários
CREATE VIEW vw_AutoresSecundarios
AS
SELECT
    O.ID AS ObraID,
    O.Titulo_Principal,
    O.Tipo,
    A.Nome AS AutorSecundario,
    A.Nacionalidade
FROM
    OBRA O
JOIN
    SECUNDARIOS S ON O.ID = S.FK_OBRA_ID
JOIN
    AUTORES A ON S.FK_AUTORES_ID = A.ID;
GO

-- Busca todas as obras que possuem o autor ID 1 (Gabriel García Márquez) como autor secundário
SELECT Titulo_Principal, Tipo, AutorSecundario
FROM vw_AutoresSecundarios
WHERE AutorSecundario = 'Gabriel García Márquez';
GO

-- Criando um login para o banco
use MUSEU;
CREATE LOGIN adm WITH PASSWORD = '123';
GO

CREATE USER admin FOR LOGIN adm;
GO

EXEC sp_addrolemember 'db_datareader','admin';
GO

EXEC sp_addrolemember 'db_datawriter','admin';
GO
