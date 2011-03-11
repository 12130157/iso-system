/***********************************************************
* Purpose : Delete LichTinNhan
* Author : NGUYEN VAN NUOI
* Date: 9-3-2011
* Description: Delete LichTinNhan
*/

IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_SMS_DeleteLichTinNhan')

BEGIN
	Drop Proc sp_SMS_DeleteLichTinNhan
End
Go
Create PROC sp_SMS_DeleteLichTinNhan
	@ID INT,
	@RESULT INT OUTPUT
AS
BEGIN
	IF EXISTS (SELECT * FROM LichTinNhan WHERE ID = @ID)
	BEGIN	
		DELETE FROM LichTinNhan  
		WHERE ID = @ID
		SET @RESULT = 1 -- DELETE PAGE SUCCESSFULL !!!!
	END
	ELSE
	BEGIN
		SET  @RESULT = 0 -- DELETE PAGE NOT SUCCESSFULL !!!!
	END
END
