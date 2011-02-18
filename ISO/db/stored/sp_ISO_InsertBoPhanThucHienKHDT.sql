if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertBoPhanThucHienKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertBoPhanThucHienKHDT]
GO
CREATE PROCEDURE sp_ISO_InsertBoPhanThucHienKHDT
	@ID							int			output,
	@Ma_noi_dung_chi_tiet_KHDT	int,
	@Ma_khoa						int,
	@Ten_bo_phan					nvarchar(200),
	@Ngay_cap_nhat_cuoi			datetime    output,
	@User1						varchar(40),
	@User2						varchar(40),
	@User3						varchar(40),
	@User4						varchar(40),
	@User5						varchar(40)
AS
BEGIN	
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	
	INSERT INTO BoPhanThucHienKHDT
	VALUES (
		@Ma_noi_dung_chi_tiet_KHDT,
		@Ma_khoa,
		@Ten_bo_phan,
		@Ngay_cap_nhat_cuoi,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	
	SELECT 	@ID=ID, @Ngay_cap_nhat_cuoi = Ngay_cap_nhat_cuoi FROM BoPhanThucHienKHDT WHERE Ngay_cap_nhat_cuoi=@Ngay_cap_nhat_cuoi
END

