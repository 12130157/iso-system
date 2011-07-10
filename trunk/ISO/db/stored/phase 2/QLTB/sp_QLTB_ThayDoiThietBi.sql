
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_ThayDoiThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_ThayDoiThietBi]
GO
CREATE PROC sp_QLTB_ThayDoiThietBi
	@ID				int output, -- ID trinh tu cu va moi
	@Ma_thiet_bi	int,
	@Ma_phong		int,
	@Ma_khoa		int
AS
BEGIN
	DECLARE @Ngay_cap_nhat_cuoi datetime
	SET @Ngay_cap_nhat_cuoi = getdate()
	UPDATE TrinhTuThayDoiThietBi SET Kiem_tra_ton_tai = '2', Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi WHERE ID = @ID
	
	INSERT TrinhTuThayDoiThietBi VALUES
	(
		@Ma_thiet_bi,
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

	UPDATE TrinhTuThayDoiLinhKien
		SET Ma_phong = @Ma_phong, Ma_bo_phan = @Ma_khoa, Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
			WHERE Ma_thiet_bi = @ID AND Kiem_tra_ton_tai = '1'

	SELECT @ID = ID FROM TrinhTuThayDoiThietBi WHERE Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi AND Kiem_tra_ton_tai = '1'
END
--select * from phongban