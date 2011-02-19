
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetKeHoachGiangDay]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetKeHoachGiangDay]
GO
CREATE PROCEDURE sp_ISO_GetKeHoachGiangDay
	@NumRows		VARCHAR(2),
	@TotalRows      varchar(5),
	@CurrentPage	VARCHAR(2),
	@Tinh_trang		varchar(2),
	@Ma_nguoi_tao   varchar(2),		
	@Ma_Bo_Phan varchar(2),
	@TenMonHoc nvarchar(max)
AS
BEGIN
	DECLARE @sql NVarchar(1000)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_khong_phai_nguoi_tao nvarchar(100)
	DECLARE @Dieu_kien_ma_nguoi_tao nvarchar(100)
	DECLARE @Dieu_kien_ma_bo_phan nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(5)
	SET @Dieu_kien_tinh_trang = ''
	SET @Dieu_kien_khong_phai_nguoi_tao = ''
	SET @Dieu_kien_ma_nguoi_tao = ''
	SET @And = ''
	SET @Where = ''
	SET @Dieu_kien_ma_bo_phan=''
	
	if(@Ma_nguoi_tao<>'')
		Begin
			SET	@Dieu_kien_ma_bo_phan = ' And B.Ma_bo_phan='+@Ma_Bo_Phan
		END

	if(@Tinh_trang <> '' and @Ma_nguoi_tao <> '')
	BEGIN
		SET @And = ' and '
	END
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Where = 'Where '
		SET @Dieu_kien_tinh_trang = ' Tinh_trang = ' + @Tinh_trang
	END
	
	if(@Ma_nguoi_tao <> '')
	BEGIN
		SET @Where = 'Where '
		if not exists(Select * From KeHoachGiangDay Where Ma_nguoi_tao = @Ma_nguoi_tao)
		BEGIN	
			SET @Dieu_kien_khong_phai_nguoi_tao = ' Tinh_trang <> 0 '
		END
		else
		BEGIN
			DECLARE @VAITRO INT
			SELECT @VAITRO=Ma_vai_tro FROM ThanhVien WHERE ID=@Ma_nguoi_tao
			IF(@VAITRO = 8)	
			BEGIN 					
				SET @Dieu_kien_ma_nguoi_tao = ' Ma_nguoi_tao = ' + @Ma_nguoi_tao
			END
			IF @Dieu_kien_tinh_trang='' and @Dieu_kien_ma_nguoi_tao ='' and @Dieu_kien_khong_phai_nguoi_tao=''
			BEGIN
				set @WHERE=''
			END
			IF @Dieu_kien_ma_nguoi_tao ='' and @Dieu_kien_khong_phai_nguoi_tao=''
			BEGIN
				set @And=''
			END
			
		END
	END

	SELECT @sql = '
		SELECT TB2.ID As MaKeHoachGiangDay, D.Ten_Mon_Hoc+'' - ''+E.Ki_Hieu  As TenKeHoachGiangDay, TB2.Ma_nguoi_tao As MaNguoiTao, (C.Ho + '' '' + C.Ten_Lot + '' '' + C.Ten) As TenNguoitao, 
			TB2.Tinh_trang As TinhTrang, TB2.Ly_do_reject As LyDoReject,TINH_TRANG_HT,TB2.Ma_mon_hoc,TB2.Ma_Lop,
			convert(varchar(20),TB2.Ngay_tao,105) As Ngaytao 
			FROM (
				SELECT TOP ' + @NumRows + '* 
				FROM (
					SELECT TOP ' + Cast(Cast(@TotalRows As Int) - (Cast(@CurrentPage As Int) - 1) * Cast(@NumRows As Int) As Varchar) + ' *
					FROM KeHoachGiangDay '
					+ @Where + @Dieu_kien_tinh_trang + @And + @Dieu_kien_ma_nguoi_tao + @Dieu_kien_khong_phai_nguoi_tao +
					' ORDER BY id ASC
				) AS TB1
				ORDER BY TB1.id DESC
			) AS TB2 
			INNER JOIN MonHoc As D On D.ID = TB2.Ma_Mon_Hoc And D.Ten_Mon_Hoc like N''%'+@TenMonHoc+'%''   
			INNER JOIN LopHoc As E On E.ID = TB2.Ma_Lop   			
			INNER JOIN ThanhVien As B On TB2.Ma_nguoi_tao = B.ID '+@Dieu_kien_ma_bo_phan+'
			INNER JOIN ChiTietThanhVien As C on B.Ten_DN = C.Ten_dang_nhap 
			ORDER BY TB2.id DESC'
			
	print @sql
	exec  sp_executesql @sql
END


