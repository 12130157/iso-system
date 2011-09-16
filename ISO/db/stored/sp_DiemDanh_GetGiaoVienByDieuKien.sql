if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_DiemDanh_GetGiaoVienByDieuKien]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_DiemDanh_GetGiaoVienByDieuKien]
GO
CREATE PROCEDURE sp_DiemDanh_GetGiaoVienByDieuKien
	@Khoa			varchar(30),
	@Lop			varchar(10),
	@NamHoc			varchar(10),
	@GiaoVien		varchar(20),
	@MonHoc			varchar(30),
	@ThoiGian		varchar(10)
	--@TinhTrang		varchar(10)
AS
BEGIN
	DECLARE @sql NVarchar(2000)
	declare @Dieu_Kien_Khoa			nvarchar(100)
	declare @Dieu_Kien_Lop			nvarchar(100)
	declare @Dien_Kien_Nam_Hoc		nvarchar(100)
	declare @Dieu_Kien_Giao_Vien		nvarchar(100)
	declare @Dieu_Kien_Mon_Hoc		nvarchar(100)
	declare @Dieu_Kien_Thoi_Gian		nvarchar(200)
	declare @Dieu_Kien_Tinh_Trang		nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(7)
	set @Dieu_Kien_Thoi_Gian = ' ''t'' = ''t'' '
	set @Dieu_Kien_Tinh_Trang = ' ''t'' = ''t'' '
	SET @And = ' AND '
	SET @Where = ' WHERE '
	if(@Khoa <> '')
	BEGIN
		SET @Dieu_Kien_Khoa = ' F.ID = ' + @Khoa
	END
	if(@Lop <> '')
	BEGIN
		SET @Dieu_Kien_Lop = 'd.id =' + @Lop
	END
	if(@NamHoc <> '')
	BEGIN
		SET @Dien_Kien_Nam_Hoc = ' A.User1 = ' + @NamHoc
	END
	if(@GiaoVien<>'')
	Begin
		SET @Dieu_Kien_Giao_Vien = 'j.id =' + @GiaoVien
	END
	if(@MonHoc <> '')
	BEGIN
		SET @Dieu_Kien_Mon_Hoc = ' B.Ma_mon_hoc = ' + @MonHoc
	END
	if(@ThoiGian <> '')
	BEGIN
		if(Cast(@ThoiGian AS Int) < 61)
		BEGIN
			SET @Dieu_Kien_Thoi_Gian = ' A.Tuan = ' + @ThoiGian
		END
		if(Cast(@ThoiGian AS Int) < 81 AND Cast(@ThoiGian AS Int) > 60)
		BEGIN
			SET @Dieu_Kien_Thoi_Gian = ' Datepart(mm, A.Ngay_hoc) = ' + Cast(Cast(@ThoiGian AS Int) - 60 AS varchar) 
			print @Dieu_Kien_Thoi_Gian
		END
	END
	SELECT @sql = '
	SELECT A.ID, H.Ki_hieu_phong AS KiHieuPhong, A.Buoi, A.Thu_trong_tuan AS ThuTrongTuan, 
			I.Ten_mon_hoc AS TenMonHoc, J.ID as MaGiaoVien,ISNULL((K.Ho + '' '' + K.Ten_Lot + '' '' + K.Ten),'''') As TenGiaoVien,
			Convert(varchar(10), A.Ngay_hoc, 105) As NgayHoc, F.Ten As TenKhoa, D.Ki_hieu As KiHieuLop,a.Hinh_thuc_day as HinhThucDay,A.NHOM
	FROM ChiTietTKB AS A 
		INNER JOIN MonHocTKB AS B ON B.ID = A.Ma_mon_hoc_TKB 
		INNER JOIN ThoiKhoaBieu AS C ON B.Ma_TKB = C.ID
		INNER JOIN LopHoc AS D ON C.Ma_lop = D.ID
		INNER JOIN ChuyenNganh AS E ON D.Ma_chuyen_nganh = E.ID
		INNER JOIN Khoa_TrungTam AS F ON E.Ma_khoaTT = F.ID
		INNER JOIN Tuanle AS G ON A.User1 = G.Ma_nam_hoc AND A.Tuan = G.So_thu_tu
		INNER JOIN PhongBan AS H ON A.Ma_phong = H.ID
		INNER JOIN MonHoc AS I ON B.Ma_mon_hoc = I.ID
		INNER JOIN ThanhVien AS J ON B.Ma_giao_vien = J.ID
		INNER JOIN ChiTietThanhVien AS K ON J.Ten_DN = K.Ten_dang_nhap'
		+ @Where + @Dieu_Kien_Khoa + @And + @Dieu_Kien_Lop + @And + @Dien_Kien_Nam_Hoc + @And + @Dieu_Kien_Giao_Vien + @And + @Dieu_Kien_Mon_Hoc + @And + @Dieu_Kien_Thoi_Gian +
		' ORDER BY A.Ngay_hoc, A.Thu_trong_tuan, A.Buoi DESC, A.Ma_phong, F.ID'
	exec  sp_executesql @sql
END

--exec sp_DiemDanh_GetGiaoVienByDieuKien 7,6,2,53,71,''
--sp_help sp_executesql
--sp_ISO_GetLichSuDungPhong '1','1','60','',''
--select * from lophoc
--select * from chitiettkb