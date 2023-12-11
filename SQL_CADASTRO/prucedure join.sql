
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