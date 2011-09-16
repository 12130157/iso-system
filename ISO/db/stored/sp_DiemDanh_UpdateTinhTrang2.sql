if exists (select * from dbo.sysobjects where name = 'sp_DiemDanh_UpdateTinhTrang2')
drop procedure [dbo].[sp_DiemDanh_UpdateTinhTrang2]
GO
CREATE PROCEDURE sp_DiemDanh_UpdateTinhTrang2
	@MaTVDD int
AS
BEGIN
	update chitietdiemdanh set tinh_trang = 4,
	Gio_ket_thuc = getdate()
	where  ma_tvdd = @MaTVDD
	and Convert(varchar(10),Ngay_hoc,105) = Convert(varchar(10), GetDate(), 105)
	and tinh_trang = 3
END
