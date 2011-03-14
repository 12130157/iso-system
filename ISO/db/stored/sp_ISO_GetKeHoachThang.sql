if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetKeHoachThang]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetKeHoachThang]
GO
CREATE PROCEDURE sp_ISO_GetKeHoachThang
	@NumRows		VARCHAR(2),
	@TotalRows      varchar(5),
	@CurrentPage	VARCHAR(2),
	@Tinh_trang		varchar(2),
	@Ma_bo_phan		varchar(5),
	@Ma_PHC			varchar(5)		
AS
BEGIN
	DECLARE @sql NVarchar(1000)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_bo_phan nvarchar(100)
	SET @Dieu_kien_tinh_trang = ' ''t'' = ''t'' '
	SET @Dieu_kien_bo_phan = ' ''t'' = ''t'' '
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Dieu_kien_tinh_trang = ' Tinh_trang = ' + @Tinh_trang
	END
	
	if(@Ma_bo_phan <> '')
	BEGIN
		if (@Ma_bo_phan <> @Ma_PHC)
		BEGIN	
			SET @Dieu_kien_bo_phan = ' Tinh_trang <> 0 '
		END
	END
	--SELECT @sql = ''
	SELECT @sql = '
	SELECT TB2.ID As MaKeHoachThang, TB2.Ten_ke_hoach_thang As TenKeHoachThang, (C.Ho + '' '' + C.Ten_Lot + '' '' + C.Ten) As TenNguoiTao, 
	TB2.Tinh_trang As TinhTrang, TB2.Ly_do_reject As LyDoReject,
	cast(datepart(mm,TB2.Ngay_Cap_Nhat_Cuoi) as varchar) + ''-'' + cast(datepart(dd,TB2.Ngay_Cap_Nhat_Cuoi) as varchar) + ''-'' + cast(datepart(yy,TB2.Ngay_Cap_Nhat_Cuoi) as varchar) As NgayCapNhatCuoi
	FROM (
		SELECT TOP ' + @NumRows + '* 
		FROM (
			SELECT TOP ' + Cast(Cast(@TotalRows As Int) - (Cast(@CurrentPage As Int) - 1) * Cast(@NumRows As Int) As Varchar) + ' *
			FROM KeHoachThang WHERE '
			+ @Dieu_kien_tinh_trang + ' AND ' + @Dieu_kien_bo_phan +
			' ORDER BY Ngay_cap_nhat_cuoi ASC
		) AS TB1
		ORDER BY TB1.Ngay_cap_nhat_cuoi DESC
	) AS TB2 
	INNER JOIN ThanhVien As B On TB2.Ma_nguoi_tao = B.ID 
	INNER JOIN ChiTietThanhVien As C on B.Ten_DN = C.Ten_dang_nhap'
	--ORDER BY TB2.Ngay_cap_nhat_cuoi DESC'
	exec  sp_executesql @sql
	--print @sql
END
--exec sp_ISO_GetKeHoachThang 10, 1, 1, '', 2, 2
