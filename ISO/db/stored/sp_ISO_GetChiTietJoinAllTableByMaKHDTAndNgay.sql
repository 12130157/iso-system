if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetChiTietJoinAllTableByMaKHDTAndNgay]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetChiTietJoinAllTableByMaKHDTAndNgay]
GO
CREATE PROC sp_ISO_GetChiTietJoinAllTableByMaKHDTAndNgay
	@Ma_ke_hoach	int,
	@Nam_bat_dau	varchar(4),
	@Kieu_tuan varchar -- Tuan hien tai hoac tuan sau
AS
BEGIN
	DECLARE @Ngay varchar(10)
	SET @Ngay = convert(varchar(10), getdate(), 110)
	DECLARE @Tu_ngay varchar(10)
	DECLARE @Den_ngay varchar(10)
	SELECT TOP 1 @Tu_ngay = Convert(varchar(10), C.Tu_ngay, 110) FROM (SELECT TOP 10 A.Tu_ngay FROM TuanLe AS A INNER JOIN NamHoc AS B ON A.Ma_nam_hoc = B.ID
		WHERE B.Nam_bat_dau = Cast(2010 AS Int) - 1
		ORDER BY A.So_thu_tu DESC ) C
	ORDER BY C.Tu_ngay 

	SELECT TOP 1 @Den_ngay = Convert(varchar(10), A.Den_ngay, 110) FROM TuanLe AS A INNER JOIN NamHoc AS B ON A.Ma_nam_hoc = B.ID 
		WHERE B.Nam_bat_dau = @Nam_bat_dau ORDER BY A.So_thu_tu DESC

	IF(@Kieu_tuan = '2')
	BEGIN
		SET @Ngay = convert(varchar(10), DATEADD(DAY, 7, @Ngay), 110)
	END
	DECLARE @sql nvarchar(3000)
	SELECT @sql = 'SELECT B.ID AS MaChiTietKHDT, Convert(varchar(10),J.Tu_ngay,110) AS TuNgay, 
		Convert(varchar(10),J.Den_ngay,110) AS DenNgay, J.Ma_nam_hoc AS MaNamHoc, 
		J.ID AS Tuan, B.Tinh_trang_phan_cong_tac AS TinhTrangPhanCongTableChiTietKHDT, 
		B.User1 AS User1TableChiTietKHDT,B.User2 AS User2TableChiTietKHDT,B.User3 AS User3TableChiTietKHDT, 
		B.User4 AS User4TableChiTietKHDT,B.User5 AS User5TableChiTietKHDT, J.So_thu_tu As ThuTuTuan, 
		C.ID AS MaNoiDungChiTietKHDT, C.Ma_cong_tac As MaCongTac, C.Khoa, C.Noi_dung_cong_tac As NoiDungCongTac, 
		C.Tinh_trang_thuc_hien As TinhTrangThucHienTableNoiDungKHDT, C.Bo_sung As BoSungTableNoiDungKHDT, 
		C.User1 AS User1TableNoiDungKHDT,C.User2 AS User2TableNoiDungKHDT, C.User3 AS User3TableNoiDungKHDT,
		C.User4 AS User4TableNoiDungKHDT,C.User5 AS User5TableNoiDungKHDT, C.Thu As Thu, C.Buoi As Buoi, 
		C.Ngay As Ngay, C.Gio As Gio, C.Phut As Phut, C.Tinh_trang_phan_cong As TinhTrangPhanCong, 
		(''<+na+>'' + IsNull(C.Ghi_chu,'''') + ''<-reg->'' + Cast(C.Gio As varchar) + ''<-reg->'' + Cast(C.Phut As varchar) + ''<-reg->'' + Cast(C.Buoi As varchar) + ''<-reg->'' + Cast(C.Thu As Varchar) + ''<-reg->'' + Convert(varchar(10), C.Ngay, 101)) As ThoiGian,
		D.ID AS MaBoPhanThucHien, D.Ma_khoa As MaKhoa, D.Ten_bo_phan As TenBoPhan, D.User1  AS User1TableBoPhanKHDT,
		D.User2 AS User2TableBoPhanKHDT,D.User3 AS User3TableBoPhanKHDT, D.User4 AS User4TableBoPhanKHDT,
		D.User5 AS User5TableBoPhanKHDT, E.ID AS MaNguoiThucHien, E.Ma_thanh_vien As MaThanhVien, 
		ISNULL(L.Ho + '' '' + L.Ten_Lot + '' '' + L.Ten,'''') As TenThanhVien, 
		E.Tinh_trang_thuc_hien As TinhTrangThucHienTableNguoiThucHien, E.User1 AS User1TableNguoiThucHienKHDT,
		E.User2 AS User2TableNguoiThucHienKHDT, E.User3 AS User3TableNguoiThucHienKHDT,E.User4 AS User4TableNguoiThucHienKHDT,
		E.User5  AS User5TableNguoiThucHienKHDT, J.So_thu_tu AS ThuTuTuan 
	FROM TuanLe AS J 
		LEFT JOIN ChiTietKHDT AS B ON B.Tuan = J.ID And B.Ma_ke_hoach = ' + Cast(@Ma_ke_hoach AS varchar) + '
		LEFT JOIN NoiDungChiTietKHDT AS C ON C.Ma_chi_tiet_KHDT = B.ID 
		LEFT JOIN BoPhanThucHienKHDT AS D ON D.Ma_noi_dung_chi_tiet_KHDT = C.ID 
		LEFT JOIN NguoiThucHien AS E ON D.ID = E.Ma_bo_phan 
		LEFT JOIN ThanhVien AS K ON E.Ma_thanh_vien = K.ID 
		LEFT JOIN ChiTietThanhVien AS L ON K.Ten_DN = L.Ten_dang_nhap 
		WHERE Cast(Convert(varchar(10), J.Tu_ngay, 110) As datetime) <= Cast(''' + @Ngay + ''' As datetime)
			And Cast(''' + @Ngay + ''' As datetime) <= Cast(Convert(varchar(10), J.Den_ngay, 110) As datetime)
			And Cast(''' + @Tu_ngay + ''' As datetime) <= Cast(''' + @Ngay + ''' As datetime)
			And Cast(''' + @Ngay + ''' As datetime) <= Cast(''' + @Den_ngay + ''' As datetime)
		ORDER BY B.Tu_ngay, C.Khoa, C.ID, D.ID, E.ID '
	exec  sp_executesql @sql
--print @sql
END

--exec sp_ISO_GetChiTietJoinAllTableByMaKHDTAndNgay 0,'2010','1'