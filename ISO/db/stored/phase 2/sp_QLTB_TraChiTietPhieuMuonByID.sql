
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_TraChiTietPhieuMuonByID]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_TraChiTietPhieuMuonByID]
GO
CREATE PROC sp_QLTB_TraChiTietPhieuMuonByID
	@Ma_chi_tiet_phieu_muon	int
AS
BEGIN
	DECLARE @Ma_thiet_bi int
	SELECT @Ma_thiet_bi = Ma_thiet_bi FROM ChiTietPhieuMuon WHERE ID = @Ma_chi_tiet_phieu_muon
	UPDATE ChiTietPhieuMuon 
		SET Tinh_trang = '2', 
			Thoi_gian_tra = GETDATE()
	WHERE ID = @Ma_chi_tiet_phieu_muon
	UPDATE ThietBi SET Ma_tinh_trang = 0, So_lan_su_dung = So_lan_su_dung + 1 WHERE ID = @Ma_thiet_bi
END
