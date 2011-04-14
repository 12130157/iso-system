IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_SMS_DeleteLoaiHopThu')

BEGIN
	Drop Proc sp_SMS_DeleteLoaiHopThu
End
Go
Create PROC sp_SMS_DeleteLoaiHopThu
	@ID INT
AS
BEGIN
	IF EXISTS (SELECT * FROM LoaiHopThu WHERE ID = @ID)
	BEGIN	
		DELETE FROM LoaiHopThu  
		WHERE ID = @ID
	END

END