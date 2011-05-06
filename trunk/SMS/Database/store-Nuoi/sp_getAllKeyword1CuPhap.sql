IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getAllKeyword1CuPhap')

BEGIN
	Drop Proc sp_getAllKeyword1CuPhap
End
Go
Create PROC sp_getAllKeyword1CuPhap
	@Cum_tu_1 Varchar(10)
AS
BEGIN
	IF EXISTS (select * from CuPhap where Cum_tu_1=@Cum_tu_1 )
	BEGIN	
		select Cum_tu_1,Cum_tu_2 from CuPhap where Cum_tu_1=@Cum_tu_1 group by Cum_tu_1, Cum_tu_2
		
	END
END
--
--select * from CuPhap where Cum_tu_1='HVD'
exec sp_getAllKeyword1CuPhap 'Diem'