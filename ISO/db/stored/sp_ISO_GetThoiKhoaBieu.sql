if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetThoiKhoaBieu]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetThoiKhoaBieu]
GO
CREATE PROCEDURE sp_ISO_GetThoiKhoaBieu
	@NumRows		VARCHAR(2),
	@TotalRows      varchar(10),
	@CurrentPage	VARCHAR(2),
	@Tinh_trang		varchar(2),
	@Ma_bo_phan		varchar(5),
	@Ma_truong_khoa	varchar(2)		
AS
BEGIN
	DECLARE @sql NVarchar(1000)
	DECLARE @Dieu_kien_tinh_trang_1 nvarchar(100)
	DECLARE @Dieu_kien_tinh_trang_2 nvarchar(100)
	DECLARE @Dieu_kien_bo_phan nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(5)
	DECLARE @Vai_tro_truong_bo_phan varchar(5)
	SET @Vai_tro_truong_bo_phan = ''
	SET @Dieu_kien_tinh_trang_1 = ' ''t'' = ''t'' '
	SET @Dieu_kien_tinh_trang_2 = ' ''t'' = ''t'' '
	SET @Dieu_kien_bo_phan = ' ''t'' = ''t'' '
	SET @And = ' And '
	SET @Where = 'Where'
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Dieu_kien_tinh_trang_1 = ' TKB.Tinh_trang = ' + @Tinh_trang
	END
	if(@Ma_bo_phan <> '')
	BEGIN
		SELECT @Vai_tro_truong_bo_phan = B.Ma_vai_tro FROM Khoa_trungtam AS A INNER JOIN ThanhVien AS B ON A.Ma_truong_khoa = B.ID WHERE B.Ma_bo_phan = @Ma_bo_phan
		if(@Vai_tro_truong_bo_phan = @Ma_truong_khoa)
		BEGIN
			SET @Dieu_kien_bo_phan = ' B.Ma_bo_phan = ' + @Ma_bo_phan
		END
		else
		BEGIN
			SET @Dieu_kien_tinh_trang_2 = ' TKB.Tinh_trang <> 0 '
		END
	END
	--SELECT @sql = ''
	SELECT @sql = '
			SELECT TOP ' + @NumRows + ' * , cast(datepart(mm,TB1.Ngay_Cap_Nhat_Cuoi) as varchar) + ''-'' + cast(datepart(dd,TB1.Ngay_Cap_Nhat_Cuoi) as varchar) + ''-'' + cast(datepart(yy,TB1.Ngay_Cap_Nhat_Cuoi) as varchar) As NgayCapNhatCuoi
			FROM (
			SELECT TOP ' + Cast(Cast(@TotalRows As Int) - (Cast(@CurrentPage As Int) - 1) * Cast(@NumRows As Int) As Varchar) + '
				TKB.ID As MaThoiKhoaBieu, (C.Ho + '' '' + C.Ten_Lot + '' '' + C.Ten) As TenNguoiTao, TKB.Ten As TenThoiKhoaBieu,
				TKB.Tinh_trang As TinhTrang, TKB.Ly_do_reject As LyDoReject, TKB.Ngay_cap_nhat_cuoi AS Ngay_cap_nhat_cuoi
				FROM ThoiKhoaBieu AS TKB 
				INNER JOIN ThanhVien As B On TKB.Ma_nguoi_tao = B.ID 
				INNER JOIN ChiTietThanhVien As C on B.Ten_DN = C.Ten_dang_nhap '
				+ @WHERE + @Dieu_kien_tinh_trang_1 + @And + @Dieu_kien_tinh_trang_2 + @And + @Dieu_kien_bo_phan +
				' ORDER BY TKB.Ngay_cap_nhat_cuoi ASC
		) AS TB1
		ORDER BY TB1.Ngay_cap_nhat_cuoi DESC '
	
	
	--ORDER BY TB2.id ASC
	exec  sp_executesql @sql
	--PRINT @sql
END
--exec sp_ISO_GetThoiKhoaBieu 3,1,1,'',5,5