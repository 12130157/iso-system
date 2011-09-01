if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].sp_iso_GetLengthOfFindGiaoAn') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].sp_iso_GetLengthOfFindGiaoAn
GO
CREATE PROCEDURE sp_iso_GetLengthOfFindGiaoAn
	@MaNguoiTao varchar(10),
	@MaNamHoc varchar(10),
	@MaLop varchar(10),
	@MaMonHoc varchar(10),
	@HocKi varchar(10),
	@TinhTrang varchar(10),
	@NgayTimBD varchar(11),
	@NgayTimKT varchar(11),
	@MaBoPhan varchar(5),
	@MaKhoa varchar(5)
AS
BEGIN			
	DECLARE @DieuKienMaNguoiTao varchar(100)
	DECLARE @DieuKienMaLop varchar(100)
	DECLARE @DieuKienMaMonHoc varchar(100)
	DECLARE @DieuKienTinhTrang varchar(100)
	DECLARE @DieuKienHocKi varchar(100)
	DECLARE @DieuKienMaNamHoc varchar(100)
	DECLARE @DieuKienTimNgay varchar(100)
	DECLARE @DieuKienMaBoPhan varchar(100)


	SET @DieuKienMaNguoiTao=''
	SET @DieuKienMaLop=''
	SET @DieuKienMaMonHoc=''
	SET @DieuKienTinhTrang=''
	SET @DieuKienHocKi=''
	SET @DieuKienMaNamHoc=''
	SET @DieuKienTimNgay=''

	IF (@MaBoPhan = 0 OR @MaBoPhan = 1 OR @MaBoPhan=16 OR @MaBoPhan=4 OR @MaBoPhan=2)  AND @MaKhoa = ''
	BEGIN
		SET @DieuKienMaBoPhan=''
	END
	ELSE
	BEGIN
		  IF @MaKhoa = ''    
		  BEGIN    
			SET @DieuKienMaBoPhan=' AND CN.Ma_khoaTT='+@MaBoPhan    
		  END    
		  ELSE
		  BEGIN    
			SET @DieuKienMaBoPhan=' AND CN.Ma_khoaTT='+@MaKhoa    
		  END   
	END

		
	IF @NgayTimBD = ''
	BEGIN
		SET @NgayTimBD='1/1/1'
	END
	
	IF @NgayTimKT =''
	BEGIN
		SET @DieuKienTimNgay= ' WHERE U.Ngay_BD >= ''' +  @NgayTimBD+'''' 
	END
	ELSE
	BEGIN
		SET @DieuKienTimNgay= ' WHERE U.Ngay_BD >= ''' + @NgayTimBD  + ''' AND U.Ngay_BD <= ''' + @NgayTimKT +''''
	END	

	IF @MaNguoiTao <> ''
	BEGIN
		SET @DieuKienMaNguoiTao=' AND A.Ma_nguoi_tao = '+@MaNguoiTao
	END
	
	IF @MaLop <> ''
	BEGIN
		SET @DieuKienMaLop=' AND Ma_Lop = '+@MaLop
	END
	
	IF @MaMonHoc <> ''
	BEGIN
		SET @DieuKienMaMonHoc =' AND Ma_mon_hoc ='+ @MaMonHoc
	END

	IF @TinhTrang <>''
	BEGIN
		SET @DieuKienTinhTrang =' AND B.Tinh_trang = '+@TinhTrang 
	END

	IF @HocKi <>''
	BEGIN
		SET @DieuKienHocKi=' AND Hoc_ki = '+@HocKi
	END	
	IF @MaNamHoc <>''
	BEGIN
		SET @DieuKienMaNamHoc=' AND Ma_nam_hoc  = '+ @MaNamHoc
	END
	
	DECLARE @sql nvarchar(2000)


SET @sql=' SELECT U.Co_Hieu As CoHieu,U.ID As MaCTKHGD,A.ID As MaKHGD,A.Ma_Nguoi_Tao As MaNguoiTao,A.Ma_mon_hoc As MaMonHoc,U.Ngay_BD As NgayThucHien
		,A.Ma_lop As MaLop,B.ID As MaGiaoAn,B.Tinh_Trang As TinhTrang,B.So_Giao_An As SoGiaoAn 
		,B.NgayGui As NgayGui,B.Ngay_duyet As NgayDuyet,B.Ma_nguoi_duyet As MaNguoiDuyet
,ISNULL(K.Ho+'' ''+'' ''+K.Ten_lot+'' ''+K.Ten,'''') As NguoiDuyet
		,C.Ten_Mon_Hoc As TenMonHoc,D.Ki_hieu As KiHieu,F.Ho+'' ''+'' ''+F.Ten_lot+'' ''+F.Ten As NguoiTao
INTO #TEMP 
FROM KeHoachGiangDay As A
INNER JOIN GiaoAn As B
ON 1=1 '     
			 +@DieuKienMaNguoiTao  
			 +@DieuKienHocKi
			 +@DieuKienMaNamHoc
			 +@DieuKienMaLop
			 +@DieuKienMaMonHoc 
			 +' AND B.Ma_KHGD=A.ID ' 
			 +@DieuKienTinhTrang
			 
+' INNER JOIN MonHoc As C
ON C.ID=A.Ma_Mon_Hoc
INNER JOIN LopHoc As D
ON D.ID=A.Ma_Lop 
INNER JOIN ChuyenNganh As CN
ON D.Ma_chuyen_nganh=CN.ID '+ @DieuKienMaBoPhan +'  
INNER JOIN ThanhVien As E
On E.ID=A.Ma_Giao_Vien
INNER JOIN ChiTietThanhVien As F
ON E.Ten_DN=F.Ten_dang_nhap
LEFT JOIN ThanhVien As G
On G.ID=B.Ma_nguoi_duyet
LEFT JOIN ChiTietThanhVien As K
ON G.Ten_DN=K.Ten_dang_nhap
INNER JOIN ChiTietKHGD As U
On U.Ma_giao_an=B.ID '
+@DieuKienTimNgay +
' ORDER BY A.Ma_nguoi_tao DESC,A.Ma_mon_hoc DESC, A.Ma_lop DESC 

SELECT COUNT(*) AS TOTAL FROM #TEMP

'


	
exec sp_executesql @sql
END


	