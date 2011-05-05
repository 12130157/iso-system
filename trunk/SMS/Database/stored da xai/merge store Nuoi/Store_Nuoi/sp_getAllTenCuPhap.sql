IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getAllTenCuPhap')

BEGIN
	Drop Proc sp_getAllTenCuPhap
End
Go
Create PROC sp_getAllTenCuPhap
AS
BEGIN
	select Ten from CuPhap group by Ten
END
--
--select * from LoaiHopThu
exec sp_getAllTenCuPhap