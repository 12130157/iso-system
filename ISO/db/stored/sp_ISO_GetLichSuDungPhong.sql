
/***********************************************************
* Purpose : Get "LICH SU DUNG PHONG"
* Author : PhuongTQ
* Date: 07-08-2010
* Description: Get "LICH SU DUNG PHONG"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetLichSuDungPhong]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetLichSuDungPhong]
GO
CREATE PROCEDURE sp_ISO_GetLichSuDungPhong
	--@NumRows		VARCHAR(2),
	--@TotalRows      varchar(5),
	--@CurrentPage	VARCHAR(2),
	@Phong			varchar(5),
	@Nam_hoc		varchar(5),
	@Tuan			varchar(5),
	@Khoa			varchar(5),
	@Mon_hoc		varchar(5)
AS
BEGIN
	DECLARE @sql NVarchar(2000)
	DECLARE @Dieu_kien_phong nvarchar(100)
	DECLARE @Dieu_kien_nam_hoc nvarchar(100)
	DECLARE @Dieu_kien_tuan nvarchar(300)
	DECLARE @Dieu_kien_khoa nvarchar(100)
	DECLARE @Dieu_kien_mon_hoc nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(7)
	SET @Dieu_kien_phong = ' ''t'' = ''t'' '
	SET @Dieu_kien_nam_hoc = ' ''t'' = ''t'' '
	SET @Dieu_kien_tuan = ' ''t'' = ''t'' '
	SET @Dieu_kien_khoa = ' ''t'' = ''t'' '
	SET @Dieu_kien_mon_hoc = ' ''t'' = ''t'' '
	SET @And = ' AND'
	SET @Where = ' WHERE '
	if(@Phong <> '')
	BEGIN
		SET @Dieu_kien_phong = ' H.ID = ' + @Phong
	END

	if(@Nam_hoc <> '')
	BEGIN
		SET @Dieu_kien_nam_hoc = ' A.User1 = ' + @Nam_hoc
	END

	if(@Tuan <> '')
	BEGIN
		if(Cast(@Tuan AS Int) < 61)
		BEGIN
			SET @Dieu_kien_tuan = ' A.Tuan = ' + @Tuan
		END
		if(Cast(@Tuan AS Int) < 81 AND Cast(@Tuan AS Int) > 60)
		BEGIN
			SET @Dieu_kien_tuan = ' Datepart(mm, A.Ngay_hoc) = ' + Cast(Cast(@Tuan AS Int) - 60 AS varchar) 
		END
		if(Cast(@Tuan AS Int) > 80)
		BEGIN
			SET @Dieu_kien_tuan = ' C.Hoc_ki = ' + Cast(Cast(@Tuan AS Int) - 80 AS Varchar)
		END
	END
	else
	BEGIN
		SET @Dieu_kien_tuan = ' Cast(convert(varchar(10),G.Tu_ngay,110) AS Datetime) <= Cast(convert(varchar(10),GETDATE(),110) AS Datetime) AND (Cast(convert(varchar(10),G.Den_ngay,110) AS Datetime) >= Cast(convert(varchar(10),GETDATE(),110) AS Datetime)) '
	END

	if(@Khoa <> '')
	BEGIN
		SET @Dieu_kien_khoa = ' F.ID = ' + @Khoa
	END
	if(@Mon_hoc <> '')
	BEGIN
		SET @Dieu_kien_mon_hoc = ' B.Ma_mon_hoc = ' + @Mon_hoc
	END
	--SELECT @sql = ''
	SELECT @sql = '
	SELECT A.ID, H.Ki_hieu_phong AS KiHieuPhong, A.Nhom AS Nhom, A.Buoi, A.Thu_trong_tuan AS ThuTrongTuan, 
			I.Ten_mon_hoc AS TenMonHoc, ISNULL((K.Ho + '' '' + K.Ten_Lot + '' '' + K.Ten),'''') As TenGiaoVien,
			Convert(varchar(10), A.Ngay_hoc, 110) As NgayHoc, F.Ten As TenKhoa, D.Ki_hieu As KiHieuLop, G.So_thu_tu AS SoThuTu
	FROM ChiTietTKB AS A 
		INNER JOIN MonHocTKB AS B ON B.ID = A.Ma_mon_hoc_TKB 
		INNER JOIN ThoiKhoaBieu AS C ON B.Ma_TKB = C.ID
		INNER JOIN LopHoc AS D ON C.Ma_lop = D.ID
		INNER JOIN ChuyenNganh AS E ON D.Ma_chuyen_nganh = E.ID
		INNER JOIN Khoa_TrungTam AS F ON E.Ma_khoaTT = F.ID
		INNER JOIN Tuanle AS G ON A.User1 = G.Ma_nam_hoc AND A.Tuan = G.So_thu_tu
		INNER JOIN PhongBan AS H ON A.Ma_phong = H.ID
		INNER JOIN MonHoc AS I ON B.Ma_mon_hoc = I.ID
		INNER JOIN ThanhVien AS J ON B.Ma_giao_vien = J.ID
		INNER JOIN ChiTietThanhVien AS K ON J.Ten_DN = K.Ten_dang_nhap'
		--INNER JOIN ChiTietTKB AS L ON A.Ma_mon_hoc_TKB = L.Ma_mon_hoc_TKB AND A.Buoi = L.Buoi AND A.Thu_trong_tuan = L.Thu_trong_tuan AND A.STT_Tuan = L.Tuan AND A.Ma_phong = L.Ma_phong'
		+ @Where + @Dieu_kien_phong + @And + @Dieu_kien_nam_hoc + @And + @Dieu_kien_tuan + @And + @Dieu_kien_khoa + @And + @Dieu_kien_mon_hoc + 
		' ORDER BY A.Ngay_hoc, A.Thu_trong_tuan, A.Buoi DESC, A.Ma_phong, F.ID'
	exec  sp_executesql @sql
	--print @sql
END
--sp_help sp_executesql
--sp_ISO_GetLichSuDungPhong '','','','',''
--select * from sudung
