if exists (select * from dbo.sysobjects where name = 'sp_DiemDanh_UpdateSinhVien')
drop procedure [dbo].[sp_DiemDanh_UpdateSinhVien]
GO
CREATE PROCEDURE sp_DiemDanh_UpdateSinhVien
	@MaTVDD int
AS
BEGIN
	update chitietdiemdanh set tinh_trang = 4
	where  ma_tvdd = @MaTVDD
	and Convert(varchar(10),Ngay_hoc,110) = Convert(varchar(10), GetDate(), 110)
	
END
