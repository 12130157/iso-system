if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_XacNhanMuonThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_XacNhanMuonThietBi]
GO
CREATE PROC sp_QLTB_XacNhanMuonThietBi
	@ID			INT -- ma chi tiet phieu muon
AS
BEGIN
	DECLARE @Phan_loai	varchar
	DECLARE @Ma_thiet_bi	int -- ma thiet bi hay linh kien
	SELECT @Phan_loai = Phan_loai, @Ma_thiet_bi = Ma_thiet_bi FROM ChiTietPhieuMuon 
			WHERE ID = @ID
	UPDATE ChiTietPhieuMuon SET Tinh_trang = '2' WHERE ID = @ID
	IF(@Phan_loai = '1')
	BEGIN
		UPDATE ThietBi SET Ma_tinh_trang = 1 
			WHERE ID = @Ma_thiet_bi
	END
	ELSE
	BEGIN
		UPDATE ChiTietThietBi SET Ma_tinh_trang = 1 
			WHERE ID = @Ma_thiet_bi
	END
END