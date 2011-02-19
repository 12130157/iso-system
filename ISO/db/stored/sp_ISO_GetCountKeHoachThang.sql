if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetCountKeHoachThang]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetCountKeHoachThang]
GO
CREATE PROCEDURE sp_ISO_GetCountKeHoachThang
	@Tinh_trang		varchar(2),
	@Ma_bo_phan		varchar(5),
	@Ma_PHC			varchar(5)
AS
BEGIN
	DECLARE @sql NVarchar(200)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_bo_phan nvarchar(100)
	SET @Dieu_kien_tinh_trang = ' ''t'' = ''t'' '
	SET @Dieu_kien_bo_phan = ' ''t'' = ''t'' '
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Dieu_kien_tinh_trang = ' Tinh_trang = ' + @Tinh_trang
	END

	if(@Ma_bo_phan <> '')
	BEGIN
		if (@Ma_bo_phan <> @Ma_PHC)
		BEGIN	
			SET @Dieu_kien_bo_phan = ' Tinh_trang <> 0 '
		END
	END

	SELECT @sql = ' 
		SELECT COUNT(*) AS Count
		FROM KEHOACHDAOTAO WHERE '
		+ @Dieu_kien_tinh_trang + ' AND' + @Dieu_kien_bo_phan
	exec sp_executesql @sql
	--PRINT @sql	
END