
/***********************************************************
* Purpose : phan trang thanh vien (tim thanh vien theo ma vai tro)
* Author : HuyenLY
* Date: 02-06-2010
* Description: phan trang thanh vien (tim thanh vien theo ma vai tro)
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_ShowThanhVienByMaBoPhan]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_ShowThanhVienByMaBoPhan]
GO
CREATE PROCEDURE sp_Admin_ShowThanhVienByMaBoPhan

	@MaBoPhan		varchar(10),
	@Ten			nvarchar(100)
AS
BEGIN
	IF @MaBoPhan = -1 AND @Ten = ''
	BEGIN
		SELECT 
			b.ID AS MaThanhVien, 
			b.Ten_DN AS TenDangNhap, 
			b.Mat_khau AS MatKhau,
			b.Ma_bo_phan AS MaBoPhan, 
			a.Ho as Ho, 
			a.Ten_lot as TenLot, 
			a.Ten AS Ten, 
			c.Ten_vai_tro As TenVaiTro,
			d.Ten AS TenBoPhan,
			b.Ma_vai_tro AS MaVaiTro, 
			a.Tinh_trang as TinhTrang, 
			a.Email As Email, 
			b.Ngay_tao AS NgayTao, 
			b.Ngay_truy_cap_cuoi AS NgayTruyCapCuoi, 
			b.Ngay_cap_nhat_cuoi AS NgayCapNhatCuoi, 
			b.User1,
			b.User2,
			b.User3,
			b.User4,
			b.User5
		FROM chitietthanhvien a
			inner join thanhvien b on a.Ten_dang_nhap = b.Ten_DN
			inner join vaitro c on c.ID = b.Ma_vai_tro
			inner join khoa_trungtam d on d.ID = b.Ma_bo_phan
	END
	
	IF @MaBoPhan <> -1 AND @Ten = ''
	BEGIN
		SELECT 
			b.ID AS MaThanhVien, 
			b.Ten_DN AS TenDangNhap, 
			b.Mat_khau AS MatKhau,
			b.Ma_bo_phan AS MaBoPhan, 
			a.Ho as Ho, 
			a.Ten_lot as TenLot, 
			a.Ten AS Ten, 
			c.Ten_vai_tro As TenVaiTro,
			d.Ten AS TenBoPhan,
			b.Ma_vai_tro AS MaVaiTro, 
			a.Tinh_trang as TinhTrang, 
			a.Email As Email, 
			b.Ngay_tao AS NgayTao, 
			b.Ngay_truy_cap_cuoi AS NgayTruyCapCuoi, 
			b.Ngay_cap_nhat_cuoi AS NgayCapNhatCuoi, 
			b.User1,
			b.User2,
			b.User3,
			b.User4,
			b.User5
		FROM chitietthanhvien a
			inner join thanhvien b on a.Ten_dang_nhap = b.Ten_DN
			inner join vaitro c on c.ID = b.Ma_vai_tro
			inner join khoa_trungtam d on d.ID = b.Ma_bo_phan 
		WHERE Ma_bo_phan = @MaBoPhan
	END
	
	IF @MaBoPhan = -1 AND @Ten <> ''
	BEGIN
		SELECT 
			b.ID AS MaThanhVien, 
			b.Ten_DN AS TenDangNhap, 
			b.Mat_khau AS MatKhau,
			b.Ma_bo_phan AS MaBoPhan, 
			a.Ho as Ho, 
			a.Ten_lot as TenLot, 
			a.Ten AS Ten, 
			c.Ten_vai_tro As TenVaiTro,
			d.Ten AS TenBoPhan,
			b.Ma_vai_tro AS MaVaiTro, 
			a.Tinh_trang as TinhTrang, 
			a.Email As Email, 
			b.Ngay_tao AS NgayTao, 
			b.Ngay_truy_cap_cuoi AS NgayTruyCapCuoi, 
			b.Ngay_cap_nhat_cuoi AS NgayCapNhatCuoi, 
			b.User1,
			b.User2,
			b.User3,
			b.User4,
			b.User5
		FROM chitietthanhvien a
			inner join thanhvien b on a.Ten_dang_nhap = b.Ten_DN
			inner join vaitro c on c.ID = b.Ma_vai_tro
			inner join khoa_trungtam d on d.ID = b.Ma_bo_phan  
		WHERE a.Ten LIKE '%' + @Ten + '%'
	END
	
	IF @MaBoPhan <> -1 AND @Ten <> ''
	BEGIN
		SELECT 
			b.ID AS MaThanhVien, 
			b.Ten_DN AS TenDangNhap, 
			b.Mat_khau AS MatKhau,
			b.Ma_bo_phan AS MaBoPhan, 
			a.Ho as Ho, 
			a.Ten_lot as TenLot, 
			a.Ten AS Ten, 
			c.Ten_vai_tro As TenVaiTro,
			d.Ten AS TenBoPhan,
			b.Ma_vai_tro AS MaVaiTro, 
			a.Tinh_trang as TinhTrang, 
			a.Email As Email, 
			b.Ngay_tao AS NgayTao, 
			b.Ngay_truy_cap_cuoi AS NgayTruyCapCuoi, 
			b.Ngay_cap_nhat_cuoi AS NgayCapNhatCuoi, 
			b.User1,
			b.User2,
			b.User3,
			b.User4,
			b.User5
		FROM chitietthanhvien a
			inner join thanhvien b on a.Ten_dang_nhap = b.Ten_DN
			inner join vaitro c on c.ID = b.Ma_vai_tro
			inner join khoa_trungtam d on d.ID = b.Ma_bo_phan
		WHERE a.Ten LIKE '%' + @ten + '%'
			AND Ma_bo_phan = @MaBoPhan
	END 

END


--sp_Admin_ShowThanhVienByMaBoPhan '9',''