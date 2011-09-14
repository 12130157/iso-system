
/***********************************************************
* Purpose : Tu dong genarate data vao cac table DIEM DANH
* Author : ThienVD
* Date: 10-09-2010
* Description: Khi thoi khoa bieu duoc HT approve thi trigger nay
*    se tu dong genarate data vao cac table 
*			1. DiemDanh
*			2. ThanhVienDiemDanh
*			3. ChiTietDiemDanh
***********************************************************/

if exists (select * from dbo.sysobjects where name='tg_genarateDiemDanh') 
begin
	drop trigger tg_genarateDiemDanh
end

go
CREATE TRIGGER tg_genarateDiemDanh ON ThoiKhoaBieu
FOR UPDATE
AS
BEGIN
 DECLARE @MaTKB INT  
 DECLARE @Tinh_trang INT  
 DECLARE @Ma_lop INT  
   
 -- Lay du lieu tu trong table temp updated, bo vao cac bien de xu ly  
 SELECT @MaTKB = ID,@Tinh_trang = Tinh_trang,@Ma_lop=Ma_lop FROM INSERTED  
   
 -- Neu tinh trang = 2(HT approve) thi xu ly  
 IF @Tinh_trang = 2  
 BEGIN  
  -- Dua du lieu vao table DiemDanh (1 record tuong ung voi lopX hoc monX do GV(X) day )  
  INSERT INTO DiemDanh  
  SELECT   
   A.Ma_lop   as 'Ma_lop_hoc',  
   B.Ma_giao_vien  as 'Ma_giao_vien',  
   A.ID    as 'Ma_CT_TKB',  
   B.Ma_mon_hoc  as 'Ma_mon_hoc',  
   A.Ngay_bat_dau  as 'Ngay_bat_dau',  
   A.Ngay_ket_thuc  as 'Ngay_ket_thuc',  
   0     as 'Tinh_trang',  
   getdate()   as 'Ngay_cap_nhat_cuoi',  
   ''     as 'Ghi_chu',  
   ''     as 'User1',  
   ''     as 'User2',  
   ''     as 'User3',  
   ''     as 'User4',  
   ''     as 'User5'    
  FROM ThoiKhoaBieu A  
  INNER JOIN MonHocTKB B ON A.ID = B.Ma_tkb  
  WHERE A.ID = @MaTKB  
    
  -- Dua du lieu vao table ThanhVienDiemDanh (bao nhieu sinh vien thuoc lopX se duoc insert vao table nay)  
  DECLARE @Ma_diem_danh INT    
  DECLARE @C CURSOR    
  SET @C = CURSOR FOR SELECT ID FROM DiemDanh WHERE Ma_CT_TKB=@MaTKB  
    
  OPEN @C  
  FETCH NEXT FROM @C INTO @Ma_diem_danh  
    
  WHILE @@FETCH_STATUS = 0  
  BEGIN  
   INSERT INTO ThanhVienDiemDanh  
   SELECT      
    @Ma_diem_danh  as 'Ma_diem_danh',  
    A.ID    as 'Ma_thanh_vien',  
    ''     as 'Ghi_chu',  
    getdate()   as 'Ngay_cap_nhat_cuoi',      
    B.User2    as 'User1', -- Nhom (1 hoac 2)  
    ''     as 'User2',  
    ''     as 'User3',  
    ''     as 'User4',  
    ''     as 'User5'      
   FROM ThanhVien A    
   INNER JOIN ChiTietThanhVien B ON A.Ten_DN = B.Ten_dang_nhap  
   WHERE B.Tinh_trang=1  
   AND B.Ma_lop_hoc=@Ma_lop  
     
   FETCH NEXT FROM @C INTO @Ma_diem_danh  
  END  
    
  CLOSE @C  
  DEALLOCATE @C  
    
    
  -- Dua du lieu vao table ChiTietDiemDanh (1 lop hoc 10 buoi, 10 hoc sinh/1 lop ==> insert 100 record vao table nay)  
    
  DECLARE @Ma_TVDD  INT    
  DECLARE @Ma_mon_hoc  INT  
  DECLARE @Nhom   VARCHAR(40)  
    
  SET @C = CURSOR FOR   
  SELECT   
   B.ID     as 'Ma_TVDD',  
   A.Ma_mon_hoc   as 'Ma_mon_hoc',  
   B.User1     as 'Nhom'  
  FROM DiemDanh A  
  INNER JOIN ThanhVienDiemDanh B ON A.ID = B.Ma_diem_danh  
  WHERE A.Ma_CT_TKB=@MaTKB  
    
  OPEN @C  
  FETCH NEXT FROM @C INTO @Ma_TVDD,@Ma_mon_hoc,@Nhom  
    
  WHILE @@FETCH_STATUS = 0  
  BEGIN  
   INSERT INTO ChiTietDiemDanh  
   SELECT      
    @Ma_TVDD   as 'Ma_TVDD',  
    C.Ngay_hoc   as 'Ngay_hoc',  
    '0'     as 'Tinh_trang',  
    '0'     as 'Ghi_chu',  
    getdate()   as 'Ngay_cap_nhat_cuoi',  
    ''     as  'Ca_hoc',  
    ''     as 'Gio_bat_dau',  
    ''     as 'Gio_ket_thuc',      
    C.Buoi    as 'Buoi',  
    ''     as 'User1',  
    ''     as 'User2',  
    ''     as 'User3',  
    ''     as 'User4',  
    ''     as 'User5'  
          
   FROM ThoiKhoaBieu A    
   INNER JOIN MonHocTKB B ON A.ID=B.Ma_TKB  
   INNER JOIN ChiTietTKB C ON B.ID=C.Ma_mon_hoc_TKB  
   WHERE A.ID=@MaTKB  
   AND B.Ma_mon_hoc=@Ma_mon_hoc  
   AND C.Nhom = @Nhom  
     
   FETCH NEXT FROM @C INTO @Ma_TVDD,@Ma_mon_hoc,@Nhom  
  END  
    
  CLOSE @C  
  DEALLOCATE @C  
 END  
END