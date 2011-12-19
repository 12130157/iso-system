IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE NAME='sp_ThietBi_DanhSachThietBi')
BEGIN
	DROP PROC sp_ThietBi_DanhSachThietBi
END
GO
CREATE PROC sp_ThietBi_DanhSachThietBi
@Phong VARCHAR(10),
@Khoa VARCHAR(10),
@Loai_thiet_bi VARCHAR(10),
@Tinh_trang VARCHAR(10),
@Hien_trang VARCHAR(10),
@Gio_bd VARCHAR(10),
@Phut_bd VARCHAR(10),
@Gio_kt VARCHAR(10),
@Phut_kt VARCHAR(10),
@Ngay_bd VARCHAR(10),
@Ngay_kt VARCHAR(10),
@NUM_PAGE VARCHAR(10),
@NUM_RECORD VARCHAR(10)
AS
BEGIN
	DECLARE @DK_Phong VARCHAR(100)
	DECLARE @DK_Khoa VARCHAR(100)
	DECLARE @DK_Loai_thiet_bi VARCHAR(100)
	DECLARE @DK_Tinh_trang VARCHAR(100)
	DECLARE @DK_Hien_trang VARCHAR(100)
	DECLARE @DK_Ngay VARCHAR(200)
	DECLARE @BD VARCHAR(20)
	DECLARE @KT VARCHAR(20)

	SET @DK_Phong = ''
	SET @DK_Khoa = ''
	SET @DK_Loai_thiet_bi = ''
	SET @DK_Tinh_trang = ''
	SET @DK_Hien_trang = ''
	SET @DK_Ngay = ''

	IF @Phong <> ''
	BEGIN
		SET @DK_Phong = ' AND A.Vi_tri_lap_dat='+@Phong
	END
	IF @Khoa <> ''
	BEGIN
		SET @DK_Khoa = ' AND B.Bo_phan_nhan='+@Khoa
	END
	IF @Loai_thiet_bi <> ''
	BEGIN
		SET @DK_Loai_thiet_bi = ' AND A.Ma_loai_thiet_bi='+@Loai_thiet_bi
	END
	IF @Tinh_trang <> ''
	BEGIN
		SET @DK_Tinh_trang = ' AND A.Tinh_trang='+@Tinh_trang
	END
	IF @Hien_trang <> ''
	BEGIN
		SET @DK_Hien_trang = ' AND A.Hien_trang='+@Hien_trang
	END
	IF (@Gio_bd <> '' OR @Phut_bd <> '' OR @Gio_kt <> '' OR @Phut_kt <> '') AND @Ngay_bd = '' AND @Ngay_kt = ''
	BEGIN
		--Tìm kiếm theo thời gian từ hh:mm đến hh:mm
		SET @BD = @Gio_bd+':'+@Phut_bd+':00'
		SET @KT = @Gio_kt+':'+@Phut_kt+':00'
		SET @DK_Ngay = ' AND CAST((CONVERT(VARCHAR,C.Thoi_gian_nhan,108)) AS DATETIME)>=CAST('''+@BD+''' AS DATETIME) AND CAST((CONVERT(VARCHAR,C.Thoi_gian_tra,108)) AS DATETIME)<=CAST('''+@KT+''' AS DATETIME)'
	END
	IF (@Gio_bd <> '' OR @Phut_bd <> '' OR @Gio_kt <> '' OR @Phut_kt <> '') AND @Ngay_bd <> '' AND @Ngay_kt = ''
	BEGIN
		--Tìm kiếm theo thời gian Ngay_bd hh:mm đến Ngay_bd hh:mm
		
		SET @BD = @Ngay_bd+' '+@Gio_bd+':'+@Phut_bd+':00'
		SET @KT = @Ngay_bd+' '+@Gio_kt+':'+@Phut_kt+':00'
		SET @DK_Ngay = ' AND C.Thoi_gian_nhan>=CAST('''+@BD+''' AS DATETIME) AND C.Thoi_gian_tra<=CAST('''+@KT+''' AS DATETIME)'
	END
	IF (@Gio_bd <> '' OR @Phut_bd <> '' OR @Gio_kt <> '' OR @Phut_kt <> '') AND @Ngay_bd <> '' AND @Ngay_kt <> ''
	BEGIN
		--Tìm kiếm theo thời gian Ngay_bd hh:mm đến Ngay_kt hh:mm 
		SET @BD = @Ngay_bd+' '+@Gio_bd+':'+@Phut_bd+':00'
		SET @KT = @Ngay_kt+' '+@Gio_kt+':'+@Phut_kt+':00'
		SET @DK_Ngay = ' AND C.Thoi_gian_nhan>=CAST('''+@BD+''' AS DATETIME) AND C.Thoi_gian_tra<=CAST('''+@KT+''' AS DATETIME)'
	END
	IF (@Gio_bd = '' OR @Phut_bd = '' OR @Gio_kt = '' OR @Phut_kt = '') AND @Ngay_bd <> '' AND @Ngay_kt = ''
	BEGIN
		--Tìm kiếm theo thời gian dd-mm-yyyy
		SET @DK_Ngay = ' AND CONVERT(VARCHAR,C.Thoi_gian_nhan,110) <> '+@Ngay_bd
	END
	IF (@Gio_bd = '' OR @Phut_bd = '' OR @Gio_kt = '' OR @Phut_kt = '') AND @Ngay_bd <> '' AND @Ngay_kt <> ''
	BEGIN
		--Tìm kiếm theo thời gian Ngay_bd đến Ngay_kt
		SET @DK_Ngay = ' AND CAST(CONVERT(VARCHAR,C.Thoi_gian_nhan,110) AS DATETIME)>=CAST('''+@Ngay_bd+''' AS DATETIME) AND CAST(CONVERT(VARCHAR,C.Thoi_gian_TRA,110) AS DATETIME)<=CAST('''+@Ngay_kt+''' AS DATETIME)'
	END
	
	DECLARE @SQL NVARCHAR(4000)
	SET @SQL = '
	SELECT * FROM ( 
	SELECT TOP '+@NUM_RECORD+' * FROM 
		(SELECT TOP '+CAST((SELECT COUNT(*)-((CAST(@NUM_PAGE AS INT)-1)*CAST(@NUM_RECORD AS INT)) FROM THIETBI) AS VARCHAR)
		+ ' A.ID as MaThietBi,D.ID as MaLoaiThietBi,D.Ten_loai_thiet_bi as TenLoaiThietBi,A.Ma as Ma, A.Ki_hieu as KiHieu,A.Ten_thiet_bi as TenThietBi,E.ID as MaPhongBan,E.Ki_hieu_phong as TenPhongBan,F.ID as MaTinhTrang,F.Ten_tinh_trang as TenTinhTrang,J.ID as MaHienTrang,J.Ten_hien_trang as TenHienTrang
		FROM THIETBI A LEFT JOIN LYLICHTHIETBI B ON B.MA_THIET_BI=A.ID
		LEFT JOIN CHITIETMUONTHIETBI C ON C.MA_THIET_BI=A.ID
		INNER JOIN LOAITHIETBI D ON A.MA_LOAI_THIET_BI=D.ID
		INNER JOIN PHONGBAN E ON A.Vi_tri_lap_dat=E.ID
		INNER JOIN TINHTRANG F ON F.ID=A.Tinh_trang
		INNER JOIN HIENTRANG J on J.ID=a.Hien_trang
		WHERE 1=1'
		+ @DK_Phong
		+ @DK_Khoa
		+ @DK_Loai_thiet_bi
		+ @DK_Tinh_trang
		+ @DK_Hien_trang
		+ @DK_Ngay 
		+ ' ORDER BY A.ID DESC) AS TB1 ORDER BY MaThietBi ASC
	) AS TB2 ORDER BY MaThietBi ASC' 
	

	PRINT @SQL
	EXEC sp_executesql @SQL
END