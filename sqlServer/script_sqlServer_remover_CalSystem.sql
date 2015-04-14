--lista todas as constraints da base Sql Server

SELECT 
 KCU1.CONSTRAINT_NAME AS 'FK_Nome_Constraint'
 , KCU1.TABLE_NAME AS 'FK_Nome_Tabela'
 , KCU1.COLUMN_NAME AS 'FK_Nome_Coluna'
 , FK.is_disabled AS 'FK_Esta_Desativada'
 , KCU2.CONSTRAINT_NAME AS 'PK_Nome_Constraint_Referenciada'
 , KCU2.TABLE_NAME AS 'PK_Nome_Tabela_Referenciada'
 , KCU2.COLUMN_NAME AS 'PK_Nome_Coluna_Referenciada'
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS RC
JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KCU1
ON KCU1.CONSTRAINT_CATALOG = RC.CONSTRAINT_CATALOG 
 AND KCU1.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA
 AND KCU1.CONSTRAINT_NAME = RC.CONSTRAINT_NAME
JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KCU2
ON KCU2.CONSTRAINT_CATALOG = RC.UNIQUE_CONSTRAINT_CATALOG 
 AND KCU2.CONSTRAINT_SCHEMA = RC.UNIQUE_CONSTRAINT_SCHEMA
 AND KCU2.CONSTRAINT_NAME = RC.UNIQUE_CONSTRAINT_NAME
 AND KCU2.ORDINAL_POSITION = KCU1.ORDINAL_POSITION
JOIN sys.foreign_keys FK on FK.name = KCU1.CONSTRAINT_NAME
Order by 
KCU1.TABLE_NAME;


---------------------------------------CURSOR PARA REMOVER CONSTRAINTS DA BASE---------------------------------------


Declare cursorConstraints Cursor For
--SELECT 'FK_Nome_Constraint'  (
SELECT 'ALTER TABLE  '+ KCU1.TABLE_NAME + '  DROP CONSTRAINT  '+ KCU1.CONSTRAINT_NAME,
	  -- 'ALTER TABLE ' comando1,
	 --  ' DROP CONSTRAINT ' comando2,
 KCU1.CONSTRAINT_NAME AS 'FK_Nome_Constraint'
 , KCU1.TABLE_NAME AS 'FK_Nome_Tabela'
 , KCU1.COLUMN_NAME AS 'FK_Nome_Coluna'
 , FK.is_disabled AS 'FK_Esta_Desativada'
 , KCU2.CONSTRAINT_NAME AS 'PK_Nome_Constraint_Referenciada'
 , KCU2.TABLE_NAME AS 'PK_Nome_Tabela_Referenciada'
 , KCU2.COLUMN_NAME AS 'PK_Nome_Coluna_Referenciada'
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS RC
JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KCU1
ON KCU1.CONSTRAINT_CATALOG = RC.CONSTRAINT_CATALOG 
 AND KCU1.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA
 AND KCU1.CONSTRAINT_NAME = RC.CONSTRAINT_NAME
JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KCU2
ON KCU2.CONSTRAINT_CATALOG = RC.UNIQUE_CONSTRAINT_CATALOG 
 AND KCU2.CONSTRAINT_SCHEMA = RC.UNIQUE_CONSTRAINT_SCHEMA
 AND KCU2.CONSTRAINT_NAME = RC.UNIQUE_CONSTRAINT_NAME
 AND KCU2.ORDINAL_POSITION = KCU1.ORDINAL_POSITION
JOIN sys.foreign_keys FK on FK.name = KCU1.CONSTRAINT_NAME
--Order by 
--KCU1.TABLE_NAME
--)

DECLARE @param0 nvarchar(100)
DECLARE @param1 nvarchar(100)
DECLARE @param2 nvarchar(100)
DECLARE @param3 nvarchar(100)
DECLARE @param4 nvarchar(100)
DECLARE @param5 nvarchar(100)
DECLARE @param6 nvarchar(100)
DECLARE @param7 nvarchar(100)

DECLARE @contador int

DECLARE @SQLString nvarchar(500);
DECLARE @ParmDefinition nvarchar(500);

DECLARE @find nvarchar(30) = '123'; 
--SET @find = 'Man%'; 

set @contador = 0

--BEGIN TRANSACTION

Open cursorConstraints

Fetch next From cursorConstraints into @param0, @param1 , @param2, @param3, @param4, @param5, @param6, @param7

print @@Fetch_Status 
print @@CURSOR_ROWS

--set @contador = @@CURSOR_ROWS

While @@Fetch_Status=0 
Begin
	--print @employee_table
	--ALTER TABLE [Nome da Tabela] NOCHECK CONSTRAINT ALL 
	--ALTER TABLE [Nome da Tabela] CHECK CONSTRAINT [Nome da Constraint]
	--ALTER TABLE table DROP CONSTRAINT Con_First;

--SET @SQLString = N'ALTER TABLE @param2 DROP CONSTRAINT @param1 ;';
--SET @ParmDefinition = N'@param2 nvarchar(100)';
--EXECUTE sp_executesql N'PRINT ',@find;


EXECUTE sp_executesql @param0;

SET @contador = @contador + 1;
   Fetch next From cursorConstraints into @param0, @param1 , @param2, @param3, @param4, @param5, @param6, @param7
End

print 'total de registros ' +  CONVERT(varchar(12), @contador, 101) 

Close cursorConstraints
Deallocate cursorConstraints;

------------------------------------------------SCRIPT REMOVE TABELAS DA BASE---------------------------------------------------------------------


Declare cursorConstraints Cursor For
SELECT 'DROP TABLE  ' + name + ';' FROM SYSOBJECTS WHERE XTYPE='U'

DECLARE @param0 nvarchar(100)

DECLARE @contador int

set @contador = 0

--BEGIN TRANSACTION

Open cursorConstraints

Fetch next From cursorConstraints into @param0

While @@Fetch_Status=0 
Begin

EXECUTE sp_executesql @param0;

SET @contador = @contador + 1;
   Fetch next From cursorConstraints into @param0
End

print 'total de registros ' +  CONVERT(varchar(12), @contador, 101) 

Close cursorConstraints
Deallocate cursorConstraints;



