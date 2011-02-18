
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_getThietBiByPhongAndLoaiTB]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_getThietBiByPhongAndLoaiTB]
GO
CREATE PROCEDURE sp_QLTB_getThietBiByPhongAndLoaiTB

	@MaPhongBan		varchar(10),
	@MaLoaiThietBi	varchar(10)
AS
BEGIN
	IF @MaPhongBan = -1 AND @MaLoaiThietBi = -1
	BEGIN
		SELECT 
			A.ID as MaThietBi, 
			A.Ten as TenThietBi, 
			B.ID as MaTinhTrang, 
			B.Ten as TenTinhTrang, 
			C.Ki_hieu_phong as TenPhongBan, 
			D.Ten_loai as TenLoaiThietBi, 
			A.Ki_hieu as KiHieu 
		from ThietBi as A 
			inner join TinhTrangThietBi as B on B.ID = A.Ma_tinh_trang 
			inner join PhongBan as C on C.ID = A.Ma_phong 
			inner join LoaiThietBi as D on D.ID = A.Ma_loai
	END
	
	IF @MaPhongBan <> -1 AND @MaLoaiThietBi = -1
	BEGIN
		SELECT 
			A.ID as MaThietBi, 
			A.Ten as TenThietBi, 
			B.ID as MaTinhTrang, 
			B.Ten as TenTinhTrang, 
			C.Ki_hieu_phong as TenPhongBan, 
			D.Ten_loai as TenLoaiThietBi, 
			A.Ki_hieu as KiHieu 
		from ThietBi as A 
			inner join TinhTrangThietBi as B on B.ID = A.Ma_tinh_trang 
			inner join PhongBan as C on C.ID = A.Ma_phong 
			inner join LoaiThietBi as D on D.ID = A.Ma_loai 
		WHERE  A.Ma_phong = @MaPhongBan
	END
	
	IF @MaPhongBan = -1 AND @MaLoaiThietBi <> -1
	BEGIN
		SELECT 
			A.ID as MaThietBi, 
			A.Ten as TenThietBi, 
			B.ID as MaTinhTrang, 
			B.Ten as TenTinhTrang, 
			C.Ki_hieu_phong as TenPhongBan, 
			D.Ten_loai as TenLoaiThietBi, 
			A.Ki_hieu as KiHieu 
		from ThietBi as A 
			inner join TinhTrangThietBi as B on B.ID = A.Ma_tinh_trang 
			inner join PhongBan as C on C.ID = A.Ma_phong 
			inner join LoaiThietBi as D on D.ID = A.Ma_loai   
		WHERE A.Ma_loai = @MaLoaiThietBi
	END
	
	IF @MaPhongBan <> -1 AND @MaLoaiThietBi <> -1
	BEGIN
		SELECT 
			A.ID as MaThietBi, 
			A.Ten as TenThietBi, 
			B.ID as MaTinhTrang, 
			B.Ten as TenTinhTrang, 
			C.Ki_hieu_phong as TenPhongBan, 
			D.Ten_loai as TenLoaiThietBi, 
			A.Ki_hieu as KiHieu 
		from ThietBi as A 
			inner join TinhTrangThietBi as B on B.ID = A.Ma_tinh_trang 
			inner join PhongBan as C on C.ID = A.Ma_phong 
			inner join LoaiThietBi as D on D.ID = A.Ma_loai
		WHERE  A.Ma_phong = @MaPhongBan
			AND A.Ma_loai = @MaLoaiThietBi
	END 

END


--sp_Admin_ShowThanhVienByMaBoPhan '9',''