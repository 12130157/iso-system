if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertCTDT_BangPhanCong]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertCTDT_BangPhanCong]
GO
CREATE PROCEDURE sp_ISO_InsertCTDT_BangPhanCong
	@ID						INT OUTPUT,
	@Ma_bang_phan_cong		INT,
	@Ma_chuong_trinh		INT,
	@Ma_lop					INT,
	@Ngay_cap_nhat_cuoi		DATETIME,
	@User1					VARCHAR(40),
	@User2					VARCHAR(40),
	@User3					VARCHAR(40),
	@User4					VARCHAR(40),
	@User5					VARCHAR(40)
AS
BEGIN
	SET @Ngay_cap_nhat_cuoi	= GETDATE()	
	INSERT INTO CTDT_BangPhanCong VALUES
	(
		@Ma_bang_phan_cong,
		@Ma_chuong_trinh,
		@Ma_lop,
		@Ngay_cap_nhat_cuoi,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	SELECT @ID = ID FROM CTDT_BangPhanCong WHERE Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
END