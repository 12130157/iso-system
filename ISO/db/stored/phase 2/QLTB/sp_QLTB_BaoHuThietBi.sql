
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_BaoHuThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_BaoHuThietBi]
GO
CREATE PROC sp_QLTB_BaoHuThietBi
	@ID	int,
	@Tinh_trang_hu int
AS
BEGIN
	UPDATE ThietBi 
		SET Ma_tinh_trang = @Tinh_trang_hu
			WHERE ID = @ID

	UPDATE TrinhTuThayDoiThietBi 
		SET Kiem_tra_ton_tai = '2' 
			WHERE Ma_thiet_bi = @ID

	UPDATE ChiTietThietBi 
		SET Ma_tinh_trang = @Tinh_trang_hu
			WHERE ID IN 
				(SELECT Distinct(B.ID) FROM TrinhTuThayDoiLinhKien AS A
						INNER JOIN ChiTietThietBi AS B ON A.Ma_linh_kien = B.ID
							WHERE A.Ma_thiet_bi = @ID)

	UPDATE TrinhTuThayDoiLinhKien 
		SET Kiem_tra_ton_tai = '2' 
			WHERE Ma_thiet_bi = @ID
END
--select * from tinhtrangthietbi
--0/ranh
--1/ban
--2/baotri
--3/hong
--select * from thietbi