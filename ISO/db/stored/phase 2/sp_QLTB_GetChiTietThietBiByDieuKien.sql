if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_GetChiTietThietBiByDieuKien]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_GetChiTietThietBiByDieuKien]
GO
CREATE PROCEDURE sp_QLTB_GetChiTietThietBiByDieuKien
	@Loai_linh_kien	varchar(3),
	@Phong_ban		varchar(3),
	@Tinh_trang		varchar(2),
	@Num_row		varchar(2),
	@Total_row		varchar(max),
	@CurrentPage	varchar(3),
	@Ten_linh_kien	nvarchar(100)
AS
BEGIN
	DECLARE @sql NVarchar(1000)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_phong_ban nvarchar(100)
	DECLARE @Dieu_kien_loai_linh_kien nvarchar(100)
	DECLARE @Dieu_kien_ten_linh_kien nvarchar(200)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(5)
	SET @Dieu_kien_tinh_trang = ' ''t'' = ''t'' '
	SET @Dieu_kien_phong_ban = ' ''t'' = ''t'' '
	SET @Dieu_kien_loai_linh_kien = ' ''t'' = ''t'' '
	SET @Dieu_kien_ten_linh_kien = ' ''t'' = ''t'' '

	if(@Tinh_trang <> '')
	BEGIN
		SET @Dieu_kien_tinh_trang = ' A.Ma_tinh_trang = ' + @Tinh_trang
	END

	if(@Loai_linh_kien <> '')
	BEGIN
		SET @Dieu_kien_loai_linh_kien = ' A.Ma_loai = ' + @Loai_linh_kien
	END
	
	if(@Phong_ban <> '')
	BEGIN
		SET @Dieu_kien_phong_ban = ' A.Ma_phong = ' + @Phong_ban
	END

	if(@Ten_linh_kien <> '')
	BEGIN
		SET @Dieu_kien_ten_linh_kien = ' A.Ten LIKE ''%' + @Ten_linh_kien + '%'''
	END

	SELECT @sql = ' SELECT TOP ' + @Num_row + ' * 
			FROM (
				SELECT TOP ' +  + Cast(Cast(@Total_row As Int) - (Cast(@CurrentPage As Int) - 1) * Cast(@Num_Row As Int) As Varchar) + '
					A.ID AS MaLinhKien, A.Ten AS TenLinhKien, A.Ki_hieu AS KiHieu, A.Ngay_cap_nhat_cuoi,
						B.Ten_loai AS LoaiLinhKien, C.Ki_hieu_phong AS KiHieuPhong, D.Ten AS TenTinhTrang, A.Ma_tinh_trang AS MaTinhTrang
				FROM ChiTietThietBi AS A
				INNER JOIN LoaiLinhKien AS B ON A.Ma_loai = B.ID
				INNER JOIN PhongBan AS C ON A.Ma_phong = C.ID
				INNER JOIN TinhTrangThietBi AS D ON A.Ma_tinh_trang = D.ID
				WHERE ' + @Dieu_kien_tinh_trang + ' AND ' + @Dieu_kien_phong_ban + ' AND ' 
					+ @Dieu_kien_loai_linh_kien + ' AND ' + @Dieu_kien_ten_linh_kien +
				' ORDER BY A.Ngay_cap_nhat_cuoi ASC
			) AS TB1
			ORDER BY TB1.Ngay_cap_nhat_cuoi DESC '
		
		
	exec sp_executesql @sql
	--PRINT @sql	
END
--exec sp_QLTB_GetChiTietThietBiByDieuKien '','','0',3,3,1
--select * from khoa_trungtam
--select * from sys_role_menu
--select * from sys_menu
--insert into sys_role_menu values(16,36,'','','','','')
--insert into sys_menu values (5, 'Quản lý phiếu mượn','', '/HungVuongISO/QuanLyThietBi/PhieuMuonThietBi/QuanLyPhieuMuon.jsp','','','','','')