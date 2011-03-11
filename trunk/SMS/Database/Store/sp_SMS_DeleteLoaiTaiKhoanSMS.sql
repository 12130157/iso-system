/***********************************************************
* Purpose : Delete LoaiTaiKhoanSMS
* Author : NGUYEN VAN NUOI
* Date: 9-3-2011
* Description: Delete LoaiTaiKhoanSMS
*/

IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_SMS_DeleteLoaiTaiKhoanSMS')

BEGIN
	Drop Proc sp_SMS_DeleteLoaiTaiKhoanSMS
End
Go
Create PROC sp_SMS_DeleteLoaiTaiKhoanSMS
	@ID INT,
	@RESULT INT OUTPUT
AS
BEGIN
	IF EXISTS (SELECT * FROM LoaiTaiKhoanSMS WHERE ID = @ID)
	BEGIN	
		DELETE FROM LoaiTaiKhoanSMS  
		WHERE ID = @ID
		SET @RESULT = 1 -- DELETE PAGE SUCCESSFULL !!!!
	END
	ELSE
	BEGIN
		SET  @RESULT = 0 -- DELETE PAGE NOT SUCCESSFULL !!!!
	END
END
