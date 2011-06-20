if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertToTrinh]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertToTrinh]
GO
CREATE PROCEDURE sp_ISO_InsertToTrinh
	@ID					int,
	@Ten				nvarchar(200),
	@Ma_nguoi_tao		int,
	@Ma_nguoi_duyet		int,
	@Ngay_cap_nhat_cuoi	datetime,
	@Ngay_tao			datetime,
	@Ngay_duyet			datetime,
	@Ngay_gui			datetime,
	@Ly_do_reject		nvarchar(2000),
	@Tinh_trang			varchar,
	@User1				varchar(40),
	@User2				varchar(40),
	@User3				varchar(40),
	@User4				varchar(40),
	@User5				varchar(40)
AS
BEGIN
	SET @Ngay_cap_nhat_cuoi = GETDATE()
	INSERT INTO ToTrinh VALUES
	(
		@Ten,
		@Ma_nguoi_tao,
		@Ma_nguoi_duyet,
		@Ngay_tao,
		@Ngay_duyet,
		@Ngay_gui,
		@Ly_do_reject,
		@Tinh_trang,
		@Ngay_cap_nhat_cuoi,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
END