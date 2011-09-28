SELECT * FROM THANHVIEN WHERE MA_VAI_TRO=8
SELECT * FROM CHITIETTHANHVIEN ORDER BY TEN
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
	WHERE C.MA_LOP_HOC='6' AND C.MA_MON_HOC='71'
	ORDER BY A.Ngay_hoc,E.Ten ASC

SHOW : Mã Học Sinh, Ngày Học, Tình Trạng
ĐK : Mã Lớp, Mã Giáo Viên, Mã Môn Học, 
SX : Nhóm, Tên, Ngày Học



Làm cách nào để khớp với danh sách Tháng ?
Đợi thầy trả lời vấn đề Lớp Học làm tiếp

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

SP_HELPTEXT sp_DiemDanh_GetHocSinhByDieuKien
select * from chitietthanhvien a inner join thanhvien b on b.Ten_DN = a.Ten_dang_nhap where Ma_lop_hoc ='6' order by a.ten