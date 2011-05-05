/***********************************************************
* Purpose : Delete ChiTietTaiKhoanSMS
* Author : NGUYEN VAN NUOI
* Date: 9-3-2011
* Description: Delete ChiTietTaiKhoanSMS
*/

IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_SMS_DeleteChiTietTaiKhoanSMS')

BEGIN
	Drop Proc sp_SMS_DeleteChiTietTaiKhoanSMS
End
Go
Create PROC sp_SMS_DeleteChiTietTaiKhoanSMS
	@ID INT
AS
BEGIN
	IF EXISTS (SELECT * FROM ChiTietTaiKhoanSMS WHERE ID = @ID)
	BEGIN	
		DELETE FROM ChiTietTaiKhoanSMS  
		WHERE ID = @ID
	END
END
