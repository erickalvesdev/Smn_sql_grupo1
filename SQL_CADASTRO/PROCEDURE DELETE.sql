------------------------------------------------------------------
 -- PROCEDURE PARA DELETAR DADOS DA TABELA Cadastro_Colaboprador
------------------------------------------------------------------

CREATE PROC [dbo].[SP_DelColaborador] (
@Id_CC INT,
@Empresa VARCHAR (50),
@Nome VARCHAR (255),
@Email VARCHAR (300),
@Cargo VARCHAR (50),
@Cidade VARCHAR (50)
)

AS 
		/* 
				DOCUMENTAÇÃO
				ARQUIVO FONTE.....: SQLCADASTRODECOLABORADOR.sql
				OBJETIVO..........: Deletando dados na tabela por meio da procedure
				AUTOR.............: SMN - ALCYMÁRIO GABRIEL
				DATA..............: 30/11/2023
				EX................: DECLARE SP_DelColaborador
									EXEC [dbo].[SP_DelColaborador] 1, 'smn','Henrique','teste23@gmail.com1','Desenvovedor','inga'
								
												
		*/

	BEGIN 
		DELETE FROM Cadastro_Colaborador
		WHERE Id_CC = @Id_CC AND 
			  Empresa = @Empresa AND
			  Nome = @Nome AND 
			  Email = @Email AND 
			  Cargo = @Cargo AND
			  Cidade = @Cidade
	END
GO

------------------------------------------------------------------
-- PROCEDURE PARA DELETAR DADOS DA TABELA Tipo_Contato
------------------------------------------------------------------

CREATE PROC  [dbo].[SP_DelTipoContato] (
@Id_Tipo INT,
@Tipo VARCHAR (20)
)

AS
	/* 
				DOCUMENTAÇÃO
				ARQUIVO FONTE.....: SQLCADASTRODECOLABORADOR.sql
				OBJETIVO..........: Deletando dados na tabela por meio da procedure
				AUTOR.............: SMN - ALCYMÁRIO GABRIEL
				DATA..............: 30/11/2023
				EX................: DECLARE SP_DelTipoContato]
									EXEC [dbo].[SP_DelTipoContato] 1, 'Celular' 
								
												
		*/
	BEGIN
		DELETE FROM Tipo_Contato
		WHERE Id_Tipo = @Id_Tipo AND
			  Tipo = @Tipo
	END
GO


------------------------------------------------------------------
-- PROCEDURE PARA DELETAR DADOS DA TABELA Contato
------------------------------------------------------------------

CREATE PROC  [dbo].[SP_DelContato] (
@Id_CC INT,
@Id_Tipo INT,
@DDD TINYINT,
@Numero BIGINT,
@Whatsapp BIT
)

   AS

	/* 
				DOCUMENTAÇÃO
				ARQUIVO FONTE.....: SQLCADASTRODECOLABORADOR.sql
				OBJETIVO..........: Deletando dados na tabela por meio da procedure
				AUTOR.............: SMN - ALCYMÁRIO GABRIEL
				DATA..............: 30/11/2023
				EX................: DECLARE [dbo].[SP_DelTipoContato]
									EXEC [dbo].[SP_DelContato] 3,3,83,998015325,1
									
								
											
		*/

	BEGIN
		DELETE  FROM Contato
		WHERE Id_CC = @Id_CC AND
			  Id_Tipo = @Id_Tipo AND
			  DDD = @DDD AND
			  Numero = @Numero AND
			  Whatsapp = @Whatsapp
	END
GO


		
		