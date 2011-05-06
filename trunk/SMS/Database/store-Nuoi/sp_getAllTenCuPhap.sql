IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getAllTenCuPhap')

BEGIN
	Drop Proc sp_getAllTenCuPhap
End
Go
Create PROC sp_getAllTenCuPhap
AS
BEGIN
	select Cum_tu_1 from CuPhap group by Cum_tu_1
END
--
--select * from LoaiHopThu
exec sp_getAllTenCuPhap