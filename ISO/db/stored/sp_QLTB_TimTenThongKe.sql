
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_TimTenThongKe]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_TimTenThongKe]
GO
CREATE PROCEDURE sp_QLTB_TimTenThongKe
	@TenThietBi			nvarchar(100)
AS
BEGIN
	IF @TenThietBi = ''
	BEGIN
		SELECT 
			A.ID as MaThietBi, 
			A.Ten as TenThietBi, 
			B.Ten_loai as TenLoaiThietBi, 
			C.Ten as TenTinhTrang, 
			D.Ten as TenNhaCungCap, 
			A.Tan_suat_toi_da as TanSuatToiDa,	
			A.Tan_suat_su_dung as TanSuatSuDung, 
			E.Ten as TenDonViTanSuat, 
			A.So_lan_bao_tri as SoLanBaoTri, 
			A.So_may as SoMay,
			F.ID as TenPhongBan
		FROM ThietBi As A 
			inner join LoaiThietBi as B on B.ID = A.Ma_loai 
			inner join TinhTrangThietBi as C on C.ID = A.Ma_tinh_trang 
			inner join NhaCungCap as D on D.ID = A.Ma_nha_cung_cap 
			inner join TanSuat as E on E.ID = A.Ma_don_vi_tan_suat 
			inner join PhongBan as F on F.ID = A.Ma_phong
	END
	
	IF @TenThietBi <> ''
	BEGIN
		SELECT 
			A.ID as MaThietBi, 
			A.Ten as TenThietBi, 
			B.Ten_loai as TenLoaiThietBi, 
			C.Ten as TenTinhTrang, 
			D.Ten as TenNhaCungCap, 
			A.Tan_suat_toi_da as TanSuatToiDa,	
			A.Tan_suat_su_dung as TanSuatSuDung, 
			E.Ten as TenDonViTanSuat, 
			A.So_lan_bao_tri as SoLanBaoTri, 
			A.So_may as SoMay,
			F.ID as TenPhongBan
		FROM ThietBi As A 
			inner join LoaiThietBi as B on B.ID = A.Ma_loai 
			inner join TinhTrangThietBi as C on C.ID = A.Ma_tinh_trang 
			inner join NhaCungCap as D on D.ID = A.Ma_nha_cung_cap 
			inner join TanSuat as E on E.ID = A.Ma_don_vi_tan_suat
			inner join PhongBan as F on F.ID = A.Ma_phong
		WHERE A.Ten LIKE '%' + @TenThietBi + '%'
	END
END

--sp_QLTB_TimTenThongKe 'Server'