if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_GetPhieuMuonThietBiByDieuKien]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_GetPhieuMuonThietBiByDieuKien]
GO
CREATE PROCEDURE sp_QLTB_GetPhieuMuonThietBiByDieuKien
	@Ten			nvarchar(100),
	@Ngay			varchar(20),
	@Khoa			varchar(5),
	@Num_row		varchar(2),
	@Total_row		varchar(max),
	@CurrentPage	varchar(3)
AS
BEGIN
	DECLARE @sql NVarchar(2000)
	DECLARE @Dieu_kien_ten nvarchar(100)
	DECLARE @Dieu_kien_ngay nvarchar(200)
	DECLARE @Dieu_kien_khoa nvarchar(100)
	SET @Dieu_kien_ten = ' ''t'' = ''t'' '
	SET @Dieu_kien_ngay = ' ''t'' = ''t'' '
	SET @Dieu_kien_khoa = ' ''t'' = ''t'' '

	if(@Khoa <> '')
	BEGIN
		SET @Dieu_kien_khoa = ' B.Ma_bo_phan = ' + @Khoa
	END

	if(@Ngay <> '')
	BEGIN
		SET @Dieu_kien_ngay = ' Cast(Convert(varchar(10), A.Ngay_muon, 110) AS DATETIME) = CAST(''' + @Ngay + ''' AS DATETIME)'
	END
	else
	BEGIN
		SET @Dieu_kien_ngay = ' Cast(Convert(varchar(10), A.Ngay_muon, 110) AS Datetime) = Cast(Convert(varchar(10), Getdate(), 110) AS Datetime) '
	END
	
	if(@Ten <> '')
	BEGIN
		SET @Dieu_kien_ten = ' C.Ho + '' '' + C.Ten_lot + '' '' + C.Ten LIKE N''%' + @Ten + '%'''
	END
	SELECT @sql = ' SELECT TOP ' + @Num_row + ' * 
			FROM (
				SELECT TOP ' +  + Cast(Cast(@Total_Row As Int) - (Cast(@CurrentPage As Int) - 1) * Cast(@Num_Row As Int) As Varchar) + '
					A.ID AS MaPhieuMuon, A.Nguoi_muon AS MaNguoiMuon, A.Ngay_cap_nhat_cuoi,
						Convert(varchar(10), A.Ngay_muon, 110) AS NgayMuon, D.Ten AS TenKhoa,
							(IsNull(C.Ho, '''') + '' '' + IsNull(C.Ten_lot, '''') + '' '' + IsNull(C.Ten, '''')) AS TenNguoiMuon
				FROM PhieuMuonThietBi AS A
				INNER JOIN ThanhVien AS B ON A.Nguoi_muon = B.ID
				INNER JOIN ChiTietThanhVien AS C ON B.Ten_DN = C.Ten_dang_nhap
				INNER JOIN Khoa_trungtam AS D ON B.Ma_bo_phan = D.ID
				WHERE ' + @Dieu_kien_khoa + ' AND ' + @Dieu_kien_ngay + ' AND ' + @Dieu_kien_ten +
				' ORDER BY A.Ngay_cap_nhat_cuoi ASC
			) AS TB1
			ORDER BY TB1.Ngay_cap_nhat_cuoi DESC '		
		
	exec sp_executesql @sql
	--PRINT @sql	
END
-- exec sp_QLTB_GetPhieuMuonThietBiByDieuKien N'Châu','04-04-2011','','3','1','1'
-- select * from thanhvien
-- select * from chitietthanhvien
-- select * from khoa_trungtam
-- select * from lophoc