if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertMonHocTKBThayDoi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertMonHocTKBThayDoi]
GO
CREATE PROCEDURE sp_ISO_InsertMonHocTKBThayDoi
	@ID						int,
	@Ma_mon_hoc_TKB			int,
	@Ma_giao_vien			int,
	@Ma_to_trinh			int,
	@Ma_nguoi_tao			int,
	@Tinh_trang				varchar,
	@ID_thay_the			int,
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN	
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	DECLARE @Ngay_thay_the	datetime
	DECLARE @Count	int
	SELECT @Count = Count(*) FROM MonHocTKBThayDoi WHERE Ma_mon_hoc_TKB = @Ma_mon_hoc_TKB
	IF(@Count > 0)
	BEGIN
		SELECT @Ngay_thay_the = MAX(Ngay_cap_nhat_cuoi) FROM MonHocTKBThayDoi 
		SELECT @ID_thay_the = ID FROM MonHocTKBThayDoi WHERE Ngay_cap_nhat_cuoi = @Ngay_thay_the
	END
	SET @Ma_to_trinh = -2
	INSERT INTO MonHocTKBThayDoi
	VALUES
	( 
		@Ma_mon_hoc_TKB,
		@Ma_giao_vien,
		@Ma_to_trinh,
		@Ma_nguoi_tao,
		@Tinh_trang,
		@ID_thay_the,
		@Ngay_cap_nhat_cuoi,		
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
END