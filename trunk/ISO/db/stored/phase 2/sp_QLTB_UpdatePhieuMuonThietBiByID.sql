

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_UpdatePhieuMuonByID]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_UpdatePhieuMuonThietBiByID]
GO
CREATE PROC sp_QLTB_UpdatePhieuMuonThietBiByID
	--phieumuonthietbi
	@ID						INT,
    @Ghi_chu				NVARCHAR(2000)
AS
BEGIN
	DECLARE @Ngay_cap_nhat_cuoi DATETIME
	set @Ngay_cap_nhat_cuoi = GETDATE()
--insert phieumuonthietbi
	UPDATE PhieuMuonThietBi 
	SET
		Ghi_chu		=	@Ghi_chu,
		Ngay_cap_nhat_cuoi		=	@Ngay_cap_nhat_cuoi
	WHERE ID = @ID 	
END