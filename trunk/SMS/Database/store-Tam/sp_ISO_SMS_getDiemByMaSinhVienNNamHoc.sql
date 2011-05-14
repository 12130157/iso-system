IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_getDiemByMaSinhVienNNamHoc')
BEGIN
	DROP PROC sp_ISO_SMS_getDiemByMaSinhVienNNamHoc
END
GO
CREATE PROC sp_ISO_SMS_getDiemByMaSinhVienNNamHoc
	@MaSinhVien		varchar(50),
	@NamHoc			varchar(10)
AS
BEGIN
	SELECT		D.User2 , F.Ten_Bai_Kiem_Tra + '/' + G.Ten_Hinh_Thuc AS 'Ten vs Hinh Thuc KT',A.Diem,J.Hoc_Ki
	FROM		ChiTietDiem		AS A
	INNER JOIN	DangKyMonHoc	AS B	ON A.Ma_Dang_Ky_Mon_Hoc = B.ID
	INNER JOIN	MonHocTKB		AS C	ON B.Ma_Mon_Hoc_TKB = C.ID
	INNER JOIN	MonHoc			AS D	ON C.Ma_Mon_Hoc = D.ID	
	INNER JOIN	ThanhVien		AS H	ON B.Ma_Hoc_Vien = H.ID
	INNER JOIN	ThoiKhoaBieu	AS J	ON C.Ma_TKB = J.ID
	INNER JOIN	BaiKiemTra		AS E	ON A.Ma_Bai_Kiem_Tra = E.ID AND C.Ma_mon_Hoc = E.Ma_Mon_Hoc
	INNER JOIN	TenBaiKiemTra	AS F	ON E.Ma_Bai_Kiem_Tra = F.ID
	INNER JOIN	HinhThuc		AS G	ON E.Ma_Hinh_Thuc = G.ID
	WHERE	H.Ten_DN = @MaSinhVien
	AND		(CAST(DATEPART(YEAR,C.Ngay_Bat_Dau_LT) AS VARCHAR) = @NamHoc OR CAST(DATEPART(YEAR,C.Ngay_Bat_Dau_TH) AS VARCHAR) = @NamHoc)
END

--exec sp_ISO_SMS_getDiemByMaSinhVienNNamHoc 'bai_ls.hv','2010'

