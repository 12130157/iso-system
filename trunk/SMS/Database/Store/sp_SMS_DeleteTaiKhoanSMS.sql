/***********************************************************
* Purpose : Delete TaiKhoanSMS
* Author : NGUYEN VAN NUOI
* Date: 9-3-2011
* Description: Delete TaiKhoanSMS
*/

IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_SMS_DeleteTaiKhoanSMS')

BEGIN
	Drop Proc sp_SMS_DeleteTaiKhoanSMS
End
Go
Create PROC sp_SMS_DeleteTaiKhoanSMS
	@ID INT,
	@RESULT INT OUTPUT
AS
BEGIN
	IF EXISTS (SELECT * FROM TaiKhoanSMS WHERE ID = @ID)
	BEGIN	
		DELETE FROM TaiKhoanSMS  
		WHERE ID = @ID
		SET @RESULT = 1 -- DELETE PAGE SUCCESSFULL !!!!
	END
	ELSE
	BEGIN
		SET  @RESULT = 0 -- DELETE PAGE NOT SUCCESSFULL !!!!
	END
END
