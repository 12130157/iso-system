IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getTaiKhoanSMSBySDT_MSV')

BEGIN
	Drop Proc sp_getTaiKhoanSMSBySDT_MSV
End
Go
Create PROC sp_getTaiKhoanSMSBySDT_MSV
@so_Dien_Thoai int,
@Ma_tai_khoan_SMS int
AS
begin
	IF EXISTS (select * from TaiKhoanSMS where So_dien_thoai=@so_Dien_Thoai and Ma_sinh_vien=@Ma_tai_khoan_SMS)
	BEGIN
		select * from TaiKhoanSMS where So_dien_thoai=@so_Dien_Thoai and Ma_sinh_vien=@Ma_tai_khoan_SMS
	END
end
--exec sp_getTaiKhoanSMSBySDT_MSV '0934070401', 1

--select * from TaiKhoanSMS