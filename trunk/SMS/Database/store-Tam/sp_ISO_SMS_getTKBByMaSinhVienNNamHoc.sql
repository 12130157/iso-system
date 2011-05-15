IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_getTKBByMaSinhVienNNamHoc')
BEGIN
	DROP PROC sp_ISO_SMS_getTKBByMaSinhVienNNamHoc
END
GO
CREATE PROC sp_ISO_SMS_getTKBByMaSinhVienNNamHoc
	@MaSinhVien		varchar(50),
	@NamHoc			varchar(10)
AS
BEGIN
	SELECT		A.Buoi,CAST(DATEPART(DAY,A.Ngay_Hoc) AS VARCHAR)+'/'+CAST(DATEPART(MONTH,A.Ngay_Hoc) AS VARCHAR)+'/'+CAST(DATEPART(YEAR,A.Ngay_Hoc) AS VARCHAR) AS 'Ngay Hoc',
				B.Hoc_Ki,J.Ki_Hieu_Phong,E.User2 AS 'Ten_Mon_hoc',A.Hinh_Thuc_Day,G.User1 AS 'Giao Vien' 
	FROM		ChiTietTKB	AS A 
	INNER JOIN	ThoiKhoaBieu		AS B	ON A.Ma_TKB = B.ID
	INNER JOIN	LopHoc				AS C	ON B.Ma_Lop = C.ID
	INNER JOIN	ChiTietThanhVien	AS H	ON H.Ma_Lop_Hoc = C.ID
	INNER JOIN	MonHocTKB			AS D	ON A.Ma_Mon_Hoc_TKB = D.ID AND A.Ma_TKB = D.Ma_TKB
	INNER JOIN	MonHoc				AS E	ON D.Ma_Mon_Hoc = E.ID
	INNER JOIN	ThanhVien			AS F	ON D.Ma_Giao_Vien = F.ID
	INNER JOIN	ChiTietThanhVien	AS G	ON F.Ten_DN = G.Ten_Dang_Nhap
	INNER JOIN	PhongBan			AS J	ON A.Ma_Phong = J.ID
	WHERE		H.Ten_Dang_Nhap = @MaSinhVien
	AND			CAST(DATEPART(YEAR,A.Ngay_Hoc) AS VARCHAR) = @NamHoc
END

--exec sp_ISO_SMS_getTKBByMaSinhVienNNamHoc 'bai_ls.hv','2010'

--select * from chitietthanhvien where ten_dang_nhap = 'bai_ls.hv'
--select * From thoikhoabieu where ma_lop = 0
--select * from chitietTKB where ma_tkb = 2 and CAST(DATEPART(YEAR,Ngay_Hoc) AS VARCHAR) = '2010'