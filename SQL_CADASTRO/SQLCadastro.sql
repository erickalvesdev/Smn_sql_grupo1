CREATE DATABASE smningatreinamentogrupo1
USE smningatreinamentogrupo1

-- CRIANDO TABELA DE CADASTRO

CREATE TABLE Cadastro_Colaborador(
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


create procedure [dbo].[SP_inscolaborador](
@empresa varchar (50),
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

create procedure [dbo].[SP_insTipo](
@tipo varchar (80)
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


create procedure [dbo].[SP_inscontato](
@id_cc int,
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

CREATE PROC [dbo].[Sp_Sel_Cliente](
	   			@Id_CC INT = NULL,  
	            @Empresa VARCHAR(50) = NULL, 
				@nome varchar (255) = NULL, 
				@email varchar(300) = NULL, 
				@cargo varchar(50) = NULL, 
				@Cidade VARCHAR (50)= NULL,
				@DDD TINYINT = NULL,
                @Numero BIGINT = NULL,
				@Whatsapp BIT = NULL
				)

AS
/*
DOCUMENTAÇÃO
ARQUIVO FONTE.....: Sp_Sel_Cliente.SQL
OBJETIVO..........: FAZER A JUNÇÃO DAS TABELAS CADASTRO DO CLIENTE E CONTATO
AUTOR.............: SMN - ERICK ALVES
DATA..............: 12/12/2023
EX................: EXEC [dbo].[Sp_Sel_Cliente] NULL, 'SMN', NULL, NULL, NULL, NULL, NULL, NULL
*/

	BEGIN

		SELECT CC.Id_CC AS Identificação, CC.Empresa, CC.Nome, CC.Email, CONCAT('(',C.DDD, ')', ' ', C.Numero) AS Telefone, IIF(C.Whatsapp = 1, 'SIM', 'NÃO') AS Whatsapp, CC.Cargo, CC.Cidade
		FROM Cadastro_Colaborador CC
			INNER JOIN Contato C 
		ON CC.Id_CC = C.Id_CC
		WHERE (@Id_CC IS NULL OR CC.Id_CC = @Id_CC) AND
		 	  (@Empresa IS NULL OR CC.Empresa = @Empresa) AND
		      (@Nome IS NULL OR CC.Nome = @Nome) AND
			  (@Email IS NULL OR CC.Email = @Email) AND
			  (@Cargo IS NULL OR CC.Cargo = @Cargo) AND
			  (@Cidade IS NULL OR CC.Cidade = @Cidade) AND
			  (@DDD IS NULL OR C.DDD = @DDD) AND
			  (@Numero IS NULL OR C.Numero = @Numero) AND
			  (@Whatsapp IS NULL OR C.Whatsapp = @Whatsapp) 

    END
GO

EXEC [dbo].[Sp_Sel_Cliente] NULL, 'SMN', NULL, NULL, NULL, NULL, NULL, NULL