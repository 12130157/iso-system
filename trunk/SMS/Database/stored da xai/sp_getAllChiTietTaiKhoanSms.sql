IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getAllChiTietTaiKhoanSms')

BEGIN
	Drop Proc sp_getAllChiTietTaiKhoanSms
End
Go
Create PROC sp_getAllChiTietTaiKhoanSms
@Ma_tai_khoan_SMS int
AS
begin
	if Exists(select * from ChiTietTaiKhoanSMS where Ma_tai_khoan_SMS=@Ma_tai_khoan_SMS)
	BEGIN
		select ID, Ma_tai_khoan_SMS as 'Account ID' ,Dang_ky_thang as 'Registration month',Dang_ky_nam as 'Registration year' from ChiTietTaiKhoanSMS where Ma_tai_khoan_SMS=@Ma_tai_khoan_SMS
	END
end
--select * from ChiTietTaiKhoanSMS
--exec sp_getAllChiTietTaiKhoanSms '1'