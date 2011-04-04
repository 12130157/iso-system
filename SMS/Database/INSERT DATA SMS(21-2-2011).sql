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

--Table LopHoc
GO
INSERT INTO LopHoc VALUES (null,'10SCM','','','','','','','')
INSERT INTO LopHoc VALUES (null,'10HTHD','','','','','','','')
INSERT INTO LopHoc VALUES (null,'10KTHN','','','','','','','')
INSERT INTO LopHoc VALUES (null,'10KTHL','','','','','','','')
INSERT INTO LopHoc VALUES (null,'09KTHN','','','','','','','')
INSERT INTO LopHoc VALUES (null,'09KTHD','','','','','','','')
INSERT INTO LopHoc VALUES (null,'10KTHS','','','','','','','')

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

-- Danh sach hoc sinh LT_10KTH

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

-- Table THANHVIEN
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

-- Danh sach hoc sinh LT_10KTH

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

-- Table CU PHAP
Go
INSERT INTO CuPhap VALUES(N'Xem Diem','DIEM','','','','','','','','','',N'xem diem nhung mon hoc co trong tuan do cua sinh vien khi phu huynh nhan tin yeu cau ',GETDATE(),'','','','','')
INSERT INTO CuPhap VALUES(N'Xem TKB','TKB','','','','','','','','','',N'xem thoi khoa bieu cua sinh vien khi phu huynh nhan tin yeu cau trong tuan',GETDATE(),'','','','','')
INSERT INTO CuPhap VALUES(N'Xem Ten Viet Tat Cua Cac Mon Hoc','MON','','','','','','','','','',N'xem diem va thoi khoa bieu cua sinh vien khi phu huynh nhan tin yeu cau  moi tuan he thong se nhan tin tra loi duy tri trong vong mot hoc ki',GETDATE(),'','','','','')

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

-- Table HOP THU DI
Go
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

INSERT INTO Monhoc VALUES(N'Web Java', 40,45 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO Monhoc VALUES(N'EJB', 50,55 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO Monhoc VALUES(N'Web PHP', 35,30 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO Monhoc VALUES(N'Joomla', 0,60 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO Monhoc VALUES(N'Mạng viễn thông', 30,40 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO Monhoc VALUES(N'Wireless', 30,30 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO Monhoc VALUES(N'Cơ sở dữ liệu', 30,20 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO Monhoc VALUES(N'Kỹ thuật lập trình', 40,80 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO Monhoc VALUES(N'Tin học văn phòng', 40,80 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO Monhoc VALUES(N'Microsoft Access', 40,80 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO Monhoc VALUES(N'Corel Draw', 40,80 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO Monhoc VALUES(N'Lắp ráp cài đặt MT', 30,60 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO Monhoc VALUES(N'Photoshop', 40,80 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO Monhoc VALUES(N'Cấu trúc máy tính', 30,60 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO Monhoc VALUES(N'CSDL  SQL Server 2005', 40,80 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')
INSERT INTO Monhoc VALUES(N'Mạng cơ bản', 40,80 ,'' ,'Thi',null,null,'',0,6,'30','','','','','')

--Table ThoiKhoaBieu
GO
INSERT INTO ThoiKhoaBieu VALUES(3,6,29,GETDATE(),GETDATE(),null,GETDATE(),null,'',GETDATE(),'Học Kỳ 1 (2010 - 2011) - 10KTHD',2,'','','2010','2011','','','','','','')

--Table MonHocTKB
GO
INSERT INTO MonHocTKB VALUES (2,1,0,0,null,GETDATE(),GETDATE(),GETDATE(),GETDATE(),'',GETDATE(),'','','','','','','','','','','')
INSERT INTO MonHocTKB VALUES (2,1,0,1,null,GETDATE(),GETDATE(),GETDATE(),GETDATE(),'',GETDATE(),'','','','','','','','','','','')
INSERT INTO MonHocTKB VALUES (2,1,0,2,null,GETDATE(),GETDATE(),GETDATE(),GETDATE(),'',GETDATE(),'','','','','','','','','','','')
INSERT INTO MonHocTKB VALUES (2,1,0,3,null,GETDATE(),GETDATE(),GETDATE(),GETDATE(),'',GETDATE(),'','','','','','','','','','','')
INSERT INTO MonHocTKB VALUES (2,1,0,4,null,GETDATE(),GETDATE(),GETDATE(),GETDATE(),'',GETDATE(),'','','','','','','','','','','')

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

INSERT INTO ChiTietTKB VALUES (0,1,'Sang','THP',1,4,GETDATE(),1,0,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,1,'Sang','THP',1,4,GETDATE(),2,0,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,1,'Sang','THP',1,4,GETDATE(),3,0,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,1,'Sang','THP',1,4,GETDATE(),4,0,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,1,'Sang','THP',1,4,GETDATE(),5,0,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,1,'Sang','THP',1,4,GETDATE(),6,0,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,1,'Sang','THP',1,4,GETDATE(),7,0,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,1,'Sang','THP',1,4,GETDATE(),8,0,6,GETDATE(),1,5,'','','','','','','')
INSERT INTO ChiTietTKB VALUES (0,1,'Sang','THP',1,4,GETDATE(),9,0,6,GETDATE(),1,5,'','','','','','','')

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

--Table DangKiMonHoc
GO
select * from DangKyMonHoc
INSERT INTO DangKyMonHoc VALUES (0,16,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (0,17,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (0,18,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (0,19,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (0,20,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (0,21,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (0,22,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (0,23,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (0,24,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (0,25,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (0,26,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (0,27,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (0,28,'','','','','',GETDATE(),'','','','','')

INSERT INTO DangKyMonHoc VALUES (1,16,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (1,17,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (1,18,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (1,19,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (1,20,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (1,21,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (1,22,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (1,23,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (1,24,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (1,25,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (1,26,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (1,27,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (1,28,'','','','','',GETDATE(),'','','','','')

INSERT INTO DangKyMonHoc VALUES (2,16,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (2,17,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (2,18,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (2,19,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (2,20,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (2,21,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (2,22,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (2,23,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (2,24,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (2,25,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (2,26,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (2,27,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (2,28,'','','','','',GETDATE(),'','','','','')

INSERT INTO DangKyMonHoc VALUES (3,16,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (3,17,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (3,18,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (3,19,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (3,20,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (3,21,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (3,22,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (3,23,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (3,24,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (3,25,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (3,26,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (3,27,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (3,28,'','','','','',GETDATE(),'','','','','')

INSERT INTO DangKyMonHoc VALUES (4,16,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (4,17,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (4,18,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (4,19,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (4,20,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (4,21,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (4,22,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (4,23,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (4,24,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (4,25,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (4,26,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (4,27,'','','','','',GETDATE(),'','','','','')
INSERT INTO DangKyMonHoc VALUES (4,28,'','','','','',GETDATE(),'','','','','')

select * from baikiemtra
select * from chitietdiem
select * from dangkymonhoc
select * from monhoctkb
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


--Table LOAI TAI KHOAN SMS
Go
INSERT INTO LoaiTaiKhoanSMS VALUES('DK_Ngay',2000,'Dang ky theo ngay',GETDATE(),'','','','','')
INSERT INTO LoaiTaiKhoanSMS VALUES('DK_Tuan',5000,'Dang ky theo tuan',GETDATE(),'','','','','')
INSERT INTO LoaiTaiKhoanSMS VALUES('DK_Thang',2000,'Dang ky theo thang',GETDATE(),'','','','','')
INSERT INTO LoaiTaiKhoanSMS VALUES('DK_Nam',2000,'Dang ky theo nam',GETDATE(),'','','','','')

--Table Tai khoan SMS
Insert into TaiKhoanSMS Values('0934070400',0,1,GetDate(),GetDate(),'','','','','')
Insert into TaiKhoanSMS Values('0936080548',2,3,GetDate(),GetDate(),'','','','','')
Insert into TaiKhoanSMS Values('0984385645',4,2,GetDate(),GetDate(),'','','','','')
Insert into TaiKhoanSMS Values('0973745634',6,0,GetDate(),GetDate(),'','','','','')

----------Table Chi Tiet Tai Khoan SMS
INSERT INTO ChiTietTaiKhoanSMS values(1,6,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(1,7,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(2,4,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(2,9,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(3,3,2011,GetDate(),'','','','','')
INSERT INTO ChiTietTaiKhoanSMS values(3,8,2011,GetDate(),'','','','','')