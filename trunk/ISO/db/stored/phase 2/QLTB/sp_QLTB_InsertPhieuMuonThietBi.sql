

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_InsertPhieuMuonThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_InsertPhieuMuonThietBi]
GO
CREATE PROC sp_QLTB_InsertPhieuMuonThietBi
	@ID						INT OUTPUT,
    @Nguoi_muon				INT,
	@Ngay_muon				DATETIME,
    @Ghi_chu				NVARCHAR(200),
    @Ngay_cap_nhat_cuoi		DATETIME,
	@User1					VARCHAR(40),
	@User2					VARCHAR(40),
	@User3					VARCHAR(40),
	@User4					VARCHAR(40),
	@User5					VARCHAR(40)
AS
BEGIN
	SET @Ngay_cap_nhat_cuoi = GETDATE()
	INSERT INTO PhieuMuonThietBi 
	VALUES (
		@Nguoi_muon,
		@Ngay_muon,
		@Ghi_chu,
		@Ngay_cap_nhat_cuoi,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)  	
	SELECT @ID = ID FROM PhieuMuonThietBi WHERE Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
END