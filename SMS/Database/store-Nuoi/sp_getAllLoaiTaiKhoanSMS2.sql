IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getAllLoaiTaiKhoanSMS2')

BEGIN
	Drop Proc sp_getAllLoaiTaiKhoanSMS2
End
Go
Create PROC sp_getAllLoaiTaiKhoanSMS2
AS
Begin
		select ID as 'Ma hop thu' ,Ten as'Ten hop thu' ,Phi_dich_vu as 'Phi dich vu' ,Ghi_chu as 'Ghi chu' from LoaiTaiKhoanSMS
END
select * from LoaiTaiKhoanSMS
--exec sp_getAllLoaiTaiKhoanSMS2