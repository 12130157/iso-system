
/***********************************************************
* Purpose : phan trang thanh vien
* Author : HuyenLY
* Date: 02-06-2010
* Description: phan trang thanh vien
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_ShowThanhVien]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_ShowThanhVien]
GO
CREATE PROCEDURE sp_Admin_ShowThanhVien

	@numRows		varchar(10),
	@totalPages		varchar(10)

AS
BEGIN
	DECLARE @sql NVarchar(1000)
	SELECT @sql = '
	select * from (
		select top ' + @numRows + ' * 
		from (
			select top ' + @totalPages + ' *
			from (
				SELECT 
					A.ID AS MaThanhVien, 
					A.Ten_DN AS TenDangNhap, 
					A.Mat_khau AS MatKhau, 
					B.Ho as Ho, 
					B.Ten_lot as TenLot, 
					B.Ten AS Ten, 
					C.Ten_vai_tro AS TenVaiTro,
					A.Ma_vai_tro AS MaVaiTro,
					A.Ma_bo_phan AS MaBoPhan,
					D.Ten AS TenBoPhan,
					B.Tinh_trang as TinhTrang, 
					B.Email As Email, 
					A.Ngay_tao AS NgayTao, 
					A.Ngay_truy_cap_cuoi AS NgayTruyCapCuoi, 
					A.Ngay_cap_nhat_cuoi AS NgayCapNhatCuoi, 
					A.User1,
					A.User2,
					A.User3,
					A.User4,
					A.User5 
				FROM ThanhVien A
						INNER JOIN ChiTietThanhVien B ON A.Ten_DN=B.Ten_dang_nhap 
						INNER JOIN VaiTro C ON A.Ma_vai_tro=C.ID
						INNER JOIN Khoa_TrungTam D ON A.Ma_bo_phan = D.ID
			) AS TB0
			order by TB0.Ten desc
		) as TB1 
		order by TB1.Ten asc
	) as TB2 
	order by TB2.Ten asc'

	exec  sp_executesql @sql
END

--select * from thanhvien
--sp_Admin_ShowThanhVien '5','19'