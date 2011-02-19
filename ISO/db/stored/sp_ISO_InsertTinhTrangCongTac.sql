if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertTinhTrangCongTac]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertTinhTrangCongTac]
GO
CREATE PROCEDURE sp_ISO_InsertTinhTrangCongTac
	@ID	int output,
	@Ma_cong_tac_thang int,
	@Ngay_cap_nhat_cuoi datetime,
	@Tinh_trang varchar,
	@Thu_tu_tuan varchar,
	@User1 varchar(40),
	@User2 varchar(40),
	@User3 varchar(40),
	@User4 varchar(40),
	@User5 varchar(40)
AS
BEGIN
	SET @Ngay_cap_nhat_cuoi = GETDATE()
	INSERT INTO TinhTrangCongTac VALUES
	(
		@Ma_cong_tac_thang,
		@Tinh_trang,
		@Thu_tu_tuan,
		@Ngay_cap_nhat_cuoi,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	SELECT ID = @ID FROM TinhTrangCongTac WHERE Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
END
