IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getAllLoaiHopThu')

BEGIN
	Drop Proc sp_getAllLoaiHopThu
End
Go
Create PROC sp_getAllLoaiHopThu

AS

	BEGIN
		select ID as 'Ma Hop Thu', Ten as 'Ten Hop Thu' ,Ghi_chu as 'Ghi Chu'  from LoaiHopThu
	END
--select * from ChiTietTaiKhoanSMS
--exec sp_getAllLoaiHopThu 
