/* *************** INSERT DU LIEU TEST **************************************/
INSERT INTO sys_Role_Menu VALUES('2','2','','','','','')
-- Table KEHOACHDAOTAO
Go
	INSERT INTO KEHOACHDAOTAO 
	VALUES(
			N'Kế hoạch đào tạo 2010-2011',
			'2010',
			'2012',
			'2009',
			'2011',
			'2010',
			'2012', 
			N'Nhiệm vụ 1', 
			N'Nhiệm vụ 2', 
			N'Nhiệm vụ 3', 
			N'Nhiệm vụ 4',
			1, 
			3/12/2010,
			'',
			'',
			2,
			'',
			'',
			'',
			'',
			'',
			'',
			'',
			''
	)

	INSERT INTO ChiTietKHDT 
	VALUES (
		0,
		GETDATE(),
		GETDATE(),
		'2009',
		'Noi_dung_cong_tac_1',
		'Bo_phan_thuc_hien_1',
		GETDATE(),
		'2010',
		'Noi_dung_cong_tac_2',
		'Bo_phan_thuc_hien_2',
		'User1',
		'User2',
		'User3',
		'User4',
		'User5'

	)


-- Table QUYETDINHMOLOP
Go
	INSERT INTO QuyetDinhMoLop
	VALUES(
			'0',
			'TC',
			N'Quyết Định đào tạo Trung Cấp Nghề 2010-2011 TEST',
			1,
			'2010',
			0,
			'Trung cap nghe',
			'Dieu_mot',
			'2010-9-1',
			'2012-7-18',
			3,
			GETDATE(),
			0,
			GETDATE(),
			2,
			'Truong TCN KTCNHV',
			'',
			'9001',
			GETDATE(),
			1000,
			3,
			GETDATE(),
			'',
			'',
			'',
			'',
			''

	)

	INSERT INTO MoChuyenNganh 
	VALUES(0,0,30,GETDATE(),'User1','User2','User3','User4','User5')

	INSERT INTO MoChuyenNganh 
	VALUES(1,0,30,GETDATE(),'User1','User2','User3','User4','User5')

	INSERT INTO MoChuyenNganh 
	VALUES(2,0,30,GETDATE(),'User1','User2','User3','User4','User5')

-- Table CHUONGTRINHDAOTAO
Go
	INSERT INTO ChuongTrinhDaoTao
	VALUES(
			N'CTDT TCN Khóa 1 2010-2012 TEST',
			N'Thiết kế web',
			1,
			0,
			'Hoc sinh, sinh vien',
			'Doi_tuong_2',
			'Doi_tuong_3',
			3,
			'Muc_tieu_1',
			'Muc_tieu_2',
			'Muc_tieu_3',
			'Muc_tieu_4',
			'Muc_tieu_5',
			'Phuong_phap_1',
			'Phuong_phap_2',
			'Phuong_phap_3',
			2,
			81,
			81,
			2430,
			5,
			200,
			2,
			80,
			30,
			60,
			30,
			30,
			' ',
			' ',
			'TH',
			'LT, TH',
			'Tai cong ty',
			'Y_kien_de_xuat',
			GETDATE(),
			GETDATE(),
			4,
			2,
			GETDATE(),
			2,
			' ',
			0,
			N'Hệ Trung Cấp',
			GETDATE(),
			'',
			'',
			'',
			'',
			''
)

	INSERT INTO ChiTietMonHocCTDT
	VALUES(0,1,0,GETDATE(),30,0,'','','Thi',1,1,1,'User1','User2','User3','User4','User5')

	INSERT INTO ChiTietMonHocCTDT
	VALUES(0,1,2,GETDATE(),45,10,'','','Thi',1,1,2,'User1','User2','User3','User4','User5')

	INSERT INTO ChiTietMonHocCTDT
	VALUES(0,1,4,GETDATE(),80,0,'','','Thi',1,1,3,'User1','User2','User3','User4','User5')

-- Table DECUONGMONHOC
Go
	INSERT INTO DeCuongMonHoc
	VALUES(
			N'ĐỀ CƯƠNG MÔN HỌC Pháp luật NGÀNH Thiết kế web 2010-2012 TEST',
			1,
			30,
			0,
			0,
			'Thi',
			'Vi_tri_mon_hoc',
			'Muc_tieu_1',
			'Muc_tieu_2',
			'Muc_tieu_3',
			'Muc_tieu_4',
			'Dieu_kien_1',
			'Dieu_kien_2',
			'Dieu_kien_3',
			'Dieu_kien_4',
			'Phuong_phap_1',
			'Phuong_phap_2',
			'Phuong_phap_3',
			GETDATE(),
			7,
			2,
			GETDATE(),
			GETDATE(),
			2,
			' ',
			' ',
			5,
			0,
			0,
			N'Công Nghệ Thông Tin',
			GETDATE(),
			'',
			'',
			'',
			'',
			''
)

INSERT INTO DeCuongMonHoc
	VALUES(
			N'ĐỀ CƯƠNG MÔN HỌC Giáo dục quốc phòng NGÀNH Thiết kế web 2010-2012 TEST',
			2,
			30,
			15,
			0,
			'Thi',
			'Vi_tri_mon_hoc',
			'Muc_tieu_1',
			'Muc_tieu_2',
			'Muc_tieu_3',
			'Muc_tieu_4',
			'Dieu_kien_1',
			'Dieu_kien_2',
			'Dieu_kien_3',
			'Dieu_kien_4',
			'Phuong_phap_1',
			'Phuong_phap_2',
			'Phuong_phap_3',
			GETDATE(),
			7,
			2,
			GETDATE(),
			GETDATE(),
			2,
			' ',
			' ',
			5,
			0,
			0,
			N'Công Nghệ Thông Tin',
			GETDATE(),
			'',
			'',
			'',
			'',
			''
)

INSERT INTO DeCuongMonHoc
	VALUES(
			N'ĐỀ CƯƠNG MÔN HỌC Anh văn căn bản và chuyên ngành NGÀNH Thiết kế web 2010-2012 TEST',
			4,
			80,
			0,
			0,
			'Thi',
			'Vi_tri_mon_hoc',
			'Muc_tieu_1',
			'Muc_tieu_2',
			'Muc_tieu_3',
			'Muc_tieu_4',
			'Dieu_kien_1',
			'Dieu_kien_2',
			'Dieu_kien_3',
			'Dieu_kien_4',
			'Phuong_phap_1',
			'Phuong_phap_2',
			'Phuong_phap_3',
			GETDATE(),
			7,
			2,
			GETDATE(),
			GETDATE(),
			2,
			' ',
			' ',
			5,
			0,
			0,
			N'Công Nghệ Thông Tin',
			GETDATE(),
			'',
			'',
			'',
			'',
			''
)

--TABLE NOIDUNGDCMH
	INSERT INTO NoiDungDCMH
	VALUES(1,1,0,'Ten chuong',0,5,GETDATE(),'','','','','')

	INSERT INTO NoiDungDCMH
	VALUES(1,2,0,'Ten chuong',0,5,GETDATE(),'','','','','')

	INSERT INTO NoiDungDCMH
	VALUES(1,3,0,'Ten chuong',0,5,GETDATE(),'','','','','')

	INSERT INTO NoiDungDCMH
	VALUES(1,4,0,'Ten chuong',0,5,GETDATE(),'','','','','')

	INSERT INTO NoiDungDCMH
	VALUES(1,5,0,'Ten chuong',0,5,GETDATE(),'','','','','')

	INSERT INTO NoiDungDCMH
	VALUES(1,6,0,'Ten chuong',0,5,GETDATE(),'','','','','')

--TABLE NOIDUNGDCMH
	INSERT INTO NoiDungDCMH
	VALUES(1,1,1,'Ten chuong',0,5,GETDATE(),'','','','','')


	INSERT INTO NoiDungDCMH
	VALUES(1,2,1,'Ten chuong',0,5,GETDATE(),'','','','','')


	INSERT INTO NoiDungDCMH
	VALUES(1,3,1,'Ten chuong',0,5,GETDATE(),'','','','','')

	INSERT INTO NoiDungDCMH
	VALUES(1,4,1,'Ten chuong',0,5,GETDATE(),'','','','','')

	INSERT INTO NoiDungDCMH
	VALUES(1,5,1,'Ten chuong',0,5,GETDATE(),'','','','','')
	
	INSERT INTO NoiDungDCMH
	VALUES(1,6,1,'Ten chuong',0,5,GETDATE(),'','','','','')

	INSERT INTO NoiDungDCMH
	VALUES(1,7,1,'Ten chuong',0,5,GETDATE(),'','','','','')

	INSERT INTO NoiDungDCMH
	VALUES(1,8,1,'Ten chuong',0,5,GETDATE(),'','','','','')

	INSERT INTO NoiDungDCMH
	VALUES(1,9,1,'Ten chuong',0,5,GETDATE(),'','','','','')
	
	INSERT INTO NoiDungDCMH
	VALUES(1,10,1,'Ten chuong',1,5,GETDATE(),'','','','','')

	INSERT INTO NoiDungDCMH
	VALUES(1,11,1,'Ten chuong',1,5,GETDATE(),'','','','','')

--TABLE NOIDUNGDCMH
	INSERT INTO NoiDungDCMH
	VALUES(1,1,2,'Ten chuong',0,5,GETDATE(),'','','','','')

	INSERT INTO NoiDungDCMH
	VALUES(1,2,2,'Ten chuong',0,5,GETDATE(),'','','','','')

	INSERT INTO NoiDungDCMH
	VALUES(1,3,2,'Ten chuong',0,5,GETDATE(),'','','','','')

	INSERT INTO NoiDungDCMH
	VALUES(1,4,2,'Ten chuong',0,5,GETDATE(),'','','','','')

	INSERT INTO NoiDungDCMH
	VALUES(1,5,2,'Ten chuong',0,5,GETDATE(),'','','','','')

	INSERT INTO NoiDungDCMH
	VALUES(1,6,2,'Ten chuong',0,5,GETDATE(),'','','','','')

	INSERT INTO NoiDungDCMH
	VALUES(1,7,2,'Ten chuong',0,5,GETDATE(),'','','','','')

	INSERT INTO NoiDungDCMH
	VALUES(1,8,2,'Ten chuong',0,5,GETDATE(),'','','','','')

	INSERT INTO NoiDungDCMH
	VALUES(1,9,2,'Ten chuong',0,5,GETDATE(),'','','','','')

	INSERT INTO NoiDungDCMH
	VALUES(1,10,2,'Ten chuong',0,5,GETDATE(),'','','','','')

	INSERT INTO NoiDungDCMH
	VALUES(1,11,2,'Ten chuong',0,5,GETDATE(),'','','','','')

	INSERT INTO NoiDungDCMH
	VALUES(1,12,2,'Ten chuong',0,5,GETDATE(),'','','','','')

	INSERT INTO NoiDungDCMH
	VALUES(1,13,2,'Ten chuong',0,5,GETDATE(),'','','','','')

	INSERT INTO NoiDungDCMH
	VALUES(1,14,2,'Ten chuong',0,5,GETDATE(),'','','','','')

	INSERT INTO NoiDungDCMH
	VALUES(1,15,2,'Ten chuong',0,5,GETDATE(),'','','','','')

	INSERT INTO NoiDungDCMH
	VALUES(1,16,2,'Ten chuong',0,5,GETDATE(),'','','','','')

-- Table THOIKHOABIEU
Go
	INSERT INTO ThoiKhoaBieu
	VALUES(
			1,
			1,
			25,
			'2010-09-01',
			'2011-02-20',
			4,
			GETDATE(),
			2,
			GETDATE(),
			GETDATE(),
			N'THỜI KHÓA BIỂU HỌC KÌ 1 HỆ Trung Cấp Nghề NGÀNH Thiết kế web NĂM HỌC 2010-2011 TEST',
			2,
			' ',
			1,
			'2010',
			'2011',
			GETDATE(),
			'',
			'',
			'',
			'',
			''
)
		
	INSERT INTO MonHocTKB
	VALUES(3,1,0,2,2,'9-1-2010','9-20-2010','9-19-2010','9-26-2010','',GETDATE(),1,4,3,4,N'Giáo dục quốc phòng',N'Nguyễn Quốc Cường','','','','','')
	
	INSERT INTO MonHocTKB
	VALUES(3,1,0,4,7,'9-1-2010','','10-10-2010','','',GETDATE(),1,0,6,0,N'Anh văn căn bản và chuyên ngành',N'Nguyễn Thành Tài','','','','','')	
	
	INSERT INTO ChiTietTKB
	VALUES(0,1,N'Sáng','LT',1,2,'2010-07-28',1,1,1,'2010-09-01',1,0,'','','','','')
	
	INSERT INTO ChiTietTKB
	VALUES(0,3,N'Sáng','LT',1,2,'2010-07-28',2,1,1,'2010-09-03',2,0,'','','','','')

	INSERT INTO ChiTietTKB
	VALUES(0,5,N'Sáng','LT',1,2,'2010-07-28',3,1,1,'2010-09-05',2,0,'','','','','')

	INSERT INTO ChiTietTKB
	VALUES(0,1,N'Sáng','LT',1,2,'2010-07-28',4,1,2,'2010-09-06',2,0,'','','','','')

	INSERT INTO ChiTietTKB
	VALUES(0,3,N'Sáng','LT',1,2,'2010-07-28',5,1,2,'2010-09-08',2,0,'','','','','')

	INSERT INTO ChiTietTKB
	VALUES(0,5,N'Sáng','LT',1,2,'2010-07-28',6,1,2,'2010-09-10',2,0,'','','','','')

	INSERT INTO ChiTietTKB
	VALUES(0,1,N'Sáng','LT',1,2,'2010-07-28',7,1,3,'2010-09-13',2,0,'','','','','')

	INSERT INTO ChiTietTKB
	VALUES(0,3,N'Sáng','LT',1,2,'2010-07-28',8,1,3,'2010-09-15',2,0,'','','','','')

	INSERT INTO ChiTietTKB
	VALUES(0,5,N'Sáng','LT',1,2,'2010-07-28',9,1,3,'2010-09-17',2,0,'','','','','')

	INSERT INTO ChiTietTKB
	VALUES(0,1,N'Sáng','TH',1,1,'2010-07-28',10,1,4,'2010-09-20',10,1,'','','','','')

	INSERT INTO ChiTietTKB
	VALUES(0,3,N'Sáng','TH',1,1,'2010-07-28',11,1,4,'2010-09-22',11,1,'','','','','')

	INSERT INTO ChiTietTKB
	VALUES(0,2,N'Sáng','LT',1,0,'2010-07-28',1,2,1,'2010-09-02',1,0,'','','','','')

	INSERT INTO ChiTietTKB
	VALUES(0,4,N'Sáng','LT',1,0,'2010-07-28',2,2,1,'2010-09-04',2,0,'','','','','')

	INSERT INTO ChiTietTKB
	VALUES(0,6,N'Sáng','LT',1,0,'2010-07-28',3,2,1,'2010-09-06',3,0,'','','','','')

	INSERT INTO ChiTietTKB
	VALUES(0,2,N'Sáng','LT',1,0,'2010-07-28',4,2,2,'2010-09-07',4,0,'','','','','')

	INSERT INTO ChiTietTKB
	VALUES(0,4,N'Sáng','LT',1,0,'2010-07-28',5,2,2,'2010-09-09',5,0,'','','','','')

	INSERT INTO ChiTietTKB
	VALUES(0,6,N'Sáng','LT',1,0,'2010-07-28',6,2,2,'2010-09-11',6,0,'','','','','')

	INSERT INTO ChiTietTKB
	VALUES(0,2,N'Sáng','LT',1,0,'2010-07-28',7,2,3,'2010-09-14',7,0,'','','','','')

	INSERT INTO ChiTietTKB
	VALUES(0,4,N'Sáng','LT',1,0,'2010-07-28',8,2,3,'2010-09-16',8,0,'','','','','')

	INSERT INTO ChiTietTKB
	VALUES(0,6,N'Sáng','LT',1,0,'2010-07-28',9,2,3,'2010-09-18',9,0,'','','','','')

	INSERT INTO ChiTietTKB
	VALUES(0,2,N'Sáng','LT',1,0,'2010-07-28',10,2,4,'2010-09-21',10,0,'','','','','')

	INSERT INTO ChiTietTKB
	VALUES(0,4,N'Sáng','LT',1,0,'2010-07-28',11,2,4,'2010-09-23',11,0,'','','','','')

	INSERT INTO ChiTietTKB
	VALUES(0,6,N'Sáng','LT',1,0,'2010-07-28',12,2,4,'2010-09-25',12,0,'','','','','')

	INSERT INTO ChiTietTKB
	VALUES(0,2,N'Sáng','LT',1,0,'2010-07-28',13,2,5,'2010-09-28',13,0,'','','','','')

	INSERT INTO ChiTietTKB
	VALUES(0,4,N'Sáng','LT',1,0,'2010-07-28',14,2,5,'2010-09-30',14,0,'','','','','')

	INSERT INTO ChiTietTKB
	VALUES(0,6,N'Sáng','LT',1,0,'2010-07-28',15,2,5,'2010-10-02',15,0,'','','','','')

	INSERT INTO ChiTietTKB
	VALUES(0,2,N'Sáng','LT',1,0,'2010-07-28',16,2,6,'2010-10-05',16,0,'','','','','')
			
	
-- Table KEHOACHGIANGDAY
Go
	INSERT INTO KeHoachGiangDay
	VALUES(
			4,
			1,
			1,
			1,
			0,
			7,
			GETDATE(),
			2,
			GETDATE(),
			2,
			N'Kế hoạch giảng dạy học kỳ 1 niên khóa 2010 - 2011 lớp TKW môn Anh văn căn bản và chuyên ngành TEST',
			' ',
			GETDATE(),
			80,
			0,
			6,
			5,
			4,
			GETDATE(),
			'',
			'',
			'',
			'',
			''
)
	
	INSERT INTO ChiTietKHGD
	VALUES(0,'Ten chuong',1,'2010-07-28',1,'2010-09-01','2010-09-05','','','','','','','','')

	INSERT INTO ChiTietKHGD
	VALUES(0,'Ten chuong',1,'2010-07-28',1,'2010-09-01','2010-09-05','','','','','','','','')

	INSERT INTO ChiTietKHGD
	VALUES(0,'Ten chuong',1,'2010-07-28',1,'2010-09-01','2010-09-05','','','','','','','','')

	INSERT INTO ChiTietKHGD
	VALUES(0,'Ten chuong',1,'2010-07-28',2,'2010-09-06','2010-09-12','','','','','','','','')

	INSERT INTO ChiTietKHGD
	VALUES(0,'Ten chuong',1,'2010-07-28',2,'2010-09-06','2010-09-12','','','','','','','','')

	INSERT INTO ChiTietKHGD
	VALUES(0,'Ten chuong',1,'2010-07-28',2,'2010-09-06','2010-09-12','','','','','','','','')

	INSERT INTO ChiTietKHGD
	VALUES(0,'Ten chuong',1,'2010-07-28',3,'2010-09-13','2010-09-19','','','','','','','','')

	INSERT INTO ChiTietKHGD
	VALUES(0,'Ten chuong',1,'2010-07-28',3,'2010-09-13','2010-09-19','','','','','','','','')

	INSERT INTO ChiTietKHGD
	VALUES(0,'Ten chuong',1,'2010-07-28',3,'2010-09-13','2010-09-19','','','','','','','','')

	INSERT INTO ChiTietKHGD
	VALUES(0,'Ten chuong',1,'2010-07-28',4,'2010-09-20','2010-09-26','','','','','','','','')

	INSERT INTO ChiTietKHGD
	VALUES(0,'Ten chuong',1,'2010-07-28',4,'2010-09-20','2010-09-26','','','','','','','','')

	INSERT INTO ChiTietKHGD
	VALUES(0,'Ten chuong',1,'2010-07-28',4,'2010-09-20','2010-09-26','','','','','','','','')

	INSERT INTO ChiTietKHGD
	VALUES(0,'Ten chuong',1,'2010-07-28',5,'2010-09-27','2010-10-03','','','','','','','','')

	INSERT INTO ChiTietKHGD
	VALUES(0,'Ten chuong',1,'2010-07-28',5,'2010-09-27','2010-10-03','','','','','','','','')

	INSERT INTO ChiTietKHGD
	VALUES(0,'Ten chuong',1,'2010-07-28',5,'2010-09-27','2010-10-03','','','','','','','','')

	INSERT INTO ChiTietKHGD
	VALUES(0,'Ten chuong',1,'2010-07-28',6,'2010-10-04','2010-10-10','','','','','','','','')
