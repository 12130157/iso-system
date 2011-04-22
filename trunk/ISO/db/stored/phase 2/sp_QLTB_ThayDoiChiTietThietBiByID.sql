
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_ThayDoiChiTietThietBiByID]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_ThayDoiChiTietThietBiByID]
GO
CREATE PROC sp_QLTB_ThayDoiChiTietThietBiByID
	@Ma_linh_kien	int,
	@Ma_phong		int,
	@Ma_thiet_bi	int
AS
BEGIN
	UPDATE ChiTietThietBi 
		SET Ma_thiet_bi = @Ma_thiet_bi,
			Ma_phong = @Ma_phong
	WHERE ID = @Ma_linh_kien
END
--select * from chitietthietbi