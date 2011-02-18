
/***********************************************************
* Purpose : Get "KE HOACH DAO TAO"
* Author : ThienVD
* Date: 28-04-2010
* Description: Get "KE HOACH DAO TAO"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetKeHoachDaoTao]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetKeHoachDaoTao]
GO
CREATE PROCEDURE sp_ISO_GetKeHoachDaoTao
	@NumRows		VARCHAR(2),
	@TotalRows      varchar(5),
	@CurrentPage	VARCHAR(2),
	@Tinh_trang		varchar(2),
	@Ma_bo_phan		varchar(5),
	@Ma_PDT			varchar(5)		
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
		if (@Ma_bo_phan <> @Ma_PDT)
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
		if (@Ma_bo_phan <> @Ma_PDT)
		BEGIN	
			SET @Where = 'Where '
			SET @Dieu_kien_bo_phan = ' Tinh_trang <> 0 '
		END
	END
	--SELECT @sql = ''
	SELECT @sql = '
	SELECT TB2.ID As MaKeHoachDaoTao, TB2.Ten As TenKeHoachDaoTao, (C.Ho + '' '' + C.Ten_Lot + '' '' + C.Ten) As TenNguoiLap, 
	TB2.Tinh_trang As TinhTrang, TB2.Ly_do_reject As LyDoReject,
	cast(datepart(mm,TB2.Ngay_Cap_Nhat_Cuoi) as varchar) + ''-'' + cast(datepart(dd,TB2.Ngay_Cap_Nhat_Cuoi) as varchar) + ''-'' + cast(datepart(yy,TB2.Ngay_Cap_Nhat_Cuoi) as varchar) As NgayCapNhatCuoi
	FROM (
		SELECT TOP ' + @NumRows + '* 
		FROM (
			SELECT TOP ' + Cast(Cast(@TotalRows As Int) - (Cast(@CurrentPage As Int) - 1) * Cast(@NumRows As Int) As Varchar) + ' *
			FROM KeHoachDaoTao '
			+ @Where + @Dieu_kien_tinh_trang + @And + @Dieu_kien_bo_phan +
			' ORDER BY Ngay_cap_nhat_cuoi ASC
		) AS TB1
		ORDER BY TB1.Ngay_cap_nhat_cuoi DESC
	) AS TB2 
	INNER JOIN ThanhVien As B On TB2.Ma_nguoi_lap = B.ID 
	INNER JOIN ChiTietThanhVien As C on B.Ten_DN = C.Ten_dang_nhap'
	--ORDER BY TB2.Ngay_cap_nhat_cuoi DESC'
	exec  sp_executesql @sql
END
--sp_help sp_executesql
--sp_ISO_GetKeHoachDaoTao 3,4,1,'',''
--select * from thanhvien

/*
	NumRows  = 3
	TotalRows = 8
	CurrentPage = 1

	sp_ISO_GetKeHoachDaoTao NumRows,TotalRows-(CurrentPage-1)*NumRows

	sp_ISO_GetKeHoachDaoTao 3,2

	select count(*)/3 from ThanhVien
*/
--select count(*)/ from ThanhVien
