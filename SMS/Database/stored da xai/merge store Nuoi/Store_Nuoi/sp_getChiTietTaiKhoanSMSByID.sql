IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getChiTietTaiKhoanSMSByID')

BEGIN
	Drop Proc sp_getChiTietTaiKhoanSMSByID
End
Go
Create PROC sp_getChiTietTaiKhoanSMSByID
@Ma_tai_khoan_SMS int
AS
begin
	if Exists(select * from ChiTietTaiKhoanSMS where ID=@Ma_tai_khoan_SMS)
	BEGIN
		select * from ChiTietTaiKhoanSMS where ID=@Ma_tai_khoan_SMS
	END
end
--select * from ChiTietTaiKhoanSMS
--exec sp_getChiTietTaiKhoanSMSByID '0'