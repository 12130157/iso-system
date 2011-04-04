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
	SELECT D.ten_mon_hoc AS 'Ten Mon Hoc',
	G.ten_bai_kiem_tra+' '+H.ten_hinh_thuc AS 'Ten vs Hinh Thuc KT',A.Diem AS 'Diem'

	FROM chitietdiem AS A

	INNER JOIN dangkymonhoc AS B
	ON A.ma_dang_ky_mon_hoc = B.id
	INNER JOIN monhoctkb AS C
	ON B.ma_mon_hoc_tkb = C.id
	INNER JOIN monhoc AS D
	ON C.ma_mon_hoc = D.id

	INNER JOIN baikiemtra AS E
	ON A.ma_bai_kiem_tra = E.id
	INNER JOIN monhoc AS F
	ON E.ma_mon_hoc = F.id
	INNER JOIN tenbaikiemtra AS G 
	ON E.ma_bai_kiem_tra = G.id
	INNER JOIN hinhthuc AS H 
	ON E.ma_hinh_thuc = H.id

	WHERE B.ma_hoc_vien = @idSinhVien
	AND C.ma_mon_hoc = @idMonHoc
	AND E.ma_mon_hoc = @idMonHoc
END
--
--select * from chitietdiem
--select * from dangkymonhoc
--select * from monhoctkb
--select * from monhoc
--
--select * from baikiemtra
--select * from tenbaikiemtra
--select * from hinhthuc
