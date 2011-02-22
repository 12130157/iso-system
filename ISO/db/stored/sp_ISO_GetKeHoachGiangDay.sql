
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
	@TenMonHoc nvarchar(500),
	@MaKhoa varchar(5),
	@MaHocKi varchar(1),
	@MaNamHoc varchar(5)
AS
BEGIN
	DECLARE @sql NVarchar(1000)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_khong_phai_nguoi_tao nvarchar(100)
	DECLARE @Dieu_kien_ma_nguoi_tao nvarchar(100)
	DECLARE @Dieu_kien_ma_bo_phan nvarchar(100)
	DECLARE @Dieu_kien_hoc_ki varchar(100)
	DECLARE @Dieu_kien_nam_hoc varchar(100)
	DECLARE @Dieu_kien_ma_khoa varchar(100)
	DECLARE @VAITRO INT
	
	SET @Dieu_kien_tinh_trang = ''
	SET @Dieu_kien_khong_phai_nguoi_tao = ''
	SET @Dieu_kien_ma_nguoi_tao = ''
	SET @Dieu_kien_ma_bo_phan=''
	SET	@Dieu_kien_hoc_ki=''
	SET @Dieu_kien_nam_hoc=''
	SET @Dieu_kien_ma_khoa=''

	IF(@Ma_nguoi_tao<>'')
		BEGIN
			SET	@Dieu_kien_ma_bo_phan = ' And B.Ma_bo_phan='+@Ma_Bo_Phan
		END
	IF(@Tinh_trang<>'')
		BEGIN
			SET	@Dieu_kien_tinh_trang = ' AND Tinh_trang ='+@Tinh_trang 
		END
	IF(@MaHocKi<>'')
		BEGIN
			SET	@Dieu_kien_hoc_ki = ' AND Hoc_ki LIKE ''%'+@MaHocKi + '%'''
		END
	IF(@MaNamHoc<>'')
		BEGIN
			SET	@Dieu_kien_nam_hoc = ' AND Ma_nam_hoc LIKE ''%'+@MaNamHoc + '%'''
		END
	IF not exists(SELECT * FROM KeHoachGiangDay WHERE Ma_nguoi_tao = @Ma_nguoi_tao)
	BEGIN	
			SET @Dieu_kien_khong_phai_nguoi_tao = ' AND Tinh_trang <> 0 '
	END
	
	SELECT @VAITRO=Ma_vai_tro FROM ThanhVien WHERE ID=@Ma_nguoi_tao
	IF(@VAITRO = 8)	
	BEGIN 					
		SET @Dieu_kien_ma_nguoi_tao = ' AND Ma_nguoi_tao = ' + @Ma_nguoi_tao
	END

	IF(@MaKhoa <> '')	
	BEGIN 					
		SET @Dieu_kien_ma_khoa = ' AND B.Ma_bo_phan like ''%' + @MaKhoa +'%'''
	END


	SELECT @sql = '
		SELECT TB2.ID As MaKeHoachGiangDay, D.Ten_Mon_Hoc+'' - ''+E.Ki_Hieu  As TenKeHoachGiangDay, TB2.Ma_nguoi_tao As MaNguoiTao, (C.Ho + '' '' + C.Ten_Lot + '' '' + C.Ten) As TenNguoitao, 
			TB2.Tinh_trang As TinhTrang, TB2.Ly_do_reject As LyDoReject,TINH_TRANG_HT,TB2.Ma_mon_hoc,TB2.Ma_Lop,
			convert(varchar(20),TB2.Ngay_tao,105) As Ngaytao 
			FROM (
				SELECT TOP ' + @NumRows + '* 
				FROM (
					SELECT TOP ' + Cast(Cast(@TotalRows As Int) - (Cast(@CurrentPage As Int) - 1) * Cast(@NumRows As Int) As Varchar) + ' *
					FROM KeHoachGiangDay WHERE 1=1 ' +
					@Dieu_kien_tinh_trang + @Dieu_kien_ma_nguoi_tao + @Dieu_kien_khong_phai_nguoi_tao + @Dieu_kien_hoc_ki + @Dieu_kien_nam_hoc
					+' ORDER BY id ASC
				) AS TB1
				ORDER BY TB1.id DESC
			) AS TB2 
			INNER JOIN MonHoc As D On D.ID = TB2.Ma_Mon_Hoc And D.Ten_Mon_Hoc like N''%'+@TenMonHoc+'%''   
			INNER JOIN LopHoc As E On E.ID = TB2.Ma_Lop   			
			INNER JOIN ThanhVien As B On TB2.Ma_nguoi_tao = B.ID '+@Dieu_kien_ma_bo_phan+ @Dieu_kien_ma_khoa +' 
			INNER JOIN ChiTietThanhVien As C on B.Ten_DN = C.Ten_dang_nhap 
			ORDER BY TB2.id DESC'
	exec  sp_executesql @sql
END


