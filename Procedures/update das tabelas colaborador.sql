-----------------------------------------------------------------------
--update colaborador
-----------------------------------------------------------------------

create procedure sp_updColaborador
(@id_CC int,
@empresa varchar (50),
@nome varchar(255),
@email varchar(300),
@cidade varchar(50),
@cargo varchar(50)
)

as
		/*			
			documenta��o
			Arquivo fonte .......cadastro_colaborador
			Objetivo.............Fazendo update de dados
			Autor................Henrique Oliveira Nascimento Dos Santos
			Data.................10/12/2023
			ex...................exec [dbo].[sp_updColaborador]
		*/
begin 
     update Cadastro_Colaborador
	 set Empresa = @empresa, nome = @nome,email = @email, cidade = @cidade, cargo = cargo
	 where Id_CC = @id_cc
end
go

exec [dbo].[sp_updColaborador] 1,'smn','henry','rike@12','inga','dev'



-----------------------------------------------------------
--update tipo
-----------------------------------------------------------
create procedure sp_updTipo
(@tipo varchar (20),
@id_tipo int
)

as 
		/*			
			documenta��o
			Arquivo fonte .......cadastro_colaborador
			Objetivo.............Fazendo update de dados
			Autor................Henrique Oliveira Nascimento Dos Santos
			Data.................10/12/2023
			ex...................exec [dbo].[sp_updTipo]
		*/
begin
     update Tipo_Contato 
	 set Tipo = @tipo
	 where Id_Tipo = @id_tipo
end
go

exec [dbo].[sp_updTipo] 'telefone',1


--------------------------------------------------------------
-- update contato
--------------------------------------------------------------

create procedure sp_updcontato
(@id_cc int,
@id_tipo int,
@ddd bigint,
@numero bigint,
@whatsapp bit
)

as 
		/*			
			documenta��o
			Arquivo fonte .......cadastro_colaborador
			Objetivo.............Fazendo update de dados
			Autor................Henrique Oliveira Nascimento Dos Santos
			Data.................10/12/2023
			ex...................exec [dbo].[sp_updcontato]
		*/
begin
     update Contato 
	 set ddd = @ddd, Numero = @numero, whatsapp = @whatsapp
	 where Id_CC = @id_cc and Id_Tipo = @id_tipo
end
go

exec [dbo].[sp_updcontato] 1,1,82,987121212,1

