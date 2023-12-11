use smningatreinamentogrupo1

-- CRIANDO TABELA DE CADASTRO

CREATE TABLE Cadastro_Colaborador (
	Id_CC INT PRIMARY KEY IDENTITY NOT NULL,
	Empresa VARCHAR (50) NOT NULL,
	Nome VARCHAR (255) NOT NULL,
	Email VARCHAR (300) NOT NULL,
	Cargo VARCHAR (50) NOT NULL,
	Cidade VARCHAR (50)
	)

-- CRIANDO TABELA DE TIPO DE CONTATO

CREATE TABLE Tipo_Contato (
	Id_Tipo INT PRIMARY KEY IDENTITY NOT NULL,
	Tipo VARCHAR (20) NOT NULL
    )

-- CRIANDO TABELA DE CONTATO

CREATE table  Contato (
	Id_Contato INT PRIMARY KEY IDENTITY NOT NULL,
	Id_CC INT NOT NULL,
	Id_Tipo INT NOT NULL,
	DDD TINYINT NOT NULL,
	Numero BIGINT NOT NULL,
	Whatsapp BIT NOT NULL,
	FOREIGN KEY (Id_CC) REFERENCES Cadastro_Colaborador (Id_CC),
	FOREIGN KEY (Id_Tipo) REFERENCES Tipo_Contato (Id_Tipo)
	)


CREATE PROC [dbo].[JOIN_CLIENTE](
	              @empresa, 
				  @nome, 
				  @email, 
				  @cargo, 
				  @Cidade,
				  @DDD,
                  @Numero,
				  @Whatsapp
				  )

AS
/*
DOCUMENTAÇÃO
ARQUIVO FONTE.....: SJOIN_CLIENTE.SQL
OBJETIVO..........: FAZER A JUNÇÃO DAS TABELAS CADASTRO DO CLIENTE E CONTATO
AUTOR.............: SMN - ERICK ALVES
DATA..............: 11/12/2023
EX................: EXEC [dbo].[JOIN_CLIENTE] @Empresa, @Nome, @Email, @Cargo, @Cidade, @DDD, @Numero, @Whatsapp
*/
	BEGIN
		SELECT CC.EMPRESA, CC.NOME, CC.EMAIL, CC.CARGO, CC.CIDADE, C. 
		FROM Cadastro_Colaborador CC
		INNER JOIN Contato C 
		ON CC.Id_C = C.Id_C
		WHERE (@empresa IS NULL OR CC.Empresa = @Empresa) AND
		      (@Nome IS NULL OR CC.Nome = @Nome) AND
			  (@Email IS NULL OR CC.Email = @Email) AND
			  (@Cargo IS NULL OR CC.Cargo = @Cargo) AND
			  (@Cidade IS NULL OR CC.Cidade = @Cidade) AND
			  (@DDD IS NULL OR CC.DDD = @DDD) AND
			  (@Numero IS NULL OR CC.Numero = @Numero) AND
			  (@Whatsapp IS NULL OR CC.Whatsapp = @Whatsapp) 

    END
GO

EXEC [dbo].[JOIN_CLIENTE] @Empresa, @Nome, @Email, @Cargo, @Cidade, @DDD, @Numero, @Whatsapp