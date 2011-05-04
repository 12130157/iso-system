IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getAllKeyword1CuPhap')

BEGIN
	Drop Proc sp_getAllKeyword1CuPhap
End
Go
Create PROC sp_getAllKeyword1CuPhap
	@Ten Varchar(40)
AS
BEGIN
	IF EXISTS (select * from CuPhap where Ten=@ten )
	BEGIN	
		select Ten,Cum_tu_1 from CuPhap where Ten=@ten group by Ten, Cum_tu_1
		
	END
END
--
--select * from LoaiHopThu
exec sp_getAllKeyword1CuPhap 'Diem'