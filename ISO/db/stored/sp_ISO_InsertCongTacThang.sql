if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertCongTacThang]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertCongTacThang]
GO
CREATE PROCEDURE sp_ISO_InsertCongTacThang
	@ID	int output,
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
	INSERT INTO CongTacThang VALUES
	(
		@Ma_ke_hoach_thang,
		@Ma_cong_tac,
		@Ngay_cap_nhat_cuoi,
		@Bao_cao,
		@Ghi_chu,
		@Bo_phan_thuc_hien,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	SELECT @ID = ID FROM CongTacThang WHERE Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
END