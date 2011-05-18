IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_getDiemByMaSinhVienNTenMonHoc')
BEGIN
	DROP PROC sp_ISO_SMS_getDiemByMaSinhVienNTenMonHoc
END
GO
CREATE PROC sp_ISO_SMS_getDiemByMaSinhVienNTenMonHoc
	@MaSinhVien		varchar(50),
	@TenMonHoc		varchar(20)
AS
BEGIN
	SELECT		D.User2 AS 'Ten_Mon_Hoc' , F.Ten_Bai_Kiem_Tra AS 'Ten_Bai_KT',A.Diem,J.Hoc_Ki,B.Diem_Trung_Binh
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
	AND		D.User1 = @TenMonHoc 
END

--exec sp_ISO_SMS_getDiemByMaSinhVienNTenMonHoc 'an_ntt.hva','CTRI'

--update chitietdiem set diem = 5 where id = 1080
--select * from chitietthanhvien where ten_dang_nhap = 'bai_ls.hv'
--select * from thanhvien where ten_dn = 'bai_ls.hv'
--select * from LopHoc where id=0
--select * from thoikhoabieu where ma_lop = 0
--select * from chitiettkb where ma_tkb = 3
--select * from MonHoctkb where ma_tkb = 3
--select * from DangKyMonHoc where ma_mon_hoc_tkb = 16 and ma_hoc_vien = 51
--
--select * from ChiTietDiem where ma_dang_ky_mon_hoc = 250
--select * from DangKyMonHoc where ma_hoc_vien = 51
--select * from MonHocTKB where id = 19
--select * from MonHoc where id = 18
--
--select * from MonHoc where id= 17
--select * from baikiemtra where id = 64
--
--Select * from baikiemtra where ma_mon_hoc = 19
--select * from TenBaiKiemTra