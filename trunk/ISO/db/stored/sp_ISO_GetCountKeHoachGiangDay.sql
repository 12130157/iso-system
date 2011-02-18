/***********************************************************
* Purpose : Get Count "KE HOACH GIANG DAY"
* Author : ToanTT
* Date: 12-05-2010
* Description: Get Count "KE HOACH GIANG DAY"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetCountKeHoachGiangDay]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetCountKeHoachGiangDay]
GO
CREATE PROCEDURE sp_ISO_GetCountKeHoachGiangDay
	@Tinh_trang		varchar(2),
	@Ma_nguoi_tao   varchar(2)
AS
BEGIN
	DECLARE @sql NVarchar(200)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_khong_phai_nguoi_tao nvarchar(100)
	DECLARE @Dieu_kien_ma_nguoi_tao nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(5)
	SET @Dieu_kien_tinh_trang = ''
	SET @Dieu_kien_khong_phai_nguoi_tao = ''
	SET @Dieu_kien_ma_nguoi_tao = ''
	SET @And = ''
	SET @Where = ''
	if(@Tinh_trang <> '' and @Ma_nguoi_tao <> '')
	BEGIN
		SET @And = ' and '
	END
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Where = 'Where '
		SET @Dieu_kien_tinh_trang = ' Tinh_trang = ' + @Tinh_trang
	END

	if(@Ma_nguoi_tao <> '')
	BEGIN
		SET @Where = 'Where '
		if not exists(Select * From KeHoachGiangDay Where Ma_nguoi_tao = @Ma_nguoi_tao)
		BEGIN	
			SET @Dieu_kien_khong_phai_nguoi_tao = ' Tinh_trang <> 0 '
		END
		else
		BEGIN
			SET @Dieu_kien_ma_nguoi_tao = ' Ma_nguoi_tao = ' + @Ma_nguoi_tao
		END
	END

	SELECT @sql = ' 
		SELECT COUNT(*) AS Count
		FROM KeHoachGiangDay '
		--+ @Where + @Dieu_kien_tinh_trang + @And + @Dieu_kien_ma_nguoi_tao + @Dieu_kien_khong_phai_nguoi_tao
	PRINT @sql	
	exec sp_executesql @sql
	
END