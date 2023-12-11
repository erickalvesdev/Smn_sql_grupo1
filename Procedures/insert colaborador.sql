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
			documenta��o
			Arquivo fonte .......cadastro_colaborador
			Objetivo.............Fazendo inclementa��o de dados
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
			documenta��o
			Arquivo fonte .......cadastro_colaborador
			Objetivo.............Fazendo inclementa��o de dados
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
			documenta��o
			Arquivo fonte .......cadastro_colaborador
			Objetivo.............Fazendo inclementa��o de dados
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
