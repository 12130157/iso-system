if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetCountCongTac]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetCountCongTac]
GO
CREATE PROCEDURE sp_ISO_GetCountCongTac
	@Ma_thanh_vien  varchar(4),
	@Ma_nam_hoc		varchar(4),
	@Tuan_le		varchar(4)
AS
BEGIN
	DECLARE @sql					nvarchar(4000)
	DECLARE @Dieu_kien_tuan			nvarchar(1000)
	DECLARE @Dieu_kien_nam_hoc		nvarchar(1000)
	-- kiem tra dieu kien nam hoc
	IF(@Ma_nam_hoc = '')
		BEGIN
			SET @Dieu_kien_nam_hoc = ' AND (A.Nam1 = cast(datepart(yyyy,GETDATE()) as varchar) OR A.Nam2 = cast(datepart(yyyy,GETDATE()) as varchar)) '
		END
	ELSE
		BEGIN
			DECLARE @namBatDau	varchar(4)
			DECLARE @namKetThuc varchar(4)
			SELECT @namBatDau = Nam_bat_dau, @namKetThuc = Nam_ket_thuc FROM NAMHOC WHERE ID = @Ma_nam_hoc
			SET @Dieu_kien_nam_hoc = ' AND (A.Nam1 = ' + @namBatDau  + ' OR A.Nam2 = ' + @namKetThuc + ') '
		END
	-- kiem tra dieu kien tuan le
	IF(@Tuan_le = '')
		BEGIN
			SET @Dieu_kien_tuan = ' AND (convert(varchar(10),B.Tu_ngay,110) <= convert(varchar(10),GETDATE(),110) 
										AND convert(varchar(10),B.Den_ngay,110) >= convert(varchar(10),GETDATE(),110)) '
		END
	ELSE
		BEGIN
			IF(@Tuan_le = '0')
				BEGIN
					SET @Dieu_kien_tuan = ''
				END
			ELSE
				BEGIN
					DECLARE @ngayBatDau		varchar(20)
			DECLARE @ngayKetThuc	varchar(20)
			SELECT @ngayBatDau = convert(varchar(10),Tu_ngay,110), @ngayKetThuc = convert(varchar(10),Den_ngay,110) FROM TUANLE WHERE Ma_nam_hoc = @Ma_nam_hoc AND So_thu_tu = @Tuan_le
			SET @Dieu_kien_tuan = 'AND (convert(varchar(10),B.Tu_ngay,110) = ''' + @ngayBatDau + ''' AND convert(varchar(10),B.Den_ngay,110) = ''' + @ngayKetThuc + ''' ) '
				END
		END
	-- thuc thi
	SELECT @sql = 'SELECT Count(C.ID) As Count
		FROM KeHoachDaoTao A 
			INNER JOIN ChiTietKHDT B ON A.ID=B.Ma_ke_hoach 
			INNER JOIN NoiDungChiTietKHDT C ON B.ID=C.Ma_chi_tiet_KHDT 
			INNER JOIN BoPhanThucHienKHDT D ON C.ID=D.Ma_noi_dung_chi_tiet_KHDT 
			INNER JOIN NguoiThucHien E ON D.ID=E.Ma_bo_phan 
			INNER JOIN ThanhVien F ON E.Ma_thanh_vien=F.ID 
			INNER JOIN ChiTietThanhVien G ON F.Ten_DN=G.Ten_dang_nhap 
		WHERE A.Tinh_trang=2 
		AND F.ID = ' + @Ma_thanh_vien + @Dieu_kien_nam_hoc + @Dieu_kien_tuan
	exec sp_executesql @sql
	--PRINT @sql
END