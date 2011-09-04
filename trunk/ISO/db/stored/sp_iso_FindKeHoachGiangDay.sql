if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].sp_iso_FindKeHoachGiangDay') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].sp_iso_FindKeHoachGiangDay
GO
CREATE PROCEDURE sp_iso_FindKeHoachGiangDay      
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
     
 IF (@MaBoPhan = 0 OR @MaBoPhan = 1 OR @MaBoPhan=16 OR @MaBoPhan=4 OR @MaBoPhan=2 ) AND @MaKhoa = ''    
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
  SET @DieuKienTimNgay= ' AND A.NgayHocBD >= ''' +  @NgayTimBD+' 00:00:00.000'''       
 END      
 ELSE      
 BEGIN      
  SET @DieuKienTimNgay= ' AND A.NgayHocBD >= ''' + @NgayTimBD  + ' 00:00:00.000'' AND A.NgayHocBD <= ''' + @NgayTimKT +' 23:59:59.000'' '      
 END       
      
      
      
 IF @MaNguoiTao <> ''      
 BEGIN      
  SET @DieuKienMaNguoiTao=' AND A.Ma_giao_vien = '+@MaNguoiTao      
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
  IF @TinhTrang = 5       
   BEGIN      
     SET @DieuKienTinhTrang =' AND ISNULL(B.Tinhtrang,5) = 5 '      
   END      
          
  ELSE      
   BEGIN       
    SET @DieuKienTinhTrang =' AND B.Tinhtrang = '+@TinhTrang       
   END      
 END      
      
 IF @HocKi <>''      
 BEGIN      
  SET @DieuKienHocKi=' AND B.HocKi = '+@HocKi      
 END       
 IF @MaNamHoc <>''      
 BEGIN      
	DECLARE @Bat_dau int
	DECLARE @Ket_thuc int
	SELECT @Bat_dau=Nam_bat_dau, @Ket_thuc=Nam_ket_thuc FROM NamHoc WHERE ID=@MaNamHoc
	SET @DieuKienMaNamHoc=' AND A.Nam_bat_dau ='+cast(@Bat_dau as varchar)+ ' AND A.Nam_ket_thuc ='+cast(@Ket_thuc as varchar)

 END      
       
 DECLARE @sql nvarchar(2000)      
      
 DECLARE @MaLoaiCT varchar(10)    
 SET @MaLoaiCT='0'     
      
 SET @sql='      
       
 SELECT MonHocTKB.Ma_mon_hoc,ThoiKhoaBieu.Nam_bat_dau,ThoiKhoaBieu.Nam_ket_thuc,ThoiKhoaBieu.Ma_lop,MonHocTKB.User5 As NgayHocBD,MonHocTKB.Ma_giao_vien INTO #temp1 FROM MonHocTKB,ThoiKhoaBieu WHERE MonHocTKB.Ma_tkb=ThoiKhoaBieu.ID AND ThoiKhoaBieu.Tinh_trang=2        
       
 SELECT  A.Tinh_Trang_HT,A.ID As MaKHGD,A.Ma_Nguoi_Tao As MaNguoiTao,A.Ma_mon_hoc As MaMonHoc,A.Ngay_tao As NgayThucHien      
  ,A.Ma_lop As MaLop,A.Tinh_Trang As TinhTrang,A.User2 As NgayBatDau      
  ,A.User1 As NgayGui,A.Ngay_duyet As NgayDuyet,A.Ma_nguoi_duyet As MaNguoiDuyet,A.Hoc_ki As HocKi,A.Ma_nam_hoc As MaNamHoc      
        
 INTO #temp2       
 FROM KeHoachGiangDay As A       
      
       
 SELECT B.Tinh_trang_Ht As TinhTrangHT,B.MaKHGD,A.NgayHocBD As NgayThucHien,B.NgayGui,B.NgayDuyet,B.TinhTrang,A.Ma_mon_hoc As MaMonHoc,A.Ma_lop As MaLop,A.Ma_giao_vien As MaNguoiTao,M.Ten_mon_hoc As TenMonHoc,L.Ki_hieu As KiHieu,ISNULL(C1.Ho+ '' '' +C1.Ten_lot+'' ''+C1.Ten,'' '') As NguoiTao,C2.Ho+ '' '' +C2.Ten_lot+'' ''+C2.Ten As NguoiDuyet ,KPPN1.Ma_phieu As MaPhieu     
 FROM #temp1 As A      
 LEFT JOIN #temp2 As B ON A.Ma_mon_hoc=B.MaMonHoc AND A.Ma_lop=B.MaLop      
 INNER JOIN MonHoc AS M ON M.ID=A.Ma_mon_hoc      
 INNER JOIN LopHoc As L ON L.ID=A.Ma_lop
 INNER JOIN ChuyenNganh As CN ON L.Ma_chuyen_nganh=CN.ID   
 LEFT JOIN Thanhvien As T1 ON T1.ID=A.Ma_Giao_vien       
 LEFT JOIN ChiTietThanhVien As C1 ON T1.Ten_DN=C1.Ten_dang_nhap      
 LEFT JOIN Thanhvien As T2 ON T2.ID=B.MaNguoiDuyet      
 LEFT JOIN ChiTietThanhVien As C2 ON T2.Ten_DN=C2.Ten_dang_nhap      
 LEFT JOIN DSThuocPhieuKPPN AS KPPN1     
 ON  KPPN1.Ma_Chuong_Trinh=B.MaKHGD AND KPPN1.Tinh_trang=0 AND KPPN1.Ma_loai='+@MaLoaiCT+'     
    
  WHERE 1 = 1 '       
 + @DieuKienMaNguoiTao      
 + @DieuKienMaLop      
 + @DieuKienMaMonHoc      
 + @DieuKienTinhTrang      
 + @DieuKienHocKi      
 + @DieuKienMaNamHoc      
 + @DieuKienTimNgay      
 +@DieuKienMaBoPhan      
 +' ORDER BY A.NgayHocBD DESC   '      
        PRINT @SQL
EXEC sp_executesql @sql      
END      
      