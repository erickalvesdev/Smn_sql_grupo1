
--Procedure Inner Join --

CREATE PROC [dbo].[SP_Sel_Cliente](
                  @Id_CC INT = NULL,
				  @Id_Contato INT = NULL,
	              @Empresa VARCHAR(50)= NULL,
				  @Nome VARCHAR(255)= NULL,
				  @Email VARCHAR(300)= NULL,
				  @Cargo VARCHAR(50)= NULL,
				  @Cidade VARCHAR(50)= NULL,
				  @DDD TINYINT = NULL,
                  @Numero BIGINT = NULL,
				  @Whatsapp BIT = NULL
				  )

AS
/*
DOCUMENTAÇÃO
ARQUIVO FONTE.....: SP_Sel_Cliente.SQL
OBJETIVO..........: FAZER A JUNÇÃO DAS TABELAS CADASTRO DO CLIENTE E CONTATO
AUTOR.............: SMN - ERICK ALVES
DATA..............: 11/12/2023
EX................: EXEC [dbo].[SP_Sel_Cliente] NULL, NULL, 'smn', NULL,NULL, NULL,NULL,NULL, NULL, NULL
*/
	BEGIN
		SELECT CC.Id_CC,CC.EMPRESA, CC.NOME, CC.EMAIL, CC.CARGO, CC.CIDADE, Concat ('(',C.DDD, ')', ' ', C.Numero) AS CONTATO, C.Whatsapp
		FROM Cadastro_Colaborador CC
			INNER JOIN Contato C 
		ON CC.Id_CC = C.Id_Contato
		WHERE (@Id_CC IS NULL OR CC.Id_CC = @Id_CC) AND
			  (@Id_Contato is null or C.Id_Contato =@Id_Contato) and
              (@empresa IS NULL OR CC.Empresa = @Empresa) AND
		      (@Nome IS NULL OR CC.Nome = @Nome) AND
			  (@Email IS NULL OR CC.Email = @Email) AND
			  (@Cargo IS NULL OR CC.Cargo = @Cargo) AND
			  (@Cidade IS NULL OR CC.Cidade = @Cidade) AND
			  (@DDD IS NULL OR C.DDD = @DDD) AND
			  (@Numero IS NULL OR C.Numero = @Numero) AND
			  (@Whatsapp IS NULL OR C.Whatsapp = @Whatsapp)

    END
GO

EXEC [dbo].[SP_Sel_Cliente] NULL, NULL, 'smn', NULL,NULL, NULL,NULL, NULL