if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateTinhTrangCongTac]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateTinhTrangCongTac]
GO
CREATE PROCEDURE sp_ISO_UpdateTinhTrangCongTac
	@ID	int,
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
	UPDATE TinhTrangCongTac
	SET
		Ma_cong_tac_thang = @Ma_cong_tac_thang,
		Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi,
		Tinh_trang = @Tinh_trang,
		Thu_tu_tuan = @Thu_tu_tuan,
		User1 = @User1,
		User2 = @User2,
		User3 = @User3,
		User4 = @User4,
		User5 = @User5
	WHERE ID = @ID
END	