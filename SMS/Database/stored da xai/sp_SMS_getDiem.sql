IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_getDiem')
BEGIN
	DROP PROC sp_ISO_SMS_getDiem
END
GO
CREATE PROC sp_ISO_SMS_getDiem
	@idSinhVien		int,
	@idMonHoc		int
AS
BEGIN
	SELECT C.ma_hoc_vien,D.ten_mon_hoc,
	E.ten_bai_kiem_tra+' '+F.ten_hinh_thuc AS 'Ten vs Hinh Thuc KT',A.Diem

	FROM chitietdiem AS A

		INNER JOIN baikiemtra AS B
		ON  A.ma_bai_kiem_tra = B.id

		INNER JOIN monhoc AS D
		ON B.ma_mon_hoc = D.id

		INNER JOIN dangkymonhoc AS C
		ON A.ma_dang_ky_mon_hoc = C.id

		INNER JOIN tenbaikiemtra AS E
		ON B.ma_bai_kiem_tra = E.id 

		INNER JOIN hinhthuc AS F
		ON B.ma_hinh_thuc = F.id

	WHERE C.ma_hoc_vien = @idSinhVien
	AND B.ma_mon_hoc  = @idMonHoc
END