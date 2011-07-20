/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	29/06/2011
	Mục Đích	:	show Kế Hoạch TNS
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_SelectAllKeHoachTNS')
BEGIN
	DROP PROC sp_NhanSu_SelectAllKeHoachTNS
END
GO
CREATE PROC sp_NhanSu_SelectAllKeHoachTNS
	@Ma_bo_phan			VARCHAR(5),
	@Ma_thanh_vien		VARCHAR(5),
	@Tinh_trang			VARCHAR(5)
AS  
BEGIN
	IF(@Ma_bo_phan = '0' OR @Ma_bo_phan <> '0' AND @Ma_bo_phan <> '2')
	BEGIN
		IF(@Tinh_trang = '')
		BEGIN
			SELECT A.*,CONVERT(VARCHAR(10),A.Ngay_lap_ke_hoach,105) as Ngay_lap_ke_hoach_dmy,(B.Ho+' '+B.Ten_lot+' '+B.Ten) as Ten_nguoi_lap_ke_hoach,(C.Ho+' '+C.Ten_lot+' '+C.Ten) as Ten_nguoi_duyet,CONVERT(VARCHAR(10),A.Ngay_duyet,105) AS Ngay_duyet_dmy
			FROM KeHoachTNS A LEFT JOIN THANHVIEN D ON A.Nguoi_lap_ke_hoach=D.ID LEFT JOIN CHITIETTHANHVIEN B ON D.Ten_DN=B.Ten_dang_nhap LEFT JOIN THANHVIEN E ON A.Nguoi_duyet=E.ID LEFT JOIN CHITIETTHANHVIEN C ON E.Ten_DN=C.Ten_dang_nhap
			WHERE A.Tinh_trang>'0'
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
		IF(@Tinh_trang <> '')
		BEGIN
			SELECT * FROM(
			SELECT A.*,CONVERT(VARCHAR(10),A.Ngay_lap_ke_hoach,105) as Ngay_lap_ke_hoach_dmy,(B.Ho+' '+B.Ten_lot+' '+B.Ten) as Ten_nguoi_lap_ke_hoach,(C.Ho+' '+C.Ten_lot+' '+C.Ten) as Ten_nguoi_duyet,CONVERT(VARCHAR(10),A.Ngay_duyet,105) AS Ngay_duyet_dmy
			FROM KeHoachTNS A LEFT JOIN THANHVIEN D ON A.Nguoi_lap_ke_hoach=D.ID LEFT JOIN CHITIETTHANHVIEN B ON D.Ten_DN=B.Ten_dang_nhap LEFT JOIN THANHVIEN E ON A.Nguoi_duyet=E.ID LEFT JOIN CHITIETTHANHVIEN C ON E.Ten_DN=C.Ten_dang_nhap
			WHERE A.Tinh_trang>'0') AS TB1 WHERE Tinh_trang=@Tinh_trang 
			ORDER BY NGAY_CAP_NHAT_CUOI DESC
		END
	END
	IF(@Ma_bo_phan = '2')
	BEGIN
		IF(@Tinh_trang = '')
		BEGIN
			SELECT A.*,CONVERT(VARCHAR(10),A.Ngay_lap_ke_hoach,105) as Ngay_lap_ke_hoach_dmy,(B.Ho+' '+B.Ten_lot+' '+B.Ten) as Ten_nguoi_lap_ke_hoach,(C.Ho+' '+C.Ten_lot+' '+C.Ten) as Ten_nguoi_duyet,CONVERT(VARCHAR(10),A.Ngay_duyet,105) AS Ngay_duyet_dmy
			FROM KeHoachTNS A LEFT JOIN THANHVIEN D ON A.Nguoi_lap_ke_hoach=D.ID LEFT JOIN CHITIETTHANHVIEN B ON D.Ten_DN=B.Ten_dang_nhap LEFT JOIN THANHVIEN E ON A.Nguoi_duyet=E.ID LEFT JOIN CHITIETTHANHVIEN C ON E.Ten_DN=C.Ten_dang_nhap
			WHERE A.Nguoi_lap_ke_hoach=@Ma_thanh_vien
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
		IF(@Tinh_trang <> '')
		BEGIN
			SELECT A.*,CONVERT(VARCHAR(10),A.Ngay_lap_ke_hoach,105) as Ngay_lap_ke_hoach_dmy,(B.Ho+' '+B.Ten_lot+' '+B.Ten) as Ten_nguoi_lap_ke_hoach,(C.Ho+' '+C.Ten_lot+' '+C.Ten) as Ten_nguoi_duyet,CONVERT(VARCHAR(10),A.Ngay_duyet,105) AS Ngay_duyet_dmy
			FROM KeHoachTNS A LEFT JOIN THANHVIEN D ON A.Nguoi_lap_ke_hoach=D.ID LEFT JOIN CHITIETTHANHVIEN B ON D.Ten_DN=B.Ten_dang_nhap LEFT JOIN THANHVIEN E ON A.Nguoi_duyet=E.ID LEFT JOIN CHITIETTHANHVIEN C ON E.Ten_DN=C.Ten_dang_nhap
			WHERE A.Tinh_trang=@Tinh_trang AND A.Nguoi_lap_ke_hoach=@Ma_thanh_vien
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
	END
END
GO
/*
	sp_NhanSu_SelectAllKeHoachTNS '2','15','0'
*/