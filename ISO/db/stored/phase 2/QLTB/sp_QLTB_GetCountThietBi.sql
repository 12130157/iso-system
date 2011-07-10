if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_GetCountThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_GetCountThietBi]
GO
CREATE PROCEDURE sp_QLTB_GetCountThietBi
	@Loai_thiet_bi	varchar(3),
	@Phong_ban		varchar(3),
	@Tinh_trang		varchar(2),
	@Ten_thiet_bi	nvarchar(100)
AS
BEGIN
	DECLARE @sql NVarchar(500)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_phong_ban nvarchar(100)
	DECLARE @Dieu_kien_loai_thiet_bi nvarchar(100)
	DECLARE @Dieu_kien_ten_thiet_bi nvarchar(200)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(5)
	SET @Dieu_kien_tinh_trang = ' ''t'' = ''t'' '
	SET @Dieu_kien_phong_ban = ' ''t'' = ''t'' '
	SET @Dieu_kien_loai_thiet_bi = ' ''t'' = ''t'' '
	SET @Dieu_kien_ten_thiet_bi = ' ''t'' = ''t'' '
	if(@Tinh_trang <> '')
	BEGIN
		SET @Dieu_kien_tinh_trang = ' A.Ma_tinh_trang = ' + @Tinh_trang
	END

	if(@Loai_thiet_bi <> '')
	BEGIN
		SET @Dieu_kien_loai_thiet_bi = ' A.Ma_loai = ' + @Loai_thiet_bi
	END
	
	if(@Phong_ban <> '')
	BEGIN
		SET @Dieu_kien_phong_ban = ' B.Ma_phong = ' + @Phong_ban
	END
	
	if(@Ten_thiet_bi <> '')
	BEGIN
		SET @Dieu_kien_ten_thiet_bi = ' A.Ten LIKE ''%' + @Ten_thiet_bi + '%'''
	END
	SELECT @sql = ' 
		SELECT COUNT(*) AS Count
		FROM ThietBi AS A INNER JOIN TrinhTuThayDoiThietBi AS B ON A.ID = B.Ma_thiet_bi AND B.Kiem_tra_ton_tai = ''1''
		WHERE ' + @Dieu_kien_tinh_trang + ' AND ' + @Dieu_kien_phong_ban 
			+ ' AND ' + @Dieu_kien_loai_thiet_bi + ' AND ' + @Dieu_kien_ten_thiet_bi
	exec sp_executesql @sql
	--PRINT @sql	
END
--exec sp_QLTB_GetCountThietBi '','',''