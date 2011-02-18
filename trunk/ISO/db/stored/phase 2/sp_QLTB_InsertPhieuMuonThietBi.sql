

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_InsertPhieuMuonThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_InsertPhieuMuonThietBi]
GO
CREATE PROC sp_QLTB_InsertPhieuMuonThietBi
	--phieumuonthietbi
    @Nguoi_muon			VARCHAR(3),
    @Thoi_gian_tra		DATETIME,
	@Ma_tinh_trang		VARCHAR(3),
    @Ghi_chu		    NVARCHAR(100),
    @Ngay_cap_nhat_cuoi DATETIME
AS
BEGIN

	set @Thoi_gian_tra = GETDATE()
	set @Ngay_cap_nhat_cuoi = GETDATE()

--insert phieumuonthietbi
	insert into phieumuonthietbi (
		Nguoi_muon,
		Thoi_gian_tra,
		Tinh_trang,
		Ghi_chu
	)  
	values (
		@Nguoi_muon,
		@Thoi_gian_tra,
		@Ma_tinh_trang,
		@Ghi_chu
	)  	

END