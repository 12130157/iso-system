/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	29/05/2011
	Mục Đích	:	show Đề Nghị
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_SelectAllDeNghiNhanSu')
BEGIN
	DROP PROC sp_NhanSu_SelectAllDeNghiNhanSu
END
GO
CREATE PROC sp_NhanSu_SelectAllDeNghiNhanSu
	@Ma_bo_phan			VARCHAR(5),
	@Nguoi_de_nghi		VARCHAR(5),
	@Tinh_trang			VARCHAR(5)
AS  
BEGIN
	IF(@Ma_bo_phan = '1')
	BEGIN
		IF(@Tinh_trang = '')
		BEGIN
			SELECT A.*,B.Ma_truong_khoa as Ma_truong_khoa,B.Ten as Ten_bo_phan,(E.Ho+' '+E.Ten_lot+' '+E.Ten) as Ten_nguoi_de_nghi,C.Ten_vai_tro AS Ten_Chuc_danh,CONVERT(VARCHAR(50),A.Ngay_lap,105) as Ngay_lap_mdy
			FROM DENGHINHANSU A LEFT JOIN KHOA_TRUNGTAM B ON A.Ma_bo_phan=B.ID LEFT JOIN VAITRO C ON A.Chuc_danh=C.ID LEFT JOIN ThanhVien D ON A.Nguoi_de_nghi=D.ID LEFT JOIN ChiTietThanhVien E ON D.Ten_DN=E.Ten_dang_nhap
			WHERE A.Tinh_trang>='2'
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
		IF(@Tinh_trang <> '')
			BEGIN
				SELECT * FROM(
				SELECT A.*,B.Ma_truong_khoa as Ma_truong_khoa,B.Ten as Ten_bo_phan,(E.Ho+' '+E.Ten_lot+' '+E.Ten) as Ten_nguoi_de_nghi,C.Ten_vai_tro AS Ten_Chuc_danh,CONVERT(VARCHAR(50),A.Ngay_lap,105) as Ngay_lap_mdy
				FROM DENGHINHANSU A LEFT JOIN KHOA_TRUNGTAM B ON A.Ma_bo_phan=B.ID LEFT JOIN VAITRO C ON A.Chuc_danh=C.ID LEFT JOIN ThanhVien D ON A.Nguoi_de_nghi=D.ID LEFT JOIN ChiTietThanhVien E ON D.Ten_DN=E.Ten_dang_nhap
				WHERE A.Tinh_trang>='2') AS TB1 WHERE Tinh_trang=@Tinh_trang ORDER BY NGAY_CAP_NHAT_CUOI DESC
			END
		END
	IF(@Ma_bo_phan = '2')
	BEGIN
		IF(@Tinh_trang = '')
		BEGIN
			SELECT A.*,B.Ma_truong_khoa as Ma_truong_khoa,B.Ten as Ten_bo_phan,(E.Ho+' '+E.Ten_lot+' '+E.Ten) as Ten_nguoi_de_nghi,C.Ten_vai_tro AS Ten_Chuc_danh,CONVERT(VARCHAR(50),A.Ngay_lap,105) as Ngay_lap_mdy
			FROM DENGHINHANSU A LEFT JOIN KHOA_TRUNGTAM B ON A.Ma_bo_phan=B.ID LEFT JOIN VAITRO C ON A.Chuc_danh=C.ID LEFT JOIN ThanhVien D ON A.Nguoi_de_nghi=D.ID LEFT JOIN ChiTietThanhVien E ON D.Ten_DN=E.Ten_dang_nhap
			WHERE A.Tinh_trang>='3'
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
		IF(@Tinh_trang <> '')
		BEGIN
			SELECT * FROM( 
			SELECT A.*,B.Ma_truong_khoa as Ma_truong_khoa,B.Ten as Ten_bo_phan,(E.Ho+' '+E.Ten_lot+' '+E.Ten) as Ten_nguoi_de_nghi,C.Ten_vai_tro AS Ten_Chuc_danh,CONVERT(VARCHAR(50),A.Ngay_lap,105) as Ngay_lap_mdy
			FROM DENGHINHANSU A LEFT JOIN KHOA_TRUNGTAM B ON A.Ma_bo_phan=B.ID LEFT JOIN VAITRO C ON A.Chuc_danh=C.ID LEFT JOIN ThanhVien D ON A.Nguoi_de_nghi=D.ID LEFT JOIN ChiTietThanhVien E ON D.Ten_DN=E.Ten_dang_nhap
			WHERE A.Tinh_trang>='3') AS TB2 WHERE Tinh_trang=@Tinh_trang ORDER BY NGAY_CAP_NHAT_CUOI DESC
		END
	END
	IF(@Ma_bo_phan = '0')
	BEGIN
		IF(@Tinh_trang = '')
		BEGIN
			SELECT A.*,B.Ma_truong_khoa as Ma_truong_khoa,B.Ten as Ten_bo_phan,(E.Ho+' '+E.Ten_lot+' '+E.Ten) as Ten_nguoi_de_nghi,C.Ten_vai_tro AS Ten_Chuc_danh,CONVERT(VARCHAR(50),A.Ngay_lap,105) as Ngay_lap_mdy
			FROM DENGHINHANSU A LEFT JOIN KHOA_TRUNGTAM B ON A.Ma_bo_phan=B.ID LEFT JOIN VAITRO C ON A.Chuc_danh=C.ID LEFT JOIN ThanhVien D ON A.Nguoi_de_nghi=D.ID LEFT JOIN ChiTietThanhVien E ON D.Ten_DN=E.Ten_dang_nhap
			WHERE A.Tinh_trang>='4'
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
		IF(@Tinh_trang <> '')
		BEGIN
			SELECT * FROM( 
			SELECT A.*,B.Ma_truong_khoa as Ma_truong_khoa,B.Ten as Ten_bo_phan,(E.Ho+' '+E.Ten_lot+' '+E.Ten) as Ten_nguoi_de_nghi,C.Ten_vai_tro AS Ten_Chuc_danh,CONVERT(VARCHAR(50),A.Ngay_lap,105) as Ngay_lap_mdy
			FROM DENGHINHANSU A LEFT JOIN KHOA_TRUNGTAM B ON A.Ma_bo_phan=B.ID LEFT JOIN VAITRO C ON A.Chuc_danh=C.ID LEFT JOIN ThanhVien D ON A.Nguoi_de_nghi=D.ID LEFT JOIN ChiTietThanhVien E ON D.Ten_DN=E.Ten_dang_nhap
			WHERE A.Tinh_trang>='4') AS TB3 WHERE Tinh_trang=@Tinh_trang ORDER BY NGAY_CAP_NHAT_CUOI DESC
		END
	END
	IF(@Ma_bo_phan = '16')
	BEGIN
		IF(@Tinh_trang = '')
		BEGIN
			SELECT A.*,B.Ma_truong_khoa as Ma_truong_khoa,B.Ten as Ten_bo_phan,(E.Ho+' '+E.Ten_lot+' '+E.Ten) as Ten_nguoi_de_nghi,C.Ten_vai_tro AS Ten_Chuc_danh,CONVERT(VARCHAR(50),A.Ngay_lap,105) as Ngay_lap_mdy
			FROM DENGHINHANSU A LEFT JOIN KHOA_TRUNGTAM B ON A.Ma_bo_phan=B.ID LEFT JOIN VAITRO C ON A.Chuc_danh=C.ID LEFT JOIN ThanhVien D ON A.Nguoi_de_nghi=D.ID LEFT JOIN ChiTietThanhVien E ON D.Ten_DN=E.Ten_dang_nhap
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
		IF(@Tinh_trang <> '')
		BEGIN
			IF(@Tinh_trang = '1')
			BEGIN
				SELECT A.*,B.Ma_truong_khoa as Ma_truong_khoa,B.Ten as Ten_bo_phan,(E.Ho+' '+E.Ten_lot+' '+E.Ten) as Ten_nguoi_de_nghi,C.Ten_vai_tro AS Ten_Chuc_danh,CONVERT(VARCHAR(50),A.Ngay_lap,105) as Ngay_lap_mdy
				FROM DENGHINHANSU A LEFT JOIN KHOA_TRUNGTAM B ON A.Ma_bo_phan=B.ID LEFT JOIN VAITRO C ON A.Chuc_danh=C.ID LEFT JOIN ThanhVien D ON A.Nguoi_de_nghi=D.ID LEFT JOIN ChiTietThanhVien E ON D.Ten_DN=E.Ten_dang_nhap
				WHERE A.Tinh_trang='2' OR A.Tinh_trang='3' OR A.Tinh_trang='4'
				ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
			END
			ELSE 
			BEGIN
				SELECT A.*,B.Ma_truong_khoa as Ma_truong_khoa,B.Ten as Ten_bo_phan,(E.Ho+' '+E.Ten_lot+' '+E.Ten) as Ten_nguoi_de_nghi,C.Ten_vai_tro AS Ten_Chuc_danh,CONVERT(VARCHAR(50),A.Ngay_lap,105) as Ngay_lap_mdy
				FROM DENGHINHANSU A LEFT JOIN KHOA_TRUNGTAM B ON A.Ma_bo_phan=B.ID LEFT JOIN VAITRO C ON A.Chuc_danh=C.ID LEFT JOIN ThanhVien D ON A.Nguoi_de_nghi=D.ID LEFT JOIN ChiTietThanhVien E ON D.Ten_DN=E.Ten_dang_nhap
				WHERE A.Tinh_trang=@Tinh_trang
				ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
			END
		END
	END
	IF(@Ma_bo_phan <> '0' AND @Ma_bo_phan <> '1' AND @Ma_bo_phan <> '2' AND @Ma_bo_phan <> '16')
	BEGIN
		IF(@Tinh_trang = '')
		BEGIN
			SELECT A.*,B.Ma_truong_khoa as Ma_truong_khoa,B.Ten as Ten_bo_phan,(E.Ho+' '+E.Ten_lot+' '+E.Ten) as Ten_nguoi_de_nghi,C.Ten_vai_tro AS Ten_Chuc_danh,CONVERT(VARCHAR(50),A.Ngay_lap,105) as Ngay_lap_mdy
			FROM DENGHINHANSU A LEFT JOIN KHOA_TRUNGTAM B ON A.Ma_bo_phan=B.ID LEFT JOIN VAITRO C ON A.Chuc_danh=C.ID LEFT JOIN ThanhVien D ON A.Nguoi_de_nghi=D.ID LEFT JOIN ChiTietThanhVien E ON D.Ten_DN=E.Ten_dang_nhap
			LEFT JOIN KHOA_TRUNGTAM F ON A.MA_BO_PHAN=F.ID
			WHERE A.Nguoi_de_nghi=@Nguoi_de_nghi OR F.ID=@Ma_bo_phan
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
		IF(@Tinh_trang <> '')
		BEGIN
			SELECT A.*,B.Ma_truong_khoa as Ma_truong_khoa,B.Ten as Ten_bo_phan,(E.Ho+' '+E.Ten_lot+' '+E.Ten) as Ten_nguoi_de_nghi,C.Ten_vai_tro AS Ten_Chuc_danh,CONVERT(VARCHAR(50),A.Ngay_lap,105) as Ngay_lap_mdy
			FROM DENGHINHANSU A LEFT JOIN KHOA_TRUNGTAM B ON A.Ma_bo_phan=B.ID LEFT JOIN VAITRO C ON A.Chuc_danh=C.ID LEFT JOIN ThanhVien D ON A.Nguoi_de_nghi=D.ID LEFT JOIN ChiTietThanhVien E ON D.Ten_DN=E.Ten_dang_nhap
			LEFT JOIN KHOA_TRUNGTAM F ON A.MA_BO_PHAN=F.ID
			WHERE A.Nguoi_de_nghi=@Nguoi_de_nghi AND A.Tinh_trang=@Tinh_trang OR F.ID=@Ma_bo_phan AND A.Tinh_trang=@Tinh_trang
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
	END
END
GO
/*
	sp_SelectAllDeNghiNhanSu '6','20',''
*/