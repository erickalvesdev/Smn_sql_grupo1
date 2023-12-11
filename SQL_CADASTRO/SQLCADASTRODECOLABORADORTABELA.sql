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
                  @Id_CC INT,
	              @empresa VARCHAR(50), 
				  @nome VARCHAR(255), 
				  @email VARCHAR(300), 
				  @cargo VARCHAR(50), 
				  @Cidade VARCHAR(50),
				  @DDD TINYINT,
                  @Numero BIGINT,
				  @Whatsapp BIT
				  )

AS
/*
DOCUMENTAÇÃO
ARQUIVO FONTE.....: SJOIN_CLIENTE.SQL
OBJETIVO..........: FAZER A JUNÇÃO DAS TABELAS CADASTRO DO CLIENTE E CONTATO
AUTOR.............: SMN - ERICK ALVES
DATA..............: 11/12/2023
EX................: EXEC [dbo].[JOIN_CLIENTE] @Empresa, @Nome, @Email, @Cargo, @Cidade, @DDD, @Numero, @Whatsapp.
*/
	BEGIN
		SELECT CC.EMPRESA, CC.NOME, CC.EMAIL, CC.CARGO, CC.CIDADE, C.DDD, C.Numero, C.Whatsapp
		FROM Cadastro_Colaborador CC
		INNER JOIN Contato C 
		ON CC.Id_C = C.Id_C
		WHERE (@Id_CC IS NULL OR CC.Id_CC = @Id_CC) AND
              (@empresa IS NULL OR CC.Empresa = @Empresa) AND
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

-------------------------------------------------------------------
-- insert colaborador
------------------------------------------------------------------

create procedure sp_inscolaborador
(@empresa varchar (50),
@nome varchar (255),
@email varchar(300),
@cidade varchar(50),
@cargo varchar(50)
)
as 
		/*			
			documentação
			Arquivo fonte .......cadastro_colaborador
			Objetivo.............Fazendo inplementa��o de dados
			Autor................Henrique Oliveira Nascimento Dos Santos
			Data.................10/12/2023
			ex...................exec [ddb].[sp_inscolaborador]
		*/
	begin 
		insert into Cadastro_Colaborador (Empresa,Nome,Email,Cidade,Cargo)
		values (@empresa,@nome,@email,@cidade,@cargo)
	end
go

exec [dbo].[sp_inscolaborador]  'smn','Henrique','teste23@gmail.com1','inga','Desenvovedor'
exec [dbo].[sp_inscolaborador]  'smn','Alcymario','teste23@gmail.com2','inga','Desenvovedor'
exec [dbo].[sp_inscolaborador]  'smn','Jo�o','teste23@gmail.com3','inga','Desenvovedor'
exec [dbo].[sp_inscolaborador]  'smn','Julia','teste23@gmail.com4','inga','Analista'
exec [dbo].[sp_inscolaborador]  'smn','Erick','teste23@gmail.com5','inga','Analista'



-----------------------------------------------
--insert tipo
-----------------------------------------------

create procedure sp_insTipo
(@tipo varchar (80)
)

as
		/*			
			documentação
			Arquivo fonte .......cadastro_colaborador
			Objetivo.............Fazendo inplementa��o de dados
			Autor................Henrique Oliveira Nascimento Dos Santos
			Data.................10/12/2023
			ex...................exec [dbo].[sp_insTipo]
		*/
	begin
		insert into Tipo_Contato (tipo)
		values (@tipo)
	end
go

exec [dbo].[sp_insTipo] 'Celular'
exec [dbo].[sp_insTipo] 'Notbook'
exec [dbo].[sp_insTipo] 'Fixo'
exec [dbo].[sp_insTipo] 'Celular'
exec [dbo].[sp_insTipo] 'PC'



-------------------------------------------------------
-- insert contato
------------------------------------------------------


create procedure sp_inscontato
(@id_cc int,
@id_tipo int,
@ddd bigint,
@numero bigint,
@whatsapp bit
)

as 
		/*			
			documentação
			Arquivo fonte .......cadastro_colaborador
			Objetivo.............Fazendo inplementação de dados
			Autor................Henrique Oliveira Nascimento Dos Santos
			Data.................10/12/2023
			ex...................exec [dbo].[sp_inscontato]
		*/
	begin
    	insert into contato (Id_CC,Id_Tipo,DDD,Numero,Whatsapp)
    	values (@id_cc,@id_tipo,@ddd,@numero,@whatsapp)
     
	end
go

exec [dbo].[sp_inscontato] 1,1,83,987130312,1
exec [dbo].[sp_inscontato] 2,2,83,991836596,1
exec [dbo].[sp_inscontato] 3,3,83,998015325,1
exec [dbo].[sp_inscontato] 4,4,83,982090355,1
exec [dbo].[sp_inscontato] 5,5,83,993426874,1

--Procedure Inner Join --

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
EX................: EXEC [dbo].[JOIN_CLIENTE] @Empresa, @Nome, @Email, @Cargo, @Cidade, @DDD, @Numero, @Whatsapp.
*/
	BEGIN
		SELECT CC.EMPRESA, CC.NOME, CC.EMAIL, CC.CARGO, CC.CIDADE, C.DDD, C.Numero, C.Whatsapp
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
