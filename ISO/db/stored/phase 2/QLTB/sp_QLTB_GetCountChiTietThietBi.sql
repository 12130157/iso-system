if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_GetCountChiTietThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_GetCountChiTietThietBi]
GO
CREATE PROCEDURE sp_QLTB_GetCountChiTietThietBi
	@Loai_linh_kien	varchar(3),
	@Phong_ban		varchar(3),
	@Tinh_trang		varchar(2),
	@Ten_linh_kien	nvarchar(100)
AS
BEGIN
	DECLARE @sql NVarchar(500)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_phong_ban nvarchar(100)
	DECLARE @Dieu_kien_loai_linh_kien nvarchar(100)
	DECLARE @Dieu_kien_ten_linh_kien nvarchar(200)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(5)
	SET @Dieu_kien_tinh_trang = ' ''t'' = ''t'' '
	SET @Dieu_kien_phong_ban = ' ''t'' = ''t'' '
	SET @Dieu_kien_loai_linh_kien = ' ''t'' = ''t'' '
	SET @Dieu_kien_ten_linh_kien = ' ''t'' = ''t'' '
	if(@Tinh_trang <> '')
	BEGIN
		SET @Dieu_kien_tinh_trang = ' A.Ma_tinh_trang = ' + @Tinh_trang
	END

	if(@Loai_linh_kien <> '')
	BEGIN
		SET @Dieu_kien_loai_linh_kien = ' A.Ma_loai = ' + @Loai_linh_kien
	END
	
	if(@Phong_ban <> '')
	BEGIN
		SET @Dieu_kien_phong_ban = ' B.Ma_phong = ' + @Phong_ban
	END
	
	if(@Ten_linh_kien <> '')
	BEGIN
		SET @Dieu_kien_ten_linh_kien = ' A.Ten LIKE ''%' + @Ten_linh_kien + '%'''
	END
	SELECT @sql = ' 
		SELECT COUNT(*) AS Count
		FROM ChiTietThietBi AS A INNER JOIN TrinhTuThayDoiLinhKien AS B ON A.ID = B.Ma_linh_kien AND B.Kiem_tra_ton_tai = ''1''
		WHERE ' + @Dieu_kien_tinh_trang + ' AND ' + @Dieu_kien_phong_ban 
			+ ' AND ' + @Dieu_kien_loai_linh_kien + ' AND ' + @Dieu_kien_ten_linh_kien
	exec sp_executesql @sql
	--PRINT @sql	
END
--exec sp_QLTB_GetCountChiTietThietBi '','',''