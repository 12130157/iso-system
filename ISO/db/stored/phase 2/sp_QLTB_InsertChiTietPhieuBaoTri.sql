
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_InsertChiTietPhieuBaoTri]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_InsertChiTietPhieuBaoTri]
GO
CREATE PROC sp_QLTB_InsertChiTietPhieuBaoTri
	@ID						int output,
	@Ma_phieu_bao_tri		int,
	@Ma_thiet_bi			int,
	@Tinh_trang				varchar,
	@Ghi_chu				nvarchar(2000),
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN
	SET @Ngay_cap_nhat_cuoi	= getdate()
	INSERT INTO	ChiTietPhieuBaoTri
	VALUES (
		@Ma_phieu_bao_tri,
		@Ma_thiet_bi,
		@Ngay_bao_tri,
		@Tinh_trang,
		@Ghi_chu,
		@Ngay_cap_nhat_cuoi,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5		
	)
	SELECT @ID = ID FROM ChiTietPhieuBaoTri WHERE Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
END
