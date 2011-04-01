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
	SELECT C.id AS 'id thoi khoa bieu',
	C.ngay_bat_dau AS 'Ngay bat dau hoc',C.ngay_ket_thuc AS 'Ngay ket thuc',
	G.ki_hieu AS 'Ma lop',C.Tuan_bat_dau,C.Tuan_ket_thuc,
	D.thu_trong_tuan,D.buoi,H.ki_hieu_phong,F.ten_mon_hoc

	FROM chitietthanhvien AS A 

	INNER JOIN thanhvien AS B
		ON B.ten_dn = A.ten_dang_nhap

	INNER JOIN lophoc AS G
		ON G.ID = A.ma_lop_hoc

	INNER JOIN thoikhoabieu AS C
		ON A.ma_lop_hoc = C.ma_lop

	INNER JOIN chitiettkb AS D
		ON C.id = D.ma_tkb

	INNER JOIN phongban AS H 
		ON D.ma_phong = H.id

	INNER JOIN monhoctkb AS E
		ON C.id = E.ma_tkb

	INNER JOIN monhoc AS F
		ON F.id = E.ma_mon_hoc

	WHERE B.id = @idSinhVien 
	and F.id = @idMonHoc
END