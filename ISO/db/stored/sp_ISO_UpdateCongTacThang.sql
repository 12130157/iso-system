if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateCongTacThang]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateCongTacThang]
GO
CREATE PROCEDURE sp_ISO_UpdateCongTacThang
	@ID	int,
	@Ma_ke_hoach_thang int,
	@Ma_cong_tac int,
	@Ngay_cap_nhat_cuoi datetime,
	@Bao_cao nvarchar(1000),
	@Ghi_chu nvarchar(1000),
	@Bo_phan_thuc_hien nvarchar(200),
	@User1 varchar(40),
	@User2 varchar(40),
	@User3 varchar(40),
	@User4 varchar(40),
	@User5 varchar(40)
AS
BEGIN
	SET @Ngay_cap_nhat_cuoi = GETDATE()
	UPDATE CongTacThang 
	SET
		Ma_ke_hoach_thang = @Ma_ke_hoach_thang,
		Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi,
		Bao_cao = @Bao_cao,
		Ghi_chu = @Ghi_chu,
		Bo_phan_thuc_hien = @Bo_phan_thuc_hien,
		User1 = @User1,
		User2 = @User2,
		User3 = @User3,
		User4 = @User4,
		User5 = @User5
	WHERE ID = @ID
END