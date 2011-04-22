

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_InsertPhieuMuonThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_InsertPhieuMuonThietBi]
GO
CREATE PROC sp_QLTB_InsertPhieuMuonThietBi
	--phieumuonthietbi
	@ID						INT OUTPUT,
    @Nguoi_muon				VARCHAR(3),
	--@Ngay_muon				DATETIME,
    @Ghi_chu				NVARCHAR(200),
	@Ma_lop					int,
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
	insert into phieumuonthietbi 
	values (
		@Nguoi_muon,
		GETDATE(),--@Ngay_muon,
		@Ma_lop,
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