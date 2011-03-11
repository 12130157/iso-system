/***********************************************************
* Purpose : Delete loai hop thu
* Author : NGUYEN VAN NUOI
* Date: 9-3-2011
* Description: Delete loai hop thu
*/

IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_SMS_DeleteLoaiHopThu')

BEGIN
	Drop Proc sp_SMS_DeleteLoaiHopThu
End
Go
Create PROC sp_SMS_DeleteLoaiHopThu
	@ID INT,
	@RESULT INT OUTPUT
AS
BEGIN
	IF EXISTS (SELECT * FROM LoaiHopThu WHERE ID = @ID)
	BEGIN	
		DELETE FROM LoaiHopThu  
		WHERE ID = @ID
		SET @RESULT = 1 -- DELETE PAGE SUCCESSFULL !!!!
	END
	ELSE
	BEGIN
		SET  @RESULT = 0 -- DELETE PAGE NOT SUCCESSFULL !!!!
	END
END
