IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getTaiKhoanSMSByID')

BEGIN
	Drop Proc sp_getTaiKhoanSMSByID
End
Go
Create PROC sp_getTaiKhoanSMSByID
@Ma_tai_khoan_SMS int
AS
begin
	IF EXISTS (select * from TaiKhoanSMS where ID=@Ma_tai_khoan_SMS)
	BEGIN
		select * from TaiKhoanSMS where ID=@Ma_tai_khoan_SMS
	END
end
--exec sp_getTaiKhoanSMSByID '1'