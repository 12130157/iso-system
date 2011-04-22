

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_UpdatePhieuMuonThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_UpdatePhieuMuonThietBi]
GO
CREATE PROC sp_QLTB_UpdatePhieuMuonThietBi
	--phieumuonthietbi
	@ID						INT,
    --@Nguoi_muon				VARCHAR(3),
	--@Ngay_muon				DATETIME,
    @Ghi_chu				NVARCHAR(200),
    @Ngay_cap_nhat_cuoi		DATETIME,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN
	set @Ngay_cap_nhat_cuoi = GETDATE()
--insert phieumuonthietbi
	UPDATE PhieuMuonThietBi 
	SET
		Ghi_chu		=	@Ghi_chu,
		Ngay_cap_nhat_cuoi		=	@Ngay_cap_nhat_cuoi,
		User1		=	@User1,
		User2		=	@User2,
		User3		=	@User3,
		User4		=	@User4,
		User5		=	@User5
	WHERE ID = @ID 	
END