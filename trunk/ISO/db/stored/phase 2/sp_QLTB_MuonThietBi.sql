
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_MuonThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_MuonThietBi]
GO
CREATE PROC sp_QLTB_MuonThietBi
	@ID	int
AS
BEGIN
	DELETE 
	FROM chitietthietbi
	WHERE Ma_thiet_bi = @ID	

	DELETE 
	FROM ThietBi
	WHERE ID = @ID	and Ma_Tinh_Trang != 1

	INSERT INTO ChiTietPhieuMuon(Ma_thiet_bi)
	Values (@ID)	

	--INSERT INTO PhieuMuonThietBi(
	--Values (
END
--select * from chitietphieumuon