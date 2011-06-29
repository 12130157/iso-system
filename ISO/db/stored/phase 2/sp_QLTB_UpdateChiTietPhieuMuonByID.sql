

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_UpdateChiTietPhieuMuonByID]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_UpdateChiTietPhieuMuonThietBiByID]
GO
CREATE PROC sp_QLTB_UpdateChiTietPhieuMuonByID
	@ID						INT,
	@Ma_thiet_bi			INT,
	@Ma_phieu_muon			INT,
	@Thoi_gian_muon			DATETIME,
	@Thoi_gian_tra			DATETIME,
	@Tinh_trang				int,
    @Ghi_chu				NVARCHAR(200),
    @Ngay_cap_nhat_cuoi		DATETIME,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN
	SET @Ngay_cap_nhat_cuoi = GETDATE()
	UPDATE ChiTietPhieuMuon 
	SET
		Thoi_gian_muon			=	@Thoi_gian_muon,
		Thoi_gian_tra			=	@Thoi_gian_tra,
		Ghi_chu					=	@Ghi_chu,
		Ngay_cap_nhat_cuoi		=	@Ngay_cap_nhat_cuoi
	WHERE ID = @ID 	
END