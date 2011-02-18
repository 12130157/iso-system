if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetCongTacReport]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetCongTacReport]
GO
CREATE PROCEDURE sp_ISO_GetCongTacReport
	@Ma_thanh_vien	varchar(5),
	@Tinh_trang		varchar(2),
	@Khoa			varchar(10),
	@Ma_nam_hoc		varchar(4),
	@Tuan_le		varchar(4),
	@Check			varchar
AS
BEGIN
	DECLARE @sql				nvarchar(4000)
	DECLARE @Dieu_kien_tuan			nvarchar(1000)
	DECLARE @Dieu_kien_nam_hoc		nvarchar(1000)
	DECLARE @Dieu_kien_tinh_trang		nvarchar(1000)
	DECLARE @Dieu_kien_khoa			nvarchar(1000)
	DECLARE @Truong_khoa			nvarchar(1000)
	DECLARE @temp				nvarchar(1000)
	SET @Dieu_kien_tuan = ' ''t'' = ''t'' '
	SET @Dieu_kien_nam_hoc = ' ''t'' = ''t'' '
	SET @Dieu_kien_khoa = ' ''t'' = ''t'' '
	-- kiem tra dieu kien tinh trang
	SET @Dieu_kien_tinh_trang = ' ''t'' = ''t'' '
	IF(@Tinh_trang <> '')
		BEGIN
			SET @Dieu_kien_tinh_trang = ' ISNULL(E.Tinh_trang_thuc_hien, 0) = ' + @Tinh_trang
		END
	
	-- kiem tra dieu kien khoa
	/*SELECT @temp = Ma_vai_tro FROM THANHVIEN WHERE ID = @Ma_thanh_vien
	IF (@Khoa = '' AND (@temp = 0 OR @temp = 1 OR @temp = 2 OR @temp = 3 OR @temp = 10 OR @temp = 11))
		BEGIN
			SET @Dieu_kien_khoa = ''
		END
	ELSE IF(@Khoa <> '' AND (@temp = 0 OR @temp = 1 OR @temp = 2 OR @temp = 3 OR @temp = 10 OR @temp = 11))
		BEGIN
			SET @Dieu_kien_khoa = ' AND D.Ma_khoa = ' + @Khoa
		END
	ELSE IF not exists (SELECT * FROM Khoa_TrungTam WHERE Ma_truong_khoa = @Ma_thanh_vien)
		BEGIN
			IF(@Khoa <> '')
				BEGIN
					SET @Dieu_kien_khoa = ' AND D.Ma_khoa = ' + @Khoa
				END
		END
	ELSE
		BEGIN
			SELECT * INTO #TempKhoa FROM Khoa_TrungTam WHERE Ma_truong_khoa = @Ma_thanh_vien
			DECLARE @IDKhoa int		
			DECLARE @C CURSOR
			DECLARE @if varchar(4)
			DECLARE @count int
			SET @count = 0
			SET @C = CURSOR FOR SELECT ID FROM #TempKhoa
			OPEN @C 
			FETCH NEXT FROM @C INTO @IDKhoa
				WHILE @@fetch_status = 0
					BEGIN
						IF(@count = 0)
							BEGIN
								SET @if = ''
							END
						ELSE
							BEGIN
								SET @if = ' OR '
							END
						SET @Dieu_kien_khoa = @Dieu_kien_khoa + @if + ' D.Ma_khoa = ' + convert(varchar(10),(SELECT ID FROM Khoa_TrungTam WHERE ID = @IDKhoa))
						SET @count = @count + 1
						FETCH NEXT FROM @C INTO @IDKhoa
					END
				CLOSE @C
			DEALLOCATE @C
			SET @Dieu_kien_khoa = 'AND (' + @Dieu_kien_khoa + ')'
		END*/
	if(@Khoa <> '')
	BEGIN
		SET @Dieu_kien_khoa = ' D.Ma_khoa = ' + @Khoa
		IF(@Check = '0')
		BEGIN
			SET @Dieu_kien_khoa = ' E.Ma_thanh_vien = ' + @Ma_thanh_vien
		END
	END	
	-- kiem tra dieu kien nam hoc
	IF(@Ma_nam_hoc <> '')
		BEGIN
			SET @Dieu_kien_nam_hoc = ' B.Ma_nam_hoc = ' + @Ma_nam_hoc
		END

	-- kiem tra dieu kien tuan le
	IF(@Tuan_le = '')
		BEGIN
			SET @Dieu_kien_tuan = ' Cast(convert(varchar(10),B.Tu_ngay,110) As DateTime) <= Cast(convert(varchar(10),GETDATE(),110) as datetime) 
										AND Cast(convert(varchar(10),B.Den_ngay,110) as datetime) >= Cast(convert(varchar(10),GETDATE(),110) as datetime) '
		END
	ELSE IF(@Tuan_le < '60')
		BEGIN
			SET @Dieu_kien_tuan = ' H.So_thu_tu = ' + @Tuan_le			
		END
	ELSE IF(@Tuan_le < '80')
		BEGIN
			SET @Dieu_kien_tuan = ' '
		END

	SET @sql = 'SELECT C.ID As MaNoiDungChiTietKHDT, D.ID As MaBoPhanThucHien, E.ID As MaNguoiThucHien, 
						A.Ten As Ten,C.Noi_dung_cong_tac As NoiDungCongTac, D.Ten_bo_phan As TenBoPhan, E.Ten_thanh_vien As TenThanhVien , G.Email As Email, 
						(cast(datepart(dd,B.Tu_ngay) as varchar) + ''-'' + cast(datepart(mm,B.Tu_ngay) as varchar) + ''-'' + cast(datepart(yyyy,B.Tu_ngay) as varchar)) As Tu_ngay, 
						(cast(datepart(dd,B.Den_ngay) as varchar) + ''-'' + cast(datepart(mm,B.Den_ngay) as varchar) + ''-'' + cast(datepart(yyyy,B.Den_ngay) as varchar)) As Den_ngay, 
						E.Tinh_trang_thuc_hien As TinhTrangThucHien 
					FROM KeHoachDaoTao A 
						INNER JOIN ChiTietKHDT B ON A.ID=B.Ma_ke_hoach 
						INNER JOIN NoiDungChiTietKHDT C ON B.ID=C.Ma_chi_tiet_KHDT 
						INNER JOIN BoPhanThucHienKHDT D ON C.ID=D.Ma_noi_dung_chi_tiet_KHDT 
						INNER JOIN NguoiThucHien E ON D.ID=E.Ma_bo_phan 
						INNER JOIN ThanhVien F ON E.Ma_thanh_vien=F.ID 
						INNER JOIN ChiTietThanhVien G ON F.Ten_DN=G.Ten_dang_nhap 
						INNER JOIN TuanLe AS H ON B.Tuan = H.ID
					WHERE 
						' + @Dieu_kien_khoa + ' AND '
						+ @Dieu_kien_nam_hoc + ' AND ' + @Dieu_kien_tuan + ' AND ' + @Dieu_kien_tinh_trang + ' 
						ORDER BY B.Tu_ngay ASC, D.Ma_khoa ASC'
	exec sp_executesql @sql
	--print @sql
END