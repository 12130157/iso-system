if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetCongTac]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetCongTac]
GO
CREATE PROCEDURE sp_ISO_GetCongTac
	@Tinh_trang		varchar(2),
	@Ma_nhan_vien   varchar(10),
	@Ma_nam_hoc		varchar(4),
	@Tuan_le		varchar(4),
	@Check			varchar,
	@Bo_phan_BGH	varchar(4)
AS
BEGIN
	DECLARE @sql					nvarchar(4000)
	DECLARE @Dieu_kien_tuan			nvarchar(1000)
	DECLARE @Dieu_kien_nam_hoc		nvarchar(1000)
	DECLARE @Dieu_kien_tinh_trang	nvarchar(1000)
	DECLARE @Dieu_kien_thanh_vien	nvarchar(1000)

	SET @Dieu_kien_tuan = ' ''t'' = ''t'' '
	SET @Dieu_kien_nam_hoc = ' ''t'' = ''t'' '
	SET @Dieu_kien_tinh_trang = ' ''t'' = ''t'' '
	SET @Dieu_kien_thanh_vien = ' F.ID = ' + @Ma_nhan_vien

	IF(@Tinh_trang <> '')
		BEGIN
			SET @Dieu_kien_tinh_trang = ' ISNULL(E.Tinh_trang_thuc_hien, 0) = ' + @Tinh_trang
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

	IF(@Check = '1')
	BEGIN
		SET @Dieu_kien_thanh_vien = ' (' + @Dieu_kien_thanh_vien + ' OR D.Ma_khoa = ' + @Bo_phan_BGH + ') '
	END
	SELECT @sql = 'SELECT C.ID As MaNoiDungChiTietKHDT, D.ID As MaBoPhanThucHien, E.ID As MaNguoiThucHien, 
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
						INNER JOIN TuanLe H ON B.Tuan = H.ID
					WHERE A.Tinh_trang=2 
						AND ' + @Dieu_kien_thanh_vien + ' AND ' + @Dieu_kien_nam_hoc + ' AND ' + @Dieu_kien_tuan + ' AND ' + @Dieu_kien_tinh_trang + '
						ORDER BY Cast(B.Tu_ngay As Datetime) ASC'
	exec sp_executesql @sql
	--print @sql
END
--sp_help sp_executesql
--sp_ISO_GetCongTac '',15,'','','1','0'
--select * from thanhvien

/*	SELECT * FROM THANHVIENNGUOITHUCHIEN
	@Tinh_trang		varchar(2),
	@Ma_nhan_vien   varchar(10),
	@Ma_nam_hoc		varchar(4),
	@Tuan_le		varchar(4)

	NumRows  = 3
	TotalRows = 8
	CurrentPage = 1

	sp_ISO_GetQuyetDinhDaoTao NumRows,TotalRows-(CurrentPage-1)*NumRows

	sp_ISO_GetQuyetDinhDaoTao 3,2

	select count(*)/3 from ThanhVien
*/
--select count(*)/ from ThanhVien
