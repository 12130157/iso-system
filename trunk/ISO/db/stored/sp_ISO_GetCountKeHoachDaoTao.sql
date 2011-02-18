if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetCountKeHoachDaoTao]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetCountKeHoachDaoTao]
GO
CREATE PROCEDURE sp_ISO_GetCountKeHoachDaoTao
	@Tinh_trang		varchar(2),
	@Ma_bo_phan		varchar(5),
	@Ma_PDT			varchar(5)
AS
BEGIN
	DECLARE @sql NVarchar(200)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_bo_phan nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(5)
	SET @Dieu_kien_tinh_trang = ''
	SET @Dieu_kien_bo_phan = ''
	SET @And = ''
	SET @Where = ''
	if(@Tinh_trang <> '' and @Ma_bo_phan <> '')
	BEGIN
		if (@Ma_bo_phan <> @Ma_PDT)
		BEGIN
			SET @And = ' and '
		END
	END
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Where = 'Where '
		SET @Dieu_kien_tinh_trang = ' Tinh_trang = ' + @Tinh_trang
	END

	if(@Ma_bo_phan <> '')
	BEGIN
		if (@Ma_bo_phan <> @Ma_PDT)
		BEGIN	
			SET @Where = 'Where '
			SET @Dieu_kien_bo_phan = ' Tinh_trang <> 0 '
		END
	END

	SELECT @sql = ' 
		SELECT COUNT(*) AS Count
		FROM KEHOACHDAOTAO '
		+ @Where + @Dieu_kien_tinh_trang + @And + @Dieu_kien_bo_phan
	exec sp_executesql @sql
	--PRINT @sql	
END