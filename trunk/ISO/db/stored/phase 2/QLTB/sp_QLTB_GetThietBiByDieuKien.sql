if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_GetThietBiByDieuKien]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_GetThietBiByDieuKien]
GO
CREATE PROCEDURE sp_QLTB_GetThietBiByDieuKien
	@Loai_thiet_bi	varchar(3),
	@Phong_ban		varchar(3),
	@Tinh_trang		varchar(2),
	@Num_row		varchar(2),
	@Total_row		varchar(max),
	@CurrentPage	varchar(3),
	@Ten_thiet_bi	nvarchar(100),
	@Choice			varchar
AS
BEGIN
	DECLARE @sql NVarchar(2000)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_phong_ban nvarchar(100)
	DECLARE @Dieu_kien_loai_thiet_bi nvarchar(100)
	DECLARE @Dieu_kien_ten_thiet_bi nvarchar(200)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(5)
	SET @Dieu_kien_tinh_trang = ' ''t'' = ''t'' '
	SET @Dieu_kien_phong_ban = ' ''t'' = ''t'' '
	SET @Dieu_kien_loai_thiet_bi = ' ''t'' = ''t'' '
	SET @Dieu_kien_ten_thiet_bi = ' ''t'' = ''t'' '

	if(@Tinh_trang <> '')
	BEGIN
		SET @Dieu_kien_tinh_trang = ' A.Ma_tinh_trang = ' + @Tinh_trang
	END

	if(@Loai_thiet_bi <> '')
	BEGIN
		SET @Dieu_kien_loai_thiet_bi = ' A.Ma_loai = ' + @Loai_thiet_bi
	END
	
	if(@Phong_ban <> '')
	BEGIN
		SET @Dieu_kien_phong_ban = ' A.Ma_phong = ' + @Phong_ban
	END

	if(@Ten_thiet_bi <> '')
	BEGIN
		SET @Dieu_kien_ten_thiet_bi = ' A.Ten LIKE ''%' + @Ten_thiet_bi + '%'''
	END

	IF(@Choice = '1')
	BEGIN
		SELECT @sql = ' 
					SELECT TOP ' + @Num_row + ' * 
					FROM (
						SELECT TOP ' + Cast(Cast(@Total_row As Int) - (Cast(@CurrentPage As Int) - 1) * Cast(@Num_Row As Int) As Varchar) + '
							A.ID AS MaThietBi, A.Ten AS TenThietBi, A.Ki_hieu AS KiHieu, A.Ngay_cap_nhat_cuoi AS NgayCapNhatCuoi,
								B.Ten_loai AS LoaiThietBi, C.Ki_hieu_phong AS KiHieuPhong, D.Ten AS TenTinhTrang, A.Ma_tinh_trang AS MaTinhTrang
						FROM ThietBi AS A
						INNER JOIN TrinhTuThayDoiThietBi AS TT ON A.ID = TT.Ma_thiet_bi AND TT.Kiem_tra_ton_tai = ''1''
						INNER JOIN LoaiThietBi AS B ON A.Ma_loai = B.ID
						INNER JOIN PhongBan AS C ON TT.Ma_phong = C.ID
						INNER JOIN TinhTrangThietBi AS D ON A.Ma_tinh_trang = D.ID
						WHERE ' + @Dieu_kien_tinh_trang + ' AND ' + @Dieu_kien_phong_ban + ' AND ' 
							+ @Dieu_kien_loai_thiet_bi + ' AND ' + @Dieu_kien_ten_thiet_bi +
						' ORDER BY A.Ngay_cap_nhat_cuoi ASC
					) AS TB1
					ORDER BY TB1.NgayCapNhatCuoi DESC '
	END
	ELSE
	BEGIN
		SELECT @sql = ' SELECT TB.MaThietBi, TB.TenThietBi, TB.KiHieu, TB.NgayCapNhatCuoi, TB.LoaiThietBi, TB.KiHieuPhong,
				TB.TenTinhTrang, TB.MaTinhTrang,  CTTB.MaChiTietThietBi, CTTB.SoLanSuDungChiTiet, TB.SoLanSuDungThietBi,
				CTTB.MaTinhTrangChiTiet	
				FROM (
					SELECT TOP ' + @Num_row + ' * 
					FROM (
						SELECT TOP ' + Cast(Cast(@Total_row As Int) - (Cast(@CurrentPage As Int) - 1) * Cast(@Num_Row As Int) As Varchar) + '
							A.ID AS MaThietBi, A.Ten AS TenThietBi, A.Ki_hieu AS KiHieu, A.Ngay_cap_nhat_cuoi AS NgayCapNhatCuoi,
								B.Ten_loai AS LoaiThietBi, C.Ki_hieu_phong AS KiHieuPhong, D.Ten AS TenTinhTrang, A.Ma_tinh_trang AS MaTinhTrang,
									A.So_lan_su_dung AS SoLanSuDungThietBi
						FROM ThietBi AS A
						INNER JOIN TrinhTuThayDoiThietBi AS TT ON A.ID = TT.Ma_thiet_bi AND TT.Kiem_tra_ton_tai = ''1''
						INNER JOIN LoaiThietBi AS B ON A.Ma_loai = B.ID
						INNER JOIN PhongBan AS C ON TT.Ma_phong = C.ID
						INNER JOIN TinhTrangThietBi AS D ON A.Ma_tinh_trang = D.ID
						WHERE ' + @Dieu_kien_tinh_trang + ' AND ' + @Dieu_kien_phong_ban + ' AND ' 
							+ @Dieu_kien_loai_thiet_bi + ' AND ' + @Dieu_kien_ten_thiet_bi +
						' ORDER BY A.Ngay_cap_nhat_cuoi ASC
					) AS TB1
					ORDER BY TB1.NgayCapNhatCuoi DESC 
				) AS TB
				LEFT JOIN (SELECT CT.ID AS MaChiTietThietBi, CT.So_lan_su_dung AS SoLanSuDungChiTiet, 
							TDLK.Ma_thiet_bi AS MaThietBi, CT.Ma_tinh_trang AS MaTinhTrangChiTiet
							 FROM ChiTietThietBi AS CT INNER JOIN 
								TrinhTuThayDoiLinhKien AS TDLK ON CT.ID = TDLK.Ma_linh_kien 
									AND TDLK.Kiem_tra_ton_tai = ''1'') AS CTTB ON TB.MaThietBi = CTTB.MaThietBi '
				
	END	
		
		
	exec sp_executesql @sql
	--PRINT @sql	
END
--exec sp_QLTB_GetThietBiByDieuKien '','','0',3,3,1,'','2'
--select * from khoa_trungtam
--select * from sys_role_menu
--select * from sys_menu
--insert into sys_role_menu values(16,36,'','','','','')
--insert into sys_menu values (5, 'Quản lý phiếu mượn','', '/HungVuongISO/QuanLyThietBi/PhieuMuonThietBi/QuanLyPhieuMuon.jsp','','','','','')