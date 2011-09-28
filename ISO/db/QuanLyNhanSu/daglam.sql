SELECT * FROM THANHVIEN WHERE MA_VAI_TRO=8
SELECT * FROM CHITIETTHANHVIEN WHERE MA_LOP_HOC='9' ORDER BY TEN
SELECT * FROM KEHOACHGIANGDAY
SELECT * FROM LOPHOC 
SELECT * FROM KHOA_TRUNGTAM
SELECT * FROM CHITIETDIEMDANH
SELECT * FROM THANHVIENDIEMDANH
SELECT * FROM MONHOC where ten_mon_hoc like 'N%'


	SELECT B.Ma_thanh_vien AS MaHocSinh,E.Ten,CONVERT(VARCHAR(10),A.NGAY_HOC,105) AS NgayHoc,A.TINH_TRANG AS TinhTrang
	FROM CHITIETDIEMDANH A INNER JOIN THANHVIENDIEMDANH B ON A.MA_TVDD=B.ID
	INNER JOIN DIEMDANH C ON B.MA_DIEM_DANH=C.ID
	INNER JOIN THANHVIEN D ON B.MA_THANH_VIEN=D.ID
	INNER JOIN CHITIETTHANHVIEN E ON D.TEN_DN=E.TEN_DANG_NHAP
	WHERE C.MA_LOP_HOC='9' AND C.MA_MON_HOC='45'
	ORDER BY A.Ngay_hoc,E.Ten ASC

SELECT * 	
FROM CHITIETDIEMDANH A INNER JOIN THANHVIENDIEMDANH B ON A.MA_TVDD=B.ID
INNER JOIN DIEMDANH C ON B.MA_DIEM_DANH=C.ID
WHERE C.MA_LOP_HOC='9' AND C.MA_MON_HOC='45'

SHOW : Mã Học Sinh, Ngày Học, Tình Trạng
ĐK : Mã Lớp, Mã Giáo Viên, Mã Môn Học, 
SX : Nhóm, Tên, Ngày Học

loop DST{
	loop ListHocSinh{
		loop 31Ngay{
			Ngay vs DST -> NgayHoc
			MaThanhVien
			loop 720 lần
			sài break để giảm lượng công việc cho cpu
		}
	}
}

40hs * 7 tháng * 31 Ngày * 720 record
40 * 7 * 31 * 720 = 6249600


SP_HELPTEXT sp_DiemDanh_GetHocSinhByDieuKien
select * from chitietthanhvien a inner join thanhvien b on b.Ten_DN = a.Ten_dang_nhap where Ma_lop_hoc ='6' order by a.ten


SELECT * FROM SOTAYGIAOVIEN

SELECT A.Tinh_trang_ht as TinhTrangHT,A.ID As MaKeHoachGiangDay, A.Ma_mon_hoc As MaMonHoc, M.Ten_mon_hoc As TenMonHoc, A.Ma_lop As MaLop, G.Ki_hieu As KiHieuLop, A.Hoc_ki As HocKi, A.Ma_nam_hoc As MaNamHoc, (convert(varchar(4),H.Nam_bat_dau)+ ' - ' +convert(varchar(4),H.Nam_ket_thuc)) As NamHoc, A.So_ca_thuc_hanh As SoCaThucHanh, A.Ma_giao_vien As MaGiaoVien, (J.Ho+' '+J.Ten_lot+' '+J.Ten) As TenGiaoVien, A.Ma_nguoi_tao As MaNguoiTao, (C.Ho+' '+C.Ten_lot+' '+C.Ten) As TenNguoiTao, convert(varchar(20),A.Ngay_tao,105) As NgayTao, convert(varchar(20),A.Ngay_tao,108) As GioTao, A.Ma_nguoi_duyet As MaNguoiDuyet,ISNULL((F.Ho + ' ' + F.Ten_Lot + ' ' + F.Ten),'') As TenNguoiDuyet, convert(varchar(20),A.Ngay_duyet,105) As NgayDuyet, convert(varchar(20),A.Ngay_duyet,108) As GioDuyet, A.Tinh_trang As TinhTrang, A.So_tiet_moi_buoi As SoTietMoiBuoi, ISNULL(A.So_gio_LT,0) As SoGioLT, ISNULL(A.So_gio_TH,0) As SoGioTH, A.Ten As TenKeHoachGiangDay, A.Ly_do_reject As LyDoReject, convert(varchar(20),A.Ngay_cap_nhat_cuoi,105) As NgayCapNhatCuoi, convert(varchar(20), A.Ngay_cap_nhat_cuoi,108) As GioCapNhatCuoi, A.Truong_khoa As MaTruongKhoa, ISNULL((L.Ho + ' ' + L.Ten_Lot + ' ' + L.Ten),'') As TenTK, convert(varchar(20),A.Ngay_TK_Duyet,105) As NgayTKDuyet, convert(varchar(20), A.Ngay_TK_Duyet,108) As GioTKDuyet FROM KeHoachGiangDay As A INNER JOIN THANHVIEN As B ON A.Ma_nguoi_tao = B.ID INNER JOIN CHITIETTHANHVIEN As C ON B.Ten_DN = C.Ten_Dang_Nhap INNER JOIN LOPHOC As G ON A.Ma_lop = G.ID INNER JOIN NamHoc As H ON A.Ma_nam_hoc = H.ID INNER JOIN MONHOC As M ON A.Ma_mon_hoc = M.ID LEFT JOIN ThanhVien As E On A.Ma_nguoi_duyet = E.ID LEFT JOIN ChiTietThanhVien As F on E.Ten_DN = F.Ten_dang_nhap LEFT JOIN ThanhVien As I On A.Ma_giao_vien = I.ID LEFT JOIN CHITIETTHANHVIEN As J On I.Ten_DN = J.Ten_dang_nhap LEFT JOIN ThanhVien As K On A.Truong_khoa = K.ID LEFT JOIN ChiTietThanhVien As L on K.Ten_DN = L.Ten_dang_nhap WHERE A.ID = 5
SELECT * FROM THOIKHOABIEU
SELECT * FROM MONHOCTKB
SELECT * FROM THOIKHOABIEU
SELECT * FROM CHITIETTKB
SELECT * FROM KEHOACHGIANGDAY WHERE MA_LOP='9' AND MA_NAM_HOC='2'
SELECT * FROM CHITIETKHGD WHERE Ma_ke_hoach_giang_day='94'

select * from kehoachgiangday where id=94
select * from thanhvien where id=268

SELECT CONVERT(VARCHAR(10),MIN(Ngay_BD),105) as Ngay_bat_dau, CONVERT(VARCHAR(10),MAX(Ngay_BD),105) as Ngay_ket_thuc 
FROM CHITIETKHGD 
WHERE Ma_ke_hoach_giang_day='94'