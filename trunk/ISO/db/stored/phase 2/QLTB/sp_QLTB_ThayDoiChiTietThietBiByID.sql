
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_ThayDoiChiTietThietBiByID]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_ThayDoiChiTietThietBiByID]
GO
CREATE PROC sp_QLTB_ThayDoiChiTietThietBiByID
	@ID				int output,
	@Ma_linh_kien	int,
	@Ma_phong		int,
	@Ma_thiet_bi	int,
	@Ma_khoa		int
AS
BEGIN
	DECLARE @Ngay_cap_nhat_cuoi datetime
	SET @Ngay_cap_nhat_cuoi = getdate()

	INSERT INTO TrinhTuThayDoiLinhKien VALUES
		(
			@Ma_thiet_bi,
			@Ma_linh_kien,
			@Ma_phong,
			@Ma_khoa,
			'1',
			@Ngay_cap_nhat_cuoi,
			NULL,
			NULL,
			NULL,
			NULL,
			NULL
		)	
END
--select * from chitietthietbi