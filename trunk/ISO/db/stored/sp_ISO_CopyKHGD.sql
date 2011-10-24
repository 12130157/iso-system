IF EXISTS(SELECT * FROM DBO.SYSOBJECTS WHERE NAME='sp_ISO_CopyKHGD')
BEGIN
	DROP PROC sp_ISO_CopyKHGD
END
GO
CREATE PROC sp_ISO_CopyKHGD
 @Ma_KHGD INT,  
 @Ma_TKB  INT,  
 @KQ   INT OUTPUT  
AS  
BEGIN  
 SET @KQ = -1  
 IF EXISTS (SELECT * FROM KEHOACHGIANGDAY WHERE ID=@Ma_KHGD)  
 BEGIN  
  DECLARE @ID INT  
  INSERT INTO KEHOACHGIANGDAY  
  SELECT   
   A.MA_MON_HOC as 'Ma_mon_hoc',  
   B.MA_LOP as 'Ma_lop',  
   B.HOC_KI as 'Hoc_ki',  
   C.ID as 'Ma_nam_hoc',  
   A.So_ca_thuc_hanh as 'So_ca_thuc_hanh',  
   A.Ma_nguoi_tao as 'Ma_nguoi_tao',  
   getdate() as 'Ngay_tao',  
   null as 'Ma_nguoi_duyet',  
   null as 'Ngay_duyet',  
   0 as 'Tinh_trang',  
   (N'Kế hoạch giảng dạy học kỳ '+CAST(B.HOC_KI AS VARCHAR)+N' niên khóa '+CAST(B.NAM_BAT_DAU AS VARCHAR)+N' - '+CAST(B.NAM_KET_THUC AS VARCHAR)+N' lớp '+CAST(D.KI_HIEU AS VARCHAR)+N' môn '+CAST(E.Ten_mon_hoc AS NVARCHAR)) as Ten,  
   NULL as 'Ly_do_reject',  
   GETDATE() as 'Ngay_cap_nhat_cuoi',  
   A.SO_GIO_LT as 'So_gio_LT',  
   A.SO_GIO_TH as 'So_gio_TH',  
   A.MA_GIAO_VIEN as 'Ma_giao_vien',  
   A.SO_TIET_MOI_BUOI as 'So_tiet_moi_buoi',  
   NULL as 'Truong_khoa',  
   NULL as 'Ngay_TK_duyet',  
   0 as 'Tinh_trang_HT',  
   A.User1 as 'User1',  
   A.User2 as 'User2',  
   NULL as 'User3',  
   NULL as 'User4',  
   NULL as 'User5'  
  FROM KEHOACHGIANGDAY A INNER JOIN MONHOC E ON A.MA_MON_HOC=E.ID, THOIKHOABIEU B INNER JOIN LOPHOC D ON B.MA_LOP=D.ID, NAMHOC C  
  WHERE A.ID=@Ma_KHGD AND B.ID=@Ma_TKB AND C.Nam_bat_dau=B.Nam_bat_dau  
    
  SELECT @ID=MAX(ID) FROM KEHOACHGIANGDAY  
  INSERT INTO CHITIETKHGD  
  SELECT   
   @ID as 'Ma_ke_hoach_giang_day',  
   B.TEN_CHUONG as 'Ten_chuong',  
   B.CO_HIEU as 'Co_hieu',  
   GETDATE() as 'Ngay_cap_nhat_cuoi',  
   D.TUAN as 'Tuan',  
   D.NGAY_HOC as 'Ngay_BD',  
   null as 'Ngay_KT',  
   B.Noi_dung_TH as 'Noi_dung_TH',  
   B.Cong_viec_chuan_bi as 'Cong_viec_chuan_bi',  
   null as 'Ma_giao_an',  
   B.NHOM as 'nhom',  
   B.STT_NOI_DUNG as 'STT_noi_dung',  
   D.THU_TRONG_TUAN as 'Thu',  
   D.BUOI as 'Buoi',  
   F.Ki_hieu_phong as 'Ten_phong',  
   '' as 'Muc_tieu_bai_hoc',  
   NULL as 'User1',  
   NULL as 'User2',  
   NULL as 'User3',  
   NULL as 'User4',  
   NULL as 'User5'  
  FROM KEHOACHGIANGDAY A INNER JOIN CHITIETKHGD B ON A.ID=B.MA_KE_HOACH_GIANG_DAY,  
  THOIKHOABIEU C INNER JOIN CHITIETTKB D ON C.ID=D.MA_TKB   
  INNER JOIN MONHOCTKB E ON D.MA_MON_HOC_TKB=E.ID  
  INNER JOIN PHONGBAN F ON D.Ma_phong=F.ID  
  WHERE A.ID=@Ma_KHGD and C.ID=@Ma_TKB and B.STT_noi_dung=D.STT_noi_dung AND A.MA_MON_HOC=E.MA_MON_HOC  
  
  INSERT INTO GIAOAN  
  SELECT   
   @ID as 'Ma_KHGD',  
   B.Thu_tu as 'Thu_tu',  
   B.Buoi_hoc as 'Buoi_hoc',  
   D.Ngay_hoc as 'Ngay_thuc_hien',  
   B.Muc_tieu as 'Muc_tieu',  
   B.Thoi_gian_on_dinh as 'Thoi_gian_on_dinh',  
   B.Cong_tac_chuan_bi as 'Cong_tac_chuan_bi',  
   GETDATE() as 'Ngay_tao',  
   GETDATE() as 'Ngay_cap_nhat_cuoi',  
   B.Dan_nhap as 'Dan_nhap',  
   B.Noi_dung_bai_giang as 'Noi_dung_bai_giang',  
   B.Cung_co_kien_thuc as 'Cung_co_kien_thuc',  
   B.Huong_dan_tu_hoc as 'Huong_dan_tu_hoc',  
   B.Thoi_gian_dan_nhap as 'Thoi_gian_dan_nhap',  
   B.Thoi_gian_bai_giang as 'Thoi_gian_bai_giang',  
   B.Thoi_gian_cung_co as 'Thoi_gian_cung_co',  
   B.Thoi_gian_HDTH as 'Thoi_gian_HDTH',  
   B.Tai_lieu_tham_khao as 'Tai_lieu_tham_khao',  
   null as 'Ma_nguoi_duyet',  
   null as 'Ngay_duyet',  
   0 as 'Tinh_trang',  
   B.HD_dan_nhap_GV as 'HD_dan_nhap_GV',  
   B.HD_dan_nhap_HS as 'HD_dan_nhap_HS',  
   B.HD_giang_bai_moi_GV as 'HD_giang_bai_moi_GV',  
   B.HD_giang_bai_moi_HS as 'HD_giang_bai_moi_HS',  
   B.HD_cung_co_GV as 'HD_cung_co_GV',  
   B.HD_cung_co_HS as 'HD_cung_co_HS',  
   B.HD_HDTH_GV as 'HD_HDTH_GV',  
   B.HD_HDTH_HS as 'HD_HDTH_HS',  
   B.Loai_giao_an as 'Loai_giao_an',  
   B.Huong_dan_ban_dau as 'Huong_dan_ban_dau',  
   B.Huong_dan_thuong_xuyen as 'Huong_dan_thuong_xuyen',  
   B.Huong_dan_ket_thuc as 'Huong_dan_ket_thuc',  
   B.Huong_dan_ren_luyen as 'Huong_dan_ren_luyen',  
   B.Thoi_gian_HDBD as 'Thoi_gian_HDBD',  
   B.Thoi_gian_HDTX as 'Thoi_gian_HDTX',  
   B.Thoi_gian_HDKT as 'Thoi_gian_HDKT',  
   B.Thoi_gian_HDRL as 'Thoi_gian_HDRL',  
   B.HD_HDBD_GV as 'HD_HDBD_GV',  
   B.HD_HDBD_HS as 'HD_HDBD_HS',  
   B.HD_HDTX_GV as 'HD_HDTX_GV',  
   B.HD_HDTX_HS as 'HD_HDTX_HS',  
   B.HD_HDKT_GV as 'HD_HDKT_GV',  
   B.HD_HDKT_HS as 'HD_HDKT_HS',  
   B.HD_HDRL_GV as 'HD_HDRL_GV',  
   B.HD_HDRL_HS as 'HD_HDRL_HS',  
   B.Gioi_thieu_chu_de as 'Gioi_thieu_chu_de',  
   B.Giai_quyet_van_de as 'Giai_quyet_van_de',  
   B.Thoi_gian_GTCD as 'Thoi_gian_GTCD',  
   B.Thoi_gian_GTVD as 'Thoi_gian_GTVD',  
   B.HD_GTCD_GV as 'HD_GTCD_GV',  
   B.HD_GTCD_HS as 'HD_GTCD_HS',  
   B.HD_GQVD_GV as 'HD_GQVD_GV',  
   B.HD_GQVD_HS as 'HD_GQVD_HS',  
   B.Rut_kinh_nghiem as 'Rut_kinh_nghiem',  
   B.So_giao_an as 'So_giao_an',  
   B.Do_dung_PT_DH as 'Do_dung_PT_DH',  
   B.On_dinh_LH as 'On_dinh_LH',  
   B.Thoi_gian_TH_BH as 'Thoi_gian_TH_BH',  
   B.Hinh_thuc_TC_DH as 'Hinh_thuc_TC_DH',  
   B.Ma_giao_vien as 'Ma_giao_vien',  
   B.Ten_chuong as 'Ten_chuong',  
   null as 'NgayGui',  
   NULL as 'User1',  
   NULL as 'User2',  
   NULL as 'User3',  
   NULL as 'User4',  
   NULL as 'User5'  
  FROM KEHOACHGIANGDAY A INNER JOIN GIAOAN B ON A.ID=B.Ma_KHGD,  
  THOIKHOABIEU C INNER JOIN CHITIETTKB D ON C.ID=D.MA_TKB INNER JOIN MONHOCTKB E ON D.MA_MON_HOC_TKB=E.ID  
  WHERE A.ID=@Ma_KHGD and C.ID=@Ma_TKB and B.So_giao_an=D.STT_noi_dung AND A.MA_MON_HOC=E.MA_MON_HOC  
  
  DECLARE @C CURSOR  
  DECLARE @ID_CTKHGD INT  
  DECLARE @ID_GIAOAN INT  
  DECLARE @CO_HIEU INT  
  SET @C = CURSOR FOR   
  SELECT B.ID,C.ID,B.CO_HIEU  
  FROM KEHOACHGIANGDAY A INNER JOIN CHITIETKHGD B ON A.ID=B.MA_KE_HOACH_GIANG_DAY  
  INNER JOIN GIAOAN C ON A.ID=C.MA_KHGD  
  WHERE B.STT_noi_dung=C.So_giao_an AND A.ID=@ID  
  
  OPEN @C  
  FETCH NEXT FROM @C INTO @ID_CTKHGD,@ID_GIAOAN,@CO_HIEU  
  WHILE @@FETCH_STATUS = 0  
  BEGIN  
   UPDATE GIAOAN SET User1=@CO_HIEU WHERE ID=@ID_GIAOAN  
   UPDATE CHITIETKHGD SET Ma_giao_an=@ID_GIAOAN WHERE ID=@ID_CTKHGD  
   FETCH NEXT FROM @C INTO @ID_CTKHGD,@ID_GIAOAN,@CO_HIEU  
  END  
    
  CLOSE @C  
  DEALLOCATE @C  
  SET @KQ = @ID  
 END  
END  