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
 @MaBoPhan varchar(5)  
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
  
 IF @MaBoPhan = 1 OR @MaBoPhan=16 OR @MaBoPhan=4 OR @MaBoPhan=2
 BEGIN  
  SET @DieuKienMaBoPhan=''  
 END  
 ELSE  
 BEGIN  
  SET @DieuKienMaBoPhan=' AND T1.Ma_bo_phan='+@MaBoPhan  
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
  SET @DieuKienMaNamHoc=' AND B.MaNamHoc  = '+ @MaNamHoc  
 END  
   
 DECLARE @sql nvarchar(2000)  
   
  
 SET @sql='  
   
 SELECT MonHocTKB.Ma_mon_hoc,ThoiKhoaBieu.Ma_lop,MonHocTKB.User5 As NgayHocBD,MonHocTKB.Ma_giao_vien INTO #temp1 FROM MonHocTKB,ThoiKhoaBieu WHERE MonHocTKB.Ma_tkb=ThoiKhoaBieu.ID AND ThoiKhoaBieu.Tinh_trang=2    
   
 SELECT  A.Tinh_Trang_HT,A.ID As MaKHGD,A.Ma_Nguoi_Tao As MaNguoiTao,A.Ma_mon_hoc As MaMonHoc,A.Ngay_tao As NgayThucHien  
  ,A.Ma_lop As MaLop,A.Tinh_Trang As TinhTrang,A.User2 As NgayBatDau  
  ,A.User1 As NgayGui,A.Ngay_duyet As NgayDuyet,A.Ma_nguoi_duyet As MaNguoiDuyet,A.Hoc_ki As HocKi,A.Ma_nam_hoc As MaNamHoc  
    
 INTO #temp2   
 FROM KeHoachGiangDay As A   
  
   
 SELECT B.Tinh_trang_Ht As TinhTrangHT,B.MaKHGD,A.NgayHocBD As NgayThucHien,B.NgayGui,B.NgayDuyet,B.TinhTrang,A.Ma_mon_hoc As MaMonHoc,A.Ma_lop As MaLop,A.Ma_giao_vien As MaNguoiTao,M.Ten_mon_hoc As TenMonHoc,L.Ki_hieu As KiHieu,ISNULL(C1.Ho+ '' '' +C1.Ten_lot+'' ''+C1.Ten,'' '') As NguoiTao,C2.Ho+ '' '' +C2.Ten_lot+'' ''+C2.Ten As NguoiDuyet  
 FROM #temp1 As A  
 LEFT JOIN #temp2 As B ON A.Ma_mon_hoc=B.MaMonHoc AND A.Ma_lop=B.MaLop  
 INNER JOIN MonHoc AS M ON M.ID=A.Ma_mon_hoc  
 INNER JOIN LopHoc As L ON L.ID=A.Ma_lop  
 LEFT JOIN Thanhvien As T1 ON T1.ID=A.Ma_Giao_vien   
 LEFT JOIN ChiTietThanhVien As C1 ON T1.Ten_DN=C1.Ten_dang_nhap  
 LEFT JOIN Thanhvien As T2 ON T2.ID=B.MaNguoiDuyet  
 LEFT JOIN ChiTietThanhVien As C2 ON T2.Ten_DN=C2.Ten_dang_nhap  
  WHERE 1 = 1 '   
 + @DieuKienMaNguoiTao  
 + @DieuKienMaLop  
 + @DieuKienMaMonHoc  
 + @DieuKienTinhTrang  
 + @DieuKienHocKi  
 + @DieuKienMaNamHoc  
 + @DieuKienTimNgay  
 +@DieuKienMaBoPhan  
 +' ORDER BY A.Ma_Giao_Vien DESC,A.Ma_mon_hoc DESC,A.Ma_lop DESC   '  
   
 EXEC sp_executesql @sql  
END  
  
  
  