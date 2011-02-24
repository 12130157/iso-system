if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].sp_iso_FindKeHoachGiangDay') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].sp_iso_FindKeHoachGiangDay
GO
CREATE PROCEDURE sp_iso_FindKeHoachGiangDay
	@MaNguoiTao varchar(10),
	@MaNamHoc varchar(10),
	@MaLop varchar(10),
	@MaMonHoc varchar(10),
	@HocKi varchar(10),
	@TinhTrang varchar(10)
AS
BEGIN			
	DECLARE @DieuKienMaNguoiTao varchar(100)
	DECLARE @DieuKienMaLop varchar(100)
	DECLARE @DieuKienMaMonHoc varchar(100)
	DECLARE @DieuKienTinhTrang varchar(100)
	DECLARE @DieuKienHocKi varchar(100)
	DECLARE @DieuKienMaNamHoc varchar(100)

	SET @DieuKienMaNguoiTao=''
	SET @DieuKienMaLop=''
	SET @DieuKienMaMonHoc=''
	SET @DieuKienTinhTrang=''
	SET @DieuKienHocKi=''
	SET @DieuKienMaNamHoc=''
		

	IF @MaNguoiTao <> ''
	BEGIN
		SET @DieuKienMaNguoiTao=' AND A.Ma_nguoi_tao = '+@MaNguoiTao
	END
	
	IF @MaLop <> ''
	BEGIN
		SET @DieuKienMaLop=' AND A.Ma_Lop = '+@MaLop
	END
	
	IF @MaMonHoc <> ''
	BEGIN
		SET @DieuKienMaMonHoc =' AND A.Ma_mon_hoc ='+ @MaMonHoc
	END

	IF @TinhTrang <>''
	BEGIN
		SET @DieuKienTinhTrang =' AND A.Tinh_trang = '+@TinhTrang 
	END

	IF @HocKi <>''
	BEGIN
		SET @DieuKienHocKi=' AND A.Hoc_ki = '+@HocKi
	END	
	IF @MaNamHoc <>''
	BEGIN
		SET @DieuKienMaNamHoc=' AND A.Ma_nam_hoc  = '+ @MaNamHoc
	END
	
	DECLARE @sql nvarchar(2000)
	

	SET @sql='
	
	SELECT MonHocTKB.Ma_mon_hoc,ThoiKhoaBieu.Ma_lop,MonHocTKB.Ma_giao_vien INTO #temp1 FROM MonHocTKB,ThoiKhoaBieu WHERE MonHocTKB.Ma_tkb=ThoiKhoaBieu.ID AND ThoiKhoaBieu.Tinh_trang=2  
	
	SELECT  A.ID As MaKHGD,A.Ma_Nguoi_Tao As MaNguoiTao,A.Ma_mon_hoc As MaMonHoc,A.Ngay_tao As NgayThucHien
		,A.Ma_lop As MaLop,A.Tinh_Trang As TinhTrang,A.User2 As SoThuTu 
		,A.User1 As NgayGui,A.Ngay_duyet As NgayDuyet,A.Ma_nguoi_duyet As MaNguoiDuyet,M.Ten_mon_hoc As TenMonHoc
		,L.Ki_hieu As KiHieu,ISNULL(C1.Ho+ '' '' +C1.Ten_lot+'' ''+C1.Ten,'' '') As NguoiTao,C2.Ho+ '' '' +C2.Ten_lot+'' ''+C2.Ten As NguoiDuyet
	INTO #temp2 
	FROM KeHoachGiangDay As A
	
	INNER JOIN MonHoc AS M ON M.ID=A.Ma_mon_hoc
	INNER JOIN LopHoc As L ON L.ID=A.Ma_lop
	LEFT JOIN Thanhvien As T1 ON T1.ID=A.Ma_nguoi_tao
	LEFT JOIN ChiTietThanhVien As C1 ON T1.Ten_DN=C1.Ten_dang_nhap
	LEFT JOIN Thanhvien As T2 ON T2.ID=A.Ma_nguoi_duyet
	LEFT JOIN ChiTietThanhVien As C2 ON T2.Ten_DN=C2.Ten_dang_nhap
	WHERE 1 = 1 ' 
	+ @DieuKienMaNguoiTao
	+ @DieuKienMaLop
	+ @DieuKienMaMonHoc
	+ @DieuKienTinhTrang
	+ @DieuKienHocKi
	+ @DieuKienMaNamHoc
	+' ORDER BY A.Ma_mon_hoc DESC,A.Ma_nguoi_tao DESC,A.Ma_lop DESC  
	
	
	SELECT * FROM #temp1
	LEFT JOIN #temp2 ON #temp1.Ma_mon_hoc=#temp2.MaMonHoc AND #temp1.Ma_lop=#temp2.MaLop

	'

	--PRINT @sql

	EXEC sp_executesql @sql
END



