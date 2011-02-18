if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertNguoiThucHien]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertNguoiThucHien]
GO
CREATE PROCEDURE sp_ISO_InsertNguoiThucHien
	@ID						int			output,
	@Ma_bo_phan				int,
	@Ma_thanh_vien			int,
	@Ten_thanh_vien			nvarchar(100),
	@Ngay_cap_nhat_cuoi		datetime    output,
	@Tinh_trang_thuc_hien	int,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN	
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	INSERT INTO NguoiThucHien
	VALUES (
		@Ma_bo_phan,
		@Ma_thanh_vien,
		@Ten_thanh_vien,
		@Ngay_cap_nhat_cuoi,
		@Tinh_trang_thuc_hien,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	
	SELECT 	@ID=ID, @Ngay_cap_nhat_cuoi = Ngay_cap_nhat_cuoi FROM NguoiThucHien WHERE Ngay_cap_nhat_cuoi=@Ngay_cap_nhat_cuoi
END
