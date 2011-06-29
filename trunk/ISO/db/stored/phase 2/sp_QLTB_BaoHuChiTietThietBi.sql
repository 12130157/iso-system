
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_BaoHuChiTietThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_BaoHuChiTietThietBi]
GO
CREATE PROC sp_QLTB_BaoHuChiTietThietBi
	@ID				int,
	@Tinh_trang_hu	int
AS
BEGIN
	UPDATE ChiTietThietBi 
		SET Ma_tinh_trang = @Tinh_trang_hu WHERE ID = @ID

	UPDATE TrinhTuThayDoiLinhKien 
		SET Kiem_tra_ton_tai = '2' 
			WHERE Ma_linh_kien = @ID
END
--select * from tinhtrangthietbi
--0/ranh
--1/ban
--2/baotri
--3/hong
--select * from thietbi