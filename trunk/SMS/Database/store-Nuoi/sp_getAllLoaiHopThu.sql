IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getAllLoaiHopThu')

BEGIN
	Drop Proc sp_getAllLoaiHopThu
End
Go
Create PROC sp_getAllLoaiHopThu
AS
	BEGIN
		select ID as 'Ma hop thu', Ten as 'Ten hop thu' ,Ghi_chu as 'Ghi chu'  from LoaiHopThu
	END
--exec sp_getAllLoaiHopThu 
