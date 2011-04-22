if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_GetChiTietPhieuMuonByDieuKien]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_GetChiTietPhieuMuonByDieuKien]
GO
CREATE PROCEDURE sp_QLTB_GetChiTietPhieuMuonByDieuKien
	@Ma_phieu_muon		int,
	@Tinh_trang			varchar(1),
	@Num_row			varchar(2),
	@Total_row			varchar(max),
	@CurrentPage		varchar(3)
AS
BEGIN
	DECLARE @sql NVarchar(1000)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	SET @Dieu_kien_tinh_trang = ' ''t'' = ''t'' '

	if(@Tinh_trang <> '')
	BEGIN
		SET @Dieu_kien_tinh_trang = ' A.Tinh_trang = ' + @Tinh_trang
	END
	
	SELECT @sql = ' SELECT TOP ' + @Num_row + ' * 
			FROM (
				SELECT TOP ' +  + Cast(Cast(@Total_Row As Int) - (Cast(@CurrentPage As Int) - 1) * Cast(@Num_Row As Int) As Varchar) + '
					D.ID AS MaPhieuMuon, D.Nguoi_muon AS MaNguoiMuon, D.Ghi_chu AS GhiChu, A.ID AS MaChiTietPhieuMuon,
						A.Ma_thiet_bi AS MaThietBi, B.Ten AS TenThietBi, C.Ten_linh_kien AS TenLinhKien, 
							A.Tinh_trang AS TinhTrang, A.Thoi_gian_muon AS ThoiGianMuon, A.Ngay_cap_nhat_cuoi,
								A.Thoi_gian_tra AS ThoiGianTra, A.Phan_loai AS PhanLoai, A.Ghi_chu AS GhiChuChiTiet
				FROM ChiTietPhieuMuon AS A
				LEFT JOIN ThietBi AS B ON A.Ma_thiet_bi = B.ID AND A.Phan_loai = 1
				LEFT JOIN ChiTietThietBi AS C ON A.Ma_thiet_bi = C.ID AND A.Phan_loai = 2
				INNER JOIN PhieuMuonThietBi AS D ON A.Ma_phieu_muon = D.ID
				WHERE ' + @Dieu_kien_tinh_trang + ' AND D.ID = ' + Cast(@Ma_phieu_muon As varchar) + 
				' ORDER BY A.Ngay_cap_nhat_cuoi ASC
			) AS TB1
			ORDER BY TB1.Ngay_cap_nhat_cuoi DESC '
		
		--INNER JOIN ThanhVien AS E ON D.Nguoi_muon = E.ID
		--INNER JOIN ChiTietThanhVien AS F ON E.Ten_DN = F.Ten_dang_nhap
		--INNER JOIN Khoa_trungtam AS G ON E.Ma_bo_phan = G.ID
		--INNER JOIN LopHoc AS H ON D.Ma_lop = H.ID
		
	exec sp_executesql @sql
	--PRINT @sql	
END
--select * from thanhvien
--select * from chitietthietbi
--exec sp_QLTB_GetChiTietPhieuMuonByDieuKien 4, '', 3, 1, 1