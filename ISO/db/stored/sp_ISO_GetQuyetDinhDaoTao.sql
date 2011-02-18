
/***********************************************************
* Purpose : Get "QUYET DINH DAO TAO"
* Author : ToanTT
* Date: 05-05-2010
* Description: Get "QUYET DINH DAO TAO"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetQuyetDinhDaoTao]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetQuyetDinhDaoTao]
GO
CREATE PROCEDURE sp_ISO_GetQuyetDinhDaoTao
	@NumRows		VARCHAR(2),
	@TotalRows      varchar(5),
	@CurrentPage	VARCHAR(2),
	@Tinh_trang		varchar(2),
	@Ma_bo_phan		varchar(5),
	@Ma_PHC		varchar(5)	
AS
BEGIN
	DECLARE @sql NVarchar(1000)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_bo_phan nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(5)
	SET @Dieu_kien_tinh_trang = ''
	SET @Dieu_kien_bo_phan = ''
	SET @And = ''
	SET @Where = ''
	if(@Tinh_trang <> '' and @Ma_bo_phan <> '')
	BEGIN
		if (@Ma_bo_phan <> @Ma_PHC)
		BEGIN
			SET @And = ' and '
		END
	END
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Where = 'Where '
		SET @Dieu_kien_tinh_trang = ' Tinh_trang = ' + @Tinh_trang
	END
	
	if(@Ma_bo_phan <> '')
	BEGIN
		if (@Ma_bo_phan <> @Ma_PHC)
		BEGIN	
			SET @Where = 'Where '
			SET @Dieu_kien_bo_phan = ' Tinh_trang <> 0 '
		END
	END
	--SELECT @sql = ''
	SELECT @sql = '
	SELECT TB2.ID As MaQuyetDinhDaoTao, TB2.Ten As TenQuyetDinhDaoTao, (C.Ho + '' '' + C.Ten_Lot + '' '' + C.Ten) As TenNguoiLap, 
	TB2.Tinh_trang As TinhTrang, TB2.Ly_do_reject As LyDoReject,
	convert(varchar(20),TB2.Ngay_Lap,105) As NgayLap 
	FROM (
		SELECT TOP ' + @NumRows + '* 
		FROM (
			SELECT TOP ' + Cast(Cast(@TotalRows As Int) - (Cast(@CurrentPage As Int) - 1) * Cast(@NumRows As Int) As Varchar) + ' *
			FROM QuyetDinhMoLop '
			+ @Where + @Dieu_kien_tinh_trang + @And + @Dieu_kien_bo_phan +
			' ORDER BY id ASC
		) AS TB1
		ORDER BY TB1.id DESC
	) AS TB2 
	INNER JOIN ThanhVien As B On TB2.Ma_nguoi_lap = B.ID 
	INNER JOIN ChiTietThanhVien As C on B.Ten_DN = C.Ten_dang_nhap
	ORDER BY TB2.id DESC'
	exec  sp_executesql @sql
END
--sp_help sp_executesql
--sp_ISO_GetQuyetDinhDaoTao 3,4,1,'',''
--select * from thanhvien

/*
	NumRows  = 3
	TotalRows = 8
	CurrentPage = 1

	sp_ISO_GetQuyetDinhDaoTao NumRows,TotalRows-(CurrentPage-1)*NumRows

	sp_ISO_GetQuyetDinhDaoTao 3,2

	select count(*)/3 from ThanhVien
*/
--select count(*)/ from ThanhVien
