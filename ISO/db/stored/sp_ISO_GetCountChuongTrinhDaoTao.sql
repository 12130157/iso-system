if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetCountChuongTrinhDaoTao]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetCountChuongTrinhDaoTao]
GO
CREATE PROCEDURE sp_ISO_GetCountChuongTrinhDaoTao
	@Tinh_trang		varchar(2),
	@Ma_bo_phan		varchar(5),
	@Ma_truong_khoa	varchar(2),
	@Check			varchar
AS
BEGIN
	DECLARE @sql NVarchar(300)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_bo_phan nvarchar(100)
	DECLARE @Vai_tro_truong_bo_phan varchar(5)
	SET @Vai_tro_truong_bo_phan = ''
	SET @Dieu_kien_tinh_trang = ' ''t'' = ''t'' '
	SET @Dieu_kien_bo_phan = ' ''t'' = ''t'' '
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Dieu_kien_tinh_trang = ' CTDT.Tinh_trang = ' + @Tinh_trang
	END
	if(@Ma_bo_phan <> '')
	BEGIN
		SELECT @Vai_tro_truong_bo_phan = B.Ma_vai_tro FROM Khoa_trungtam AS A INNER JOIN ThanhVien AS B ON A.Ma_truong_khoa = B.ID WHERE B.Ma_bo_phan = @Ma_bo_phan
		if(@Vai_tro_truong_bo_phan = @Ma_truong_khoa)
		BEGIN
			SET @Dieu_kien_bo_phan = ' TV.Ma_bo_phan = ' + @Ma_bo_phan
		END
		else
		BEGIN
			IF(@Check = '1')
			BEGIN
				SET @Dieu_kien_bo_phan = ' CTDT.Tinh_trang <> 0 '
			END
			ELSE
			BEGIN
				SET @Dieu_kien_bo_phan = ' CTDT.Tinh_trang <> 0 AND CTDT.Tinh_trang <> 4 '
			END
		END
	END
	--if(@Ma_nguoi_tao <> '')
	--BEGIN
	--	SET @Where = 'Where '
	--	if not exists(Select * From ChuongTrinhDaoTao Where Ma_nguoi_tao = @Ma_nguoi_tao)
	--	BEGIN	
	--		SET @Dieu_kien_khong_phai_nguoi_tao = ' Tinh_trang <> 0 '
	--	END
	--	else
	--	BEGIN
	--		SET @Dieu_kien_ma_nguoi_tao = ' Ma_nguoi_tao = ' + @Ma_nguoi_tao
	--	END
	--END

	SELECT @sql = ' 
		SELECT COUNT(*) AS Count
		FROM ChuongTrinhDaoTao AS CTDT
		INNER JOIN ThanhVien AS TV ON CTDT.Ma_nguoi_tao = TV.ID 
		Where ' + @Dieu_kien_tinh_trang + ' And ' + @Dieu_kien_bo_phan
	exec sp_executesql @sql
	--PRINT @sql	
END
--exec sp_ISO_GetCountChuongTrinhDaoTao '2',0,5,0