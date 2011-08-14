if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertChiTietBangPhanCong]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertChiTietBangPhanCong]
GO
CREATE PROCEDURE sp_ISO_InsertChiTietBangPhanCong
	@ID						INT,
	@Ma_bang_phan_cong		INT,
	@Ma_lop					INT,
	@Ma_chi_tiet_CTDT		INT,
	@Ma_giao_vien			INT,
	@Nhiem_vu				NVARCHAR(2000),
	@Ghi_chu				NVARCHAR(2000),
	@Ngay_cap_nhat_cuoi		DATETIME,
	@User1					VARCHAR(40),
	@User2					VARCHAR(40),
	@User3					VARCHAR(40),
	@User4					VARCHAR(40),
	@User5					VARCHAR(40)
AS
BEGIN
	SET @Ngay_cap_nhat_cuoi	= GETDATE()	
	INSERT INTO ChiTietBangPhanCong VALUES
	(
		@Ma_bang_phan_cong,
		@Ma_lop,
		@Ma_chi_tiet_CTDT,
		@Ma_giao_vien,
		@Nhiem_vu,
		@Ghi_chu,
		@Ngay_cap_nhat_cuoi,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
END