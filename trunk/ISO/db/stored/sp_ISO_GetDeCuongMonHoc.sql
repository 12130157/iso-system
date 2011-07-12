if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetDeCuongMonHoc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetDeCuongMonHoc]
GO
CREATE PROCEDURE sp_ISO_GetDeCuongMonHoc
	@NumRows		VARCHAR(2),
	@TotalRows      varchar(5),
	@CurrentPage	VARCHAR(2),
	@Tinh_trang		varchar(2),
	@Ma_nguoi_tao   varchar(10),
	@Ma_bo_phan		varchar(5),
	@Ma_truong_khoa varchar(2),
	@Ma_pho_khoa	varchar(2),
	@Ma_vai_tro		varchar(2),	-- quyền trưởng khoa	
	@Ten_mon_hoc	nvarchar(50)
AS
BEGIN
	DECLARE @sql NVarchar(2000)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	--DECLARE @Dieu_kien_ma_nguoi_tao nvarchar(100)
	DECLARE @Dieu_kien_bo_phan nvarchar(300)
	DECLARE @Vai_tro_truong_bo_phan varchar(5)
	DECLARE @Dieu_kien_mon_hoc nvarchar(150)
	SET @Dieu_kien_tinh_trang = ' ''t'' = ''t'' '
	SET @Dieu_kien_mon_hoc = ' ''t'' = ''t'' '
	--SET @Dieu_kien_ma_nguoi_tao = ''
	SET @Dieu_kien_bo_phan = ' ''t'' = ''t'' '
	SET @Vai_tro_truong_bo_phan = ''
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Dieu_kien_tinh_trang = ' DCMH.Tinh_trang = ' + @Tinh_trang
	END
	--
	if(@Ten_mon_hoc <> '')
	BEGIN
		SET @Dieu_kien_mon_hoc = ' DCMH.Ten LIKE N''%' + @Ten_mon_hoc + '%'' ' 
	END
	--
	if(@Ma_nguoi_tao <> '')
	BEGIN
		--IF(@Ma_vai_tro <> @Ma_truong_khoa or @Ma_vai_tro <> @Ma_pho_khoa)--
		--BEGIN--
			--SET @Dieu_kien_bo_phan = ' DCMH.Ma_nguoi_tao = ' + @Ma_nguoi_tao
		--END--
		--ELSE
		--BEGIN
			SET @Dieu_kien_bo_phan = ' B.Ma_bo_phan = ' + @Ma_bo_phan + ' And ((DCMH.Tinh_trang = 0 and DCMH.Ma_nguoi_tao = ' + @Ma_nguoi_tao + ') Or DCMH.Tinh_trang <> 0) '
		--END
	END
	ELSE
	BEGIN
		if(@Ma_bo_phan <> '')
		BEGIN
			SELECT @Vai_tro_truong_bo_phan = B.Ma_vai_tro FROM Khoa_trungtam AS A INNER JOIN ThanhVien AS B ON A.Ma_truong_khoa = B.ID WHERE B.Ma_bo_phan = @Ma_bo_phan
			if(@Vai_tro_truong_bo_phan = @Ma_truong_khoa)
			BEGIN
				SET @Dieu_kien_bo_phan = ' B.Ma_bo_phan = ' + @Ma_bo_phan + ' And DCMH.Tinh_trang <> 0 '
			END
			ELSE
			BEGIN
				SET @Dieu_kien_bo_phan = ' DCMH.Tinh_trang <> 0 '
			END
		END
	END
	--SELECT @sql = ''
	SELECT @sql = '
		SELECT TOP ' + @NumRows + '* , cast(datepart(mm,TB1.Ngay_Cap_Nhat_Cuoi) as varchar) + ''-'' + cast(datepart(dd,TB1.Ngay_Cap_Nhat_Cuoi) as varchar) + ''-'' + cast(datepart(yy,TB1.Ngay_Cap_Nhat_Cuoi) as varchar) As NgayCapNhatCuoi 
		FROM (
			SELECT TOP ' + Cast(Cast(@TotalRows As Int) - (Cast(@CurrentPage As Int) - 1) * Cast(@NumRows As Int) As Varchar) + ' 
				DCMH.ID As MaDeCuongMonHoc, DCMH.Ten As TenDeCuongMonHoc, (C.Ho + '' '' + C.Ten_Lot + '' '' + C.Ten) As TenNguoiTao, 
				DCMH.Tinh_trang As TinhTrang, DCMH.Ly_do_reject As LyDoReject, D.Tinh_trang As TinhTrangChuongTrinh, DCMH.Ma_nguoi_tao AS MaNguoiTao, DCMH.Ngay_cap_nhat_cuoi AS Ngay_cap_nhat_cuoi
			FROM DeCuongMonHoc AS DCMH 
				INNER JOIN ThanhVien As B On DCMH.Ma_nguoi_tao = B.ID 
				INNER JOIN ChiTietThanhVien As C on B.Ten_DN = C.Ten_dang_nhap
				INNER JOIN ChuongTrinhDaoTao As D ON DCMH.Ma_chuong_trinh = D.ID
			Where ' + @Dieu_kien_tinh_trang + ' And ' + @Dieu_kien_bo_phan + ' And ' + @Dieu_kien_mon_hoc +
			' ORDER BY DCMH.Ngay_cap_nhat_cuoi ASC
		) AS TB1
		ORDER BY TB1.Ngay_cap_nhat_cuoi DESC '
	--ORDER BY TB2.id ASC'
	exec  sp_executesql @sql
	--print @sql
END
--exec sp_ISO_GetDeCuongMonHoc 3,10,1,'0',20,6,5,5