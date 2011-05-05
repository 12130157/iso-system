IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getAllLoaiTaiKhoanSMS')

BEGIN
	Drop Proc sp_getAllLoaiTaiKhoanSMS
End
Go
Create PROC sp_getAllLoaiTaiKhoanSMS
AS

	BEGIN
		select * from LoaiTaiKhoanSMS
	END

--exec sp_getAllLoaiTaiKhoanSMS 