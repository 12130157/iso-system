IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getAllLoaiHopThu')

BEGIN
	Drop Proc sp_getAllLoaiHopThu
End
Go
Create PROC sp_getAllLoaiHopThu

AS

	BEGIN
		select ID, Ten as 'Name' ,Ghi_chu as 'Note'  from LoaiHopThu
	END
--select * from ChiTietTaiKhoanSMS
--exec sp_getAllLoaiHopThu 

select * from ThanhVien