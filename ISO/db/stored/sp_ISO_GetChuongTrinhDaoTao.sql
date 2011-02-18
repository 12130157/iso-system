if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetChuongTrinhDaoTao]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetChuongTrinhDaoTao]
GO
CREATE PROCEDURE sp_ISO_GetChuongTrinhDaoTao
	@NumRows		VARCHAR(2),
	@TotalRows      varchar(5),
	@CurrentPage	VARCHAR(2),
	@Tinh_trang		varchar(2),
	@Ma_bo_phan		varchar(5),
	@Ma_truong_khoa	varchar(2),
	@Check			varchar
	--@Ma_nguoi_tao   varchar(2)		
AS
BEGIN
	DECLARE @sql NVarchar(2000)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_bo_phan nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(5)
	DECLARE @Vai_tro_truong_bo_phan varchar(5)
	SET @Vai_tro_truong_bo_phan = ''
	SET @Dieu_kien_tinh_trang = ' ''t'' = ''t'' '
	SET @Dieu_kien_bo_phan = ' ''t'' = ''t'' '
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Dieu_kien_tinh_trang = ' CTDT.Tinh_trang = ' + @Tinh_trang
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
			IF(@Check = '1')
			BEGIN
				SET @Dieu_kien_bo_phan = ' CTDT.Tinh_trang <> 0 '
			END
			ELSE
			BEGIN
				SET @Dieu_kien_bo_phan = ' CTDT.Tinh_trang <> 0 AND CTDT.Tinh_trang <> 4 '
			END
		END
	END
	--if(@Ma_nguoi_tao <> '')
	--BEGIN
		--SET @Where = 'Where '
		--if not exists(Select * From ChuongTrinhDaoTao Where Ma_nguoi_tao = @Ma_nguoi_tao)
		--BEGIN	
		--	SET @Dieu_kien_khong_phai_nguoi_tao = ' Tinh_trang <> 0 '
		--END
		--else
		--BEGIN
		--	SET @Dieu_kien_ma_nguoi_tao = ' Ma_nguoi_tao = ' + @Ma_nguoi_tao
		--END
	--END
	--SELECT @sql = ''
	SELECT @sql = '
		SELECT TOP ' + @NumRows + '* , cast(datepart(mm,TB1.Ngay_Cap_Nhat_Cuoi) as varchar) + ''-'' + cast(datepart(dd,TB1.Ngay_Cap_Nhat_Cuoi) as varchar) + ''-'' + cast(datepart(yy,TB1.Ngay_Cap_Nhat_Cuoi) as varchar) As NgayCapNhatCuoi
		FROM (
			SELECT TOP ' + Cast(Cast(@TotalRows As Int) - (Cast(@CurrentPage As Int) - 1) * Cast(@NumRows As Int) As Varchar) + ' 
				CTDT.ID As MaChuongTrinhDaoTao, CTDT.Ten As TenChuongTrinhDaoTao, (C.Ho + '' '' + C.Ten_Lot + '' '' + C.Ten) As TenNguoiTao, 
				CTDT.Tinh_trang As TinhTrang, CTDT.Ly_do_reject As LyDoReject, CTDT.Ma_nguoi_tao AS MaNguoiTao,
				CTDT.Ngay_cap_nhat_cuoi AS Ngay_cap_nhat_cuoi,
				D.Ten As TenTrinhDo, E.Ten_chuyen_nganh As TenNghe
			FROM ChuongTrinhDaoTao AS CTDT
			INNER JOIN ThanhVien AS B ON CTDT.Ma_nguoi_tao = B.ID 
			INNER JOIN ChiTietThanhVien As C on B.Ten_DN = C.Ten_dang_nhap
			INNER JOIN HeDaoTao As D On CTDT.Ma_trinh_do = D.ID
			INNER JOIN ChuyenNganh As E On CTDT.Ma_nghe = E.ID 
			WHERE ' + @Dieu_kien_tinh_trang + ' And ' + @Dieu_kien_bo_phan +
			' ORDER BY CTDT.Ngay_cap_nhat_cuoi ASC
		) AS TB1
		ORDER BY TB1.Ngay_cap_nhat_cuoi DESC'
	 
	--ORDER BY TB2.Ngay_cap_nhat_cuoi DESC
	exec  sp_executesql @sql
	--PRINT @sql
END
--INNER JOIN ThanhVien As B On TB2.Ma_nguoi_tao = B.ID 
--INNER JOIN ChiTietThanhVien As C on B.Ten_DN = C.Ten_dang_nhap
--exec sp_ISO_GetChuongTrinhDaoTao 3,1,1,'',4,5,'1'