if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_GetCountPhieuMuonThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_GetCountPhieuMuonThietBi]
GO
CREATE PROCEDURE sp_QLTB_GetCountPhieuMuonThietBi
	@Ten			nvarchar(100),
	@Ngay			varchar(20),
	@Khoa			varchar(5)
AS
BEGIN
	DECLARE @sql NVarchar(500)
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
		SET @Dieu_kien_ngay = ' Cast(Convert(varchar(10), A.Ngay_muon, 110) AS Datetime) =  Cast(Convert(varchar(10), Getdate(), 110) AS Datetime) '
	END
	
	if(@Ten <> '')
	BEGIN
		SET @Dieu_kien_ten = ' C.Ho + '' '' + C.Ten_lot + '' '' + C.Ten LIKE N''%' + @Ten + '%'''
	END

	SELECT @sql = ' 
		SELECT COUNT(*) AS Count
		FROM PhieuMuonThietBi AS A
		INNER JOIN ThanhVien AS B ON A.Nguoi_muon = B.ID
		INNER JOIN ChiTietThanhVien AS C ON B.Ten_DN = C.Ten_dang_nhap
		WHERE ' + @Dieu_kien_khoa + ' AND ' + @Dieu_kien_ngay + ' AND ' + @Dieu_kien_ten
	exec sp_executesql @sql
	--PRINT @sql	
END
--select * from thanhvien
--exec sp_QLTB_GetCountPhieuMuonThietBi '','4-4-2011',''
--select Cast(Convert(varchar(10), Getdate(), 110) AS Datetime)