if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetCountThoiKhoaBieu]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetCountThoiKhoaBieu]
GO
CREATE PROCEDURE sp_ISO_GetCountThoiKhoaBieu
	@Tinh_trang		varchar(2),
	@Ma_bo_phan		varchar(5),
	@Ma_truong_khoa	varchar(2)
AS
BEGIN
	DECLARE @sql NVarchar(200)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_bo_phan nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(5)
	DECLARE @Vai_tro_truong_bo_phan varchar(5)
	SET @Vai_tro_truong_bo_phan = ''
	SET @Dieu_kien_tinh_trang = ''
	SET @Dieu_kien_bo_phan = ''
	SET @And = ''
	SET @Where = ''
	
	if(@Tinh_trang <> '' and @Ma_bo_phan <> '')
	BEGIN
		SET @And = ' and '
	END
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Where = 'Where '
		SET @Dieu_kien_tinh_trang = ' A.Tinh_trang = ' + @Tinh_trang
	END
	if(@Ma_bo_phan <> '')
	BEGIN
		SELECT @Vai_tro_truong_bo_phan = B.Ma_vai_tro FROM Khoa_trungtam AS A INNER JOIN ThanhVien AS B ON A.Ma_truong_khoa = B.ID WHERE B.Ma_bo_phan = @Ma_bo_phan
		SET @Where = 'Where '
		if(@Vai_tro_truong_bo_phan = @Ma_truong_khoa)
		BEGIN
			SET @Dieu_kien_bo_phan = ' B.Ma_bo_phan = ' + @Ma_bo_phan
		END
		else
		BEGIN
			SET @Dieu_kien_bo_phan = ' A.Tinh_trang <> 0 '
		END
	END

	SELECT @sql = ' 
		SELECT COUNT(*) AS Count
		FROM ThoiKhoaBieu AS A
		INNER JOIN ThanhVien AS B ON A.Ma_nguoi_tao = B.ID ' 
		+ @Where + @Dieu_kien_tinh_trang + @And + @Dieu_kien_bo_phan
	--PRINT @sql
	exec  sp_executesql @sql	
END