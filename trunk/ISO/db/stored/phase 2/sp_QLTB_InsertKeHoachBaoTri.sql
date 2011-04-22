
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_InsertKeHoachBaoTri]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_InsertKeHoachBaoTri]
GO
CREATE PROC sp_QLTB_InsertKeHoachBaoTri
	@ID						int output,
	@Thang					int,
	@Nam					int,
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
	INSERT INTO	KeHoachBaoTri
	VALUES (
		@Thang,
		@Nam,
		@Ghi_chu,
		@Ngay_cap_nhat_cuoi,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5		
	)
	SELECT @ID = ID FROM KeHoachBaoTri WHERE Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
END
