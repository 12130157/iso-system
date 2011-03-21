-- Table Vai Tro
Go
INSERT INTO VaiTro VALUES(N'Phòng Đào Tạo',GETDATE(),'','','','','')
INSERT INTO VaiTro VALUES(N'Hiệu Trưởng',GETDATE(),'','','','','')
INSERT INTO VaiTro VALUES(N'Phòng Hành Chánh',GETDATE(),'','','','','')
INSERT INTO VaiTro VALUES(N'Trưởng Khoa',GETDATE(),'','','','','')
INSERT INTO VaiTro VALUES(N'Hội Đồng Thẩm Định',GETDATE(),'','','','','')
INSERT INTO VaiTro VALUES(N'Giáo Viên',GETDATE(),'','','','','')
INSERT INTO VaiTro VALUES(N'Admin',GETDATE(),'','','','','')
INSERT INTO VaiTro VALUES(N'Trưởng Bộ Môn',GETDATE(),'','','','','')

-- Table ChiTietThanhVien
Go
INSERT INTO ChiTietThanhVien VALUES('ThienVD',N'Võ',N'Đức',N'Thiện',getdate(),null,'ducthienkhtn@gmail.com','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('PhongDaoTao',N'Phòng',N'Đào',N'Tạo',getdate(),null,'ducthienkhtn@gmail.com','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('HieuTruong',N'Hiệu','',N'Trưởng',getdate(),null,'ducthienkhtn@gmail.com','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('PhongHanhChanh',N'Phòng',N'Hành',N'Chánh',getdate(),null,'ducthienkhtn@gmail.com','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('cuong_nq',N'Nguyễn',N'Quốc',N'Cường',getdate(),null,'ducthienkhtn@gmail.com','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('HoiDongThamDinh',N'Hội',N'Đồng Thẩm',N'Định',getdate(),null,'ducthienkhtn@gmail.com','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('uyen_bmt',N'Bùi',N'Mộng Thúy',N'Uyên',getdate(),null,'ducthienkhtn@gmail.com','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('TruongBoMon',N'Trưởng',N'Bộ',N'Môn',getdate(),null,'ducthienkhtn@gmail.com','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('truong_tht',N'Tô',N'Huỳnh Thiên',N'Trường',getdate(),null,'ducthienkhtn@gmail.com','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('trung_pn',N'Phan',N'Nhật',N'Trung',getdate(),null,'ducthienkhtn@gmail.com','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('lam_vt',N'Võ',N'Thị',N'Lắm',getdate(),null,'ducthienkhtn@gmail.com','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('linh_lqh',N'Lê',N'Quí Hồng',N'Lĩnh',getdate(),null,'ducthienkhtn@gmail.com','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('khoa_ng',N'Nguyễn',N'Gia',N'Khoa',getdate(),null,'ducthienkhtn@gmail.com','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('dung_dd',N'Dương',N'Đình',N'Dũng',getdate(),null,'ducthienkhtn@gmail.com','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('tho_nd',N'Ngô',N'Đình',N'Thọ',getdate(),null,'ducthienkhtn@gmail.com','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('trieu_nh',N'Nguyễn',N'Hải',N'Triều',getdate(),null,'ducthienkhtn@gmail.com','',null,getdate(),getdate(),null,1,null,null,'','','','','','')
INSERT INTO ChiTietThanhVien VALUES('khoa_nvd',N'Nguyễn',N'Võ Đăng',N'Khoa',getdate(),null,'ducthienkhtn@gmail.com','',null,getdate(),getdate(),null,1,null,null,'','','','','','')

-- Table THANHVIEN
Go 
INSERT INTO ThanhVien VALUES('ThienVD','ThienVD',6,GETDATE(),GETDATE(),GETDATE(),0,'','','','','')
INSERT INTO ThanhVien VALUES('PhongDaoTao','PhongDaoTao',0,GETDATE(),GETDATE(),GETDATE(),0,'','','','','')
INSERT INTO ThanhVien VALUES('HieuTruong','HieuTruong',1,GETDATE(),GETDATE(),GETDATE(),0,'','','','','')
INSERT INTO ThanhVien VALUES('PhongHanhChanh','PhongHanhChanh',2,GETDATE(),GETDATE(),GETDATE(),0,'','','','','')
INSERT INTO ThanhVien VALUES('cuong_nq','cuong_nq',3,GETDATE(),GETDATE(),GETDATE(),1,'','','','','')
INSERT INTO ThanhVien VALUES('HoiDongThamDinh','HoiDongThamDinh',4,GETDATE(),GETDATE(),GETDATE(),1,'','','','','')
INSERT INTO ThanhVien VALUES('uyen_bmt','uyen_bmt',5,GETDATE(),GETDATE(),GETDATE(),0,'','','','','')
INSERT INTO ThanhVien VALUES('TruongBoMon','TruongBoMon',7,GETDATE(),GETDATE(),GETDATE(),1,'','','','','')
INSERT INTO ThanhVien VALUES('truong_tht','truong_tht',5,GETDATE(),GETDATE(),GETDATE(),0,'','','','','')
INSERT INTO ThanhVien VALUES('trung_pn','trung_pn',5,GETDATE(),GETDATE(),GETDATE(),0,'','','','','')
INSERT INTO ThanhVien VALUES('lam_vt','lam_vt',5,GETDATE(),GETDATE(),GETDATE(),0,'','','','','')
INSERT INTO ThanhVien VALUES('linh_lqh','linh_lqh',5,GETDATE(),GETDATE(),GETDATE(),0,'','','','','')
INSERT INTO ThanhVien VALUES('tho_nd','tho_nd',5,GETDATE(),GETDATE(),GETDATE(),0,'','','','','')
INSERT INTO ThanhVien VALUES('trieu_nh','trieu_nh',5,GETDATE(),GETDATE(),GETDATE(),0,'','','','','')
INSERT INTO ThanhVien VALUES('khoa_nvd','khoa_nvd',5,GETDATE(),GETDATE(),GETDATE(),0,'','','','','')

-- Table CU PHAP
Go
INSERT INTO CuPhap VALUES(N'Xem Diem','DIEM','','','','','','','','','',N'xem diem nhung mon hoc co trong tuan do cua sinh vien khi phu huynh nhan tin yeu cau ',GETDATE(),'','','','','')
INSERT INTO CuPhap VALUES(N'Xem Diem Tuan','DIEM','THANG','','','','','','','','',N'xem diem cua sinh vien khi phu huynh nhan tin yeu cau  moi tuan he thong se tra loi tin nhan trong vong mot thang',GETDATE(),'','','','','')
INSERT INTO CuPhap VALUES(N'Xem Diem THANG','DIEM','HK','','','','','','','','',N'xem diem cua sinh vien khi phu huynh nhan tin yeu cau  moi tuan he thong se tra loi tin nhan trong vong mot hoc ki',GETDATE(),'','','','','')
INSERT INTO CuPhap VALUES(N'Xem TKB','TKB','','','','','','','','','',N'xem thoi khoa bieu cua sinh vien khi phu huynh nhan tin yeu cau trong tuan',GETDATE(),'','','','','')
INSERT INTO CuPhap VALUES(N'Xem TKB Tuan','TKB','TUAN','','','','','','','','',N'xem thoi khoa bieu cua sinh vien khi phu huynh nhan tin yeu cau nhan tin nhan theo tuan trong vong mot thang',GETDATE(),'','','','','')
INSERT INTO CuPhap VALUES(N'Xem TKB Hoc Ky','TKB','HK','','','','','','','','',N'xem diem cua sinh vien khi phu huynh nhan tin yeu cau nhan tin nhan theo tuan trong vong mot hoc ki',GETDATE(),'','','','','')
INSERT INTO CuPhap VALUES(N'Xem Diem TKB','DT','','','','','','','','','',N'xem diem va thoi khoa bieu cua sinh vien khi phu huynh nhan tin yeu cau trong tuan do',GETDATE(),'','','','','')
INSERT INTO CuPhap VALUES(N'Xem Diem TKB Thang','DT','THANG','','','','','','','','',N'xem diem va thoi khoa bieu cua sinh vien khi phu huynh nhan tin yeu cau moi tuan he thong se nhan tin tra loi duy tri trong vong mot thang',GETDATE(),'','','','','') 
INSERT INTO CuPhap VALUES(N'Xem Diem TKB Nam','DT','HK','','','','','','','','',N'xem diem va thoi khoa bieu cua sinh vien khi phu huynh nhan tin yeu cau  moi tuan he thong se nhan tin tra loi duy tri trong vong mot hoc ki',GETDATE(),'','','','','')

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
INSERT INTO LoaiHopThu VALUES('Tin Nhan Loi','Luu nhung tin nhan di',GETDATE(),'','','','','')
INSERT INTO LoaiHopThu VALUES('Tin Nhan Loi Da Xoa','Luu nhung tin nhan di duoc xoa',GETDATE(),'','','','','')

--Conlum tinhtrang table hop thu di, 1 la da gui , 0 la chua gui thanh cong

-- Table HOP THU DI
Go
INSERT INTO HopThuDi VALUES('0975587553','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0911111111','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0922222222','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0933333333','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0944444444','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0955555555','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0977777777','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0988888888','test data',1,4,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0912121212','test data',1,6,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDi VALUES('0934343434','test data',1,4,GETDATE(),GETDATE(),'','','','','')

--conlumn tinh trang Table HopThuDen , 1 da tra loi , 2 chua tra loi

--Table HOP THU DEN 
Go
INSERT INTO HopThuDen VALUES('0975587553',null,'test hop thu den',1,2,null,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0911111111',0,'test hop thu den',0,0,null,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0922222222',null,'test hop thu den',1,2,null,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0933333333',1,'test hop thu den',1,0,null,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0944444444',null,'test hop thu den',0,2,null,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0955555555',2,'test hop thu den',1,0,null,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0977777777',null,'test hop thu den',1,2,null,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0988888888',3,'test hop thu den',0,0,null,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0912121212',null,'test hop thu den',1,2,null,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0934343434',4,'test hop thu den',0,0,null,GETDATE(),GETDATE(),'','','','','')

INSERT INTO HopThuDen VALUES('0977538942',null,'test hop thu den',1,2,null,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0917523197',5,'test hop thu den',0,0,null,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0992475213',null,'test hop thu den',1,2,null,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0975694283',6,'test hop thu den',1,0,null,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0975349821',null,'test hop thu den',0,2,null,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0963547128',7,'test hop thu den',1,0,null,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0969321857',null,'test hop thu den',1,2,null,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0935749527',8,'test hop thu den',0,0,null,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0979828792',null,'test hop thu den',1,2,null,GETDATE(),GETDATE(),'','','','','')
INSERT INTO HopThuDen VALUES('0934358796',0,'test hop thu den',0,0,null,GETDATE(),GETDATE(),'','','','','')

--Table LOAI TAI KHOAN SMS
Go
--INSERT INTO LoaiTaiKhoanSMS VALUES(,,,GETDATE(),'','','','','')