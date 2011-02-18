if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetCountDeCuongMonHoc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetCountDeCuongMonHoc]
GO
CREATE PROCEDURE sp_ISO_GetCountDeCuongMonHoc
	@Tinh_trang		varchar(2),
	@Ma_nguoi_tao   varchar(10),
	@Ma_bo_phan		varchar(5),
	@Ma_truong_khoa varchar(2),
	@Ma_pho_khoa	varchar(2),
	@Ma_vai_tro		varchar(2),	-- quyền trưởng khoa		
	@Ten_mon_hoc	nvarchar(50)
AS
BEGIN
	DECLARE @sql NVarchar(1000)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	--DECLARE @Dieu_kien_ma_nguoi_tao nvarchar(100)
	DECLARE @Dieu_kien_bo_phan nvarchar(100)
	DECLARE @Dieu_kien_mon_hoc nvarchar(150)
	DECLARE @Vai_tro_truong_bo_phan varchar(5)
	SET @Dieu_kien_tinh_trang = ' ''t'' = ''t'' '
	SET @Dieu_kien_mon_hoc = ' ''t'' = ''t'' '
	--SET @Dieu_kien_ma_nguoi_tao = ''
	SET @Dieu_kien_bo_phan = ' ''t'' = ''t'' '
	SET @Vai_tro_truong_bo_phan = ''
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Dieu_kien_tinh_trang = ' A.Tinh_trang = ' + @Tinh_trang
	END
	--
	if(@Ten_mon_hoc <> '')
	BEGIN
		SET @Dieu_kien_mon_hoc = ' A.Ten LIKE N''%' + @Ten_mon_hoc + '%'' ' 
	END
	--
	if(@Ma_nguoi_tao <> '')
	BEGIN
		IF(@Ma_vai_tro <> @Ma_truong_khoa or @Ma_vai_tro <> @Ma_pho_khoa)--
		BEGIN--
			SET @Dieu_kien_bo_phan = ' A.Ma_nguoi_tao = ' + @Ma_nguoi_tao
		END--
		ELSE
		BEGIN
			SET @Dieu_kien_bo_phan = ' B.Ma_bo_phan = ' + @Ma_bo_phan + ' And ((A.Tinh_trang = 0 and A.Ma_nguoi_tao = ' + @Ma_nguoi_tao + ') Or A.Tinh_trang <> 0) '
		END
	END
	ELSE
	BEGIN
		if(@Ma_bo_phan <> '')
		BEGIN
			SELECT @Vai_tro_truong_bo_phan = B.Ma_vai_tro FROM Khoa_trungtam AS A INNER JOIN ThanhVien AS B ON A.Ma_truong_khoa = B.ID WHERE B.Ma_bo_phan = @Ma_bo_phan
			if(@Vai_tro_truong_bo_phan = @Ma_truong_khoa)
			BEGIN
				SET @Dieu_kien_bo_phan = ' B.Ma_bo_phan = ' + @Ma_bo_phan + ' And A.Tinh_trang <> 0'
			END
			else
			BEGIN
				SET @Dieu_kien_bo_phan = ' A.Tinh_trang <> 0 '
			END
		END
	END

	SELECT @sql = ' 
		SELECT COUNT(*) AS Count
		FROM DeCuongMonHoc AS A
		INNER JOIN ThanhVien As B On A.Ma_nguoi_tao = B.ID 
		INNER JOIN ChiTietThanhVien As C on B.Ten_DN = C.Ten_dang_nhap
		Where ' + @Dieu_kien_tinh_trang + ' And ' + @Dieu_kien_bo_phan + ' And ' + @Dieu_kien_mon_hoc
	exec sp_executesql @sql
	--PRINT @sql	
END

