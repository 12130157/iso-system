if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetTuanChiTietKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetTuanChiTietKHDT]
GO
CREATE PROCEDURE sp_ISO_GetTuanChiTietKHDT
	@Ngay_bat_dau				datetime,
	@Ngay_ket_thuc				datetime,
	@Kieu_them_dong				int,
	@Ma_nam						int output,
	@Ma_tuan_le					int output,
	@Ngay_bat_dau_tuan_moi		varchar(20) output,
	@Ngay_ket_thuc_tuan_moi		varchar(20) output,
	@Thu_tu_tuan				int output
AS
BEGIN
	IF(@Kieu_them_dong = 1)
	BEGIN
		DECLARE @Ngay varchar(2)
		DECLARE @Thang varchar(2)
		DECLARE	@Nam varchar(4)
		SELECT @Ngay = DATEPART(dd, @Ngay_bat_dau), @Thang = DATEPART(mm, @Ngay_bat_dau), @Nam = DATEPART(yyyy, @Ngay_bat_dau)
		IF(@Ngay = 1)
		BEGIN
			SET @Thang = @Thang - 1
			--PRINT @Thang 
		END
		SELECT TOP 1 @Ma_tuan_le = ID FROM TuanLe WHERE DATEPART(mm, Den_ngay) = @Thang AND DATEPART(yyyy, Den_ngay) = @Nam ORDER BY Den_ngay DESC
		--PRINT @Ma_tuan_le
	END
	ELSE
	BEGIN
		SELECT @Ma_tuan_le = ID FROM TuanLe WHERE Tu_ngay = DATEADD(day,1,@Ngay_ket_thuc)
	END
	SELECT @Ma_tuan_le = ID, @Ma_nam = Ma_nam_hoc, @Thu_tu_tuan = So_thu_tu, 
				@Ngay_bat_dau_tuan_moi = Convert(varchar(20),Tu_ngay, 105),
					@Ngay_ket_thuc_tuan_moi = Convert(varchar(20),Den_ngay,105)
		FROM TuanLe
		WHERE ID = @Ma_tuan_le	
END
