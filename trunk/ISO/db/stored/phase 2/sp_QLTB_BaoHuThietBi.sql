
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_BaoHuThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_BaoHuThietBi]
GO
CREATE PROC sp_QLTB_BaoHuThietBi
	@ID	int
AS
BEGIN
	UPDATE ThietBi SET Ma_tinh_trang = 3 WHERE ID = @ID
	UPDATE ChiTietThietBi SET Ma_tinh_trang = 3 WHERE Ma_thiet_bi = @ID
END
--select * from tinhtrangthietbi
--0/ranh
--1/ban
--2/baotri
--3/hong
--select * from thietbi