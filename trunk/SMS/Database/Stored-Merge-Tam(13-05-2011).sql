
--sp_ISO_SMS_deleteMessInbox.sql
/***********************************************************
* Purpose : DELETE MESSAGE INBOX
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: DELETE MESSAGE INBOX INTO DELETED INBOX
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_deleteMessInbox') 
BEGIN
	DROP PROC sp_ISO_SMS_deleteMessInbox
END
GO
CREATE PROC sp_ISO_SMS_deleteMessInbox
	@id		int
AS
BEGIN
	UPDATE HopThuDen 

	SET tinh_trang = 3,
	ngay_cap_nhat_cuoi = GETDATE() 

	WHERE id = @id
END
GO

--sp_ISO_SMS_deleteMessSent.sql
/***********************************************************
* Purpose : DELETE MESSAGE SENT
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: DELETE MESSAGE SENT INTO DELETED SENT
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_deleteMessSent') 
BEGIN
	DROP PROC sp_ISO_SMS_deleteMessSent
END
GO
CREATE PROC sp_ISO_SMS_deleteMessSent
	@id		int
AS
BEGIN
	UPDATE HopThuDi 

	SET tinh_trang = 3,
		ngay_cap_nhat_cuoi = GETDATE() 
	
	WHERE id = @id
END
GO

--sp_ISO_SMS_getAllNormalMessDeletedInbox.sql
/***********************************************************
* Purpose : SELECT ALL NORMAL MESSAGE DELETED INBOX
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: GET ALL NORMAL MESS DELETED
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_getAllNormalMessDeletedInbox') 
BEGIN
	DROP PROC sp_ISO_SMS_getAllNormalMessDeletedInbox
END
GO
CREATE PROC sp_ISO_SMS_getAllNormalMessDeletedInbox
AS
BEGIN
	SELECT	ID,So_dien_thoai,Noi_dung_tin_nhan,Ngay_nhan,
			dbo.fnc_ISO_SMS_statusReply(Ma_Tin_Nhan_Tra_Loi) AS 'Tinh_trang_Tra_loi'

	FROM HopThuDen  

	WHERE Loai_hop_thu = 2 AND tinh_trang = 3

	ORDER BY ngay_cap_nhat_cuoi ASC , id DESC
END
GO

--sp_ISO_SMS_getAllNormalMessDeletedSent.sql
/***********************************************************
* Purpose : SELECT ALL NORMAL MESS DELETED SENT
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: SELECT ALL NORMAL MESS DELETED SENT
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_getAllNormalMessDeletedSent') 
BEGIN
	DROP PROC sp_ISO_SMS_getAllNormalMessDeletedSent
END
GO
CREATE PROC sp_ISO_SMS_getAllNormalMessDeletedSent
AS
BEGIN
	SELECT id,so_dien_thoai,noi_dung_tin_nhan,ngay_gui 

	FROM HopThuDi 

	WHERE tinh_trang = 3 AND loai_hop_thu = 6

	ORDER BY id DESC
END
GO

--sp_ISO_SMS_getAllNormalMessErrorSent.sql
/***********************************************************
* Purpose : SELECT ALL NORMAL MESS ERROR SENT
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: SELECT ALL NORMAL MESS ERROR SENT
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_getAllNormalMessErrorSent') 
BEGIN
	DROP PROC sp_ISO_SMS_getAllNormalMessErrorSent
END
GO
CREATE PROC sp_ISO_SMS_getAllNormalMessErrorSent
AS
BEGIN
	SELECT id,so_dien_thoai,noi_dung_tin_nhan,ngay_gui 

	FROM HopThuDi 
	
	WHERE tinh_trang = 0 AND loai_hop_thu = 6

	ORDER BY id DESC
END
GO

--sp_ISO_SMS_getAllNormalMessInbox.sql
/***********************************************************
* Purpose : SELECT ALL NORMAL MESSAGE INBOX
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: GET ALL NORMAL MESS
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_getAllNormalMessInbox') 
BEGIN
	DROP PROC sp_ISO_SMS_getAllNormalMessInbox
END
GO
CREATE PROC sp_ISO_SMS_getAllNormalMessInbox
AS
BEGIN
	SELECT	A.ID,A.So_dien_thoai,A.Noi_dung_tin_nhan,
			dbo.statusToString(A.Tinh_trang) AS 'Tinh_trang',
			A.Ngay_nhan,dbo.fnc_ISO_SMS_statusReply(A.Ma_Tin_Nhan_Tra_Loi) AS 'Tinh_trang_Tra_loi'

	FROM HopThuDen AS A 

	WHERE A.Loai_hop_thu = 2 AND A.tinh_trang != 3

	ORDER BY A.Tinh_trang ASC , A.id DESC
END
GO

--sp_ISO_SMS_getAllNormalMessSent.sql
/***********************************************************
* Purpose : SELECT ALL NORMAL MESSAGE SENT
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: GET ALL NORMAL MESS SENT
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_getAllNormalMessSent') 
BEGIN
	DROP PROC sp_ISO_SMS_getAllNormalMessSent
END
GO
CREATE PROC sp_ISO_SMS_getAllNormalMessSent
AS
BEGIN
	SELECT id,so_dien_thoai,noi_dung_tin_nhan,ngay_gui 

	FROM hopthudi 
	
	WHERE tinh_trang = 1 AND loai_hop_thu = 6 

	ORDER BY id DESC
END
GO

--sp_ISO_SMS_getAllSyntaxMessDeletedInbox.sql
/***********************************************************
* Purpose : SELECT ALL SYNTAX MESSAGE DELETED INBOX
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: GET ALL SYNTAX MESS DELETED
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_getAllSyntaxMessDeletedInbox') 
BEGIN
	DROP PROC sp_ISO_SMS_getAllSyntaxMessDeletedInbox
END
GO
CREATE PROC sp_ISO_SMS_getAllSyntaxMessDeletedInbox
AS
BEGIN
	SELECT	A.ID,A.So_dien_thoai,A.Noi_dung_tin_nhan,
			B.Cum_tu_1+' '+B.Cum_tu_2+' '+B.Cum_tu_3+
			' '+B.Cum_tu_4+' '+B.Cum_tu_5+' '+B.Cum_tu_6 +
			' '+B.Cum_tu_7 +' '+B.Cum_tu_8 +' '+B.Cum_tu_9 +
			' '+B.Cum_tu_10  AS 'Cu_phap',A.Ngay_nhan,
			dbo.fnc_ISO_SMS_statusReply(A.Ma_Tin_Nhan_Tra_Loi) AS 'Tinh_trang_Tra_loi'
	
	FROM HopThuDen AS A 

	INNER JOIN CuPhap AS B
	ON A.Ma_cu_phap = B.ID

	WHERE A.Loai_hop_thu = 0 AND A.tinh_trang = 3

	ORDER BY A.ngay_cap_nhat_cuoi ASC,A.id DESC
END
GO

--sp_ISO_SMS_getAllSyntaxMessDeletedSent.sql
/***********************************************************
* Purpose : SELECT ALL SYNTAX MESS DELETED SENT
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: SELECT ALL SYNTAX MESS DELETED SENT
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_getAllSyntaxMessDeletedSent') 
BEGIN
	DROP PROC sp_ISO_SMS_getAllSyntaxMessDeletedSent
END
GO
CREATE PROC sp_ISO_SMS_getAllSyntaxMessDeletedSent
AS
BEGIN
	SELECT	A.id,A.so_dien_thoai,A.noi_dung_tin_nhan,
			C.cum_tu_1+' '+C.cum_tu_2+' '+C.cum_tu_3+' '+C.cum_tu_4+' '+
			C.cum_tu_5+' '+C.cum_tu_6+' '+C.cum_tu_7+' '+C.cum_tu_8+' '+
			C.cum_tu_9+' '+C.cum_tu_10 AS 'Cu_Phap',A.ngay_gui 

	FROM HopThuDi AS A 
	
	INNER JOIN HopThuDen AS B
	ON B.ma_tin_nhan_tra_loi = A.id
	
	INNER JOIN CuPhap AS C
	ON B.ma_cu_phap = C.id

	WHERE A.tinh_trang = 3 AND A.loai_hop_thu = 4

	ORDER BY A.id DESC
END
GO

--sp_ISO_SMS_getAllSyntaxMessErrorSent.sql
/***********************************************************
* Purpose : SELECT ALL SYNTAX MESS ERROR SENT
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: SELECT ALL SYNTAX MESS ERROR SENT
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_getAllSyntaxMessErrorSent') 
BEGIN
	DROP PROC sp_ISO_SMS_getAllSyntaxMessErrorSent
END
GO
CREATE PROC sp_ISO_SMS_getAllSyntaxMessErrorSent
AS
BEGIN
	SELECT	A.id,A.so_dien_thoai,A.noi_dung_tin_nhan,
			C.cum_tu_1+' '+C.cum_tu_2+' '+C.cum_tu_3+' '+C.cum_tu_4+' '+
			C.cum_tu_5+' '+C.cum_tu_6+' '+C.cum_tu_7+' '+C.cum_tu_8+' '+
			C.cum_tu_9+' '+C.cum_tu_10 AS 'Cu_Phap',A.ngay_gui 

	FROM HopThuDi AS A 
	
	INNER JOIN HopThuDen AS B
	ON B.ma_tin_nhan_tra_loi = A.id
	
	INNER JOIN CuPhap AS C
	ON B.ma_cu_phap = C.id

	WHERE A.tinh_trang = 0 AND A.loai_hop_thu = 4

	ORDER BY A.id DESC
END
GO

--sp_ISO_SMS_getAllSyntaxMessInbox.sql
/***********************************************************
* Purpose : SELECT ALL SYNTAX MESSAGE INBOX
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: GET ALL SYNTAX MESS
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_getAllSyntaxMessInbox') 
BEGIN
	DROP PROC sp_ISO_SMS_getAllSyntaxMessInbox
END
GO
CREATE PROC sp_ISO_SMS_getAllSyntaxMessInbox
AS
BEGIN
	SELECT	A.ID,A.So_dien_thoai,A.Noi_dung_tin_nhan,
			B.Cum_tu_1+' '+B.Cum_tu_2+' '+B.Cum_tu_3+
			' '+B.Cum_tu_4+' '+B.Cum_tu_5+' '+B.Cum_tu_6 +
			' '+B.Cum_tu_7 +' '+B.Cum_tu_8 +' '+B.Cum_tu_9 +
			' '+B.Cum_tu_10  AS 'Cu_phap'
			,dbo.statusToString(A.Tinh_trang) AS 'Tinh_trang',
			A.Ngay_nhan,dbo.fnc_ISO_SMS_statusReply(A.Ma_Tin_Nhan_Tra_Loi) AS 'Tinh_trang_Tra_loi'
	FROM HopThuDen AS A 

	INNER JOIN CuPhap AS B
	ON A.Ma_cu_phap = B.ID

	WHERE A.Loai_hop_thu = 0 AND A.tinh_trang != 3

	ORDER BY A.tinh_trang ASC,A.id DESC 
END

--EXEC sp_ISO_SMS_getAllSyntaxMessInbox
GO

--sp_ISO_SMS_getAllSyntaxMessSent.sql
/***********************************************************
* Purpose : SELECT ALL SYNTAX MESSAGE SENT
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: GET ALL SYNTAX MESS SENT
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_getAllSyntaxMessSent') 
BEGIN
	DROP PROC sp_ISO_SMS_getAllSyntaxMessSent
END
GO
CREATE PROC sp_ISO_SMS_getAllSyntaxMessSent
AS
BEGIN
	SELECT A.id,A.so_dien_thoai,A.noi_dung_tin_nhan,
	C.cum_tu_1+' '+C.cum_tu_2+' '+C.cum_tu_3+' '+C.cum_tu_4+' '+
	C.cum_tu_5+' '+C.cum_tu_6+' '+C.cum_tu_7+' '+C.cum_tu_8+' '+
	C.cum_tu_9+' '+C.cum_tu_10 AS 'Cu_Phap',A.ngay_gui 

	FROM  hopthudi AS A
	
	INNER JOIN hopthuden AS B
	ON A.id = B.ma_tin_nhan_tra_loi

	INNER JOIN cuphap AS C
	ON B.ma_cu_phap = C.id

	WHERE A.tinh_trang = 1 AND A.loai_hop_thu = 4 

	ORDER BY id DESC
END
GO

--sp_ISO_SMS_getCountMessUnread.sql
/***********************************************************
* Purpose : SELECT COUNT MESSAGE UNREAD
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: GET COUNT MESSAGE UNREAD
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_getCountMessUnread') 
BEGIN
	DROP PROC sp_ISO_SMS_getCountMessUnread
END
GO
CREATE PROC sp_ISO_SMS_getCountMessUnread	
AS
BEGIN
	SELECT COUNT(*) FROM HopThuDen WHERE Tinh_Trang = 0
END

--declare @i int 
--exec sp_ISO_SMS_getCountMessUnread @i output
--print @i
GO

--sp_ISO_SMS_getCumCuPhap.sql
/***********************************************************
* Purpose : SELECT 1 CUM CU PHAP 
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: SELECT 1 CUM CU PHAP
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_getCumCuPhap') 
BEGIN
	DROP PROC sp_ISO_SMS_getCumCuPhap
END
GO
CREATE PROC sp_ISO_SMS_getCumCuPhap
	@cumCuPhap		nvarchar(100)
AS
BEGIN
	SELECT * 

	FROM cuphap 

	WHERE cum_tu_1 + cum_tu_2 + cum_tu_3 + 
	cum_tu_4 + cum_tu_5 + cum_tu_6 + cum_tu_7 +
	cum_tu_8 + cum_tu_9 + cum_tu_10 = @cumCuPhap
END
GO

--sp_ISO_SMS_getDiemByMaSinhVienNHocKi.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_getDiemByMaSinhVienNHocKi')
BEGIN
	DROP PROC sp_ISO_SMS_getDiemByMaSinhVienNHocKi
END
GO
CREATE PROC sp_ISO_SMS_getDiemByMaSinhVienNHocKi
	@MaSinhVien		varchar(50),
	@HocKi			varchar(10)
AS
BEGIN
	IF @HocKi = 'ALL'
	BEGIN
		SELECT		D.Ten_Mon_Hoc , F.Ten_Bai_Kiem_Tra + '/' + G.Ten_Hinh_Thuc AS 'Ten vs Hinh Thuc KT',A.Diem,J.Hoc_Ki		
		FROM		ChiTietDiem		AS A
		INNER JOIN	DangKyMonHoc	AS B	ON A.Ma_Dang_Ky_Mon_Hoc = B.ID
		INNER JOIN	MonHocTKB		AS C	ON B.Ma_Mon_Hoc_TKB = C.ID
		INNER JOIN	MonHoc			AS D	ON C.Ma_Mon_Hoc = D.ID	
		INNER JOIN	ThanhVien		AS H	ON B.Ma_Hoc_Vien = H.ID
		INNER JOIN	ThoiKhoaBieu	AS J	ON C.Ma_TKB = J.ID
		INNER JOIN	BaiKiemTra		AS E	ON A.Ma_Bai_Kiem_Tra = E.ID AND C.Ma_mon_Hoc = E.Ma_Mon_Hoc
		INNER JOIN	TenBaiKiemTra	AS F	ON E.Ma_Bai_Kiem_Tra = F.ID
		INNER JOIN	HinhThuc		AS G	ON E.Ma_Hinh_Thuc = G.ID
		WHERE	H.Ten_DN = @MaSinhVien
	END
	ELSE
	BEGIN
		SELECT		D.Ten_Mon_Hoc , F.Ten_Bai_Kiem_Tra + '/' + G.Ten_Hinh_Thuc AS 'Ten vs Hinh Thuc KT',A.Diem,J.Hoc_Ki			
		FROM		ChiTietDiem		AS A
		INNER JOIN	DangKyMonHoc	AS B	ON A.Ma_Dang_Ky_Mon_Hoc = B.ID
		INNER JOIN	MonHocTKB		AS C	ON B.Ma_Mon_Hoc_TKB = C.ID
		INNER JOIN	MonHoc			AS D	ON C.Ma_Mon_Hoc = D.ID	
		INNER JOIN	ThanhVien		AS H	ON B.Ma_Hoc_Vien = H.ID
		INNER JOIN	ThoiKhoaBieu	AS J	ON C.Ma_TKB = J.ID
		INNER JOIN	BaiKiemTra		AS E	ON A.Ma_Bai_Kiem_Tra = E.ID AND C.Ma_mon_Hoc = E.Ma_Mon_Hoc
		INNER JOIN	TenBaiKiemTra	AS F	ON E.Ma_Bai_Kiem_Tra = F.ID
		INNER JOIN	HinhThuc		AS G	ON E.Ma_Hinh_Thuc = G.ID
		WHERE	H.Ten_DN = @MaSinhVien
		AND		J.Hoc_Ki = @HocKi
	END
END

--exec sp_ISO_SMS_getDiemByMaSinhVienNHocKi 'bai_ls.hv','ALL'
GO

--sp_ISO_SMS_getDiemByMaSinhVienNNamHoc.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_getDiemByMaSinhVienNNamHoc')
BEGIN
	DROP PROC sp_ISO_SMS_getDiemByMaSinhVienNNamHoc
END
GO
CREATE PROC sp_ISO_SMS_getDiemByMaSinhVienNNamHoc
	@MaSinhVien		varchar(50),
	@NamHoc			varchar(10)
AS
BEGIN
	SELECT		D.Ten_Mon_Hoc , F.Ten_Bai_Kiem_Tra + '/' + G.Ten_Hinh_Thuc AS 'Ten vs Hinh Thuc KT',A.Diem,J.Hoc_Ki
	FROM		ChiTietDiem		AS A
	INNER JOIN	DangKyMonHoc	AS B	ON A.Ma_Dang_Ky_Mon_Hoc = B.ID
	INNER JOIN	MonHocTKB		AS C	ON B.Ma_Mon_Hoc_TKB = C.ID
	INNER JOIN	MonHoc			AS D	ON C.Ma_Mon_Hoc = D.ID	
	INNER JOIN	ThanhVien		AS H	ON B.Ma_Hoc_Vien = H.ID
	INNER JOIN	ThoiKhoaBieu	AS J	ON C.Ma_TKB = J.ID
	INNER JOIN	BaiKiemTra		AS E	ON A.Ma_Bai_Kiem_Tra = E.ID AND C.Ma_mon_Hoc = E.Ma_Mon_Hoc
	INNER JOIN	TenBaiKiemTra	AS F	ON E.Ma_Bai_Kiem_Tra = F.ID
	INNER JOIN	HinhThuc		AS G	ON E.Ma_Hinh_Thuc = G.ID
	WHERE	H.Ten_DN = @MaSinhVien
	AND		(CAST(DATEPART(YEAR,C.Ngay_Bat_Dau_LT) AS VARCHAR) = @NamHoc OR CAST(DATEPART(YEAR,C.Ngay_Bat_Dau_TH) AS VARCHAR) = @NamHoc)
END

--exec sp_ISO_SMS_getDiemByMaSinhVienNNamHoc 'bai_ls.hv','2010'


GO

--sp_ISO_SMS_getDiemByMaSinhVienNTenMonHoc.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_getDiemByMaSinhVienNTenMonHoc')
BEGIN
	DROP PROC sp_ISO_SMS_getDiemByMaSinhVienNTenMonHoc
END
GO
CREATE PROC sp_ISO_SMS_getDiemByMaSinhVienNTenMonHoc
	@MaSinhVien		varchar(50),
	@IDMonHoc		int
AS
BEGIN
	SELECT		D.Ten_Mon_Hoc , F.Ten_Bai_Kiem_Tra + '/' + G.Ten_Hinh_Thuc AS 'Ten vs Hinh Thuc KT',A.Diem,J.Hoc_Ki
	FROM		ChiTietDiem		AS A
	INNER JOIN	DangKyMonHoc	AS B	ON A.Ma_Dang_Ky_Mon_Hoc = B.ID
	INNER JOIN	MonHocTKB		AS C	ON B.Ma_Mon_Hoc_TKB = C.ID
	INNER JOIN	MonHoc			AS D	ON C.Ma_Mon_Hoc = D.ID	
	INNER JOIN	ThanhVien		AS H	ON B.Ma_Hoc_Vien = H.ID
	INNER JOIN	ThoiKhoaBieu	AS J	ON C.Ma_TKB = J.ID
	INNER JOIN	BaiKiemTra		AS E	ON A.Ma_Bai_Kiem_Tra = E.ID AND C.Ma_mon_Hoc = E.Ma_Mon_Hoc
	INNER JOIN	TenBaiKiemTra	AS F	ON E.Ma_Bai_Kiem_Tra = F.ID
	INNER JOIN	HinhThuc		AS G	ON E.Ma_Hinh_Thuc = G.ID
	WHERE	H.Ten_DN = @MaSinhVien
	AND		C.Ma_Mon_Hoc = @IDMonHoc 
END

--exec sp_ISO_SMS_getDiemByMaSinhVienNTenMonHoc 'bai_ls.hv',15


--select * from chitietthanhvien where ten_dang_nhap = 'bai_ls.hv'
--select * from thanhvien where ten_dn = 'bai_ls.hv'
--select * from LopHoc where id=0
--select * from thoikhoabieu where ma_lop = 0
--select * from chitiettkb where ma_tkb = 3
--select * from MonHoctkb where ma_tkb = 3
--select * from DangKyMonHoc where ma_mon_hoc_tkb = 16 and ma_hoc_vien = 51
--
--select * from ChiTietDiem where ma_dang_ky_mon_hoc = 250
--select * from DangKyMonHoc where ma_hoc_vien = 51
--select * from MonHocTKB where id = 19
--select * from MonHoc where id = 18
--
--select * from MonHoc where id= 17
--select * from baikiemtra where id = 64
--
--Select * from baikiemtra where ma_mon_hoc = 19
--select * from TenBaiKiemTra
GO

--sp_ISO_SMS_getDiemTatCaMonHocTrongHocKiHienTaiByMaSinhVien.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_getDiemTatCaMonHocTrongHocKiHienTaiByMaSinhVien')
BEGIN
	DROP PROC sp_ISO_SMS_getDiemTatCaMonHocTrongHocKiHienTaiByMaSinhVien
END
GO
CREATE PROC sp_ISO_SMS_getDiemTatCaMonHocTrongHocKiHienTaiByMaSinhVien
	@MaSinhVien		varchar(50)
AS
BEGIN
	DECLARE @HocKi	int
	SET @HocKi = (	SELECT C.Hoc_Ki
					FROM		ChiTietThanhVien	AS A
					INNER JOIN	LopHoc				AS B	ON A.Ma_Lop_Hoc = B.ID
					INNER JOIN	ThoiKhoaBieu		AS C	ON C.Ma_Lop  = B.ID 		 
					WHERE	A.Ten_Dang_Nhap = @MaSinhVien
					AND		GETDATE() BETWEEN C.Ngay_Bat_Dau AND C.Ngay_Ket_Thuc
				)
	IF @HocKi <> ''
	BEGIN 
		SELECT		D.Ten_Mon_Hoc , F.Ten_Bai_Kiem_Tra + '/' + G.Ten_Hinh_Thuc AS 'Ten vs Hinh Thuc KT',A.Diem ,J.Hoc_Ki			
		FROM		ChiTietDiem		AS A
		INNER JOIN	DangKyMonHoc	AS B	ON A.Ma_Dang_Ky_Mon_Hoc = B.ID
		INNER JOIN	MonHocTKB		AS C	ON B.Ma_Mon_Hoc_TKB = C.ID
		INNER JOIN	MonHoc			AS D	ON C.Ma_Mon_Hoc = D.ID	
		INNER JOIN	ThanhVien		AS H	ON B.Ma_Hoc_Vien = H.ID
		INNER JOIN	ThoiKhoaBieu	AS J	ON C.Ma_TKB = J.ID
		INNER JOIN	BaiKiemTra		AS E	ON A.Ma_Bai_Kiem_Tra = E.ID AND C.Ma_mon_Hoc = E.Ma_Mon_Hoc
		INNER JOIN	TenBaiKiemTra	AS F	ON E.Ma_Bai_Kiem_Tra = F.ID
		INNER JOIN	HinhThuc		AS G	ON E.Ma_Hinh_Thuc = G.ID
		WHERE	H.Ten_DN = @MaSinhVien
		AND		J.Hoc_Ki = @HocKi
	END
END

--exec sp_ISO_SMS_getDiemTatCaMonHocTrongHocKiHienTaiByMaSinhVien 'bai_ls.hv'
GO

--sp_ISO_SMS_getNewMessInbox.sql
/***********************************************************
* Purpose : SELECT NEW MESSAGE INBOX
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: GET NEW MESSAGE INBOX
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_getNewMessInbox') 
BEGIN
	DROP PROC sp_ISO_SMS_getNewMessInbox
END
GO
CREATE PROC sp_ISO_SMS_getNewMessInbox
	@newMess	int
AS
BEGIN
	SELECT TOP (@newMess) So_Dien_Thoai,Noi_Dung_Tin_Nhan FROM HopThuDen ORDER BY ID DESC
END

--exec sp_ISO_SMS_getNewMessInbox 2
GO

--sp_ISO_SMS_getTKBByMaSinhVienNHocKi.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_getTKBByMaSinhVienNHocKi')
BEGIN
	DROP PROC sp_ISO_SMS_getTKBByMaSinhVienNHocKi
END
GO
CREATE PROC sp_ISO_SMS_getTKBByMaSinhVienNHocKi
	@MaSinhVien		varchar(50),
	@HocKi			varchar(10)
AS
BEGIN
	IF @HocKi = 'ALL'
	BEGIN
		SELECT		A.Buoi,CAST(DATEPART(DAY,A.Ngay_Hoc) AS VARCHAR)+'/'+CAST(DATEPART(MONTH,A.Ngay_Hoc) AS VARCHAR)+'/'+CAST(DATEPART(YEAR,A.Ngay_Hoc) AS VARCHAR) AS 'Ngay_Hoc',
					B.Hoc_Ki,J.Ki_Hieu_Phong,E.Ten_Mon_hoc,A.Hinh_Thuc_Day,G.Ho+' '+G.Ten_Lot+' '+G.Ten AS 'Giao Vien'
		FROM		ChiTietTKB	AS A 
		INNER JOIN	ThoiKhoaBieu		AS B	ON A.Ma_TKB = B.ID
		INNER JOIN	LopHoc				AS C	ON B.Ma_Lop = C.ID
		INNER JOIN	ChiTietThanhVien	AS H	ON H.Ma_Lop_Hoc = C.ID
		INNER JOIN	MonHocTKB			AS D	ON A.Ma_Mon_Hoc_TKB = D.ID AND A.Ma_TKB = D.Ma_TKB
		INNER JOIN	MonHoc				AS E	ON D.Ma_Mon_Hoc = E.ID
		INNER JOIN	ThanhVien			AS F	ON D.Ma_Giao_Vien = F.ID
		INNER JOIN	ChiTietThanhVien	AS G	ON F.Ten_DN = G.Ten_Dang_Nhap
		INNER JOIN	PhongBan			AS J	ON A.Ma_Phong = J.ID
		WHERE		H.Ten_Dang_Nhap = @MaSinhVien
	END
	ELSE
	BEGIN
		SELECT		A.Buoi,CAST(DATEPART(DAY,A.Ngay_Hoc) AS VARCHAR)+'/'+CAST(DATEPART(MONTH,A.Ngay_Hoc) AS VARCHAR)+'/'+CAST(DATEPART(YEAR,A.Ngay_Hoc) AS VARCHAR) AS 'Ngay_Hoc',
					B.Hoc_Ki,J.Ki_Hieu_Phong,E.Ten_Mon_hoc,A.Hinh_Thuc_Day,G.Ho+' '+G.Ten_Lot+' '+G.Ten AS 'Giao Vien'
		FROM		ChiTietTKB	AS A 
		INNER JOIN	ThoiKhoaBieu		AS B	ON A.Ma_TKB = B.ID
		INNER JOIN	LopHoc				AS C	ON B.Ma_Lop = C.ID
		INNER JOIN	ChiTietThanhVien	AS H	ON H.Ma_Lop_Hoc = C.ID
		INNER JOIN	MonHocTKB			AS D	ON A.Ma_Mon_Hoc_TKB = D.ID AND A.Ma_TKB = D.Ma_TKB
		INNER JOIN	MonHoc				AS E	ON D.Ma_Mon_Hoc = E.ID
		INNER JOIN	ThanhVien			AS F	ON D.Ma_Giao_Vien = F.ID
		INNER JOIN	ChiTietThanhVien	AS G	ON F.Ten_DN = G.Ten_Dang_Nhap
		INNER JOIN	PhongBan			AS J	ON A.Ma_Phong = J.ID
		WHERE		H.Ten_Dang_Nhap = @MaSinhVien
		AND			B.Hoc_Ki = @HocKi		
	END
END

--exec sp_ISO_SMS_getTKBByMaSinhVienNHocKi 'bai_ls.hv','1'
GO

--sp_ISO_SMS_getTKBByMaSinhVienNNamHoc.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_getTKBByMaSinhVienNNamHoc')
BEGIN
	DROP PROC sp_ISO_SMS_getTKBByMaSinhVienNNamHoc
END
GO
CREATE PROC sp_ISO_SMS_getTKBByMaSinhVienNNamHoc
	@MaSinhVien		varchar(50),
	@NamHoc			varchar(10)
AS
BEGIN
	SELECT		A.Buoi,CAST(DATEPART(DAY,A.Ngay_Hoc) AS VARCHAR)+'/'+CAST(DATEPART(MONTH,A.Ngay_Hoc) AS VARCHAR)+'/'+CAST(DATEPART(YEAR,A.Ngay_Hoc) AS VARCHAR) AS 'Ngay Hoc',
				B.Hoc_Ki,J.Ki_Hieu_Phong,E.Ten_Mon_hoc,A.Hinh_Thuc_Day,G.Ho+' '+G.Ten_Lot+' '+G.Ten AS 'Giao Vien' 
	FROM		ChiTietTKB	AS A 
	INNER JOIN	ThoiKhoaBieu		AS B	ON A.Ma_TKB = B.ID
	INNER JOIN	LopHoc				AS C	ON B.Ma_Lop = C.ID
	INNER JOIN	ChiTietThanhVien	AS H	ON H.Ma_Lop_Hoc = C.ID
	INNER JOIN	MonHocTKB			AS D	ON A.Ma_Mon_Hoc_TKB = D.ID AND A.Ma_TKB = D.Ma_TKB
	INNER JOIN	MonHoc				AS E	ON D.Ma_Mon_Hoc = E.ID
	INNER JOIN	ThanhVien			AS F	ON D.Ma_Giao_Vien = F.ID
	INNER JOIN	ChiTietThanhVien	AS G	ON F.Ten_DN = G.Ten_Dang_Nhap
	INNER JOIN	PhongBan			AS J	ON A.Ma_Phong = J.ID
	WHERE		H.Ten_Dang_Nhap = @MaSinhVien
	AND			CAST(DATEPART(YEAR,A.Ngay_Hoc) AS VARCHAR) = @NamHoc
END

--exec sp_ISO_SMS_getTKBByMaSinhVienNNamHoc 'bai_ls.hv','2010'

--select * from chitietthanhvien where ten_dang_nhap = 'bai_ls.hv'
--select * From thoikhoabieu where ma_lop = 0
--select * from chitietTKB where ma_tkb = 2 and CAST(DATEPART(YEAR,Ngay_Hoc) AS VARCHAR) = '2010'
GO

--sp_ISO_SMS_insertMessInbox.sql
/***********************************************************
* Purpose : INSERT HOPTHUDEN
* Author : Nguyen VAN NUOI
* Date: 8 -3 - 2011
* Description: INSERT HOPTHUDEN
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_insertMessInbox' ) 
BEGIN
	DROP PROC sp_ISO_SMS_insertMessInbox
END
GO
CREATE PROC sp_ISO_SMS_insertMessInbox
	@So_Dien_Thoai			varchar(20),
	@Ma_Cu_Phap				int,
	@Noi_Dung_Tin_Nhan		nvarchar(500),
	@Tinh_Trang				int,
	@Loai_Hop_Thu			int,
	@Ma_Tin_Nhan_Tra_Loi	int,
	@User1					varchar(max),
	@User2					varchar(max),
	@User3					varchar(max),
	@User4					varchar(max),
	@User5					varchar(max)	
	
AS 
BEGIN
	DECLARE @Ngay_Nhan				datetime
	DECLARE	@Ngay_Cap_Nhat_Cuoi		datetime

	SET	@Ngay_Cap_Nhat_Cuoi = GETDATE()
	SET	@Ngay_Nhan = GETDATE()

	INSERT INTO HopThuDen 
	VALUES (@So_Dien_Thoai,
			@Ma_Cu_Phap,
			@Noi_Dung_Tin_Nhan,
			@Tinh_Trang,
			@Loai_Hop_Thu,
			@Ma_Tin_Nhan_Tra_Loi,
			@Ngay_Nhan,
			@Ngay_cap_nhat_cuoi,
			@User1,
			@User2,
			@User3,
			@User4,
			@User5)
END 
GO

--sp_ISO_SMS_insertMessSent.sql
/***********************************************************
* Purpose : INSERT HOP THU DI
* Author : NGUYEN CHI TAM
* Date: 9-3-2011
* Description: INSERT HOP THU DI
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_insertMessSent' ) 
BEGIN
	DROP PROC sp_ISO_SMS_insertMessSent
END
GO
CREATE PROC sp_ISO_SMS_insertMessSent
	@So_Dien_Thoai			varchar(40),
	@Noi_Dung_Tin_Nhan		nvarchar(max),
	@Tinh_Trang				int,
	@Loai_Hop_Thu			int,
	@User1					varchar(100),
	@User2					varchar(100),
	@User3					varchar(100), 
	@User4					varchar(100),
	@User5					varchar(100)	
	
AS 
BEGIN
	DECLARE @Ngay_Gui				datetime
	DECLARE	@Ngay_Cap_Nhat_Cuoi		datetime

	SET	@Ngay_Cap_Nhat_Cuoi = GETDATE()
	SET	@Ngay_Gui = GETDATE()
	INSERT INTO HopThuDi 
	VALUES (@So_Dien_Thoai,
			@Noi_Dung_Tin_Nhan,
			@Tinh_Trang,
			@Loai_Hop_Thu,
			@Ngay_Gui,
			@Ngay_Cap_Nhat_Cuoi,
			@User1,
			@User2,
			@User3,
			@User4,
			@User5)
END

-- exec sp_SMS_InertHopThuDi '0975587553',,'abc',1,6,'','','','',''

GO

--sp_ISO_SMS_removeMessInbox.sql
/***********************************************************
* Purpose : REMOVE MESSAGE INBOX
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: REMOVE MESSAGE INBOX
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_removeMessInbox') 
BEGIN
	DROP PROC sp_ISO_SMS_removeMessInbox
END
GO
CREATE PROC sp_ISO_SMS_removeMessInbox
	@ID		int
AS
BEGIN
	DELETE HopThuDen 

	WHERE id = @ID
END
GO

--sp_ISO_SMS_removeMessSent.sql
/***********************************************************
* Purpose : REMOVE MESSAGE SENT
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: REMOVE MESSAGE SENT
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_removeMessSent') 
BEGIN
	DROP PROC sp_ISO_SMS_removeMessSent
END
GO
CREATE PROC sp_ISO_SMS_removeMessSent
	@ID		int
AS
BEGIN
	DELETE HopThuDi 

	WHERE id = @ID
END
GO

--sp_ISO_SMS_searchNormalMessByNoiDungTinNhan.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchNormalMessByNoiDungTinNhan')
BEGIN
	DROP PROC sp_ISO_SMS_searchNormalMessByNoiDungTinNhan
END
GO
CREATE PROC sp_ISO_SMS_searchNormalMessByNoiDungTinNhan
	@NoiDungTinNhan		varchar(max)
AS
BEGIN
	IF @NoiDungTinNhan = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllNormalMessInbox
	END
	ELSE
	BEGIN
		SELECT	A.ID,A.So_dien_thoai,A.Noi_dung_tin_nhan,
				dbo.statusToString(A.Tinh_trang) AS 'Tinh_trang',
				A.Ngay_nhan,dbo.fnc_ISO_SMS_statusReply(A.Ma_Tin_Nhan_Tra_Loi) AS 'Tinh_trang_Tra_loi'

		FROM HopThuDen AS A 

		WHERE	A.Loai_hop_thu = 2 
		AND		A.tinh_trang != 3
		AND		A.Noi_Dung_Tin_Nhan LIKE '%'+@NoiDungTinNhan+'%'

		ORDER BY A.Tinh_trang ASC , A.id DESC
	END
END

--EXEC sp_ISO_SMS_searchNormalMessByNoiDungTinNhan 'test'
GO

--sp_ISO_SMS_searchNormalMessBySoDienThoai.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchNormalMessBySoDienThoai')
BEGIN
	DROP PROC sp_ISO_SMS_searchNormalMessBySoDienThoai
END
GO
CREATE PROC sp_ISO_SMS_searchNormalMessBySoDienThoai
	@SoDienThoai		varchar(20)
AS
BEGIN
	IF @SoDienThoai = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllNormalMessInbox
	END
	ELSE
	BEGIN
		SELECT	A.ID,A.So_dien_thoai,A.Noi_dung_tin_nhan,
				dbo.statusToString(A.Tinh_trang) AS 'Tinh_trang',
				A.Ngay_nhan,dbo.fnc_ISO_SMS_statusReply(A.Ma_Tin_Nhan_Tra_Loi) AS 'Tinh_trang_Tra_loi'

		FROM HopThuDen AS A 

		WHERE	A.Loai_hop_thu = 2 
		AND		A.tinh_trang != 3
		AND		A.So_dien_thoai LIKE '%'+@SoDienThoai+'%'

		ORDER BY A.Tinh_trang ASC , A.id DESC
	END
END

--EXEC sp_ISO_SMS_searchNormalMessBySoDienThoai '34'
GO

--sp_ISO_SMS_searchNormalMessDeletedByNoiDungTinNhan.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchNormalMessDeletedByNoiDungTinNhan')
BEGIN
	DROP PROC sp_ISO_SMS_searchNormalMessDeletedByNoiDungTinNhan
END
GO
CREATE PROC sp_ISO_SMS_searchNormalMessDeletedByNoiDungTinNhan
	@NoiDungTinNhan		varchar(max)
AS
BEGIN
	IF @NoiDungTinNhan = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllNormalMessDeletedInbox
	END
	ELSE
	BEGIN
		SELECT	ID,So_dien_thoai,Noi_dung_tin_nhan,Ngay_nhan,
				dbo.fnc_ISO_SMS_statusReply(Ma_Tin_Nhan_Tra_Loi) AS 'Tinh_trang_Tra_loi'

		FROM HopThuDen  

		WHERE	Loai_hop_thu = 2 AND tinh_trang = 3
		AND		Noi_Dung_Tin_Nhan LIKE '%'+@NoiDungTinNhan+'%'

		ORDER BY ngay_cap_nhat_cuoi ASC , id DESC
	END
END

--EXEC sp_ISO_SMS_searchNormalMessDeletedBySoDienThoai '3'
GO

--sp_ISO_SMS_searchNormalMessDeletedBySoDienThoai.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchNormalMessDeletedBySoDienThoai')
BEGIN
	DROP PROC sp_ISO_SMS_searchNormalMessDeletedBySoDienThoai
END
GO
CREATE PROC sp_ISO_SMS_searchNormalMessDeletedBySoDienThoai
	@SoDienThoai		varchar(20)
AS
BEGIN
	IF @SoDienThoai = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllNormalMessDeletedInbox
	END
	ELSE
	BEGIN
		SELECT	ID,So_dien_thoai,Noi_dung_tin_nhan,Ngay_nhan,
				dbo.fnc_ISO_SMS_statusReply(Ma_Tin_Nhan_Tra_Loi) AS 'Tinh_trang_Tra_loi'

		FROM HopThuDen  

		WHERE	Loai_hop_thu = 2 AND tinh_trang = 3
		AND		So_dien_thoai LIKE '%'+@SoDienThoai+'%'

		ORDER BY ngay_cap_nhat_cuoi ASC , id DESC
	END
END

--EXEC sp_ISO_SMS_searchNormalMessDeletedBySoDienThoai '3'
GO

--sp_ISO_SMS_searchNormalMessDeletedSentByNoiDungTinNhan.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchNormalMessDeletedSentByNoiDungTinNhan')
BEGIN
	DROP PROC sp_ISO_SMS_searchNormalMessDeletedSentByNoiDungTinNhan
END
GO
CREATE PROC sp_ISO_SMS_searchNormalMessDeletedSentByNoiDungTinNhan
	@NoiDungTinNhan		varchar(max)
AS
BEGIN
	IF @NoiDungTinNhan = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllNormalMessDeletedSent
	END
	ELSE
	BEGIN
		SELECT id,so_dien_thoai,noi_dung_tin_nhan,ngay_gui 

		FROM HopThuDi 

		WHERE tinh_trang = 3 AND loai_hop_thu = 6
		AND		Noi_Dung_Tin_Nhan LIKE '%'+@NoiDungTinNhan+'%'

		ORDER BY id DESC
	END
END

--EXEC sp_ISO_SMS_searchNormalMessDeletedSentByNoiDungTinNhan '34'
GO

--sp_ISO_SMS_searchNormalMessDeletedSentBySoDienThoai.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchNormalMessDeletedSentBySoDienThoai')
BEGIN
	DROP PROC sp_ISO_SMS_searchNormalMessDeletedSentBySoDienThoai
END
GO
CREATE PROC sp_ISO_SMS_searchNormalMessDeletedSentBySoDienThoai
	@SoDienThoai		varchar(20)
AS
BEGIN
	IF @SoDienThoai = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllNormalMessDeletedSent
	END
	ELSE
	BEGIN
		SELECT id,so_dien_thoai,noi_dung_tin_nhan,ngay_gui 

		FROM HopThuDi 

		WHERE tinh_trang = 3 AND loai_hop_thu = 6
		AND		So_dien_thoai LIKE '%'+@SoDienThoai+'%'


		ORDER BY id DESC
	END
END

--EXEC sp_ISO_SMS_searchNormalMessDeletedSentBySoDienThoai '34'
GO

--sp_ISO_SMS_searchNormalMessErrorSentByNoiDungTinNhan.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchNormalMessErrorSentByNoiDungTinNhan')
BEGIN
	DROP PROC sp_ISO_SMS_searchNormalMessErrorSentByNoiDungTinNhan
END
GO
CREATE PROC sp_ISO_SMS_searchNormalMessErrorSentByNoiDungTinNhan
	@NoiDungTinNhan		varchar(max)
AS
BEGIN
	IF @NoiDungTinNhan = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllNormalMessErrorSent
	END
	ELSE
	BEGIN
		SELECT id,so_dien_thoai,noi_dung_tin_nhan,ngay_gui 

		FROM HopThuDi 
	
		WHERE tinh_trang = 0 AND loai_hop_thu = 6
		AND		Noi_Dung_Tin_Nhan LIKE '%'+@NoiDungTinNhan+'%'

		ORDER BY id DESC
	END
END

--EXEC sp_ISO_SMS_searchNormalMessErrorSentByNoiDungTinNhan '34'
GO

--sp_ISO_SMS_searchNormalMessErrorSentBySoDienThoai.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchNormalMessErrorSentBySoDienThoai')
BEGIN
	DROP PROC sp_ISO_SMS_searchNormalMessErrorSentBySoDienThoai
END
GO
CREATE PROC sp_ISO_SMS_searchNormalMessErrorSentBySoDienThoai
	@SoDienThoai		varchar(20)
AS
BEGIN
	IF @SoDienThoai = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllNormalMessErrorSent
	END
	ELSE
	BEGIN
		SELECT id,so_dien_thoai,noi_dung_tin_nhan,ngay_gui 

		FROM HopThuDi 
	
		WHERE tinh_trang = 0 AND loai_hop_thu = 6
		AND		So_dien_thoai LIKE '%'+@SoDienThoai+'%'

		ORDER BY id DESC
	END
END

--EXEC sp_ISO_SMS_searchNormalMessErrorSentBySoDienThoai '34'
GO

--sp_ISO_SMS_searchNormalMessSentByNoiDungTinNhan.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchNormalMessSentByNoiDungTinNhan')
BEGIN
	DROP PROC sp_ISO_SMS_searchNormalMessSentByNoiDungTinNhan
END
GO
CREATE PROC sp_ISO_SMS_searchNormalMessSentByNoiDungTinNhan
	@NoiDungTinNhan		varchar(max)
AS
BEGIN
	IF @NoiDungTinNhan = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllNormalMessSent
	END
	ELSE
	BEGIN
		SELECT id,so_dien_thoai,noi_dung_tin_nhan,ngay_gui 

		FROM hopthudi 
	
		WHERE	tinh_trang = 1 AND loai_hop_thu = 6 
		AND		Noi_Dung_Tin_Nhan LIKE '%'+@NoiDungTinNhan+'%'

		ORDER BY id DESC

		

	END
END

--EXEC sp_ISO_SMS_searchNormalMessSentByNoiDungTinNhan '34'
GO

--sp_ISO_SMS_searchNormalMessSentBySoDienThoai.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchNormalMessSentBySoDienThoai')
BEGIN
	DROP PROC sp_ISO_SMS_searchNormalMessSentBySoDienThoai
END
GO
CREATE PROC sp_ISO_SMS_searchNormalMessSentBySoDienThoai
	@SoDienThoai		varchar(20)
AS
BEGIN
	IF @SoDienThoai = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllNormalMessSent
	END
	ELSE
	BEGIN
		SELECT id,so_dien_thoai,noi_dung_tin_nhan,ngay_gui 

		FROM hopthudi 
	
		WHERE	tinh_trang = 1 AND loai_hop_thu = 6 
		AND		So_dien_thoai LIKE '%'+@SoDienThoai+'%'

		ORDER BY id DESC

		

	END
END

--EXEC sp_ISO_SMS_searchNormalMessSentBySoDienThoai '34'
GO

--sp_ISO_SMS_searchSyntaxMessByCuPhap.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchSyntaxMessByCuPhap')
BEGIN
	DROP PROC sp_ISO_SMS_searchSyntaxMessByCuPhap
END
GO
CREATE PROC sp_ISO_SMS_searchSyntaxMessByCuPhap
	@CuPhap		varchar(100)
AS
BEGIN
	IF @CuPhap = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllSyntaxMessInbox
	END
	ELSE
	BEGIN
		SELECT	A.ID,A.So_dien_thoai,A.Noi_dung_tin_nhan,
				B.Cum_tu_1+' '+B.Cum_tu_2+' '+B.Cum_tu_3+
				' '+B.Cum_tu_4+' '+B.Cum_tu_5+' '+B.Cum_tu_6 +
				' '+B.Cum_tu_7 +' '+B.Cum_tu_8 +' '+B.Cum_tu_9 +
				' '+B.Cum_tu_10  AS 'Cu_phap'
				,dbo.statusToString(A.Tinh_trang) AS 'Tinh_trang',
				A.Ngay_nhan,dbo.fnc_ISO_SMS_statusReply(A.Ma_Tin_Nhan_Tra_Loi) AS 'Tinh_trang_Tra_loi'
		FROM HopThuDen AS A 

		INNER JOIN CuPhap AS B
		ON A.Ma_cu_phap = B.ID

		WHERE	A.Loai_hop_thu = 0 
		AND		A.tinh_trang != 3
		AND		B.Cum_tu_1+' '+B.Cum_tu_2+' '+B.Cum_tu_3+
				' '+B.Cum_tu_4+' '+B.Cum_tu_5+' '+B.Cum_tu_6 +
				' '+B.Cum_tu_7 +' '+B.Cum_tu_8 +' '+B.Cum_tu_9 +
				' '+B.Cum_tu_10 LIKE '%'+@CuPhap+'%'
		ORDER BY A.tinh_trang ASC,A.id DESC
	END
END

--EXEC sp_ISO_SMS_searchSyntaxMessByCuPhap 'HVA'
GO

--sp_ISO_SMS_searchSyntaxMessByNbPhone.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchSyntaxMessByNbPhone')
BEGIN
	DROP PROC sp_ISO_SMS_searchSyntaxMessByNbPhone
END
GO
CREATE PROC sp_ISO_SMS_searchSyntaxMessByNbPhone
	@SoDienThoai		varchar(20)
AS
BEGIN
	IF @SoDienThoai = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllSyntaxMessInbox
	END
	ELSE
	BEGIN
		SELECT	A.ID,A.So_dien_thoai,A.Noi_dung_tin_nhan,
				B.Cum_tu_1+' '+B.Cum_tu_2+' '+B.Cum_tu_3+
				' '+B.Cum_tu_4+' '+B.Cum_tu_5+' '+B.Cum_tu_6 +
				' '+B.Cum_tu_7 +' '+B.Cum_tu_8 +' '+B.Cum_tu_9 +
				' '+B.Cum_tu_10  AS 'Cu_phap'
				,dbo.statusToString(A.Tinh_trang) AS 'Tinh_trang',
				A.Ngay_nhan,dbo.fnc_ISO_SMS_statusReply(A.Ma_Tin_Nhan_Tra_Loi) AS 'Tinh_trang_Tra_loi'
		FROM HopThuDen AS A 

		INNER JOIN CuPhap AS B
		ON A.Ma_cu_phap = B.ID

		WHERE	A.Loai_hop_thu = 0 
		AND		A.tinh_trang != 3
		AND		A.So_dien_thoai LIKE '%'+@SoDienThoai+'%'
		ORDER BY A.tinh_trang ASC,A.id DESC
	END
END

--EXEC sp_ISO_SMS_searchSyntaxMessByNbPhone '3'
GO

--sp_ISO_SMS_searchSyntaxMessByNoiDungTinNhan.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchSyntaxMessByNoiDungTinNhan')
BEGIN
	DROP PROC sp_ISO_SMS_searchSyntaxMessByNoiDungTinNhan
END
GO
CREATE PROC sp_ISO_SMS_searchSyntaxMessByNoiDungTinNhan
	@NoiDungTinNhan		varchar(max)
AS
BEGIN
	IF @NoiDungTinNhan = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllSyntaxMessInbox
	END
	ELSE
	BEGIN
		SELECT	A.ID,A.So_dien_thoai,A.Noi_dung_tin_nhan,
				B.Cum_tu_1+' '+B.Cum_tu_2+' '+B.Cum_tu_3+
				' '+B.Cum_tu_4+' '+B.Cum_tu_5+' '+B.Cum_tu_6 +
				' '+B.Cum_tu_7 +' '+B.Cum_tu_8 +' '+B.Cum_tu_9 +
				' '+B.Cum_tu_10  AS 'Cu_phap'
				,dbo.statusToString(A.Tinh_trang) AS 'Tinh_trang',
				A.Ngay_nhan,dbo.fnc_ISO_SMS_statusReply(A.Ma_Tin_Nhan_Tra_Loi) AS 'Tinh_trang_Tra_loi'
		FROM HopThuDen AS A 

		INNER JOIN CuPhap AS B
		ON A.Ma_cu_phap = B.ID

		WHERE	A.Loai_hop_thu = 0 
		AND		A.tinh_trang != 3
		AND		A.Noi_Dung_Tin_Nhan LIKE '%'+@NoiDungTinNhan+'%'
		ORDER BY A.tinh_trang ASC,A.id DESC
	END
END

--EXEC sp_ISO_SMS_searchSyntaxMessByNoiDungTinNhan ''
GO

--sp_ISO_SMS_searchSyntaxMessDeletedByCuPhap.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchSyntaxMessDeletedByCuPhap')
BEGIN
	DROP PROC sp_ISO_SMS_searchSyntaxMessDeletedByCuPhap
END
GO
CREATE PROC sp_ISO_SMS_searchSyntaxMessDeletedByCuPhap
	@CuPhap		varchar(100)
AS
BEGIN
	IF @CuPhap = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllSyntaxMessDeletedInbox
	END
	ELSE
	BEGIN
		SELECT	A.ID,A.So_dien_thoai,A.Noi_dung_tin_nhan,
			B.Cum_tu_1+' '+B.Cum_tu_2+' '+B.Cum_tu_3+
			' '+B.Cum_tu_4+' '+B.Cum_tu_5+' '+B.Cum_tu_6 +
			' '+B.Cum_tu_7 +' '+B.Cum_tu_8 +' '+B.Cum_tu_9 +
			' '+B.Cum_tu_10  AS 'Cu_phap',A.Ngay_nhan,
			dbo.fnc_ISO_SMS_statusReply(A.Ma_Tin_Nhan_Tra_Loi) AS 'Tinh_trang_Tra_loi'
	
		FROM HopThuDen AS A 

		INNER JOIN CuPhap AS B
		ON A.Ma_cu_phap = B.ID

		WHERE	A.Loai_hop_thu = 0 
		AND		A.tinh_trang = 3
		AND		B.Cum_tu_1+' '+B.Cum_tu_2+' '+B.Cum_tu_3+
				' '+B.Cum_tu_4+' '+B.Cum_tu_5+' '+B.Cum_tu_6 +
				' '+B.Cum_tu_7 +' '+B.Cum_tu_8 +' '+B.Cum_tu_9 +
				' '+B.Cum_tu_10 LIKE '%'+@CuPhap+'%'

		ORDER BY A.ngay_cap_nhat_cuoi ASC,A.id DESC
	END
END

--EXEC sp_ISO_SMS_searchSyntaxMessDeletedByNoiDungTinNhan '3'
GO

--sp_ISO_SMS_searchSyntaxMessDeletedByNbPhone.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchSyntaxMessDeletedByNbPhone')
BEGIN
	DROP PROC sp_ISO_SMS_searchSyntaxMessDeletedByNbPhone
END
GO
CREATE PROC sp_ISO_SMS_searchSyntaxMessDeletedByNbPhone
	@SoDienThoai		varchar(20)
AS
BEGIN
	IF @SoDienThoai = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllSyntaxMessDeletedInbox
	END
	ELSE
	BEGIN
		SELECT	A.ID,A.So_dien_thoai,A.Noi_dung_tin_nhan,
			B.Cum_tu_1+' '+B.Cum_tu_2+' '+B.Cum_tu_3+
			' '+B.Cum_tu_4+' '+B.Cum_tu_5+' '+B.Cum_tu_6 +
			' '+B.Cum_tu_7 +' '+B.Cum_tu_8 +' '+B.Cum_tu_9 +
			' '+B.Cum_tu_10  AS 'Cu_phap',A.Ngay_nhan,
			dbo.fnc_ISO_SMS_statusReply(A.Ma_Tin_Nhan_Tra_Loi) AS 'Tinh_trang_Tra_loi'
	
		FROM HopThuDen AS A 

		INNER JOIN CuPhap AS B
		ON A.Ma_cu_phap = B.ID

		WHERE	A.Loai_hop_thu = 0 
		AND		A.tinh_trang = 3
		AND		A.So_dien_thoai LIKE '%'+@SoDienThoai+'%'

		ORDER BY A.ngay_cap_nhat_cuoi ASC,A.id DESC
	END
END

--EXEC sp_ISO_SMS_searchSyntaxMessByNbPhone '3'
GO

--sp_ISO_SMS_searchSyntaxMessDeletedByNoiDungTinNhan.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchSyntaxMessDeletedByNoiDungTinNhan')
BEGIN
	DROP PROC sp_ISO_SMS_searchSyntaxMessDeletedByNoiDungTinNhan
END
GO
CREATE PROC sp_ISO_SMS_searchSyntaxMessDeletedByNoiDungTinNhan
	@NoiDungTinNhan		varchar(max)
AS
BEGIN
	IF @NoiDungTinNhan = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllSyntaxMessDeletedInbox
	END
	ELSE
	BEGIN
		SELECT	A.ID,A.So_dien_thoai,A.Noi_dung_tin_nhan,
			B.Cum_tu_1+' '+B.Cum_tu_2+' '+B.Cum_tu_3+
			' '+B.Cum_tu_4+' '+B.Cum_tu_5+' '+B.Cum_tu_6 +
			' '+B.Cum_tu_7 +' '+B.Cum_tu_8 +' '+B.Cum_tu_9 +
			' '+B.Cum_tu_10  AS 'Cu_phap',A.Ngay_nhan,
			dbo.fnc_ISO_SMS_statusReply(A.Ma_Tin_Nhan_Tra_Loi) AS 'Tinh_trang_Tra_loi'
	
		FROM HopThuDen AS A 

		INNER JOIN CuPhap AS B
		ON A.Ma_cu_phap = B.ID

		WHERE	A.Loai_hop_thu = 0 
		AND		A.tinh_trang = 3
		AND		A.Noi_Dung_Tin_Nhan LIKE '%'+@NoiDungTinNhan+'%'

		ORDER BY A.ngay_cap_nhat_cuoi ASC,A.id DESC
	END
END

--EXEC sp_ISO_SMS_searchSyntaxMessDeletedByNoiDungTinNhan '3'
GO

--sp_ISO_SMS_searchSyntaxMessDeletedSentByCuPhap.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchSyntaxMessDeletedSentByCuPhap')
BEGIN
	DROP PROC sp_ISO_SMS_searchSyntaxMessDeletedSentByCuPhap
END
GO
CREATE PROC sp_ISO_SMS_searchSyntaxMessDeletedSentByCuPhap
	@CuPhap		varchar(100)
AS
BEGIN
	IF @CuPhap = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllSyntaxMessDeletedSent
	END
	ELSE
	BEGIN
		SELECT	A.id,A.so_dien_thoai,A.noi_dung_tin_nhan,
			C.cum_tu_1+' '+C.cum_tu_2+' '+C.cum_tu_3+' '+C.cum_tu_4+' '+
			C.cum_tu_5+' '+C.cum_tu_6+' '+C.cum_tu_7+' '+C.cum_tu_8+' '+
			C.cum_tu_9+' '+C.cum_tu_10 AS 'Cu_Phap',A.ngay_gui 

		FROM HopThuDi AS A 
		
		INNER JOIN HopThuDen AS B
		ON B.ma_tin_nhan_tra_loi = A.id
		
		INNER JOIN CuPhap AS C
		ON B.ma_cu_phap = C.id

		WHERE A.tinh_trang = 3 AND A.loai_hop_thu = 4
		AND		C.Cum_tu_1+' '+C.Cum_tu_2+' '+C.Cum_tu_3+
				' '+C.Cum_tu_4+' '+C.Cum_tu_5+' '+C.Cum_tu_6 +
				' '+C.Cum_tu_7 +' '+C.Cum_tu_8 +' '+C.Cum_tu_9 +
				' '+C.Cum_tu_10 LIKE '%'+@CuPhap+'%'

		ORDER BY A.id DESC
	END
END

--EXEC sp_ISO_SMS_searchSyntaxMessDeletedSentByCuPhap '34'
GO

--sp_ISO_SMS_searchSyntaxMessDeletedSentByNbPhone.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchSyntaxMessDeletedSentByNbPhone')
BEGIN
	DROP PROC sp_ISO_SMS_searchSyntaxMessDeletedSentByNbPhone
END
GO
CREATE PROC sp_ISO_SMS_searchSyntaxMessDeletedSentByNbPhone
	@SoDienThoai		varchar(20)
AS
BEGIN
	IF @SoDienThoai = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllSyntaxMessDeletedSent
	END
	ELSE
	BEGIN
		SELECT	A.id,A.so_dien_thoai,A.noi_dung_tin_nhan,
			C.cum_tu_1+' '+C.cum_tu_2+' '+C.cum_tu_3+' '+C.cum_tu_4+' '+
			C.cum_tu_5+' '+C.cum_tu_6+' '+C.cum_tu_7+' '+C.cum_tu_8+' '+
			C.cum_tu_9+' '+C.cum_tu_10 AS 'Cu_Phap',A.ngay_gui 

		FROM HopThuDi AS A 
		
		INNER JOIN HopThuDen AS B
		ON B.ma_tin_nhan_tra_loi = A.id
		
		INNER JOIN CuPhap AS C
		ON B.ma_cu_phap = C.id

		WHERE A.tinh_trang = 3 AND A.loai_hop_thu = 4
		AND		A.So_dien_thoai LIKE '%'+@SoDienThoai+'%'

		ORDER BY A.id DESC
	END
END

--EXEC sp_ISO_SMS_searchSyntaxMessDeletedSentByNbPhone '34'
GO

--sp_ISO_SMS_searchSyntaxMessDeletedSentByNoiDungTinNhan.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchSyntaxMessDeletedSentByNoiDungTinNhan')
BEGIN
	DROP PROC sp_ISO_SMS_searchSyntaxMessDeletedSentByNoiDungTinNhan
END
GO
CREATE PROC sp_ISO_SMS_searchSyntaxMessDeletedSentByNoiDungTinNhan
	@NoiDungTinNhan		varchar(max)
AS
BEGIN
	IF @NoiDungTinNhan = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllSyntaxMessDeletedSent
	END
	ELSE
	BEGIN
		SELECT	A.id,A.so_dien_thoai,A.noi_dung_tin_nhan,
			C.cum_tu_1+' '+C.cum_tu_2+' '+C.cum_tu_3+' '+C.cum_tu_4+' '+
			C.cum_tu_5+' '+C.cum_tu_6+' '+C.cum_tu_7+' '+C.cum_tu_8+' '+
			C.cum_tu_9+' '+C.cum_tu_10 AS 'Cu_Phap',A.ngay_gui 

		FROM HopThuDi AS A 
		
		INNER JOIN HopThuDen AS B
		ON B.ma_tin_nhan_tra_loi = A.id
		
		INNER JOIN CuPhap AS C
		ON B.ma_cu_phap = C.id

		WHERE A.tinh_trang = 3 AND A.loai_hop_thu = 4
		AND		A.Noi_Dung_Tin_Nhan LIKE '%'+@NoiDungTinNhan+'%'

		ORDER BY A.id DESC
	END
END

--EXEC sp_ISO_SMS_searchSyntaxMessDeletedSentByNoiDungTinNhan '34'
GO

--sp_ISO_SMS_searchSyntaxMessErrorSentByCuPhap.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchSyntaxMessErrorSentByCuPhap')
BEGIN
	DROP PROC sp_ISO_SMS_searchSyntaxMessErrorSentByCuPhap
END
GO
CREATE PROC sp_ISO_SMS_searchSyntaxMessErrorSentByCuPhap
	@CuPhap		varchar(100)
AS
BEGIN
	IF @CuPhap = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllSyntaxMessErrorSent
	END
	ELSE
	BEGIN
		SELECT	A.id,A.so_dien_thoai,A.noi_dung_tin_nhan,
			C.cum_tu_1+' '+C.cum_tu_2+' '+C.cum_tu_3+' '+C.cum_tu_4+' '+
			C.cum_tu_5+' '+C.cum_tu_6+' '+C.cum_tu_7+' '+C.cum_tu_8+' '+
			C.cum_tu_9+' '+C.cum_tu_10 AS 'Cu_Phap',A.ngay_gui 

		FROM HopThuDi AS A 
	
		INNER JOIN HopThuDen AS B
		ON B.ma_tin_nhan_tra_loi = A.id
	
		INNER JOIN CuPhap AS C
		ON B.ma_cu_phap = C.id

		WHERE A.tinh_trang = 0 AND A.loai_hop_thu = 4
		AND		C.Cum_tu_1+' '+C.Cum_tu_2+' '+C.Cum_tu_3+
				' '+C.Cum_tu_4+' '+C.Cum_tu_5+' '+C.Cum_tu_6 +
				' '+C.Cum_tu_7 +' '+C.Cum_tu_8 +' '+C.Cum_tu_9 +
				' '+C.Cum_tu_10 LIKE '%'+@CuPhap+'%'
		
		ORDER BY A.id DESC
	END
END

--EXEC sp_ISO_SMS_searchSyntaxMessErrorSentByCuPhap '34'
GO

--sp_ISO_SMS_searchSyntaxMessErrorSentByNbPhone.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchSyntaxMessErrorSentByNbPhone')
BEGIN
	DROP PROC sp_ISO_SMS_searchSyntaxMessErrorSentByNbPhone
END
GO
CREATE PROC sp_ISO_SMS_searchSyntaxMessErrorSentByNbPhone
	@SoDienThoai		varchar(20)
AS
BEGIN
	IF @SoDienThoai = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllSyntaxMessErrorSent
	END
	ELSE
	BEGIN
		SELECT	A.id,A.so_dien_thoai,A.noi_dung_tin_nhan,
			C.cum_tu_1+' '+C.cum_tu_2+' '+C.cum_tu_3+' '+C.cum_tu_4+' '+
			C.cum_tu_5+' '+C.cum_tu_6+' '+C.cum_tu_7+' '+C.cum_tu_8+' '+
			C.cum_tu_9+' '+C.cum_tu_10 AS 'Cu_Phap',A.ngay_gui 

		FROM HopThuDi AS A 
	
		INNER JOIN HopThuDen AS B
		ON B.ma_tin_nhan_tra_loi = A.id
	
		INNER JOIN CuPhap AS C
		ON B.ma_cu_phap = C.id

		WHERE A.tinh_trang = 0 AND A.loai_hop_thu = 4
		AND		A.So_dien_thoai LIKE '%'+@SoDienThoai+'%'
		
		ORDER BY A.id DESC
	END
END

--EXEC sp_ISO_SMS_searchSyntaxMessErrorSentByNbPhone '34'
GO

--sp_ISO_SMS_searchSyntaxMessErrorSentByNoiDungTinNhan.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchSyntaxMessErrorSentByNoiDungTinNhan')
BEGIN
	DROP PROC sp_ISO_SMS_searchSyntaxMessErrorSentByNoiDungTinNhan
END
GO
CREATE PROC sp_ISO_SMS_searchSyntaxMessErrorSentByNoiDungTinNhan
	@NoiDungTinNhan		varchar(max)
AS
BEGIN
	IF @NoiDungTinNhan = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllSyntaxMessErrorSent
	END
	ELSE
	BEGIN
		SELECT	A.id,A.so_dien_thoai,A.noi_dung_tin_nhan,
			C.cum_tu_1+' '+C.cum_tu_2+' '+C.cum_tu_3+' '+C.cum_tu_4+' '+
			C.cum_tu_5+' '+C.cum_tu_6+' '+C.cum_tu_7+' '+C.cum_tu_8+' '+
			C.cum_tu_9+' '+C.cum_tu_10 AS 'Cu_Phap',A.ngay_gui 

		FROM HopThuDi AS A 
	
		INNER JOIN HopThuDen AS B
		ON B.ma_tin_nhan_tra_loi = A.id
	
		INNER JOIN CuPhap AS C
		ON B.ma_cu_phap = C.id

		WHERE A.tinh_trang = 0 AND A.loai_hop_thu = 4
		AND		A.Noi_Dung_Tin_Nhan LIKE '%'+@NoiDungTinNhan+'%'
		
		ORDER BY A.id DESC
	END
END

--EXEC sp_ISO_SMS_searchSyntaxMessErrorSentByNoiDungTinNhan '34'
GO

--sp_ISO_SMS_searchSyntaxMessSentByCuPhap.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchSyntaxMessSentByCuPhap')
BEGIN
	DROP PROC sp_ISO_SMS_searchSyntaxMessSentByCuPhap
END
GO
CREATE PROC sp_ISO_SMS_searchSyntaxMessSentByCuPhap
	@CuPhap		varchar(100)
AS
BEGIN
	IF @CuPhap = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllSyntaxMessSent
	END
	ELSE
	BEGIN
		SELECT	A.id,A.so_dien_thoai,A.noi_dung_tin_nhan,
				C.cum_tu_1+' '+C.cum_tu_2+' '+C.cum_tu_3+' '+C.cum_tu_4+' '+
				C.cum_tu_5+' '+C.cum_tu_6+' '+C.cum_tu_7+' '+C.cum_tu_8+' '+
				C.cum_tu_9+' '+C.cum_tu_10 AS 'Cu_Phap',A.ngay_gui 

		FROM  hopthudi AS A
	
		INNER JOIN hopthuden AS B
		ON A.id = B.ma_tin_nhan_tra_loi

		INNER JOIN cuphap AS C
		ON B.ma_cu_phap = C.id

		WHERE	A.tinh_trang = 1 AND A.loai_hop_thu = 4 
		AND		C.Cum_tu_1+' '+C.Cum_tu_2+' '+C.Cum_tu_3+
				' '+C.Cum_tu_4+' '+C.Cum_tu_5+' '+C.Cum_tu_6 +
				' '+C.Cum_tu_7 +' '+C.Cum_tu_8 +' '+C.Cum_tu_9 +
				' '+C.Cum_tu_10 LIKE '%'+@CuPhap+'%'

		ORDER BY id DESC
	END
END

--EXEC sp_ISO_SMS_searchSyntaxMessSentByCuPhap '34'
GO

--sp_ISO_SMS_searchSyntaxMessSentByNbPhone.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchSyntaxMessSentByNbPhone')
BEGIN
	DROP PROC sp_ISO_SMS_searchSyntaxMessSentByNbPhone
END
GO
CREATE PROC sp_ISO_SMS_searchSyntaxMessSentByNbPhone
	@SoDienThoai		varchar(20)
AS
BEGIN
	IF @SoDienThoai = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllSyntaxMessSent
	END
	ELSE
	BEGIN
		SELECT	A.id,A.so_dien_thoai,A.noi_dung_tin_nhan,
				C.cum_tu_1+' '+C.cum_tu_2+' '+C.cum_tu_3+' '+C.cum_tu_4+' '+
				C.cum_tu_5+' '+C.cum_tu_6+' '+C.cum_tu_7+' '+C.cum_tu_8+' '+
				C.cum_tu_9+' '+C.cum_tu_10 AS 'Cu_Phap',A.ngay_gui 

		FROM  hopthudi AS A
	
		INNER JOIN hopthuden AS B
		ON A.id = B.ma_tin_nhan_tra_loi

		INNER JOIN cuphap AS C
		ON B.ma_cu_phap = C.id

		WHERE A.tinh_trang = 1 AND A.loai_hop_thu = 4 
		AND		A.So_dien_thoai LIKE '%'+@SoDienThoai+'%'

		ORDER BY id DESC
	END
END

--EXEC sp_ISO_SMS_searchSyntaxMessSentByNbPhone '34'
GO

--sp_ISO_SMS_searchSyntaxMessSentByNoiDungTinNhan.sql
IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchSyntaxMessSentByNoiDungTinNhan')
BEGIN
	DROP PROC sp_ISO_SMS_searchSyntaxMessSentByNoiDungTinNhan
END
GO
CREATE PROC sp_ISO_SMS_searchSyntaxMessSentByNoiDungTinNhan
	@NoiDungTinNhan		varchar(max)
AS
BEGIN
	IF @NoiDungTinNhan = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllSyntaxMessSent
	END
	ELSE
	BEGIN
		SELECT	A.id,A.so_dien_thoai,A.noi_dung_tin_nhan,
				C.cum_tu_1+' '+C.cum_tu_2+' '+C.cum_tu_3+' '+C.cum_tu_4+' '+
				C.cum_tu_5+' '+C.cum_tu_6+' '+C.cum_tu_7+' '+C.cum_tu_8+' '+
				C.cum_tu_9+' '+C.cum_tu_10 AS 'Cu_Phap',A.ngay_gui 

		FROM  hopthudi AS A
	
		INNER JOIN hopthuden AS B
		ON A.id = B.ma_tin_nhan_tra_loi

		INNER JOIN cuphap AS C
		ON B.ma_cu_phap = C.id

		WHERE	A.tinh_trang = 1 AND A.loai_hop_thu = 4 
		AND		A.Noi_Dung_Tin_Nhan LIKE '%'+@NoiDungTinNhan+'%'

		ORDER BY id DESC
	END
END

--EXEC sp_ISO_SMS_searchSyntaxMessSentByNoiDungTinNhan '34'
GO

--sp_ISO_SMS_updateMaTinNhanTraLoiInbox.sql
/***********************************************************
* Purpose : UPDATE MA_TIN_NHAN_TRA_LOI = -1 INBOX TO DELETE MESS SENT 
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: UPDATE MA_TIN_NHAN_TRA_LOI = -1 INBOX TO DELETE MESS SENT
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_updateMaTinNhanTraLoiInbox') 
BEGIN
	DROP PROC sp_ISO_SMS_updateMaTinNhanTraLoiInbox
END
GO
CREATE PROC sp_ISO_SMS_updateMaTinNhanTraLoiInbox
	@ma_tin_nhan_tra_loi		int
AS
BEGIN
	UPDATE hopthuden
	
	SET ma_tin_nhan_tra_loi = null 
	
	WHERE ma_tin_nhan_tra_loi = @ma_tin_nhan_tra_loi
END
GO

--sp_ISO_SMS_updateStatusMessInbox.sql
/***********************************************************
* Purpose : UPDATE STATUS MESSAGE INBOX
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: UPDATE STATUS MESS INBOX (READ/UREAD)
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_updateStatusMessInbox') 
BEGIN
	DROP PROC sp_ISO_SMS_updateStatusMessInbox
END
GO
CREATE PROC sp_ISO_SMS_updateStatusMessInbox
	@id		int
AS
BEGIN
	UPDATE HopThuDen 

	SET tinh_trang = 1,
		ngay_cap_nhat_cuoi = GETDATE() 

	WHERE id = @id
END

GO

--sp_ISO_SMS_updateStatusResentMess.sql
/***********************************************************
* Purpose : UPDATE STATUS RESENT MESS 
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: UPDATE STATUS RESENT MESS
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_updateStatusResentMess') 
BEGIN
	DROP PROC sp_ISO_SMS_updateStatusResentMess
END
GO
CREATE PROC sp_ISO_SMS_updateStatusResentMess
	@tinh_trang		int,
	@loai_hop_thu	int,
	@id				int
AS
BEGIN
	UPDATE HopThuDi 

	SET	tinh_trang = @tinh_trang , 
		loai_hop_thu = @loai_hop_thu 

	WHERE id = @id
END
GO
