/********************************************************
*********************************************************
**************** TABELA tbl_excecao *********************
*********************************************************
********************************************************/

select * from tbl_excecao order by id desc;

insert into tbl_excecao 
values 
	('2015-03-21', '2015-03-21', 'ATIVO', '999', 'Erro de Sistema');
    
insert into tbl_excecao 
values 
	('2015-03-21', '2015-03-21', 'ATIVO', '100', 'Erro de Perif�rico');
    
insert into tbl_excecao 
values 
	('2015-03-21', '2015-03-21', 'ATIVO', '200', 'Erro de Login');
    
insert into tbl_excecao 
values 
	('2015-03-21', '2015-03-21', 'ATIVO', '300', 'Erro de Token');

insert into tbl_excecao 
values 
	( '2015-03-21', '2015-03-21', 'ATIVO', '400', 'Erro de Conta');
    
insert into tbl_excecao 
values 
	('2015-03-21', '2015-03-21', 'ATIVO', '500', 'Erro de Voucher');


/********************************************************
*********************************************************
************* TABELA tbl_excecao_detalhe ****************
*********************************************************
********************************************************/

select * from tbl_excecao_detalhe  order by id desc;

-- Erro de Sistema
insert into tbl_excecao_detalhe 
values 
	( '2015-03-21', '2015-03-21', 'ATIVO', '001', 'N�o foi poss�vel processar sua solicita��o!', 1);
    
-- Erro de Perif�rico
insert into tbl_excecao_detalhe 
values 
	( '2015-03-21', '2015-03-21', 'ATIVO', '001', 'O Perif�rico informado n�o est� cadastrado para acessar o Sistema!', 2);
    
insert into tbl_excecao_detalhe 
values 
	( '2015-03-21', '2015-03-21', 'ATIVO', '002', 'Perif�rico inv�lido ou n�o informado!', 2);

-- Erro de Login
insert into tbl_excecao_detalhe 
values 
	( '2015-03-21', '2015-03-21', 'ATIVO', '001', 'Login inv�lido ou n�o informado!', 3);
    
-- Erro de Token
insert into tbl_excecao_detalhe 
values 
	('2015-03-21', '2015-03-21', 'ATIVO', '001', 'O Token informado � inv�lido ou expirou!', 4);

insert into tbl_excecao_detalhe 
values 
	( '2015-03-21', '2015-03-21', 'ATIVO', '002', 'O Token de Login informado � inv�lido ou expirou!', 4);

insert into tbl_excecao_detalhe 
values 
	( '2015-03-21', '2015-03-21', 'ATIVO', '003', 'Nenhum Token foi informado!', 4);
    
insert into tbl_excecao_detalhe 
values 
	( '2015-03-21', '2015-03-21', 'ATIVO', '004', 'O Token de Sess�o n�o foi informado!', 4);

insert into tbl_excecao_detalhe 
values 
	( '2015-03-21', '2015-03-21', 'ATIVO', '005', 'O Token de Login n�o foi informado!', 4);
    
insert into tbl_excecao_detalhe 
values 
	( '2015-03-21', '2015-03-21', 'ATIVO', '006', 'O Token de Sess�o informado � inv�lido ou expirou!', 4);

insert into tbl_excecao_detalhe 
values 
	( '2015-03-21', '2015-03-21', 'ATIVO', '007', 'O Token de Transa��o informado � inv�lido ou expirou!', 4);

insert into tbl_excecao_detalhe 
values 
	( '2015-03-21', '2015-03-21', 'ATIVO', '008', 'O Token de Transa��o n�o foi informado!', 4);
    
-- Erro de Conta
insert into tbl_excecao_detalhe 
values 
	( '2015-03-21', '2015-03-21', 'ATIVO', '001', 'CPF inv�lido ou n�o informado!', 5);
    
-- Erro de Voucher
insert into tbl_excecao_detalhe 
values 
	( '2015-03-21', '2015-03-21', 'ATIVO', '001', 'Nenhum Voucher foi encontrado!', 6);

insert into tbl_excecao_detalhe 
values 
	( '2015-03-21', '2015-03-21', 'ATIVO', '002', 'O Voucher informado j� foi gerado!', 6);

insert into tbl_excecao_detalhe 
values 
	( '2015-03-21', '2015-03-21', 'ATIVO', '003', 'O Voucher informado j� foi utilizado!', 6);
    
insert into tbl_excecao_detalhe 
values 
	( '2015-03-21', '2015-03-21', 'ATIVO', '004', 'O Voucher informado est� expirado!', 6);

insert into tbl_excecao_detalhe 
values 
	( '2015-03-21', '2015-03-21', 'ATIVO', '005', 'O Voucher informado est� cancelado!', 6);

insert into tbl_excecao_detalhe 
values 
	( '2015-03-21', '2015-03-21', 'ATIVO', '006', 'O status do Voucher informado � inv�lido!', 6);



-------------------------------------------------------------------------------------------------------------

insert into tbl_periferico (data_atualizacao,data_registro,status,codigo,descricao)
values (GETDATE(),GETDATE(),'A','945439','pdv');

insert into tbl_perfil (data_atualizacao,data_registro,status,codigo,nome) 
values (GETDATE(),GETDATE(),'ATIVO','1','super');

insert into tbl_usuario  (data_atualizacao,data_registro,status ,cpf,login,nome,senha,id_perfil) 
values ( GETDATE(),GETDATE(),'ATIVO','01937043070','asd','asd','asd',1);

INSERT INTO [tbl_parametro_global]
           ([data_atualizacao]
           ,[data_registro]
           ,[status]
           ,[descricao]
           ,[nome]
           ,[tipo]
           ,[valor_booleano]
           ,[valor_inteiro]
           ,[valor_texto])
     VALUES
           (GETDATE(),
           GETDATE(),
           'ATIVO',
           'ATIVO',
           'VALIDA_TOKEN',
           'BOOLEANO',
           'N',
           NULL,
           NULL);

insert into tbl_lojista (data_atualizacao,data_registro,status,codigo,nome)
values (GETDATE(),GETDATE(),'ATIVO',1,'Loja');

insert into tbl_estabelecimento (data_atualizacao,data_registro,status,cnpj,codigo,id_lojista)
values (GETDATE(),GETDATE(),'ATIVO','45701937043070',20,1);

insert into tbl_CONTA (data_atualizacao,data_registro,status,cpf,data_cadastro,ddd_celular,id_conta_externa,nome_cliente,numero_celular,id_estabelecimento)
values (GETDATE(),GETDATE(),'DISPONIVEL','01937043070',GETDATE(),'51','10','Elias Teste','82942676','1');


insert into tbl_cartao (data_atualizacao,data_registro,status,cpf,data_Cadastro,data_validade,nome_portador,numero,senha,titular,id_conta)
values (GETDATE(),GETDATE(),'ATIVO','01937043070',GETDATE(),GETDATE(),'ELIAS TESTE','1245352145782145','1234','S','1');

insert into tbl_voucher (data_atualizacao,data_registro,status,codigo,data_geracao,id_conta)
values (GETDATE(),GETDATE(),'DISPONIVEL','1020',GETDATE(),1);

insert into tbl_menu (id_menu,id_submenu,descricao,nome) 
values (4,2,null,'Alterar Senha');