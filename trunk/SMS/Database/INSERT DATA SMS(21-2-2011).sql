-- Table Vai Tro 
Go
INSERT INTO VaiTro VALUES(N'Admin',GETDATE(),'','','','','')
INSERT INTO VaiTro VALUES(N'Hiệu Trưởng',GETDATE(),'','','','','')
INSERT INTO VaiTro VALUES(N'Hiệu Phó',GETDATE(),'','','','','')
INSERT INTO VaiTro VALUES(N'Trưởng Phòng',GETDATE(),'','','','','')
INSERT INTO VaiTro VALUES(N'Phó Phòng',GETDATE(),'','','','','')
INSERT INTO VaiTro VALUES(N'Trưởng Khoa',GETDATE(),'','','','','')
INSERT INTO VaiTro VALUES(N'Phó Khoa',GETDATE(),'','','','','')
INSERT INTO VaiTro VALUES(N'Trưởng Bộ Môn',GETDATE(),'','','','','')
INSERT INTO VaiTro VALUES(N'Giáo Viên',GETDATE(),'','','','','')
INSERT INTO VaiTro VALUES(N'Sinh Viên',GETDATE(),'','','','','')
INSERT INTO VaiTro VALUES(N'Giám Đốc Trung Tâm',GETDATE(),'','','','','')
INSERT INTO VaiTro VALUES(N'Nhân Viên',GETDATE(),'','','','','')
INSERT INTO VaiTro VALUES(N'Giáo Vụ',GETDATE(),'','','','','')
INSERT INTO VaiTro VALUES(N'Quản Lý Thiết Bị',GETDATE(),'','','','','') 
--SELECT * FROM VaiTro

--Table LopHoc
GO
INSERT INTO LopHoc VALUES (null,'10SCM','','','','','','','')
INSERT INTO LopHoc VALUES (null,'10HTHD','','','','','','','')
INSERT INTO LopHoc VALUES (null,'10KTHN','','','','','','','')
INSERT INTO LopHoc VALUES (null,'10KTHL','','','','','','','')
INSERT INTO LopHoc VALUES (null,'09KTHN','','','','','','','')
INSERT INTO LopHoc VALUES (null,'09KTHD','','','','','','','')
INSERT INTO LopHoc VALUES (null,'10KTHS','','','','','','','')
--SELECT * FROM LopHoc

--Table HinhThuc
GO
INSERT INTO HinhThuc VALUES ('Tai Lop',GETDATE(),'','','','','')
INSERT INTO HinhThuc VALUES ('Tu Luan',GETDATE(),'','','','','')
INSERT INTO HinhThuc VALUES ('Trac Nghiem',GETDATE(),'','','','','')

--Table TenBiaKiemTra
GO
INSERT INTO TenBaiKiemTra VALUES ('Mieng',GETDATE(),'','','','','')
INSERT INTO TenBaiKiemTra VALUES ('15 Phut',GETDATE(),'','','','','')
INSERT INTO TenBaiKiemTra VALUES ('1 Tiet',GETDATE(),'','','','','')
INSERT INTO TenBaiKiemTra VALUES ('Thi Cuoi Mon',GETDATE(),'','','','','')

-- Table ChiTietThanhVien
Go
INSERT INTO ChiTietThanhVien VALUES('ThienVD',N'Võ',N'Đức',N'Thiện',getdate(),null,'ducthienkhtn@gmail.com','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('hai_tv',N'Trần',N'Văn',N'Hải',getdate(),null,'hai_tv@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('hanh_nn',N'Nguyễn',N'Ngọc',N'Hạnh',getdate(),null,'hanh_nn@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('hanh_vtb',N'Võ',N'Thị Bích',N'Hạnh',getdate(),null,'hanh_vtb@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('dung_nn',N'Ngô',N'Ngọc',N'Dung',getdate(),null,'dung_nn@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('han_nkn',N'Nguyễn',N'Khắc Ngọc',N'Hân',getdate(),null,'han_nkn@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('hoi_tt',N'Trần',N'Thị',N'Hội',getdate(),null,'hoi_tt@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('nhan_nh',N'Nguyễn',N'Hữu',N'Nhân',getdate(),null,'nhan_nh@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('cong_nd',N'Nguyễn',N'Đình',N'Công',getdate(),null,'cong_nd@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('chau_dcb',N'Đỗ',N'Cao Bảo',N'Châu',getdate(),null,'chau_dcb@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('loi_nt',N'Nguyễn',N'Tấn',N'Lợi',getdate(),null,'loi_nt@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('tran_dtt',N'Đoàn',N'Thị Thanh',N'Trân',getdate(),null,'tran_dtt@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('luong_nt',N'Nguyễn',N'Trọng',N'Lượng',getdate(),null,'luong_nt@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('trung_th',N'Trương',N'Hòa',N'Trung',getdate(),null,'trung_th@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('ngoc_dtt',N'Đặng',N'Thị Thu',N'Ngọc',getdate(),null,'ngoc_dtt@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('hong_nt',N'Nguyễn',N'Thị',N'Hồng',getdate(),null,'hong_nt@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')

-- Danh sach giao vien 

INSERT INTO ChiTietThanhVien VALUES('duc_pm',N'Phạm',N'Minh',N'Đức',getdate(),null,'duc_pm@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('tan_dp',N'Dương',N'Phước',N'Tấn',getdate(),null,'tan_dp@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('trien_nt',N'Nguyễn',N'Tấn',N'Triển',getdate(),null,'trien_nt@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('tu_pt',N'Phạm',N'Thanh',N'Tú',getdate(),null,'tu_pt@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('thiet_tv',N'Trần',N'Văn',N'Thiệt',getdate(),null,'thiet_tv@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('vu_nm',N'Nguyễn',N'Minh',N'Vũ',getdate(),null,'vu_nm@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('phu_nh',N'Nguyễn',N'Hoàn',N'Phú',getdate(),null,'phu_nh@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('minh_nn',N'Nguyễn',N'Ngọc',N'Minh',getdate(),null,'minh_nn@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('hau_tt',N'Trần',N'Thanh',N'Hậu',getdate(),null,'hau_tt@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('phuoc_nt',N'Nguyễn',N'Tấn',N'Phước',getdate(),null,'phuoc_nt@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('san_h',N'Huỳnh',N'',N'San',getdate(),null,'san_h@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('kiet_dc',N'Dương',N'Chánh',N'Kiệt',getdate(),null,'kiet_dc@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('nha_mt',N'Mai',N'Thanh',N'Nhã',getdate(),null,'nha_mt@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('binh_nh',N'Nguyễn',N'Hiếu',N'Bình',getdate(),null,'binh_nh@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('thanh_lt',N'Lê',N'Tấn',N'Thanh',getdate(),null,'thanh_lt@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('tien_pv',N'Phạm',N'Vĩnh',N'Tiên',getdate(),null,'tien_pv@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('bao_tn',N'Trần',N'Như',N'Bảo',getdate(),null,'bao_tn@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('phuong_vh',N'Vương',N'Hoàng',N'Phương',getdate(),null,'phuong_vh@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('minh_pq',N'Phan',N'Quang',N'Minh',getdate(),null,'minh_pq@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('phuong_ptt',N'Phạm',N'Thị Trúc',N'Phương',getdate(),null,'phuong_ptt@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('cam_nd',N'Nhan',N'Đỗ',N'Cẩm',getdate(),null,'cam_nd@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('nhung_ltt',N'Lý',N'Thị Tuyết',N'Nhung',getdate(),null,'nhung_ltt@hungvuongtech.edu.vn','',null,getdate(),getdate(),null,1,null,null,'','','','','','')

-- Danh sach hoc sinh 10KTHL

INSERT INTO ChiTietThanhVien VALUES('cuong_lc.hv',N'Lâm',N'Chí',N'Cường',getdate(),null,'cuong_lc.hv@gmail.com','',null,getdate(),getdate(),null,1,null,3,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('dat_tv.hv',N'Tô',N'Vũ',N'Đạt',getdate(),null,'dat_tv.hv@gmail.com','',null,getdate(),getdate(),null,1,null,3,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('dong_tx.hv',N'Trịnh',N'Xuân',N'Đông',getdate(),null,'dong_tx.hv@gmail.com','',null,getdate(),getdate(),null,1,null,3,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('hai_tt.hv',N'Trần',N'Trấn',N'Hải',getdate(),null,'hai_tt.hv@gmail.com','',null,getdate(),getdate(),null,1,null,3,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('han_tv.hv',N'Trương',N'Vĩ',N'Hán',getdate(),null,'han_tv.hv@gmail.com','',null,getdate(),getdate(),null,1,null,3,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('hieu_pd.hv',N'Phạm',N'Đình',N'Hiếu',getdate(),null,'hieu_pd.hv@gmail.com','',null,getdate(),getdate(),null,1,null,3,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('hung_tv.hv',N'Trần',N'Vĩnh',N'Hùng',getdate(),null,'hung_tv.hv@gmail.com','',null,getdate(),getdate(),null,1,null,3,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('huy_ltt.hv',N'Lữ',N'Thái Thanh',N'Huy',getdate(),null,'huy_ltt.hv@gmail.com','',null,getdate(),getdate(),null,1,null,3,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('luan_mv.hv',N'Mã',N'Vĩ',N'Luận',getdate(),null,'luan_mv.hv@gmail.com','',null,getdate(),getdate(),null,1,null,3,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('nhan_nt.hv',N'Nguyễn',N'Trọng',N'Nhân',getdate(),null,'nhan_nt.hv@gmail.com','',null,getdate(),getdate(),null,1,null,3,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('quan_pm.hv',N'Phạm',N'Minh',N'Quân',getdate(),null,'quan_pm.hv@gmail.com','',null,getdate(),getdate(),null,1,null,3,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('tam_pd.hv',N'Phạm',N'Đình',N'Tâm',getdate(),null,'tam_pd.hv@gmail.com','',null,getdate(),getdate(),null,1,null,3,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('thang_tg.hv',N'Trần',N'Gia',N'Thắng',getdate(),null,'thang_tg.hv@gmail.com','',null,getdate(),getdate(),null,1,null,3,'','','','','','')

-- Danh sach hoc sinh 10SCM

INSERT INTO ChiTietThanhVien VALUES('bai_ls.hv',N'Lâm',N'Sa',N'Bai',getdate(),null,'bai_ls.hv@gmail.com','',null,getdate(),getdate(),null,1,null,0,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('binh_vt.hv',N'Vũ',N'Tiến',N'Bình',getdate(),null,'binh_vt.hv@gmail.com','',null,getdate(),getdate(),null,1,null,0,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('boi_lq.hv',N'Lư',N'Quốc',N'Bồi',getdate(),null,'boi_lq.hv@gmail.com','',null,getdate(),getdate(),null,1,null,0,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('canh_td.hv',N'Trần',N'Đình',N'Cảnh',getdate(),null,'canh_td.hv@gmail.com','',null,getdate(),getdate(),null,1,null,0,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('chi_nv.hv',N'Nguyễn',N'Văn',N'Chí',getdate(),null,'chi_nv.hv@gmail.com','',null,getdate(),getdate(),null,1,null,0,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('cong_lt.hv',N'La',N'Thành',N'Công',getdate(),null,'cong_lt.hv@gmail.com','',null,getdate(),getdate(),null,1,null,0,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('duy_nh.hv',N'Nguyễn',N'Hoàng',N'Duy',getdate(),null,'duy_nh.hv@gmail.com','',null,getdate(),getdate(),null,1,null,0,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('duy_pa.hv',N'Phan',N'Anh',N'Duy',getdate(),null,'duy_pa.hv@gmail.com','',null,getdate(),getdate(),null,1,null,0,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('duy_tq.hv',N'Trần',N'Quang',N'Duy',getdate(),null,'duy_tq.hv@gmail.com','',null,getdate(),getdate(),null,1,null,0,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('hao_lt1.hv',N'Lâm',N'Tuấn',N'Hào',getdate(),null,'hao_lt1.hv@gmail.com','',null,getdate(),getdate(),null,1,null,0,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('hieu_hn.hv',N'Huỳnh',N'Ngọc',N'Hiếu',getdate(),null,'hieu_hn.hv@gmail.com','',null,getdate(),getdate(),null,1,null,0,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('hung_nh.hv',N'Nguyễn',N'Huy',N'Hùng',getdate(),null,'hung_nh.hv@gmail.com','',null,getdate(),getdate(),null,1,null,0,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('khanh_dq.hv',N'Dương',N'Quốc',N'Khánh',getdate(),null,'khanh_dq.hv@gmail.com','',null,getdate(),getdate(),null,1,null,0,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('khiem_tt.hv',N'Trần',N'Trọng',N'Khiêm',getdate(),null,'khiem_tt.hv@gmail.com','',null,getdate(),getdate(),null,1,null,0,'','','','','','')

--SELECT * FROM ChiTietThanhVien
-- Table THANHVIEN
--ID 0-->15
Go 
INSERT INTO ThanhVien VALUES('ThienVD','ThienVD',0,GETDATE(),GETDATE(),GETDATE(),16,'','','','','')
INSERT INTO ThanhVien VALUES('hai_tv','hai_tv',1,GETDATE(),GETDATE(),GETDATE(),0,'','','','','')
INSERT INTO ThanhVien VALUES('hanh_nn','hanh_nn',2,GETDATE(),GETDATE(),GETDATE(),0,'','','','','')
INSERT INTO ThanhVien VALUES('hanh_vtb','hanh_vtb',2,GETDATE(),GETDATE(),GETDATE(),0,'','','','','')
INSERT INTO ThanhVien VALUES('dung_nn','dung_nn',4,GETDATE(),GETDATE(),GETDATE(),1,'','','','','')
INSERT INTO ThanhVien VALUES('han_nkn','han_nkn',3,GETDATE(),GETDATE(),GETDATE(),1,'','','','','')
INSERT INTO ThanhVien VALUES('hoi_tt','hoi_tt',11,GETDATE(),GETDATE(),GETDATE(),1,'','','','','')
INSERT INTO ThanhVien VALUES('nhan_nh','nhan_nh',11,GETDATE(),GETDATE(),GETDATE(),1,'','','','','')
INSERT INTO ThanhVien VALUES('cong_nd','cong_nd',11,GETDATE(),GETDATE(),GETDATE(),1,'','','','','')
INSERT INTO ThanhVien VALUES('chau_dcb','chau_dcb',11,GETDATE(),GETDATE(),GETDATE(),1,'','','','','')
INSERT INTO ThanhVien VALUES('loi_nt','loi_nt',4,GETDATE(),GETDATE(),GETDATE(),3,'','','','','')
INSERT INTO ThanhVien VALUES('tran_dtt','tran_dtt',8,GETDATE(),GETDATE(),GETDATE(),6,'','','','','')
INSERT INTO ThanhVien VALUES('luong_nt','luong_nt',11,GETDATE(),GETDATE(),GETDATE(),3,'','','','','')
INSERT INTO ThanhVien VALUES('trung_th','trung_th',3,GETDATE(),GETDATE(),GETDATE(),4,'','','','','')
INSERT INTO ThanhVien VALUES('ngoc_dtt','ngoc_dtt',11,GETDATE(),GETDATE(),GETDATE(),4,'','','','','')
INSERT INTO ThanhVien VALUES('hong_nt','hong_nt',4,GETDATE(),GETDATE(),GETDATE(),2,'','','','','')

-- Danh sach giao vien ID 16-->37

INSERT INTO ThanhVien VALUES('duc_pm','duc_pm',8,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('tan_dp','tan_dp',8,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('trien_nt','trien_nt',8,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('tu_pt','tu_pt',8,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('thiet_tv','thiet_tv',8,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('vu_nm','vu_nm',8,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('phu_nh','phu_nh',7,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('minh_nn','minh_nn',8,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('hau_tt','hau_tt',8,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('phuoc_nt','phuoc_nt',8,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('san_h','san_h',8,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('kiet_dc','kiet_dc',7,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('nha_mt','nha_mt',8,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('binh_nh','binh_nh',8,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('thanh_lt','thanh_lt',8,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('tien_pv','tien_pv',8,GETDATE(),GETDATE(),GETDATE(),6,'','','','','')
INSERT INTO ThanhVien VALUES('bao_tn','bao_tn',8,GETDATE(),GETDATE(),GETDATE(),6,'','','','','')
INSERT INTO ThanhVien VALUES('phuong_vh','phuong_vh',8,GETDATE(),GETDATE(),GETDATE(),6,'','','','','')
INSERT INTO ThanhVien VALUES('minh_pq','minh_pq',8,GETDATE(),GETDATE(),GETDATE(),6,'','','','','')
INSERT INTO ThanhVien VALUES('phuong_ptt','phuong_ptt',8,GETDATE(),GETDATE(),GETDATE(),6,'','','','','')
INSERT INTO ThanhVien VALUES('cam_nd','cam_nd',8,GETDATE(),GETDATE(),GETDATE(),6,'','','','','')
INSERT INTO ThanhVien VALUES('nhung_ltt','nhung_ltt',8,GETDATE(),GETDATE(),GETDATE(),6,'','','','','')

-- Danh sach hoc sinh LT_10KTH ID 38-->50

INSERT INTO ThanhVien VALUES('cuong_lc.hv','cuong_lc.hv',9,GETDATE(),GETDATE(),GETDATE(),6,'','','','','')
INSERT INTO ThanhVien VALUES('dat_tv.hv','dat_tv.hv',9,GETDATE(),GETDATE(),GETDATE(),6,'','','','','')
INSERT INTO ThanhVien VALUES('dong_tx.hv','dong_tx.hv',9,GETDATE(),GETDATE(),GETDATE(),6,'','','','','')
INSERT INTO ThanhVien VALUES('hai_tt.hv','hai_tt.hv',9,GETDATE(),GETDATE(),GETDATE(),6,'','','','','')
INSERT INTO ThanhVien VALUES('han_tv.hv','han_tv.hv',9,GETDATE(),GETDATE(),GETDATE(),6,'','','','','')
INSERT INTO ThanhVien VALUES('hieu_pd.hv','hieu_pd.hv',9,GETDATE(),GETDATE(),GETDATE(),6,'','','','','')
INSERT INTO ThanhVien VALUES('hung_tv.hv','hung_tv.hv',9,GETDATE(),GETDATE(),GETDATE(),6,'','','','','')
INSERT INTO ThanhVien VALUES('huy_ltt.hv','huy_ltt.hv',9,GETDATE(),GETDATE(),GETDATE(),6,'','','','','')
INSERT INTO ThanhVien VALUES('luan_mv.hv','luan_mv.hv',9,GETDATE(),GETDATE(),GETDATE(),6,'','','','','')
INSERT INTO ThanhVien VALUES('nhan_nt.hv','nhan_nt.hv',9,GETDATE(),GETDATE(),GETDATE(),6,'','','','','')
INSERT INTO ThanhVien VALUES('quan_pm.hv','quan_pm.hv',9,GETDATE(),GETDATE(),GETDATE(),6,'','','','','')
INSERT INTO ThanhVien VALUES('tam_pd.hv','tam_pd.hv',9,GETDATE(),GETDATE(),GETDATE(),6,'','','','','')
INSERT INTO ThanhVien VALUES('thang_tg.hv','thang_tg.hv',9,GETDATE(),GETDATE(),GETDATE(),6,'','','','','')

-- Danh sach hoc sinh 10SCM ID 51-->64

INSERT INTO ThanhVien VALUES('bai_ls.hv','bai_ls.hv',9,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('binh_vt.hv','binh_vt.hv',9,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('boi_lq.hv','boi_lq.hv',9,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('canh_td.hv','canh_td.hv',9,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('chi_nv.hv','chi_nv.hv',9,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('cong_lt.hv','cong_lt.hv',9,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('duy_nh.hv','duy_nh.hv',9,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('duy_pa.hv','duy_pa.hv',9,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('duy_tq.hv','duy_tq.hv',9,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('hao_lt1.hv','hao_lt1.hv',9,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('hieu_hn.hv','hieu_hn.hv',9,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('hung_nh.hv','hung_nh.hv',9,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('khanh_dq.hv','khanh_dq.hv',9,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')
INSERT INTO ThanhVien VALUES('khiem_tt.hv','khiem_tt.hv',9,GETDATE(),GETDATE(),GETDATE(),7,'','','','','')

--SELECT * FROM ThanhVien

-- Table CU PHAP
Go
INSERT INTO CuPhap VALUES(N'Tra cứu điểm theo Mã sinh viên => Điểm tất cả các môn trong học kì hiện tại','HVA','DIEM','','','','','','','','',N'[x] : Mã số sinh viên',GETDATE(),'','','','','')
INSERT INTO CuPhap VALUES(N'Tra cứu điểm theo Mã Sinh Viên và Tên Môn Học => Điểm môn học đó của Sinh Viên','HVA','DIEM','','','','','','','','',N'[x] : Mã số sinh viên/[y] : Tên môn học (vd: Java,php,sql,....)',GETDATE(),'','','','','')
INSERT INTO CuPhap VALUES(N'Tra cứu điểm theo Mã sinh viên và Năm Học => Điểm tất cả các môn học trong năm học nhập vào','HVA','DIEM','','','','','','','','',N'[x] : Mã số sinh viên/[y] :  Năm học (VD: 2010,2011)',GETDATE(),'','','','','')
INSERT INTO CuPhap VALUES(N'Tra cứu điểm theo Mã sinh viên và Học Kì => Điểm tất cả các môn trong học kì nhập vào','HVA','DIEM','','','','','','','','',N'[x] : Mã số sinh viên/[y] :  Học kỳ (VD : HKI,HKII,HKIII,HKIV,ALL)',GETDATE(),'','','','','')
INSERT INTO CuPhap VALUES(N'Tra cứu Lịch học và TKB theo Mã sinh viên và Năm Học => LH và TKB của sinh viên trong năm học nhập vào','HVA','TKB','','','','','','','','',N'[x] : Mã số sinh viên/[y] :  Năm học (VD: 2010, 2011)',GETDATE(),'','','','','')
INSERT INTO CuPhap VALUES(N'Tra cứu Lịch học và TKB theo Mã sinh viên và Học Kì => LH và TKB của sinh viên trong học kì nhập vào','HVA','TKB','','','','','','','','',N'[x] : Mã số sinh viên/[y] :  Học kỳ (vd : HKI, HKII, HKIII, HKIV, ALL)',GETDATE(),'','','','','')
INSERT INTO CuPhap VALUES(N'Điểm danh HS theo ngày => Tình trạng điểm danh của học sinh trong ngày nhập vào','HVA','DD','','','','','','','','',N'[x] : Mã số sinh viên/[y] :  Ngày cụ thể(VD: 07012011,12022011,18032011....122011)',GETDATE(),'','','','','')
INSERT INTO CuPhap VALUES(N'Điểm danh HS theo tháng => Tình trạng điểm danh của học sinh trong tháng nhập vào','HVA','DD','','','','','','','','',N'[x] : Mã số sinh viên/[y] :  Tháng cụ thể (VD: 012011,022011,032011....122011)',GETDATE(),'','','','','')

--select * from cuphap

-- Table LOAI HOP THU
Go
INSERT INTO LoaiHopThu VALUES('Hop Thu Cu Phap','Luu nhung tin nhan theo cu phap',GETDATE(),'','','','','')
INSERT INTO LoaiHopThu VALUES('Hop Thu Cu Phap Da Xoa','Luu nhung tin nhan nhap',GETDATE(),'','','','','')
INSERT INTO LoaiHopThu VALUES('Hop Thu Binh Thuong','Luu nhung tin nhan thu cong khong theo cu phap',GETDATE(),'','','','','')
INSERT INTO LoaiHopThu VALUES('Hop Thu Binh Thuong Da Xoa','Luu nhung tin nhan den duoc xoa',GETDATE(),'','','','','')
INSERT INTO LoaiHopThu VALUES('Tin Nhan Cu Phap Da Gui','Luu nhung tin nhan da gui',GETDATE(),'','','','','')
INSERT INTO LoaiHopThu VALUES('Tin Nhan Cu Phap Duoc Xoa','Luu nhung tin nhan da gui duoc xoa',GETDATE(),'','','','','')
INSERT INTO LoaiHopThu VALUES('Tin Nhan Binh Thuong Da Gui','Luu nhung tin nhan da gui',GETDATE(),'','','','','')
INSERT INTO LoaiHopThu VALUES('Tin Nhan Binh Thuong Duoc Xoa','Luu nhung tin nhan da gui duoc xoa',GETDATE(),'','','','','')

--Conlum tinhtrang table hop thu di, 1 la da gui , 0 la chua gui thanh cong

--SELECT * FROM HopThuDi

-- Table HOP THU DI
Go
INSERT INTO HopThuDi VALUES('0975587553','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0911543211','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0922222222','test data',3,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0976437533','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0944217744','test data',0,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0955555555','test data',3,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0977777777','test data',3,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0988888888','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0912121212','test data',0,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0934343434','test data',3,4,GETDATE(),GETDATE(),'','','','','')

INSERT INTO HopThuDi VALUES('0975587553','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0912111741','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0926322253','test data',3,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0943313383','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0946038244','test data',0,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0954295145','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0974379135','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0988082456','test data',3,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0912848195','test data',0,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0909876325','test data',1,4,GETDATE(),GETDATE(),'','','','','')

INSERT INTO HopThuDi VALUES('0975587553','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0911111111','test data',0,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0922222222','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0933333333','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0944444444','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0955555555','test data',0,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0977777777','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0988888888','test data',0,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0912121212','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0934343434','test data',1,4,GETDATE(),GETDATE(),'','','','','')

-----------------------------

INSERT INTO HopThuDi VALUES('0975587553','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0911111111','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0922222222','test data',0,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0933333333','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0944444444','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0955555555','test data',0,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0977777777','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0988888888','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0912121212','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0934343434','test data',0,4,GETDATE(),GETDATE(),'','','','','')

INSERT INTO HopThuDi VALUES('0975587553','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0911111111','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0922222222','test data',0,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0933333333','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0944444444','test data',0,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0955555555','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0977777777','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0988888888','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0912121212','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0934343434','test data',1,4,GETDATE(),GETDATE(),'','','','','')

INSERT INTO HopThuDi VALUES('0975587553','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0911111111','test data',0,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0922222222','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0933333333','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0944444444','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0955555555','test data',0,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0977777777','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0988888888','test data',0,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0912121212','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0934343434','test data',1,4,GETDATE(),GETDATE(),'','','','','')

-------------------------

INSERT INTO HopThuDi VALUES('0975587553','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0911111111','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0922222222','test data',0,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0933333333','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0944444444','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0955555555','test data',0,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0977777777','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0988888888','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0912121212','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0934343434','test data',0,4,GETDATE(),GETDATE(),'','','','','')

INSERT INTO HopThuDi VALUES('0975587553','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0911111111','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0922222222','test data',0,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0933333333','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0944444444','test data',0,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0955555555','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0977777777','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0988888888','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0912121212','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0934343434','test data',1,4,GETDATE(),GETDATE(),'','','','','')

INSERT INTO HopThuDi VALUES('0975587553','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0911111111','test data',0,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0922222222','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0933333333','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0944444444','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0955555555','test data',0,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0977777777','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0988888888','test data',0,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0912121212','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0934343434','test data',1,4,GETDATE(),GETDATE(),'','','','','')
--SELECT * FROM HopThuDi

--conlumn tinh trang Table HopThuDen , 1 da tra loi , 2 chua tra loi

--Table HOP THU DEN 
Go
INSERT INTO HopThuDen VALUES('0975587553',null,'test hop thu den',1,2,0,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0911111111',0,'test hop thu den',0,0,1,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0922222222',null,'test hop thu den',1,2,2,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0933333333',1,'test hop thu den',1,0,3,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0944444444',null,'test hop thu den',0,2,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0955555555',2,'test hop thu den',1,0,5,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0977777777',null,'test hop thu den',1,2,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0988888888',0,'test hop thu den',0,0,7,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0912121212',null,'test hop thu den',1,2,8,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0934343434',1,'test hop thu den',0,0,9,GETDATE(),GETDATE(),'','','','','')

INSERT INTO HopThuDen VALUES('0977538942',null,'test hop thu den',1,2,10,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0917523197',2,'test hop thu den',0,0,11,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0992475213',null,'test hop thu den',1,2,12,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0975694283',0,'test hop thu den',1,0,13,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0975349821',null,'test hop thu den',0,2,14,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0963547128',1,'test hop thu den',1,0,15,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0969321857',null,'test hop thu den',1,2,16,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0935749527',2,'test hop thu den',0,0,17,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0979828792',null,'test hop thu den',1,2,18,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0934358796',0,'test hop thu den',0,0,19,GETDATE(),GETDATE(),'','','','','')

INSERT INTO HopThuDen VALUES('0977538942',null,'test hop thu den',1,2,20,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0917523197',1,'test hop thu den',0,0,21,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0992475213',null,'test hop thu den',1,2,22,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0975694283',2,'test hop thu den',1,0,23,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0975349821',null,'test hop thu den',0,2,24,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0963547128',0,'test hop thu den',1,0,25,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0969321857',null,'test hop thu den',1,2,26,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0935749527',1,'test hop thu den',0,0,27,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0979828792',null,'test hop thu den',1,2,28,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0934358796',2,'test hop thu den',0,0,29,GETDATE(),GETDATE(),'','','','','')

--Table Phong Ban
Go
INSERT INTO PhongBan VALUES('F2.1','','TH',50,GETDATE(),'','','','','')
INSERT INTO PhongBan VALUES('F2.2','','LT',40,GETDATE(),'','','','','')
INSERT INTO PhongBan VALUES('F2.3','','LT',30,GETDATE(),'','','','','')
INSERT INTO PhongBan VALUES('F2.4','','LT',60,GETDATE(),'','','','','')
INSERT INTO PhongBan VALUES('G2.1','','TH',30,GETDATE(),'','','','','')
INSERT INTO PhongBan VALUES('G2.2','','TH',30,GETDATE(),'','','','','')
INSERT INTO PhongBan VALUES('G2.3','','TH',30,GETDATE(),'','','','','')
INSERT INTO PhongBan VALUES('G2.4','','TH',30,GETDATE(),'','','','','')
INSERT INTO PhongBan VALUES('G2.5','','TH',30,GETDATE(),'','','','','')

-- Table MonHoc
Go

INSERT INTO MonHoc VALUES(N'Web Java', 40,45 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'EJB', 50,55 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Web PHP', 35,30 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Joomla', 0,60 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Mạng viễn thông', 30,40 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Wireless', 30,30 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Cơ sở dữ liệu', 30,20 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Kỹ thuật lập trình', 40,80 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Tin học văn phòng', 40,80 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Microsoft Access', 40,80 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Corel Draw', 40,80 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Lắp ráp cài đặt MT', 30,60 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Photoshop', 40,80 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Cấu trúc máy tính', 30,60 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'CSDL  SQL Server 2005', 40,80 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Mạng cơ bản', 40,80 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')

INSERT INTO MonHoc VALUES(N'HTML-DHTML & Javascript', 40,80 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Dreamweaver', 30,60 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Cài đặt và quản trị Windows 2003', null,null ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Thiết bị mạng', 40,80 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Kỹ thuật trình chiếu (Powerpoint)', 20,40 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Internet', 20,40 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Thiết kế Multimedia(FLASH )', 30,60 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Autocad', 30,60 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'PHP & MySQL', 40,80 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Illustrator', 30,60 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'PHP & MySQL', 40,80 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Java căn bản hướng đối tượng', 30,60 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Winform', 30,60 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Vận hành và duy trì Windows 2003', 40,80 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Mail Server (MS Exchange)', 30,60 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Thiết kế hệ thống mạng', 30,60 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Hệ điều hành Linux', 30,60 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO MonHoc VALUES(N'Bảo mật mạng trên Windows ', 30,60 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')

--Table ThoiKhoaBieu
GO
INSERT INTO ThoiKhoaBieu VALUES(3,6,26,'2010-08-15','2011-03-15',null,GETDATE(),null,'',GETDATE(),'Học Kỳ 1 (2010 - 2011) - 10KTHD',2,'','1','2010','2011','','','','','','')
INSERT INTO ThoiKhoaBieu VALUES(3,26,52,'2011-03-16','2011-08-15',null,GETDATE(),null,'',GETDATE(),'Học Kỳ 2 (2010 - 2011) - 10KTHD',2,'','2','2010','2011','','','','','','')

INSERT INTO ThoiKhoaBieu VALUES(0,6,26,'2010-08-15','2011-03-15',null,GETDATE(),null,'',GETDATE(),'Học Kỳ 1 (2010 - 2011) - 10SCM',2,'','1','2010','2011','','','','','','')
INSERT INTO ThoiKhoaBieu VALUES(0,26,52,'2011-03-16','2011-08-15',null,GETDATE(),null,'',GETDATE(),'Học Kỳ 2 (2010 - 2011) - 10SCM',2,'','2','2010','2011','','','','','','')

--SELECT * FROM ThoiKhoaBieu
--SELECT * FROM MonHocTKB

--Table MonHocTKB
GO
INSERT INTO MonHocTKB VALUES (2,1,0,0,16,'2010-08-15','2010-08-15',GETDATE(),GETDATE(),'',GETDATE(),'','','','','','','','','','','')
INSERT INTO MonHocTKB VALUES (2,1,0,1,17,'2010-09-15','2010-09-15',GETDATE(),GETDATE(),'',GETDATE(),'','','','','','','','','','','')
INSERT INTO MonHocTKB VALUES (2,1,0,2,18,'2010-10-15','2010-10-15',GETDATE(),GETDATE(),'',GETDATE(),'','','','','','','','','','','')
INSERT INTO MonHocTKB VALUES (2,1,0,3,19,'2010-12-15','2010-12-15',GETDATE(),GETDATE(),'',GETDATE(),'','','','','','','','','','','')
INSERT INTO MonHocTKB VALUES (2,1,0,4,20,'2011-03-15','2011-03-15',GETDATE(),GETDATE(),'',GETDATE(),'','','','','','','','','','','')

INSERT INTO MonHocTKB VALUES (2,1,1,5,21,'2011-04-15','2011-04-15',GETDATE(),GETDATE(),'',GETDATE(),'','','','','','','','','','','')
INSERT INTO MonHocTKB VALUES (2,1,1,6,22,'2011-05-15','2011-05-15',GETDATE(),GETDATE(),'',GETDATE(),'','','','','','','','','','','')
INSERT INTO MonHocTKB VALUES (2,1,1,7,23,'2011-06-15','2011-06-15',GETDATE(),GETDATE(),'',GETDATE(),'','','','','','','','','','','')
INSERT INTO MonHocTKB VALUES (2,1,1,8,24,'2011-07-15','2011-07-15',GETDATE(),GETDATE(),'',GETDATE(),'','','','','','','','','','','')
INSERT INTO MonHocTKB VALUES (2,1,1,9,25,'2011-08-15','2011-08-15',GETDATE(),GETDATE(),'',GETDATE(),'','','','','','','','','','','')

INSERT INTO MonHocTKB VALUES (2,1,2,10,26,'2010-08-15','2010-08-15',GETDATE(),GETDATE(),'',GETDATE(),'','','','','','','','','','','')
INSERT INTO MonHocTKB VALUES (2,1,2,11,27,'2010-09-15','2010-09-15',GETDATE(),GETDATE(),'',GETDATE(),'','','','','','','','','','','')
INSERT INTO MonHocTKB VALUES (2,1,2,12,28,'2010-10-15','2010-10-15',GETDATE(),GETDATE(),'',GETDATE(),'','','','','','','','','','','')
INSERT INTO MonHocTKB VALUES (2,1,2,13,29,'2010-12-15','2010-12-15',GETDATE(),GETDATE(),'',GETDATE(),'','','','','','','','','','','')
INSERT INTO MonHocTKB VALUES (2,1,2,14,30,'2011-03-15','2011-03-15',GETDATE(),GETDATE(),'',GETDATE(),'','','','','','','','','','','')

INSERT INTO MonHocTKB VALUES (2,1,3,15,31,'2011-04-15','2011-04-15',GETDATE(),GETDATE(),'',GETDATE(),'','','','','','','','','','','')
INSERT INTO MonHocTKB VALUES (2,1,3,16,32,'2011-05-15','2011-05-15',GETDATE(),GETDATE(),'',GETDATE(),'','','','','','','','','','','')
INSERT INTO MonHocTKB VALUES (2,1,3,17,33,'2011-06-15','2011-06-15',GETDATE(),GETDATE(),'',GETDATE(),'','','','','','','','','','','')
INSERT INTO MonHocTKB VALUES (2,1,3,18,34,'2011-07-15','2011-07-15',GETDATE(),GETDATE(),'',GETDATE(),'','','','','','','','','','','')
INSERT INTO MonHocTKB VALUES (2,1,3,19,35,'2011-08-15','2011-08-15',GETDATE(),GETDATE(),'',GETDATE(),'','','','','','','','','','','')

--SELECT * FROM MonHocTKB

--Table ChiTietTKB
GO
INSERT INTO ChiTietTKB VALUES (0,1,'Sang','THP',1,0,GETDATE(),1,0,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,3,'Sang','THP',1,0,GETDATE(),2,0,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,4,'Sang','THP',1,0,GETDATE(),3,0,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,1,'Sang','THP',1,0,GETDATE(),4,0,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,3,'Sang','THP',1,0,GETDATE(),5,0,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,5,'Sang','THP',1,0,GETDATE(),6,0,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,1,'Sang','THP',1,0,GETDATE(),7,0,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,3,'Sang','THP',1,0,GETDATE(),8,0,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,5,'Sang','THP',1,0,GETDATE(),9,0,6,GETDATE(),1,5,'','','','','','','')

INSERT INTO ChiTietTKB VALUES (0,2,'Chieu','THP',1,1,GETDATE(),1,1,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,4,'Chieu','THP',1,1,GETDATE(),2,1,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,6,'Chieu','THP',1,1,GETDATE(),3,1,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,2,'Chieu','THP',1,1,GETDATE(),4,1,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,4,'Chieu','THP',1,1,GETDATE(),5,1,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,6,'Chieu','THP',1,1,GETDATE(),6,1,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,2,'Chieu','THP',1,1,GETDATE(),7,1,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,4,'Chieu','THP',1,1,GETDATE(),8,1,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,6,'Chieu','THP',1,1,GETDATE(),9,1,6,GETDATE(),1,5,'','','','','','','')

INSERT INTO ChiTietTKB VALUES (0,2,'Sang','THP',1,2,GETDATE(),1,2,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,4,'Sang','THP',1,2,GETDATE(),2,2,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,6,'Sang','THP',1,2,GETDATE(),3,2,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,2,'Sang','THP',1,2,GETDATE(),4,2,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,4,'Sang','THP',1,2,GETDATE(),5,2,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,6,'Sang','THP',1,2,GETDATE(),6,2,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,2,'Sang','THP',1,2,GETDATE(),7,2,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,4,'Sang','THP',1,2,GETDATE(),8,2,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,6,'Sang','THP',1,2,GETDATE(),9,2,6,GETDATE(),1,5,'','','','','','','')

INSERT INTO ChiTietTKB VALUES (0,1,'Chieu','THP',1,3,GETDATE(),1,3,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,3,'Chieu','THP',1,3,GETDATE(),2,3,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,5,'Chieu','THP',1,3,GETDATE(),3,3,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,1,'Chieu','THP',1,3,GETDATE(),4,3,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,3,'Chieu','THP',1,3,GETDATE(),5,3,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,5,'Chieu','THP',1,3,GETDATE(),6,3,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,1,'Chieu','THP',1,3,GETDATE(),7,3,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,3,'Chieu','THP',1,3,GETDATE(),8,3,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,5,'Chieu','THP',1,3,GETDATE(),9,3,6,GETDATE(),1,5,'','','','','','','')

INSERT INTO ChiTietTKB VALUES (0,1,'Sang','THP',1,4,GETDATE(),1,4,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,1,'Sang','THP',1,4,GETDATE(),2,4,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,1,'Sang','THP',1,4,GETDATE(),3,4,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,1,'Sang','THP',1,4,GETDATE(),4,4,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,1,'Sang','THP',1,4,GETDATE(),5,4,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,1,'Sang','THP',1,4,GETDATE(),6,4,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,1,'Sang','THP',1,4,GETDATE(),7,4,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,1,'Sang','THP',1,4,GETDATE(),8,4,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,1,'Sang','THP',1,4,GETDATE(),9,4,6,GETDATE(),1,5,'','','','','','','')

---------

INSERT INTO ChiTietTKB VALUES (1,1,'Sang','THP',1,0,GETDATE(),1,5,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,3,'Sang','THP',1,0,GETDATE(),2,5,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,4,'Sang','THP',1,0,GETDATE(),3,5,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,1,'Sang','THP',1,0,GETDATE(),4,5,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,3,'Sang','THP',1,0,GETDATE(),5,5,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,5,'Sang','THP',1,0,GETDATE(),6,5,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,1,'Sang','THP',1,0,GETDATE(),7,5,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,3,'Sang','THP',1,0,GETDATE(),8,5,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,5,'Sang','THP',1,0,GETDATE(),9,5,6,GETDATE(),1,5,'','','','','','','')

INSERT INTO ChiTietTKB VALUES (1,2,'Sang','THP',1,2,GETDATE(),1,6,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,4,'Sang','THP',1,2,GETDATE(),2,6,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,6,'Sang','THP',1,2,GETDATE(),3,6,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,2,'Sang','THP',1,2,GETDATE(),4,6,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,4,'Sang','THP',1,2,GETDATE(),5,6,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,6,'Sang','THP',1,2,GETDATE(),6,6,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,2,'Sang','THP',1,2,GETDATE(),7,6,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,4,'Sang','THP',1,2,GETDATE(),8,6,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,6,'Sang','THP',1,2,GETDATE(),9,6,6,GETDATE(),1,5,'','','','','','','')

INSERT INTO ChiTietTKB VALUES (1,1,'Chieu','THP',1,3,GETDATE(),1,7,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,3,'Chieu','THP',1,3,GETDATE(),2,7,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,5,'Chieu','THP',1,3,GETDATE(),3,7,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,1,'Chieu','THP',1,3,GETDATE(),4,7,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,3,'Chieu','THP',1,3,GETDATE(),5,7,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,5,'Chieu','THP',1,3,GETDATE(),6,7,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,1,'Chieu','THP',1,3,GETDATE(),7,7,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,3,'Chieu','THP',1,3,GETDATE(),8,7,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,5,'Chieu','THP',1,3,GETDATE(),9,7,6,GETDATE(),1,5,'','','','','','','')

INSERT INTO ChiTietTKB VALUES (1,1,'Sang','THP',1,4,GETDATE(),1,8,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,1,'Sang','THP',1,4,GETDATE(),2,8,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,1,'Sang','THP',1,4,GETDATE(),3,8,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,1,'Sang','THP',1,4,GETDATE(),4,8,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,1,'Sang','THP',1,4,GETDATE(),5,8,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,1,'Sang','THP',1,4,GETDATE(),6,8,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,1,'Sang','THP',1,4,GETDATE(),7,8,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,1,'Sang','THP',1,4,GETDATE(),8,8,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (1,1,'Sang','THP',1,4,GETDATE(),9,8,6,GETDATE(),1,5,'','','','','','','')

INSERT INTO ChiTietTKB VALUES (2,1,'Sang','THP',1,0,GETDATE(),1,9,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,3,'Sang','THP',1,0,GETDATE(),2,9,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,4,'Sang','THP',1,0,GETDATE(),3,9,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,1,'Sang','THP',1,0,GETDATE(),4,9,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,3,'Sang','THP',1,0,GETDATE(),5,9,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,5,'Sang','THP',1,0,GETDATE(),6,9,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,1,'Sang','THP',1,0,GETDATE(),7,9,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,3,'Sang','THP',1,0,GETDATE(),8,9,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,5,'Sang','THP',1,0,GETDATE(),9,9,6,GETDATE(),1,5,'','','','','','','')

------------------------------

INSERT INTO ChiTietTKB VALUES (2,2,'Chieu','THP',1,1,GETDATE(),1,10,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,4,'Chieu','THP',1,1,GETDATE(),2,10,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,6,'Chieu','THP',1,1,GETDATE(),3,10,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,2,'Chieu','THP',1,1,GETDATE(),4,10,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,4,'Chieu','THP',1,1,GETDATE(),5,10,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,6,'Chieu','THP',1,1,GETDATE(),6,10,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,2,'Chieu','THP',1,1,GETDATE(),7,10,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,4,'Chieu','THP',1,1,GETDATE(),8,10,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,6,'Chieu','THP',1,1,GETDATE(),9,10,6,GETDATE(),1,5,'','','','','','','')

INSERT INTO ChiTietTKB VALUES (2,2,'Sang','THP',1,2,GETDATE(),1,11,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,4,'Sang','THP',1,2,GETDATE(),2,11,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,6,'Sang','THP',1,2,GETDATE(),3,11,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,2,'Sang','THP',1,2,GETDATE(),4,11,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,4,'Sang','THP',1,2,GETDATE(),5,11,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,6,'Sang','THP',1,2,GETDATE(),6,11,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,2,'Sang','THP',1,2,GETDATE(),7,11,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,4,'Sang','THP',1,2,GETDATE(),8,11,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,6,'Sang','THP',1,2,GETDATE(),9,11,6,GETDATE(),1,5,'','','','','','','')

INSERT INTO ChiTietTKB VALUES (2,1,'Chieu','THP',1,3,GETDATE(),1,12,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,3,'Chieu','THP',1,3,GETDATE(),2,12,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,5,'Chieu','THP',1,3,GETDATE(),3,12,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,1,'Chieu','THP',1,3,GETDATE(),4,12,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,3,'Chieu','THP',1,3,GETDATE(),5,12,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,5,'Chieu','THP',1,3,GETDATE(),6,12,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,1,'Chieu','THP',1,3,GETDATE(),7,12,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,3,'Chieu','THP',1,3,GETDATE(),8,12,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,5,'Chieu','THP',1,3,GETDATE(),9,12,6,GETDATE(),1,5,'','','','','','','')

INSERT INTO ChiTietTKB VALUES (2,1,'Sang','THP',1,4,GETDATE(),1,13,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,1,'Sang','THP',1,4,GETDATE(),2,13,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,1,'Sang','THP',1,4,GETDATE(),3,13,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,1,'Sang','THP',1,4,GETDATE(),4,13,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,1,'Sang','THP',1,4,GETDATE(),5,13,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,1,'Sang','THP',1,4,GETDATE(),6,13,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,1,'Sang','THP',1,4,GETDATE(),7,13,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,1,'Sang','THP',1,4,GETDATE(),8,13,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (2,1,'Sang','THP',1,4,GETDATE(),9,13,6,GETDATE(),1,5,'','','','','','','')

INSERT INTO ChiTietTKB VALUES (3,1,'Sang','THP',1,0,GETDATE(),1,14,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,3,'Sang','THP',1,0,GETDATE(),2,14,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,4,'Sang','THP',1,0,GETDATE(),3,14,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,1,'Sang','THP',1,0,GETDATE(),4,14,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,3,'Sang','THP',1,0,GETDATE(),5,14,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,5,'Sang','THP',1,0,GETDATE(),6,14,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,1,'Sang','THP',1,0,GETDATE(),7,14,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,3,'Sang','THP',1,0,GETDATE(),8,14,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,5,'Sang','THP',1,0,GETDATE(),9,14,6,GETDATE(),1,5,'','','','','','','')

-----------------------

INSERT INTO ChiTietTKB VALUES (3,2,'Chieu','THP',1,1,GETDATE(),1,15,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,4,'Chieu','THP',1,1,GETDATE(),2,15,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,6,'Chieu','THP',1,1,GETDATE(),3,15,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,2,'Chieu','THP',1,1,GETDATE(),4,15,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,4,'Chieu','THP',1,1,GETDATE(),5,15,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,6,'Chieu','THP',1,1,GETDATE(),6,15,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,2,'Chieu','THP',1,1,GETDATE(),7,15,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,4,'Chieu','THP',1,1,GETDATE(),8,15,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,6,'Chieu','THP',1,1,GETDATE(),9,15,6,GETDATE(),1,5,'','','','','','','')

INSERT INTO ChiTietTKB VALUES (3,2,'Sang','THP',1,2,GETDATE(),1,16,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,4,'Sang','THP',1,2,GETDATE(),2,16,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,6,'Sang','THP',1,2,GETDATE(),3,16,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,2,'Sang','THP',1,2,GETDATE(),4,16,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,4,'Sang','THP',1,2,GETDATE(),5,16,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,6,'Sang','THP',1,2,GETDATE(),6,16,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,2,'Sang','THP',1,2,GETDATE(),7,16,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,4,'Sang','THP',1,2,GETDATE(),8,16,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,6,'Sang','THP',1,2,GETDATE(),9,16,6,GETDATE(),1,5,'','','','','','','')

INSERT INTO ChiTietTKB VALUES (3,1,'Chieu','THP',1,3,GETDATE(),1,17,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,3,'Chieu','THP',1,3,GETDATE(),2,17,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,5,'Chieu','THP',1,3,GETDATE(),3,17,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,1,'Chieu','THP',1,3,GETDATE(),4,17,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,3,'Chieu','THP',1,3,GETDATE(),5,17,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,5,'Chieu','THP',1,3,GETDATE(),6,17,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,1,'Chieu','THP',1,3,GETDATE(),7,17,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,3,'Chieu','THP',1,3,GETDATE(),8,17,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,5,'Chieu','THP',1,3,GETDATE(),9,17,6,GETDATE(),1,5,'','','','','','','')

INSERT INTO ChiTietTKB VALUES (3,1,'Sang','THP',1,4,GETDATE(),1,18,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,1,'Sang','THP',1,4,GETDATE(),2,18,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,1,'Sang','THP',1,4,GETDATE(),3,18,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,1,'Sang','THP',1,4,GETDATE(),4,18,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,1,'Sang','THP',1,4,GETDATE(),5,18,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,1,'Sang','THP',1,4,GETDATE(),6,18,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,1,'Sang','THP',1,4,GETDATE(),7,18,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,1,'Sang','THP',1,4,GETDATE(),8,18,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,1,'Sang','THP',1,4,GETDATE(),9,18,6,GETDATE(),1,5,'','','','','','','')

INSERT INTO ChiTietTKB VALUES (3,2,'Chieu','THP',1,1,GETDATE(),1,19,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,4,'Chieu','THP',1,1,GETDATE(),2,19,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,6,'Chieu','THP',1,1,GETDATE(),3,19,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,2,'Chieu','THP',1,1,GETDATE(),4,19,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,4,'Chieu','THP',1,1,GETDATE(),5,19,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,6,'Chieu','THP',1,1,GETDATE(),6,19,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,2,'Chieu','THP',1,1,GETDATE(),7,19,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,4,'Chieu','THP',1,1,GETDATE(),8,19,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (3,6,'Chieu','THP',1,1,GETDATE(),9,19,6,GETDATE(),1,5,'','','','','','','')


--SELECT * FROM ChiTietTKB
--SELECT * FROM BaiKiemTra
--Table BaiKiemTra
GO
INSERT INTO BaiKiemTra VALUES (0,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (0,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (0,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (0,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (1,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (1,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (1,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (1,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (2,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (2,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (2,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (2,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (3,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (3,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (3,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (3,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (4,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (4,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (4,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (4,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (5,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (5,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (5,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (5,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (6,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (6,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (6,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (6,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (7,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (7,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (7,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (7,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (8,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (8,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (8,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (8,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (9,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (9,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (9,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (9,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (10,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (10,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (10,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (10,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (11,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (11,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (11,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (12,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (13,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (13,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (13,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (13,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (14,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (14,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (14,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (14,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (15,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (15,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (15,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (15,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (16,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (16,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (16,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (16,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (17,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (17,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (17,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (17,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (18,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (18,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (18,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (18,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (19,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (19,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (19,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (19,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (20,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (20,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (20,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (20,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (21,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (21,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (21,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (21,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (22,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (22,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (22,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (22,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (23,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (23,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (23,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (23,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (24,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (24,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (24,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (24,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (25,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (25,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (25,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (25,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (26,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (26,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (26,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (26,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (27,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (27,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (27,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (27,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (28,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (28,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (28,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (28,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (29,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (29,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (29,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (29,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (30,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (30,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (30,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (30,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (31,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (31,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (31,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (31,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (32,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (32,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (32,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (32,3,2,10,'',GETDATE(),'','','','','')

INSERT INTO BaiKiemTra VALUES (33,0,0,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (33,1,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (33,2,1,10,'',GETDATE(),'','','','','')
INSERT INTO BaiKiemTra VALUES (33,3,2,10,'',GETDATE(),'','','','','')

--Table DangKiMonHoc
GO
--select * from DangKyMonHoc

--0-12
INSERT INTO DangKyMonHoc VALUES (0,38,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (0,39,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (0,40,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (0,41,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (0,42,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (0,43,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (0,44,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (0,45,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (0,46,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (0,47,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (0,48,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (0,49,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (0,50,'','','','','',GETDATE(),'','','','','')
--13-25
INSERT INTO DangKyMonHoc VALUES (1,38,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (1,39,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (1,40,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (1,41,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (1,42,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (1,43,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (1,44,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (1,45,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (1,46,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (1,47,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (1,48,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (1,49,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (1,50,'','','','','',GETDATE(),'','','','','')
--26-38
INSERT INTO DangKyMonHoc VALUES (2,38,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (2,39,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (2,40,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (2,41,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (2,42,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (2,43,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (2,44,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (2,45,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (2,46,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (2,47,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (2,48,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (2,49,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (2,50,'','','','','',GETDATE(),'','','','','')
--39-51
INSERT INTO DangKyMonHoc VALUES (3,38,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (3,39,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (3,40,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (3,41,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (3,42,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (3,43,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (3,44,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (3,45,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (3,46,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (3,47,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (3,48,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (3,49,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (3,50,'','','','','',GETDATE(),'','','','','')
--52-64
INSERT INTO DangKyMonHoc VALUES (4,38,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (4,39,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (4,40,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (4,41,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (4,42,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (4,43,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (4,44,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (4,45,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (4,46,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (4,47,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (4,48,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (4,49,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (4,50,'','','','','',GETDATE(),'','','','','')

------------
--65-77
INSERT INTO DangKyMonHoc VALUES (5,38,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (5,39,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (5,40,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (5,41,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (5,42,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (5,43,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (5,44,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (5,45,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (5,46,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (5,47,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (5,48,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (5,49,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (5,50,'','','','','',GETDATE(),'','','','','')
--78-90
INSERT INTO DangKyMonHoc VALUES (6,38,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (6,39,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (6,40,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (6,41,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (6,42,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (6,43,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (6,44,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (6,45,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (6,46,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (6,47,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (6,48,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (6,49,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (6,50,'','','','','',GETDATE(),'','','','','')
--91-103
INSERT INTO DangKyMonHoc VALUES (7,38,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (7,39,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (7,40,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (7,41,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (7,42,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (7,43,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (7,44,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (7,45,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (7,46,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (7,47,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (7,48,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (7,49,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (7,50,'','','','','',GETDATE(),'','','','','')
--104-116
INSERT INTO DangKyMonHoc VALUES (8,38,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (8,39,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (8,40,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (8,41,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (8,42,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (8,43,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (8,44,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (8,45,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (8,46,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (8,47,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (8,48,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (8,49,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (8,50,'','','','','',GETDATE(),'','','','','')
--117-129
INSERT INTO DangKyMonHoc VALUES (9,38,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (9,39,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (9,40,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (9,41,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (9,42,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (9,43,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (9,44,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (9,45,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (9,46,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (9,47,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (9,48,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (9,49,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (9,50,'','','','','',GETDATE(),'','','','','')

---------------------------
--130-143
INSERT INTO DangKyMonHoc VALUES (10,51,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (10,52,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (10,53,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (10,54,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (10,55,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (10,56,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (10,57,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (10,58,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (10,59,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (10,60,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (10,61,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (10,62,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (10,63,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (10,64,'','','','','',GETDATE(),'','','','','')
--144-157
INSERT INTO DangKyMonHoc VALUES (11,51,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (11,52,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (11,53,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (11,54,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (11,55,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (11,56,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (11,57,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (11,58,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (11,59,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (11,60,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (11,61,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (11,62,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (11,63,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (11,64,'','','','','',GETDATE(),'','','','','')
--158-171
INSERT INTO DangKyMonHoc VALUES (12,51,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (12,52,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (12,53,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (12,54,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (12,55,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (12,56,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (12,57,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (12,58,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (12,59,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (12,60,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (12,61,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (12,62,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (12,63,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (12,64,'','','','','',GETDATE(),'','','','','')
--172-185
INSERT INTO DangKyMonHoc VALUES (13,51,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (13,52,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (13,53,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (13,54,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (13,55,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (13,56,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (13,57,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (13,58,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (13,59,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (13,60,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (13,61,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (13,62,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (13,63,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (13,64,'','','','','',GETDATE(),'','','','','')
--186-199
INSERT INTO DangKyMonHoc VALUES (14,51,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (14,52,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (14,53,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (14,54,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (14,55,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (14,56,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (14,57,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (14,58,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (14,59,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (14,60,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (14,61,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (14,62,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (14,63,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (14,64,'','','','','',GETDATE(),'','','','','')

--------------------
--200-213
INSERT INTO DangKyMonHoc VALUES (15,51,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (15,52,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (15,53,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (15,54,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (15,55,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (15,56,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (15,57,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (15,58,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (15,59,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (15,60,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (15,61,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (15,62,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (15,63,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (15,64,'','','','','',GETDATE(),'','','','','')
--214-227
INSERT INTO DangKyMonHoc VALUES (16,51,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (16,52,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (16,53,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (16,54,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (16,55,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (16,56,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (16,57,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (16,58,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (16,59,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (16,60,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (16,61,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (16,62,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (16,63,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (16,64,'','','','','',GETDATE(),'','','','','')
--228-241
INSERT INTO DangKyMonHoc VALUES (17,51,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (17,52,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (17,53,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (17,54,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (17,55,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (17,56,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (17,57,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (17,58,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (17,59,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (17,60,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (17,61,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (17,62,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (17,63,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (17,64,'','','','','',GETDATE(),'','','','','')
--242-255
INSERT INTO DangKyMonHoc VALUES (18,51,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (18,52,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (18,53,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (18,54,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (18,55,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (18,56,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (18,57,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (18,58,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (18,59,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (18,60,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (18,61,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (18,62,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (18,63,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (18,64,'','','','','',GETDATE(),'','','','','')
--256-269
INSERT INTO DangKyMonHoc VALUES (19,51,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (19,52,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (19,53,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (19,54,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (19,55,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (19,56,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (19,57,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (19,58,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (19,59,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (19,60,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (19,61,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (19,62,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (19,63,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (19,64,'','','','','',GETDATE(),'','','','','')

--select * from baikiemtra
--select * from chitietdiem
--select * from DangKyMonHoc
--select * from MonHocTKB
--select * from chitietdiem

--Table ChiTietDiem
GO
INSERT INTO ChiTietDiem VALUES (0,0,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (0,1,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (0,2,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (0,3,10,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (1,0,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (1,1,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (1,2,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (1,3,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (2,0,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (2,1,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (2,2,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (2,3,10,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (3,0,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (3,1,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (3,2,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (3,3,4,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (4,0,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (4,1,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (4,2,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (4,3,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (5,0,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (5,1,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (5,2,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (5,3,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (6,0,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (6,1,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (6,2,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (6,3,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (7,0,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (7,1,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (7,2,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (7,3,7,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (8,0,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (8,1,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (8,2,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (8,3,4,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (9,0,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (9,1,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (9,2,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (9,3,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (10,0,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (10,1,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (10,2,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (10,3,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (11,0,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (11,1,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (11,2,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (11,3,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (12,0,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (12,1,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (12,2,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (12,3,10,'',GETDATE(),'','','','','')

---------------------

INSERT INTO ChiTietDiem VALUES (13,4,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (13,5,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (13,6,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (13,7,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (14,4,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (14,5,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (14,6,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (14,7,5,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (15,4,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (15,5,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (15,6,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (15,7,1,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (16,4,0,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (16,5,0,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (16,6,0,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (16,7,0,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (17,4,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (17,5,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (17,6,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (17,7,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (18,4,0,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (18,5,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (18,6,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (18,7,10,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (19,4,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (19,5,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (19,6,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (19,7,1,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (20,4,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (20,5,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (20,6,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (20,7,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (21,4,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (21,5,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (21,6,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (21,7,3,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (22,4,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (22,5,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (22,6,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (22,7,5,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (23,4,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (23,5,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (23,6,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (23,7,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (24,4,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (24,5,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (24,6,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (24,7,1,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (25,4,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (25,5,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (25,6,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (25,7,1,'',GETDATE(),'','','','','')

-----------------

INSERT INTO ChiTietDiem VALUES (26,8,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (26,9,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (26,10,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (26,11,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (27,8,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (27,9,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (27,10,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (27,11,3,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (28,8,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (28,9,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (28,10,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (28,11,10,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (29,8,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (29,9,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (29,10,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (29,11,10,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (30,8,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (30,9,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (30,10,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (30,11,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (31,8,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (31,9,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (31,10,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (31,11,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (32,8,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (32,9,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (32,10,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (32,11,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (33,8,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (33,9,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (33,10,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (33,11,10,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (34,8,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (34,9,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (34,10,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (34,11,7,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (35,8,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (35,9,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (35,10,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (35,11,2,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (36,8,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (36,9,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (36,10,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (36,11,2,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (37,8,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (37,9,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (37,10,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (37,11,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (38,8,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (38,9,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (38,10,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (38,11,9,'',GETDATE(),'','','','','')

---------------------

INSERT INTO ChiTietDiem VALUES (39,12,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (39,13,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (39,14,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (39,15,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (40,12,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (40,13,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (40,14,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (40,15,5,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (41,12,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (41,13,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (41,14,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (41,15,4,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (42,12,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (42,13,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (42,14,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (42,15,7,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (43,12,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (43,13,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (43,14,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (43,15,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (44,12,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (44,13,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (44,14,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (44,15,2,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (45,12,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (45,13,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (45,14,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (45,15,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (46,12,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (46,13,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (46,14,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (46,15,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (47,12,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (47,13,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (47,14,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (47,15,7,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (48,12,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (48,13,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (48,14,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (48,15,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (49,12,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (49,13,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (49,14,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (49,15,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (50,12,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (50,13,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (50,14,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (50,15,2,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (51,12,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (51,13,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (51,14,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (51,15,4,'',GETDATE(),'','','','','')

--------------------------

INSERT INTO ChiTietDiem VALUES (52,16,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (52,17,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (52,18,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (52,19,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (53,16,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (53,17,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (53,18,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (53,19,4,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (54,16,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (54,17,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (54,18,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (54,19,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (55,16,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (55,17,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (55,18,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (55,19,1,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (56,16,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (56,17,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (56,18,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (56,19,7,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (57,16,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (57,17,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (57,18,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (57,19,4,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (58,16,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (58,17,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (58,18,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (58,19,2,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (59,16,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (59,17,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (59,18,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (59,19,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (60,16,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (60,17,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (60,18,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (60,19,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (61,16,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (61,17,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (61,18,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (61,19,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (62,16,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (62,17,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (62,18,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (62,19,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (63,16,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (63,17,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (63,18,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (63,19,5,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (64,16,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (64,17,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (64,18,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (64,19,7,'',GETDATE(),'','','','','')

--------------------------

INSERT INTO ChiTietDiem VALUES (65,20,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (65,21,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (65,22,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (65,23,10,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (66,20,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (66,21,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (66,22,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (66,23,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (67,20,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (67,21,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (67,22,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (67,23,10,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (68,20,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (68,21,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (68,22,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (68,23,4,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (69,20,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (69,21,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (69,22,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (69,23,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (70,20,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (70,21,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (70,22,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (70,23,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (71,20,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (71,21,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (71,22,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (71,23,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (72,20,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (72,21,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (72,22,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (72,23,7,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (73,20,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (73,21,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (73,22,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (73,23,4,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (74,20,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (74,21,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (74,22,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (74,23,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (75,20,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (75,21,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (75,22,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (75,23,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (76,20,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (76,21,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (76,22,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (76,23,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (77,20,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (77,21,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (77,22,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (77,23,10,'',GETDATE(),'','','','','')

----------------------------

INSERT INTO ChiTietDiem VALUES (78,24,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (78,25,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (78,26,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (78,27,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (79,24,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (79,25,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (79,26,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (79,27,5,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (80,24,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (80,25,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (80,26,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (80,27,1,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (81,24,0,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (81,25,0,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (81,26,0,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (81,27,0,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (82,24,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (82,25,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (82,26,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (82,27,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (83,24,0,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (83,25,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (83,26,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (83,27,10,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (84,24,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (84,25,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (84,26,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (84,27,1,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (85,24,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (85,25,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (85,26,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (85,27,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (86,24,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (86,25,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (86,26,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (86,27,3,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (87,24,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (87,25,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (87,26,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (87,27,5,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (88,24,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (88,25,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (88,26,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (88,27,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (89,24,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (89,25,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (89,26,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (89,27,1,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (90,24,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (90,25,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (90,26,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (90,27,1,'',GETDATE(),'','','','','')

-----------------------------

INSERT INTO ChiTietDiem VALUES (91,28,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (91,29,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (91,30,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (91,31,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (92,28,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (92,29,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (92,30,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (92,31,3,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (93,28,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (93,29,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (93,30,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (93,31,10,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (94,28,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (94,29,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (94,30,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (94,31,10,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (95,28,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (95,29,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (95,30,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (95,31,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (96,28,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (96,29,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (96,30,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (96,31,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (97,28,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (97,29,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (97,30,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (97,31,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (98,28,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (98,29,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (98,30,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (98,31,10,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (99,28,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (99,29,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (99,30,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (99,31,7,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (100,28,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (100,29,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (100,30,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (100,31,2,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (101,28,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (101,29,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (101,30,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (101,31,2,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (102,28,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (102,29,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (102,30,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (102,31,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (103,28,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (103,29,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (103,30,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (103,31,9,'',GETDATE(),'','','','','')

----------------------------

INSERT INTO ChiTietDiem VALUES (104,32,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (104,33,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (104,34,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (104,35,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (105,32,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (105,33,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (105,34,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (105,35,5,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (106,32,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (106,33,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (106,34,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (106,35,4,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (107,32,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (107,33,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (107,34,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (107,35,7,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (108,32,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (108,33,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (108,34,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (108,35,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (109,32,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (109,33,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (109,34,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (109,35,2,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (110,32,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (110,33,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (110,34,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (110,35,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (111,32,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (111,33,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (111,34,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (111,35,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (112,32,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (112,33,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (112,34,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (112,35,7,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (113,32,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (113,33,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (113,34,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (113,35,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (114,32,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (114,33,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (114,34,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (114,35,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (115,32,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (115,33,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (115,34,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (115,35,2,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (116,32,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (116,33,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (116,34,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (116,35,4,'',GETDATE(),'','','','','')

--------------------------

INSERT INTO ChiTietDiem VALUES (117,36,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (117,37,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (117,38,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (117,39,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (118,36,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (118,37,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (118,38,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (118,39,4,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (119,36,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (119,37,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (119,38,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (119,39,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (120,36,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (120,37,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (120,38,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (120,39,1,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (121,36,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (121,37,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (121,38,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (121,39,7,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (122,36,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (122,37,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (122,38,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (122,39,4,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (123,36,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (123,37,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (123,38,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (123,39,2,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (124,36,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (124,37,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (124,38,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (124,39,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (125,36,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (125,37,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (125,38,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (125,39,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (126,36,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (126,37,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (126,38,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (126,39,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (127,36,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (127,37,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (127,38,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (127,39,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (128,36,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (128,37,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (128,38,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (128,39,5,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (129,36,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (129,37,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (129,38,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (129,39,7,'',GETDATE(),'','','','','')

------------------------------------

INSERT INTO ChiTietDiem VALUES (130,40,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (130,41,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (130,42,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (130,43,10,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (131,40,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (131,41,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (131,42,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (131,43,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (132,40,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (132,41,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (132,42,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (132,43,10,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (133,40,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (133,41,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (133,42,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (133,43,4,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (134,40,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (134,41,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (134,42,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (134,43,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (135,40,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (135,41,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (135,42,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (135,43,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (136,40,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (136,41,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (136,42,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (136,43,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (137,40,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (137,41,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (137,42,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (137,43,7,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (138,40,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (138,41,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (138,42,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (138,43,4,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (139,40,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (139,41,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (139,42,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (139,43,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (140,40,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (140,41,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (140,42,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (140,43,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (141,40,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (141,41,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (141,42,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (141,43,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (142,40,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (142,41,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (142,42,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (142,43,10,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (143,40,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (143,41,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (143,42,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (143,43,9,'',GETDATE(),'','','','','')

----------------------------

INSERT INTO ChiTietDiem VALUES (144,44,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (144,45,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (144,46,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (144,47,5,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (145,44,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (145,45,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (145,46,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (145,47,1,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (146,44,0,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (146,45,0,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (146,46,0,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (146,47,0,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (147,44,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (147,45,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (147,46,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (147,47,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (148,44,0,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (148,45,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (148,46,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (148,47,10,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (149,44,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (149,45,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (149,46,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (149,47,1,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (150,44,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (150,45,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (150,46,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (150,47,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (151,44,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (151,45,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (151,46,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (151,47,3,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (152,44,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (152,45,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (152,46,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (152,47,5,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (153,44,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (153,45,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (153,46,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (153,47,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (154,44,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (154,45,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (154,46,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (154,47,1,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (155,44,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (155,45,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (155,46,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (155,47,1,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (156,44,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (156,45,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (156,46,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (156,47,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (157,44,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (157,45,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (157,46,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (157,47,3,'',GETDATE(),'','','','','')

-------------------------

INSERT INTO ChiTietDiem VALUES (158,48,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (158,49,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (158,50,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (158,51,10,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (159,48,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (159,49,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (159,50,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (159,51,10,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (160,48,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (160,49,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (160,50,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (160,51,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (161,48,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (161,49,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (161,50,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (161,51,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (162,48,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (162,49,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (162,50,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (162,51,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (163,48,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (163,49,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (163,50,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (163,51,10,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (164,48,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (164,49,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (164,50,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (164,51,7,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (165,48,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (165,49,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (165,50,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (165,51,2,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (166,48,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (166,49,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (166,50,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (166,51,2,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (167,48,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (167,49,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (167,50,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (167,51,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (168,48,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (168,49,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (168,50,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (168,51,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (169,48,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (169,49,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (169,50,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (169,51,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (170,48,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (170,49,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (170,50,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (170,51,5,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (171,48,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (171,49,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (171,50,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (171,51,4,'',GETDATE(),'','','','','')

--------------------------

INSERT INTO ChiTietDiem VALUES (172,52,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (172,53,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (172,54,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (172,55,7,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (173,52,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (173,53,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (173,54,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (173,55,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (174,52,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (174,53,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (174,54,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (174,55,2,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (175,52,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (175,53,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (175,54,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (175,55,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (176,52,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (176,53,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (176,54,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (176,55,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (177,52,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (177,53,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (177,54,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (177,55,7,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (178,52,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (178,53,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (178,54,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (178,55,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (179,52,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (179,53,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (179,54,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (179,55,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (180,52,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (180,53,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (180,54,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (180,55,2,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (181,52,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (181,53,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (181,54,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (181,55,4,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (182,52,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (182,53,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (182,54,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (182,55,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (183,52,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (183,53,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (183,54,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (183,55,4,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (184,52,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (184,53,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (184,54,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (184,55,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (185,52,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (185,53,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (185,54,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (185,55,1,'',GETDATE(),'','','','','')

-----------------------------

INSERT INTO ChiTietDiem VALUES (186,56,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (186,57,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (186,58,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (186,59,7,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (187,56,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (187,57,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (187,58,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (187,59,4,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (188,56,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (188,57,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (188,58,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (188,59,2,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (189,56,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (189,57,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (189,58,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (189,59,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (190,56,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (190,57,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (190,58,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (190,59,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (191,56,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (191,57,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (191,58,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (191,59,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (192,56,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (192,57,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (192,58,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (192,59,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (193,56,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (193,57,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (193,58,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (193,59,5,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (194,56,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (194,57,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (194,58,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (194,59,7,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (195,56,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (195,57,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (195,58,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (195,59,10,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (196,56,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (196,57,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (196,58,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (196,59,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (197,56,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (197,57,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (197,58,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (197,59,10,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (198,56,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (198,57,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (198,58,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (198,59,4,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (199,56,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (199,57,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (199,58,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (199,59,6,'',GETDATE(),'','','','','')

---------------------------

INSERT INTO ChiTietDiem VALUES (200,60,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (200,61,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (200,62,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (200,63,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (201,60,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (201,61,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (201,62,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (201,63,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (202,60,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (202,61,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (202,62,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (202,63,7,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (203,60,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (203,61,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (203,62,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (203,63,4,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (204,60,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (204,61,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (204,62,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (204,63,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (205,60,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (205,61,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (205,62,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (205,63,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (206,60,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (206,61,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (206,62,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (206,63,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (207,60,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (207,61,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (207,62,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (207,63,10,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (208,60,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (208,61,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (208,62,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (208,63,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (209,60,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (209,61,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (209,62,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (209,63,5,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (210,60,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (210,61,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (210,62,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (210,63,1,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (211,60,0,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (211,61,0,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (211,62,0,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (211,63,0,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (212,60,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (212,61,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (212,62,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (212,63,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (213,60,0,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (213,61,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (213,62,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (213,63,10,'',GETDATE(),'','','','','')

----------------------------

INSERT INTO ChiTietDiem VALUES (214,64,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (214,65,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (214,66,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (214,67,1,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (215,64,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (215,65,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (215,66,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (215,67,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (216,64,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (216,65,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (216,66,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (216,67,3,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (217,64,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (217,65,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (217,66,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (217,67,5,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (218,64,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (218,65,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (218,66,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (218,67,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (219,64,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (219,65,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (219,66,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (219,67,1,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (220,64,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (220,65,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (220,66,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (220,67,1,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (221,64,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (221,65,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (221,66,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (221,67,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (222,64,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (222,65,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (222,66,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (222,67,3,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (223,64,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (223,65,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (223,66,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (223,67,10,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (224,64,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (224,65,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (224,66,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (224,67,10,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (225,64,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (225,65,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (225,66,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (225,67,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (226,64,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (226,65,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (226,66,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (226,67,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (227,64,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (227,65,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (227,66,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (227,67,9,'',GETDATE(),'','','','','')

----------------------------------

INSERT INTO ChiTietDiem VALUES (228,68,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (228,69,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (228,70,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (228,71,10,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (229,68,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (229,69,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (229,70,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (229,71,7,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (230,68,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (230,69,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (230,70,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (230,71,2,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (231,68,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (231,69,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (231,70,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (231,71,2,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (232,68,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (232,69,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (232,70,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (232,71,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (233,68,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (233,69,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (233,70,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (233,71,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (234,68,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (234,69,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (234,70,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (234,71,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (235,68,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (235,69,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (235,70,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (235,71,5,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (236,68,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (236,69,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (236,70,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (236,71,4,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (237,68,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (237,69,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (237,70,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (237,71,7,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (238,68,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (238,69,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (238,70,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (238,71,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (239,68,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (239,69,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (239,70,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (239,71,2,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (240,68,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (240,69,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (240,70,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (240,71,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (241,68,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (241,69,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (241,70,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (241,71,9,'',GETDATE(),'','','','','')

--------------------------

INSERT INTO ChiTietDiem VALUES (242,72,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (242,73,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (242,74,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (242,75,7,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (243,72,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (243,73,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (243,74,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (243,75,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (244,72,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (244,73,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (244,74,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (244,75,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (245,72,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (245,73,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (245,74,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (245,75,2,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (246,72,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (246,73,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (246,74,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (246,75,4,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (247,72,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (247,73,6,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (247,74,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (247,75,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (248,72,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (248,73,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (248,74,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (248,75,4,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (249,72,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (249,73,2,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (249,74,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (249,75,6,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (250,72,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (250,73,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (250,74,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (250,75,1,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (251,72,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (251,73,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (251,74,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (251,75,7,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (252,72,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (252,73,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (252,74,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (252,75,4,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (253,72,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (253,73,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (253,74,9,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (253,75,2,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (254,72,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (254,73,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (254,74,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (254,75,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (255,72,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (255,73,5,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (255,74,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (255,75,9,'',GETDATE(),'','','','','')

--------------------------------

INSERT INTO ChiTietDiem VALUES (256,76,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (256,77,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (256,78,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (256,79,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (257,76,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (257,77,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (257,78,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (257,79,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (258,76,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (258,77,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (258,78,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (258,79,5,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (259,76,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (259,77,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (259,78,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (259,79,7,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (260,76,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (260,77,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (260,78,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (260,79,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (261,76,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (261,77,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (261,78,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (261,79,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (262,76,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (262,77,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (262,78,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (262,79,5,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (263,76,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (263,77,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (263,78,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (263,79,7,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (264,76,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (264,77,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (264,78,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (264,79,9,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (265,76,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (265,77,3,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (265,78,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (265,79,8,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (266,76,10,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (266,77,4,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (266,78,7,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (266,79,5,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (267,76,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (267,77,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (267,78,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (267,79,7,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (268,76,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (268,77,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (268,78,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (268,79,7,'',GETDATE(),'','','','','')

INSERT INTO ChiTietDiem VALUES (269,76,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (269,77,8,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (269,78,1,'',GETDATE(),'','','','','')
INSERT INTO ChiTietDiem VALUES (269,79,7,'',GETDATE(),'','','','','')

--select * from DangKyMonHoc
--Table LOAI TAI KHOAN SMS
Go
Go
INSERT INTO LoaiTaiKhoanSMS VALUES('DK_1_Ngay',120000,'Dang ky theo ngay',GETDATE(),'','','','','')
INSERT INTO LoaiTaiKhoanSMS VALUES('DK_3_Ngay',50000,'Dang ky theo tuan',GETDATE(),'','','','','')
INSERT INTO LoaiTaiKhoanSMS VALUES('DK_1_Tuan',35000,'Dang ky theo thang',GETDATE(),'','','','','')
INSERT INTO LoaiTaiKhoanSMS VALUES('DK_2_Tuan',25000,'Dang ky theo nam',GETDATE(),'','','','','')
INSERT INTO LoaiTaiKhoanSMS VALUES('DK_1_Thang',15000,'Dang ky theo nam',GETDATE(),'','','','','')

--Table Tai khoan SMS
Insert into TaiKhoanSMS Values('0934070400',0,1,GetDate(),GetDate(),'','','','','')
Insert into TaiKhoanSMS Values('0936080548',2,3,GetDate(),GetDate(),'','','','','')
Insert into TaiKhoanSMS Values('0984385645',4,2,GetDate(),GetDate(),'','','','','')
Insert into TaiKhoanSMS Values('0973745634',6,0,GetDate(),GetDate(),'','','','','')
Insert into TaiKhoanSMS Values('0945385344',3,1,GetDate(),GetDate(),'','','','','')
Insert into TaiKhoanSMS Values('01243595667',5,4,GetDate(),GetDate(),'','','','','')
Insert into TaiKhoanSMS Values('01663483666',4,2,GetDate(),GetDate(),'','','','','')
Insert into TaiKhoanSMS Values('01284755776',7,3,GetDate(),GetDate(),'','','','','')
Insert into TaiKhoanSMS Values('01215349346',9,0,GetDate(),GetDate(),'','','','','')
Insert into TaiKhoanSMS Values('0957634753',10,4,GetDate(),GetDate(),'','','','','')
Insert into TaiKhoanSMS Values('0985634834',12,2,GetDate(),GetDate(),'','','','','')
Insert into TaiKhoanSMS Values('0975763484',13,0,GetDate(),GetDate(),'','','','','')
Insert into TaiKhoanSMS Values('01245344847',14,3,GetDate(),GetDate(),'','','','','')
Insert into TaiKhoanSMS Values('0986545645',15,0,GetDate(),GetDate(),'','','','','')
Insert into TaiKhoanSMS Values('0945644345',16,4,GetDate(),GetDate(),'','','','','')
Insert into TaiKhoanSMS Values('0974573433',17,2,GetDate(),GetDate(),'','','','','')
Insert into TaiKhoanSMS Values('01684587465',18,0,GetDate(),GetDate(),'','','','','')
Insert into TaiKhoanSMS Values('01222545656',19,1,GetDate(),GetDate(),'','','','','')
Insert into TaiKhoanSMS Values('0954564455',20,2,GetDate(),GetDate(),'','','','','')
Insert into TaiKhoanSMS Values('0957634753',21,2,GetDate(),GetDate(),'','','','','')
Insert into TaiKhoanSMS Values('01677456345',22,4,GetDate(),GetDate(),'','','','','')
Insert into TaiKhoanSMS Values('0932543633',23,0,GetDate(),GetDate(),'','','','','')

--select* from ThanhVien

----------Table Chi Tiet Tai Khoan SMS
INSERT INTO ChiTietTaiKhoanSMS values(1,6,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(2,7,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(3,4,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(4,9,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(5,3,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(6,5,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(7,8,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(8,6,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(9,7,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(10,4,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(11,9,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(12,3,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(13,5,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(14,8,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(15,7,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(16,4,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(17,9,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(18,3,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(19,5,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(20,8,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(1,6,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(2,7,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(3,4,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(4,9,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(5,3,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(6,5,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(7,8,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(8,6,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(9,7,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(10,4,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(11,9,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(12,3,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(13,5,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(14,8,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(15,7,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(16,4,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(17,9,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(18,3,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(19,5,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(20,8,2011,GetDate(),'','','','','')

