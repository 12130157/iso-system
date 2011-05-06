IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_SearchNane_LoaiHopThu')
BEGIN
	Drop Proc sp_SearchNane_LoaiHopThu
End
go
CREATE PROC sp_SearchNane_LoaiHopThu
	@Ten	varchar(40) 
	
AS
BEGIN
	IF @Ten = ''
	BEGIN
		-- DIEU KIEN 1 ==> SEARCH ALL
		select ID as 'Ma hop thu', Ten as 'Ten hop thu' ,Ghi_chu as 'Ghi chu'  from LoaiHopThu
	END

	ELSE IF @Ten <> ''
	BEGIN
		-- DIEU KIEN 2 ==> SEARCH CUSTOMER NAME

		select ID as 'Ma hop thu', Ten as 'Ten hop thu' ,Ghi_chu as 'Ghi chu'  from LoaiHopThu
		WHERE Ten LIKE '%' +@Ten + '%'
	END
	
END
--select * from TaiKhoanSMS
--exec sp_SearchNane_LoaiHopThu 'hop thu'