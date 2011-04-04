IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_getTKB')
BEGIN
	DROP PROC sp_ISO_SMS_getTKB
END
GO
CREATE PROC sp_ISO_SMS_getTKB
	@idSinhVien		int,
	@idMonHoc		int
AS
BEGIN
	SELECT CAST(DATEPART(DAY,A.ngay_hoc) AS VARCHAR)
	+'/'+CAST(DATEPART(MONTH,A.ngay_hoc) AS VARCHAR)
	+'/'+CAST(DATEPART(YEAR,A.ngay_hoc) AS VARCHAR) AS 'Ngay hoc',	
	A.buoi AS 'Buoi',H.ki_hieu_phong AS 'Ten Phong',G.ten_mon_hoc AS 'Mon Hoc'

	FROM chitiettkb AS A 

	INNER JOIN thoikhoabieu AS B
	ON A.ma_tkb = B.ID
	INNER JOIN lophoc AS C
	ON B.ma_lop = C.id
	INNER JOIN chitietthanhvien AS D
	ON C.id = D.ma_lop_hoc
	INNER JOIN thanhvien AS E
	ON D.ten_dang_nhap = E.ten_dn

	INNER JOIN monhoctkb AS F 
	ON A.ma_mon_hoc_tkb = F.id
	INNER JOIN monhoc AS G
	ON F.ma_mon_hoc = G.id

	INNER JOIN phongban AS H 
	ON A.ma_phong = H.id

	WHERE E.id = @idSinhVien
	AND G.id = @idMonHoc
END