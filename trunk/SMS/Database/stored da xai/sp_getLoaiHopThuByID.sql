IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getLoaiHopThuByID')

BEGIN
	Drop Proc sp_getLoaiHopThuByID
End
Go
Create PROC sp_getLoaiHopThuByID
	@ID INT
AS
BEGIN
	IF EXISTS (SELECT * FROM LoaiHopThu WHERE ID = @ID)
	BEGIN	
		SELECT * FROM LoaiHopThu  
		WHERE ID = @ID
		
	END
END
--
--select * from LoaiHopThu
exec sp_getLoaiHopThuByID '1'