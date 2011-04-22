if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_FindPhieuMuonThietBiByNguoiMuonAndNgayMuonANDMaLop]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_FindPhieuMuonThietBiByNguoiMuonAndNgayMuonANDMaLop]
GO
CREATE PROC sp_QLTB_FindPhieuMuonThietBiByNguoiMuonAndNgayMuonANDMaLop
	@Nguoi_muon		int,
	@Ma_lop			int,
	@Result			varchar output
AS
BEGIN
	if exists(SELECT * FROM PhieuMuonThietBi WHERE Nguoi_muon = @Nguoi_muon 
		AND Convert(varchar(10), Ngay_muon, 110) =  Convert(varchar(10), GETDATE(), 110)
			AND Ma_lop = @Ma_lop)
	BEGIN
		SET @Result = '1'
	END
	ELSE
	BEGIN
		SET @Result = '0'
	END
END