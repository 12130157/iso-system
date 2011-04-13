IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_SMS_DeleteAllChiTietTaiKhoanSMS')

BEGIN
	Drop Proc sp_SMS_DeleteAllChiTietTaiKhoanSMS
End
Go
Create PROC sp_SMS_DeleteAllChiTietTaiKhoanSMS
	@Ma_tai_khoan_SMS INT
AS
BEGIN
	IF EXISTS (SELECT * FROM ChiTietTaiKhoanSMS WHERE Ma_tai_khoan_SMS = @Ma_tai_khoan_SMS)
	BEGIN	
		DELETE FROM ChiTietTaiKhoanSMS  
		WHERE Ma_tai_khoan_SMS = @Ma_tai_khoan_SMS
		
	END
END
--
--select * from ChiTietTaiKhoanSMS