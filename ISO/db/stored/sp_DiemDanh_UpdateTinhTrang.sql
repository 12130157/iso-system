if exists (select * from dbo.sysobjects where name = 'sp_DiemDanh_UpdateTinhTrang')
drop procedure [dbo].[sp_DiemDanh_UpdateTinhTrang]
GO
CREATE PROCEDURE sp_DiemDanh_UpdateTinhTrang
	@MaTVDD int
AS
BEGIN
	update chitietdiemdanh set tinh_trang = 2 ,
	Gio_bat_dau = getdate()
	where  ma_tvdd = @MaTVDD
	and Convert(varchar(10),Ngay_hoc,110) = Convert(varchar(10), GetDate(), 110)
END
