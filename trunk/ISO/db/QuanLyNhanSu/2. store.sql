
--sp_InsertChiTietCongViecThanhVien.sql
--Người Lập :	Trần Cẩm Thành
--Ngày Lập  :	06/08/2011
--Mục Đích  :	Nhập Dữ Liệu Khen Thưởng/ Kỷ Luật cho Nhân Sự

IF EXISTS (SELECT * FROM SYS.OBJECTS WHERE NAME='sp_NhanSu_InsertChiTietCongViecThanhVien')
BEGIN
	DROP PROC sp_NhanSu_InsertChiTietCongViecThanhVien
END
GO
CREATE PROC sp_NhanSu_InsertChiTietCongViecThanhVien
@Ma_nam_hoc		INT,
@Ma_thanh_vien	INT,
@Chuc_vu		INT,
@Ghi_chu		NVARCHAR(1000),
@Loai_ghi_chu	INT,
@KQ				INT OUTPUT
AS
BEGIN
	SET @KQ = -1
	IF NOT EXISTS(SELECT * FROM CHITIETCONGVIECTHANHVIEN WHERE Ma_nam_hoc=@Ma_nam_hoc AND Ma_thanh_vien=@Ma_thanh_vien AND Chuc_vu=@Chuc_vu AND Ghi_chu=@Ghi_chu AND Loai_ghi_chu=@Loai_ghi_chu)
	BEGIN
		INSERT INTO CHITIETCONGVIECTHANHVIEN(Ma_nam_hoc,Ma_thanh_vien,Chuc_vu,Ghi_chu,Loai_ghi_chu,Ngay_cap_nhat_cuoi) VALUES (@Ma_nam_hoc,@Ma_thanh_vien,@Chuc_vu,@Ghi_chu,@Loai_ghi_chu,getdate())
		SELECT @KQ=MAX(ID) FROM CHITIETCONGVIECTHANHVIEN
	END
END

GO

--sp_NhanSu_CapNhatThongTin.sql
IF EXISTS (SELECT * FROM SYS.OBJECTS WHERE NAME='sp_NhanSu_CapNhatThongTin')
BEGIN
	DROP PROC sp_NhanSu_CapNhatThongTin
END
GO
CREATE PROC sp_NhanSu_CapNhatThongTin
@ID	INT,
@Ho	NVARCHAR(40),
@Ten_lot NVARCHAR(40),
@Ten NVARCHAR(40),
@Gioi_tinh INT,
@Ngay_sinh DATETIME,
@CMND VARCHAR(15),
@Ngay_cap	DATETIME,
@Noi_cap	NVARCHAR(100),
@So_nha NVARCHAR(20),
@Duong NVARCHAR(200),
@Phuong_xa NVARCHAR(50),
@Quan_huyen NVARCHAR(50),
@Tinh_thanhpho NVARCHAR(50),
@Dien_thoai_nha VARCHAR(20),
@Email VARCHAR(40),
@Dien_thoai_dd VARCHAR(20),
@Ngay_thu_viec DATETIME,
@Ngay_vao_lam DATETIME,
@KQ	INT OUTPUT
AS
BEGIN
	SET @KQ = -1
	IF EXISTS (SELECT * FROM THANHVIEN WHERE ID=@ID)
	BEGIN
		DECLARE @Ten_dang_nhap VARCHAR(20)
		SELECT @Ten_dang_nhap=Ten_DN FROM THANHVIEN WHERE ID=@ID
		IF NOT EXISTS (SELECT * FROM HOSODUTUYEN WHERE TEN_DANG_NHAP=@Ten_dang_nhap)
		BEGIN
			INSERT INTO HOSODUTUYEN(Ten_dang_nhap,Ho,Ten_lot,Ten,Gioi_tinh,Ngay_sinh,CMND,Ngay_cap,Noi_cap,So_nha,Duong,Phuong_xa,Quan_huyen,Tinh_thanhpho,Dien_thoai_nha,Email,Dien_thoai_dd,Tinh_trang,Ngay_cap_nhat_cuoi) VALUES(@Ten_dang_nhap,@Ho,@Ten_lot,@Ten,@Gioi_tinh,@Ngay_sinh,@CMND,@Ngay_cap,@Noi_cap,@So_nha,@Duong,@Phuong_xa,@Quan_huyen,@Tinh_thanhpho,@Dien_thoai_nha,@Email,@Dien_thoai_dd,'-1',GETDATE())
			SELECT @KQ=MAX(ID) FROM HOSODUTUYEN
		END
		ELSE
		BEGIN
			UPDATE HOSODUTUYEN SET Ho=@Ho,Ten_lot=@Ten_lot,Ten=@Ten,Gioi_tinh=@Gioi_tinh,Ngay_sinh=@Ngay_sinh,CMND=@CMND,So_nha=@So_nha,Duong=@Duong,Phuong_xa=@Phuong_xa,Quan_huyen=@Quan_huyen,Tinh_thanhpho=@Tinh_thanhpho,Dien_thoai_nha=@Dien_thoai_nha,Email=@Email,Ngay_cap_nhat_cuoi=GETDATE() WHERE Ten_dang_nhap=@Ten_dang_nhap
			SELECT @KQ=MAX(ID) FROM HOSODUTUYEN WHERE Ten_dang_nhap=@Ten_dang_nhap
		END
		
		IF NOT EXISTS (SELECT * FROM DENGHIKTV WHERE Nguoi_du_tuyen=@KQ)
		BEGIN
			INSERT INTO DENGHIKTV(Nguoi_du_tuyen,Bat_dau,Tinh_trang,Ngay_cap_nhat_cuoi) VALUES(@KQ,@Ngay_thu_viec,'-1',GETDATE())
		END
		ELSE
		BEGIN
			UPDATE DENGHIKTV SET Bat_dau=@Ngay_thu_viec,Ngay_cap_nhat_cuoi=GETDATE() WHERE Nguoi_du_tuyen=@KQ
		END
		
		IF NOT EXISTS (SELECT * FROM HOPDONGLAODONG WHERE Nguoi_du_tuyen=@KQ)
		BEGIN
			INSERT INTO HOPDONGLAODONG(Nguoi_du_tuyen,Bat_dau,Tinh_trang,Ngay_cap_nhat_cuoi) VALUES(@KQ,@Ngay_vao_lam,'-1',GETDATE())
		END
		ELSE
		BEGIN
			UPDATE HOPDONGLAODONG SET Bat_dau=@Ngay_vao_lam,Ngay_cap_nhat_cuoi=GETDATE() WHERE Nguoi_du_tuyen=@KQ
		END
		
		SELECT @KQ = Ma_dia_chi FROM CHITIETTHANHVIEN WHERE Ten_dang_nhap=@Ten_dang_nhap
		
		UPDATE DIACHI SET So_nha=@So_nha,Duong=@Duong,Phuong_xa=@Phuong_xa,Quan_huyen=@Quan_huyen,Tinh_thanhpho=@Tinh_thanhpho,Dien_thoai_nha=@Dien_thoai_nha,Lan_cap_nhat_cuoi=GETDATE() WHERE ID=@KQ
		UPDATE CHITIETTHANHVIEN SET Ho=@Ho,Ten_lot=@Ten_lot,Ten=@Ten,Ngay_sinh=@Ngay_sinh,Email=@Email,Dien_thoai_dd=@Dien_thoai_dd,Chung_minh_nhan_dan=@CMND,Ngay_cap=@Ngay_cap,Noi_cap=@Noi_cap WHERE Ten_dang_nhap=@Ten_dang_nhap
		SET @KQ = @ID
	END
END

GO

--sp_NhanSu_DeleteThoiGianTuyenDung.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	25/05/2011
	Mục Đích	:	Cập Nhật Thời Gian Tuyển Dụng
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_DeleteThoiGianTuyenDung')
BEGIN
	DROP PROC sp_NhanSu_DeleteThoiGianTuyenDung
END
GO
CREATE PROC sp_NhanSu_DeleteThoiGianTuyenDung
	@Ma_CTKHTDNS	INT,
	@KQ				INT OUTPUT  
AS  
BEGIN
	SET @KQ = -1
	IF EXISTS (SELECT * FROM ThoiGianTuyenDung WHERE Ma_CTKHTDNS=@Ma_CTKHTDNS)
	BEGIN
		DELETE FROM ThoiGianTuyenDung WHERE Ma_CTKHTDNS=@Ma_CTKHTDNS
		SET @KQ = 1  
	END
END   
GO
/*

DECLARE @KQ INT 
EXEC sp_InsertDeNghiKTV 0,3,1,'1/1/1991','1/1/1991','1',@KQ OUTPUT
SELECT @KQ

SELECT * FROM DeNghiNhanSu

SELECT * FROM DeNghiKTV

*/

GO

--sp_NhanSu_DeleteTieuChuan.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	24/05/2011
	Mục Đích	:	Xóa tiêu chuẩn không thích hợp
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_DeleteTieuChuan')
BEGIN
	DROP PROC sp_NhanSu_DeleteTieuChuan
END
GO
CREATE PROC sp_NhanSu_DeleteTieuChuan
	@ID					INT,
	@KQ					INT OUTPUT
AS  
BEGIN  
	SET @KQ = -1  
	IF EXISTS (SELECT * FROM TieuChuan WHERE ID=@ID)   
	BEGIN  
		DELETE FROM TieuChuan WHERE ID=@ID
		SET @KQ = 1
	END  
END

GO

GO

--sp_NhanSu_getAllNhanSu.sql

/*
		Nguoi Viet: AMIN
 		Ngay viet:	27/06/2011
		Muc dich:   Danh Sách Nhân Sự Phân Trang
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_getAllNhanSu')
BEGIN
	DROP PROC sp_NhanSu_getAllNhanSu
END
GO
CREATE PROC sp_NhanSu_getAllNhanSu
	@NUMROWS		INT,
	@NUMPAGES		INT
AS
BEGIN
DECLARE @sql NVARCHAR(2000)
	SET @sql = '
	SELECT * FROM (SELECT TOP '+CAST(@NUMROWS AS VARCHAR)+' * FROM ( SELECT TOP ' + CAST(@NUMPAGES AS VARCHAR)+ ' A.ID,(D.HO +'' ''+ D.TEN_LOT +'' ''+ D.TEN) AS HOTEN, 
	(E.SO_NHA +'' ''+ E.DUONG +'' ''+ E.PHUONG_XA +'' ''+ E.QUAN_HUYEN +'' ''+ E.TINH_THANHPHO) AS DIACHI,
	convert(VARCHAR(10),D.NGAY_SINH,105) AS NGAYSINH,
	convert(VARCHAR(10),D.NGAY_BAT_DAU,105) AS NGAYVAOLAM,	
	D.EMAIL,C.TEN AS BOPHAN,B.TEN_VAI_TRO AS VAITRO,F.LOAI_BANG AS BANGCAP
	FROM ThanhVien A LEFT JOIN VAITRO B ON A.MA_VAI_TRO=B.ID 
	LEFT JOIN KHOA_TRUNGTAM C ON A.MA_BO_PHAN=C.ID
	LEFT JOIN CHITIETTHANHVIEN D ON A.TEN_DN=D.TEN_DANG_NHAP 
	LEFT JOIN DIACHI E ON D.MA_DIA_CHI=E.ID 
	LEFT JOIN BANGCAP F ON D.MA_BANG_CAP=F.ID
	ORDER BY A.ID DESC) AS TB1 ORDER BY ID ASC) AS TB2 ORDER BY ID ASC'
	EXEC sp_executesql @sql
END
GO
/*
	 EXEC sp_NhanSu_getAllNhanSu '20','244'
*/






 

GO

--sp_NhanSu_GiamSoLuongDaTuyenKHTNS.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	09/07/1990
	Mục Đích	:	giảm số lượng đã tuyển thành công
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_GiamSoLuongDaTuyenKHTNS')
BEGIN
	DROP PROC sp_NhanSu_GiamSoLuongDaTuyenKHTNS
END
GO
CREATE PROC sp_NhanSu_GiamSoLuongDaTuyenKHTNS  
	@ID				INT,
	@KQ				INT OUTPUT  
AS  
BEGIN  
	SET @KQ = -1
	IF EXISTS (SELECT * FROM ChiTietKHTNS WHERE ID=@ID)
	BEGIN
		DECLARE @So_luong_da_tuyen INT
		SET @So_luong_da_tuyen = 0
		SELECT @So_luong_da_tuyen=So_luong_da_tuyen FROM ChiTietKHTNS WHERE ID=@ID
		IF (@So_luong_da_tuyen > 0)
		BEGIN
			SET @So_luong_da_tuyen = @So_luong_da_tuyen - 1
			UPDATE ChiTietKHTNS SET So_luong_da_tuyen=@So_luong_da_tuyen, Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
			SET @KQ = @ID 
		END
	END  
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_InsertChiTietKHTNS 4,0,'CHI_TIET_KE_HOACH_TUYEN_NHAN_SU',@KQ OUTPUT
SELECT @KQ

SELECT * FROM ChiTietKHTNS

SELECT * FROM KeHoachTNS

SELECT * FROM DeNghiNhanSu

*/

GO

--sp_NhanSu_InsertBangCap.sql
IF EXISTS (SELECT * FROM SYS.OBJECTS WHERE NAME='sp_NhanSu_InsertBangCap')
BEGIN
	DROP PROC sp_NhanSu_InsertBangCap
END
GO
CREATE PROC sp_NhanSu_InsertBangCap
@Ma_thanh_vien INT,
@Loai_bang NVARCHAR(20),
@Truong_cap NVARCHAR(200),
@Nam_tot_nghiep INT,
@Loai_tot_nghiep NVARCHAR(40),
@Bang_cap_chinh INT,
@KQ	INT OUTPUT
AS
BEGIN
	SET @KQ = -1
	IF EXISTS (SELECT * FROM THANHVIEN WHERE ID=@Ma_thanh_vien)
	BEGIN
		INSERT INTO BANGCAP(Ma_thanh_vien,Loai_bang,Truong_cap,Nam_tot_nghiep,Loai_tot_nghiep,Ngach_luong,Bang_cap_chinh) VALUES (@Ma_thanh_vien,@Loai_bang,@Truong_cap,@Nam_tot_nghiep,@Loai_tot_nghiep,'2.34',@Bang_cap_chinh)
		SELECT @KQ = MAX(ID) FROM BANGCAP
	END
END

GO

--sp_NhanSu_InsertChiTietKHTNS.sql
/*
	Người Viết	:	Huỳnh Thị Ngoc Mai
	Ngày Viết	:	24/05/2011
	Mục Đích	:	STORE INSERT CHI_TIET_KE_HOACH_TUYEN_NHAN_SU
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_InsertChiTietKHTNS')
BEGIN
	DROP PROC sp_NhanSu_InsertChiTietKHTNS
END
GO
CREATE PROC sp_NhanSu_InsertChiTietKHTNS  
	@Ma_ke_hoach		INT,
	@Ma_de_nghi			INT,
	@KQ					INT OUTPUT  
AS  
BEGIN  
	SET @KQ = -1
	IF NOT EXISTS (SELECT * FROM ChiTietKHTNS WHERE Ma_ke_hoach=@Ma_ke_hoach AND Ma_de_nghi=@Ma_de_nghi)
	BEGIN
		DECLARE @Tinh_trang INT
		SET @Tinh_trang = (SELECT Tinh_trang FROM KeHoachTNS WHERE ID=@Ma_ke_hoach)
		IF(@Tinh_trang = 0 or @Tinh_trang = 3)
		BEGIN
		INSERT INTO ChiTietKHTNS(Ma_ke_hoach,Ma_de_nghi,Ghi_chu,So_luong_da_tuyen,Ngay_cap_nhat_cuoi,User1,User2,User3,User4,User5) VALUES(@Ma_ke_hoach,@Ma_de_nghi,null,0,GETDATE(),'','','','','')
		SET @KQ = 1  
		END
	END  
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_InsertChiTietKHTNS 4,0,'CHI_TIET_KE_HOACH_TUYEN_NHAN_SU',@KQ OUTPUT
SELECT @KQ

SELECT * FROM ChiTietKHTNS

SELECT * FROM KeHoachTNS

SELECT * FROM DeNghiNhanSu

*/

GO

--sp_NhanSu_InsertDeNghiKTV.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	24/05/2011
	Mục Đích	:	Thêm Đề Nghị Khoán Thử Việc
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_InsertDeNghiKTV')
BEGIN
	DROP PROC sp_NhanSu_InsertDeNghiKTV
END
GO
CREATE PROC sp_NhanSu_InsertDeNghiKTV  
	@Nguoi_du_tuyen			INT,
	@Tinh_trang				INT,
	@Ma_truong_khoa			INT,
	@KQ						INT OUTPUT  
AS  
BEGIN  
	SET @KQ = -1  
	IF NOT EXISTS (SELECT * FROM DeNghiKTV WHERE Nguoi_du_tuyen=@Nguoi_du_tuyen)   
	BEGIN  
		INSERT INTO DeNghiKTV(Nguoi_du_tuyen,Tinh_trang,Ngay_lap,Truong_khoa,Ngay_cap_nhat_cuoi,User1,User2,User3,User4,User5) VALUES(@Nguoi_du_tuyen,@Tinh_trang,GETDATE(),@Ma_truong_khoa,GETDATE(),'','','','','')
		SELECT @KQ=MAX(ID) FROM DeNghiKTV
	END  
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_InsertDeNghiKTV '1','0',@KQ OUTPUT
SELECT @KQ

SELECT * FROM DeNghiNhanSu

SELECT * FROM DeNghiKTV

*/

GO

--sp_NhanSu_InsertDeNghiNhanSu.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	27/05/2011
	Mục Đích	:	Đề Nghị Nhân Sự Mới
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_InsertDeNghiNhanSu')
BEGIN
	DROP PROC sp_NhanSu_InsertDeNghiNhanSu
END
GO
CREATE PROC sp_NhanSu_InsertDeNghiNhanSu 
	@Nam					INT,
	@Ma_bo_phan				INT,		
	@Nguoi_de_nghi			INT,
	@Chuc_danh				INT,
	@So_luong				INT,
	@Cong_viec				NVARCHAR(2000),
	@Thoi_gian_bat_dau_lam	DATETIME,
	@Tinh_trang				INT,
	@Bo_sung				INT,		
	@KQ						INT OUTPUT  
AS  
BEGIN  
	SET @KQ = -1
	INSERT INTO DeNghiNhanSu(Nam,Ma_bo_phan,Nguoi_de_nghi,Chuc_danh,So_luong,Cong_viec,Thoi_gian_bat_dau_lam,Tinh_trang,Ngay_lap,Bo_sung,Ngay_cap_nhat_cuoi,User1,User2,User3,User4,User5) VALUES(@Nam,@Ma_bo_phan,@Nguoi_de_nghi,@Chuc_danh,@So_luong,@Cong_viec,@Thoi_gian_bat_dau_lam,@Tinh_trang,GETDATE(),@Bo_sung,GETDATE(),'','','','','')
	SELECT @KQ=MAX(ID) FROM DeNghiNhanSu
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_InsertDeNghiNhanSu '2011','8','5','5','2','Quét rác','5000000','1/1/1991',0,@KQ OUTPUT
SELECT @KQ
SELECT ID FROM DeNghiNhanSu WHERE Nam='2011' AND Ma_bo_phan='8' AND Chuc_danh='5'

SELECT * FROM DeNghiNhanSu

SELECT * FROM KeHoachTNS

*/

GO

--sp_NhanSu_InsertDonXinThoiViec.sql
/*
	Người Viết	:	Trần Cẩm thành
	Ngày Viết	:	19/08/2011
	Mục Đích	:	cập nhật đơn xin thôi việc
	SELECT * FROM DONXINTHOIVIEC
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_InsertDonXinThoiViec')
BEGIN
	DROP PROC sp_NhanSu_InsertDonXinThoiViec
END
GO
CREATE PROC sp_NhanSu_InsertDonXinThoiViec  
	@Nguoi_du_tuyen		INT,
	@KQ					INT OUTPUT  
AS  
BEGIN  
	SET @KQ = -1
	IF NOT EXISTS (SELECT * FROM DonXinThoiViec WHERE Nguoi_du_tuyen=@Nguoi_du_tuyen)
	BEGIN
		INSERT INTO DonXinThoiViec(Nguoi_du_tuyen,Ngay_lap,Tinh_trang,Ngay_cap_nhat_cuoi)
		VALUES(@Nguoi_du_tuyen,getdate(),'0',getdate())
		SELECT @KQ=MAX(ID) FROM DonXinThoiViec
	END
	ELSE
	BEGIN
		SELECT @KQ=ID FROM DonXinThoiViec WHERE Nguoi_du_tuyen=@Nguoi_du_tuyen
	END
END  
GO


GO

--sp_NhanSu_InsertHDLD.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	24/05/2011
	Mục Đích	:	Thêm Hợp Đồng Lần Đầu
*/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_InsertHDLD')
BEGIN
	DROP PROC sp_NhanSu_InsertHDLD
END
GO
CREATE PROC sp_NhanSu_InsertHDLD
	@Nguoi_du_tuyen			INT,
	@So_lan					INT,
	@Nguoi_lap				INT,
	@KQ						INT OUTPUT  
AS  
BEGIN  
	SET @KQ = -1
	INSERT INTO HopDongLaoDong(Nguoi_du_tuyen,Tinh_trang,So_lan,Nguoi_lap,Ngay_lap,Ngay_cap_nhat_cuoi) VALUES(@Nguoi_du_tuyen,'0',@So_lan,@Nguoi_lap,GETDATE(),GETDATE())
	SELECT @KQ=MAX(ID) FROM HopDongLaoDong
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_NhanSu_InsertHDLD '1','0','1',@KQ OUTPUT
SELECT @KQ

*/

GO

--sp_NhanSu_InsertHoSoDuTuyen.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	04/06/2011
	Mục Đích	:	Thêm Hồ Sơ Dự Tuyển
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_InsertHoSoDuTuyen')
BEGIN
	DROP PROC sp_NhanSu_InsertHoSoDuTuyen
END
GO
CREATE PROC sp_NhanSu_InsertHoSoDuTuyen
	@Ten_dang_nhap		VARCHAR(20),
	@Ho					NVARCHAR(50),
	@Ten_lot			NVARCHAR(200),
	@Ten				NVARCHAR(50),
	@Gioi_tinh			INT,
	@Ngay_sinh			DATETIME,
	@CMND				VARCHAR(20),
	@Ngay_cap			DATETIME,
	@Noi_cap			NVARCHAR(100),
	@So_nha				VARCHAR(20),	
	@Duong				NVARCHAR(500),
	@Phuong_xa			NVARCHAR(100),
	@Quan_huyen			NVARCHAR(100),
	@Tinh_thanhpho		NVARCHAR(200),		
	@Dien_thoai_nha		VARCHAR(20),
	@Email				VARCHAR(100),
	@Dien_thoai_dd		VARCHAR(50),
	@Trinh_do_van_hoa	NVARCHAR(1000),
	@Chuyen_mon			NVARCHAR(1000),
	@Tin_hoc			NVARCHAR(1000),
	@Ngoai_ngu			NVARCHAR(1000),
	@Tom_tat_ban_than	NVARCHAR(MAX),
	@Vi_tri_du_tuyen	INT,					
	@KQ					INT OUTPUT  
AS  
BEGIN  
	SET @KQ = -1  
	IF NOT EXISTS (SELECT * FROM HoSoDuTuyen WHERE CMND=@CMND AND Vi_tri_du_tuyen NOT IN (SELECT ID FROM ChiTietKHTNS WHERE Ma_ke_hoach=(SELECT Ma_ke_hoach FROM ChiTietKHTNS WHERE ID=@Vi_tri_du_tuyen)))   
	BEGIN  
		INSERT INTO HoSoDuTuyen(Ten_dang_nhap,Ho,Ten_lot,Ten,Gioi_tinh,Ngay_sinh,Ghi_chu,CMND,Ngay_cap,Noi_cap,So_nha,Duong,Phuong_xa,Quan_huyen,Tinh_thanhpho,Dien_thoai_nha,Email,Dien_thoai_dd,Trinh_do_van_hoa,Chuyen_mon,Tin_hoc,Ngoai_ngu,Tom_tat_ban_than,Vi_tri_du_tuyen,Tinh_trang,Ngay_cap_nhat_cuoi,User1,User2,User3,User4,User5) VALUES(@Ten_dang_nhap,@Ho,@Ten_lot,@Ten,@Gioi_tinh,@Ngay_sinh,null,@CMND,@Ngay_cap,@Noi_cap,@So_nha,@Duong,@Phuong_xa,@Quan_huyen,@Tinh_thanhpho,@Dien_thoai_nha,@Email,@Dien_thoai_dd,@Trinh_do_van_hoa,@Chuyen_mon,@Tin_hoc,@Ngoai_ngu,@Tom_tat_ban_than,@Vi_tri_du_tuyen,0,GETDATE(),'','','','','')
		SET @KQ = 1  
	END  
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_InsertHoSoDuTuyen 'ngoxxmai',N'Huỳnh',N'Thị Ngọc',N'Mai',0,'07/20/1991','TP.HCM','090805824','80/4','maihtn.hv@gmail.com','0908058240',N'Trung cấp',N'Lập trình',N'trung cấp',N'Anh Văn','123456',3,@KQ OUTPUT
SELECT @KQ

SELECT * FROM HoSoDuTuyen

SELECT * FROM ChiTietKHTNS

SELECT * FROM KehoachTNS

*/

GO

--sp_NhanSu_InsertKeHoachTNS.sql
/*
	Người Viết	:	Huỳnh Thị Ngoc Mai
	Ngày Viết	:	24/05/2011
	Mục Đích	:	STORE INSERT KE_HOACH_TUYEN_NHAN_SU 
	-- TINH_TRANG	= 0 -- SAVE
	-- TINH_TRANG	= 1 -- GUI
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_InsertKeHoachTNS')
BEGIN
	DROP PROC sp_NhanSu_InsertKeHoachTNS
END
GO
CREATE PROC sp_NhanSu_InsertKeHoachTNS
	@Nam				INT,					
	@Nguoi_lap_ke_hoach	INT,
	@Bo_sung			INT,
	@KQ					INT OUTPUT
AS  
BEGIN  
	SET @KQ = -1
	INSERT INTO KeHoachTNS(Nam,Tinh_trang,Nguoi_lap_ke_hoach,Ngay_lap_ke_hoach,Bo_sung,Ngay_cap_nhat_cuoi,User1,User2,User3,User4,User5) VALUES(@Nam,'0',@Nguoi_lap_ke_hoach,GETDATE(),@Bo_sung,GETDATE(),'','','','','')
	SELECT @KQ=MAX(ID) FROM KeHoachTNS
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_NhanSu_InsertKeHoachTNS '2011','15','0',@KQ OUTPUT
SELECT @KQ

SELECT * FROM ThanhVien

SELECT * FROM KeHoachTNS

*/

GO

--sp_NhanSu_InsertLuong.sql
/*
	Người Viết	:	Huỳnh Thị Ngoc Mai
	Ngày Viết	:	24/05/2011
	Mục Đích	:	xét lương
	SELECT * FROM LUONG
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_InsertLuong')
BEGIN
	DROP PROC sp_NhanSu_InsertLuong
END
GO
CREATE PROC sp_NhanSu_InsertLuong  
	@Ma_thanh_vien		INT,
	@Loai_vien_chuc		VARCHAR(10),
	@Ma_ngach			VARCHAR(20),
	@Bac_luong			INT,
	@He_so_luong		FLOAT,
	@Ghi_chu			NVARCHAR(1000),
	@KQ					INT OUTPUT  
AS  
BEGIN  
	SET @KQ = -1
	IF EXISTS (SELECT * FROM THANHVIEN WHERE ID=@Ma_thanh_vien)
	BEGIN
		INSERT INTO LUONG(Ma_thanh_vien,Loai_vien_chuc,Ma_ngach,Bac_luong,He_so_luong,Ngay_xet_luong,Ngay_cap_nhat_cuoi,Ghi_chu) 
		VALUES (@Ma_thanh_vien,@Loai_vien_chuc,@Ma_ngach,@Bac_luong,@He_so_luong,getdate(),getdate(),@Ghi_chu)
		SELECT @KQ=MAX(ID) FROM LUONG
	END  
END  
GO


GO

--sp_NhanSu_InsertNhanXetKetQuaThuViec.sql
/*
	Người Viết	:	Huỳnh Thị Ngoc Mai
	Ngày Viết	:	24/05/2011
	Mục Đích	:	STORE INSERT NHAN_XET_KET_QUA_THU_VIEC
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_InsertNhanXetKetQuaThuViec')
BEGIN
	DROP PROC sp_NhanSu_InsertNhanXetKetQuaThuViec
END
GO
CREATE PROC sp_NhanSu_InsertNhanXetKetQuaThuViec  
	@Nguoi_nhan_xet		VARCHAR(5),
	@Thoi_gian_thu_viec	FLOAT,
	@KQ					INT OUTPUT
AS
BEGIN  
	SET @KQ = -1
	IF NOT EXISTS (SELECT * FROM NhanXetKetQuaThuViec WHERE Nguoi_nhan_xet=@Nguoi_nhan_xet)   
	BEGIN  
		INSERT INTO NhanXetKetQuaThuViec(Nguoi_nhan_xet,Thoi_gian_thu_viec,Tinh_trang,Ngay_cap_nhat_cuoi) VALUES(@Nguoi_nhan_xet,@Thoi_gian_thu_viec,'0',GETDATE())
		SELECT @KQ=MAX(ID) FROM NhanXetKetQuaThuViec
	END  
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_NhanSu_InsertNhanXetKetQuaThuViec '0','6',@KQ OUTPUT
SELECT @KQ

SELECT * FROM NhanXetKetQuaThuViec
*/

GO

--sp_NhanSu_InsertThoiGianTuyenDung.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	25/05/2011
	Mục Đích	:	Thời Gian Tuyển Dụng Nhân Sự
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_InsertThoiGianTuyenDung')
BEGIN
	DROP PROC sp_NhanSu_InsertThoiGianTuyenDung
END
GO
CREATE PROC sp_NhanSu_InsertThoiGianTuyenDung  
	@Ma_CTKHTDNS				INT,
	@Thoi_gian					VARCHAR(15),
	@KQ							INT OUTPUT  
AS  
BEGIN  
	
	SET @KQ = -1
	IF EXISTS (SELECT * FROM ChiTietKHTNS WHERE ID=@Ma_CTKHTDNS)
	BEGIN
		DECLARE @Tinh_trang INT
		SET @Tinh_trang = (SELECT Tinh_trang FROM KeHoachTNS WHERE ID=(SELECT Ma_ke_hoach FROM ChiTietKHTNS WHERE ID=@Ma_CTKHTDNS))
		IF(@Tinh_trang = 0)
		BEGIN
			INSERT INTO ThoiGianTuyenDung(Ma_CTKHTDNS,Thoi_gian,Ngay_cap_nhat_cuoi,User1,User2,User3,User4,User5) VALUES(@Ma_CTKHTDNS,@Thoi_gian,GETDATE(),'','','','','')
			SET @KQ = 1
		END
	END
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_InsertThoiGianTuyenDung '14','2',@KQ OUTPUT
SELECT @KQ

SELECT * FROM DeNghiNhanSu
SELECT * FROM HinhThuc_DT
SELECT * FROM DeNghiDTNS
SELECT * FROM THOIGIANTUYENDUNG
SELECT * FROM CHITIETKHTNS
*/

GO

--sp_NhanSu_InsertTieuChuan.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	27/05/2011
	Mục Đích	:	Tiêu Chuẩn Tuyển Nhân Sự
*/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_InsertTieuChuan')
BEGIN
	DROP PROC sp_NhanSu_InsertTieuChuan
END
GO
CREATE PROC sp_NhanSu_InsertTieuChuan
	@Ma_de_nghi			INT,
	@Tieu_chuan			NVARCHAR(500),
	@KQ					INT OUTPUT  
AS  
BEGIN  
	SET @KQ = -1
	IF EXISTS (SELECT * FROM DeNghiNhanSu WHERE ID=@Ma_de_nghi)
	BEGIN
		DECLARE @Tinh_trang INT
		SET @Tinh_trang = (SELECT Tinh_trang FROM DeNghiNhanSu WHERE ID=@Ma_de_nghi)
		IF(@Tinh_trang = 0 OR @Tinh_trang = 6)
		BEGIN  
			INSERT INTO TieuChuan(Ma_de_nghi,Tieu_chuan,Ngay_cap_nhat_cuoi,User1,User2,User3,User4,User5) VALUES(@Ma_de_nghi,@Tieu_chuan,GETDATE(),'','','','','')
			SELECT @KQ=ID FROM TIEUCHUAN WHERE Ma_de_nghi=@Ma_de_nghi AND Tieu_chuan=@Tieu_chuan  
		END 
	END
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_InsertTieuChuan 1,1,'3','1/1/1991','5','6','7','8','9',@KQ OUTPUT
SELECT @KQ

SELECT * FROM TieuChuan

SELECT * FROM DeNghiNhanSu
*/

GO

--sp_NhanSu_NhapThongTin.sql
IF EXISTS (SELECT * FROM SYS.OBJECTS WHERE NAME='sp_NhanSu_NhapThongTin')
BEGIN
	DROP PROC sp_NhanSu_NhapThongTin
END
GO
CREATE PROC sp_NhanSu_NhapThongTin
@Ten_dang_nhap VARCHAR(20),
@Ho	NVARCHAR(40),
@Ten_lot NVARCHAR(40),
@Ten NVARCHAR(40),
@Gioi_tinh INT,
@Ngay_sinh DATETIME,
@CMND VARCHAR(15),
@Ngay_cap	DATETIME,
@Noi_cap	NVARCHAR(100),
@So_nha NVARCHAR(20),
@Duong NVARCHAR(200),
@Phuong_xa NVARCHAR(50),
@Quan_huyen NVARCHAR(50),
@Tinh_thanhpho NVARCHAR(50),
@Dien_thoai_nha VARCHAR(20),
@Email VARCHAR(40),
@Dien_thoai_dd VARCHAR(20),
@Ngay_thu_viec DATETIME,
@Ngay_vao_lam DATETIME,
@Vai_tro INT,
@Bo_phan INT,
@KQ	INT OUTPUT
AS
BEGIN
	SET @KQ = -1
	IF NOT EXISTS (SELECT * FROM CHITIETTHANHVIEN WHERE Chung_minh_nhan_dan=@CMND)
	BEGIN
		INSERT INTO HOSODUTUYEN(Ten_dang_nhap,Ho,Ten_lot,Ten,Gioi_tinh,Ngay_sinh,CMND,So_nha,Duong,Phuong_xa,Quan_huyen,Tinh_thanhpho,Dien_thoai_nha,Email,Dien_thoai_dd,Tinh_trang,Ngay_cap_nhat_cuoi) VALUES(@Ten_dang_nhap,@Ho,@Ten_lot,@Ten,@Gioi_tinh,@Ngay_sinh,@CMND,@So_nha,@Duong,@Phuong_xa,@Quan_huyen,@Tinh_thanhpho,@Dien_thoai_nha,@Email,@Dien_thoai_dd,'-1',GETDATE())
		SELECT @KQ=MAX(ID) FROM HOSODUTUYEN
		INSERT INTO DENGHIKTV(Nguoi_du_tuyen,Bat_dau,Tinh_trang,Ngay_cap_nhat_cuoi) VALUES(@KQ,@Ngay_thu_viec,'-1',GETDATE())
		INSERT INTO HOPDONGLAODONG(Nguoi_du_tuyen,Bat_dau,Tinh_trang,Ngay_cap_nhat_cuoi) VALUES(@KQ,@Ngay_vao_lam,'-1',GETDATE())
		INSERT INTO DIACHI(So_nha,Duong,Phuong_xa,Quan_huyen,Tinh_thanhpho,Dien_thoai_nha,Lan_cap_nhat_cuoi) VALUES (@So_nha,@Duong,@Phuong_xa,@Quan_huyen,@Tinh_thanhpho,@Dien_thoai_nha,GETDATE())
		SELECT @KQ=MAX(ID) FROM DIACHI
		INSERT INTO CHITIETTHANHVIEN(Ten_dang_nhap,Ho,Ten_lot,Ten,Ngay_sinh,Ma_dia_chi,Email,Dien_thoai_dd,Tinh_trang,Chung_minh_nhan_dan,Ngay_cap,Noi_cap) VALUES (@Ten_dang_nhap,@Ho,@Ten_lot,@Ten,@Ngay_sinh,@KQ,@Email,@Dien_thoai_dd,'1',@CMND,@Ngay_cap,@Noi_cap)
		INSERT INTO THANHVIEN(Ten_DN,Mat_khau,Ma_vai_tro,Ngay_tao,Ngay_truy_cap_cuoi,Ngay_cap_nhat_cuoi,Ma_bo_phan) VALUES (@Ten_dang_nhap,@Ten_dang_nhap,@Vai_tro,GETDATE(),GETDATE(),GETDATE(),@Bo_phan)
		SELECT @KQ=MAX(ID) FROM THANHVIEN
	END
END

--DECLARE @KQ INT
--EXEC sp_NhanSu_NhapThongTin 'thanhtc3.hv','tran','cam','thanh','1','08/07/1990','024372246','23','23','23','23','23','38575063','thanhtc.hv@gmail.com','0907336635','10/10/2005','10/10/2007','8','6',@KQ OUTPUT
--SELECT @KQ
GO

--sp_NhanSu_SelectAllDeNghiKTV.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	29/05/2011
	Mục Đích	:	show Đề Nghị
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_SelectAllDeNghiKTV')
BEGIN
	DROP PROC sp_NhanSu_SelectAllDeNghiKTV
END
GO
CREATE PROC sp_NhanSu_SelectAllDeNghiKTV
	@Ma_bo_phan			VARCHAR(5),
	@Ma_truong_khoa		VARCHAR(5),
	@Tinh_trang			VARCHAR(5)
AS  
BEGIN
	IF(@Ma_bo_phan = '1' OR @Ma_bo_phan = '2')
	BEGIN
		IF(@Tinh_trang = '')
		BEGIN
			SELECT A.*,(B.HO+' '+B.TEN_LOT+' '+B.TEN) AS TEN_NGUOI_DU_TUYEN,(D.HO+' '+D.TEN_LOT+' '+D.TEN) AS NGUOI_LAP,CONVERT(VARCHAR(10),A.NGAY_LAP,105) AS NGAY_LAP_MDY ,B.VI_TRI_DU_TUYEN
			FROM DENGHIKTV A LEFT JOIN HOSODUTUYEN B ON A.NGUOI_DU_TUYEN=B.ID LEFT JOIN THANHVIEN C ON A.TRUONG_KHOA=C.ID LEFT JOIN CHITIETTHANHVIEN D ON C.TEN_DN=D.TEN_DANG_NHAP
			WHERE A.Tinh_trang>='2'
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
		IF(@Tinh_trang <> '')
		BEGIN
			SELECT * FROM(
			SELECT A.*,(B.HO+' '+B.TEN_LOT+' '+B.TEN) AS TEN_NGUOI_DU_TUYEN,(D.HO+' '+D.TEN_LOT+' '+D.TEN) AS NGUOI_LAP,CONVERT(VARCHAR(10),A.NGAY_LAP,105) AS NGAY_LAP_MDY ,B.VI_TRI_DU_TUYEN
			FROM DENGHIKTV A LEFT JOIN HOSODUTUYEN B ON A.NGUOI_DU_TUYEN=B.ID LEFT JOIN THANHVIEN C ON A.TRUONG_KHOA=C.ID LEFT JOIN CHITIETTHANHVIEN D ON C.TEN_DN=D.TEN_DANG_NHAP
			WHERE A.Tinh_trang>='2') AS TB1 WHERE Tinh_trang=@Tinh_trang 
			ORDER BY NGAY_CAP_NHAT_CUOI DESC
		END
	END
	IF(@Ma_bo_phan = '0')
	BEGIN
		IF(@Tinh_trang = '')
		BEGIN
			SELECT A.*,(B.HO+' '+B.TEN_LOT+' '+B.TEN) AS TEN_NGUOI_DU_TUYEN,(D.HO+' '+D.TEN_LOT+' '+D.TEN) AS NGUOI_LAP,CONVERT(VARCHAR(10),A.NGAY_LAP,105) AS NGAY_LAP_MDY ,B.VI_TRI_DU_TUYEN
			FROM DENGHIKTV A LEFT JOIN HOSODUTUYEN B ON A.NGUOI_DU_TUYEN=B.ID LEFT JOIN THANHVIEN C ON A.TRUONG_KHOA=C.ID LEFT JOIN CHITIETTHANHVIEN D ON C.TEN_DN=D.TEN_DANG_NHAP
			WHERE A.Tinh_trang>='4'
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
		IF(@Tinh_trang <> '')
		BEGIN
			SELECT * FROM( 
			SELECT A.*,(B.HO+' '+B.TEN_LOT+' '+B.TEN) AS TEN_NGUOI_DU_TUYEN,(D.HO+' '+D.TEN_LOT+' '+D.TEN) AS NGUOI_LAP,CONVERT(VARCHAR(10),A.NGAY_LAP,105) AS NGAY_LAP_MDY ,B.VI_TRI_DU_TUYEN
			FROM DENGHIKTV A LEFT JOIN HOSODUTUYEN B ON A.NGUOI_DU_TUYEN=B.ID LEFT JOIN THANHVIEN C ON A.TRUONG_KHOA=C.ID LEFT JOIN CHITIETTHANHVIEN D ON C.TEN_DN=D.TEN_DANG_NHAP
			WHERE A.Tinh_trang>='4') AS TB3 WHERE Tinh_trang=@Tinh_trang 
			ORDER BY NGAY_CAP_NHAT_CUOI DESC
		END
	END
	IF(@Ma_bo_phan = '16')
	BEGIN
		IF(@Tinh_trang = '')
		BEGIN
			SELECT A.*,(B.HO+' '+B.TEN_LOT+' '+B.TEN) AS TEN_NGUOI_DU_TUYEN,(D.HO+' '+D.TEN_LOT+' '+D.TEN) AS NGUOI_LAP,CONVERT(VARCHAR(10),A.NGAY_LAP,105) AS NGAY_LAP_MDY ,B.VI_TRI_DU_TUYEN
			FROM DENGHIKTV A LEFT JOIN HOSODUTUYEN B ON A.NGUOI_DU_TUYEN=B.ID LEFT JOIN THANHVIEN C ON A.TRUONG_KHOA=C.ID LEFT JOIN CHITIETTHANHVIEN D ON C.TEN_DN=D.TEN_DANG_NHAP
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
		IF(@Tinh_trang <> '')
		BEGIN
			IF(@Tinh_trang = '1')
			BEGIN
				SELECT A.*,(B.HO+' '+B.TEN_LOT+' '+B.TEN) AS TEN_NGUOI_DU_TUYEN,(D.HO+' '+D.TEN_LOT+' '+D.TEN) AS NGUOI_LAP,CONVERT(VARCHAR(10),A.NGAY_LAP,105) AS NGAY_LAP_MDY ,B.VI_TRI_DU_TUYEN
				FROM DENGHIKTV A LEFT JOIN HOSODUTUYEN B ON A.NGUOI_DU_TUYEN=B.ID LEFT JOIN THANHVIEN C ON A.TRUONG_KHOA=C.ID LEFT JOIN CHITIETTHANHVIEN D ON C.TEN_DN=D.TEN_DANG_NHAP
				WHERE A.Tinh_trang='2' OR A.Tinh_trang='3' OR A.Tinh_trang='4'
				ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
			END
			ELSE 
			BEGIN
				SELECT A.*,(B.HO+' '+B.TEN_LOT+' '+B.TEN) AS TEN_NGUOI_DU_TUYEN,(D.HO+' '+D.TEN_LOT+' '+D.TEN) AS NGUOI_LAP,CONVERT(VARCHAR(10),A.NGAY_LAP,105) AS NGAY_LAP_MDY ,B.VI_TRI_DU_TUYEN
				FROM DENGHIKTV A LEFT JOIN HOSODUTUYEN B ON A.NGUOI_DU_TUYEN=B.ID LEFT JOIN THANHVIEN C ON A.TRUONG_KHOA=C.ID LEFT JOIN CHITIETTHANHVIEN D ON C.TEN_DN=D.TEN_DANG_NHAP
				WHERE A.Tinh_trang=@Tinh_trang
				ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
			END
		END
	END
	IF(@Ma_bo_phan <> '0' AND @Ma_bo_phan <> '1' AND @Ma_bo_phan <> '2' AND @Ma_bo_phan <> '16')
	BEGIN
		IF(@Ma_truong_khoa <> '' AND @Tinh_trang = '')
		BEGIN
			SELECT DISTINCT A.*,(B.HO+' '+B.TEN_LOT+' '+B.TEN) AS TEN_NGUOI_DU_TUYEN,(D.HO+' '+D.TEN_LOT+' '+D.TEN) AS NGUOI_LAP,CONVERT(VARCHAR(10),A.NGAY_LAP,105) AS NGAY_LAP_MDY ,B.VI_TRI_DU_TUYEN
			FROM DENGHIKTV A LEFT JOIN HOSODUTUYEN B ON A.NGUOI_DU_TUYEN=B.ID LEFT JOIN THANHVIEN C ON A.TRUONG_KHOA=C.ID LEFT JOIN CHITIETTHANHVIEN D ON C.TEN_DN=D.TEN_DANG_NHAP LEFT JOIN KHOA_TRUNGTAM E ON A.TRUONG_KHOA=E.MA_TRUONG_KHOA
			WHERE A.TRUONG_KHOA=@Ma_truong_khoa OR E.ID=@Ma_bo_phan
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
		IF(@Ma_truong_khoa <> '' AND @Tinh_trang <> '')
		BEGIN
			SELECT DISTINCT A.*,(B.HO+' '+B.TEN_LOT+' '+B.TEN) AS TEN_NGUOI_DU_TUYEN,(D.HO+' '+D.TEN_LOT+' '+D.TEN) AS NGUOI_LAP,CONVERT(VARCHAR(10),A.NGAY_LAP,105) AS NGAY_LAP_MDY ,B.VI_TRI_DU_TUYEN
			FROM DENGHIKTV A LEFT JOIN HOSODUTUYEN B ON A.NGUOI_DU_TUYEN=B.ID LEFT JOIN THANHVIEN C ON A.TRUONG_KHOA=C.ID LEFT JOIN CHITIETTHANHVIEN D ON C.TEN_DN=D.TEN_DANG_NHAP LEFT JOIN KHOA_TRUNGTAM E ON A.TRUONG_KHOA=E.MA_TRUONG_KHOA
			WHERE A.TRUONG_KHOA=@Ma_truong_khoa AND A.Tinh_trang=@Tinh_trang OR E.ID=@Ma_bo_phan AND A.Tinh_trang=@Tinh_trang
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
	END
END
GO
/*
	sp_NhanSu_SelectAllDeNghiKTV '6','20','0'
*/
GO

--sp_NhanSu_SelectAllDeNghiNhanSu.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	29/05/2011
	Mục Đích	:	show Đề Nghị
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_SelectAllDeNghiNhanSu')
BEGIN
	DROP PROC sp_NhanSu_SelectAllDeNghiNhanSu
END
GO
CREATE PROC sp_NhanSu_SelectAllDeNghiNhanSu
	@Ma_bo_phan			VARCHAR(5),
	@Nguoi_de_nghi		VARCHAR(5),
	@Tinh_trang			VARCHAR(5)
AS  
BEGIN
	IF(@Ma_bo_phan = '1' OR @Ma_bo_phan = '2')
	BEGIN
		IF(@Tinh_trang = '')
		BEGIN
			SELECT A.*,B.Ma_truong_khoa as Ma_truong_khoa,B.Ten as Ten_bo_phan,(E.Ho+' '+E.Ten_lot+' '+E.Ten) as Ten_nguoi_de_nghi,C.Ten_vai_tro AS Ten_Chuc_danh,CONVERT(VARCHAR(50),A.Ngay_lap,105) as Ngay_lap_mdy
			FROM DENGHINHANSU A LEFT JOIN KHOA_TRUNGTAM B ON A.Ma_bo_phan=B.ID LEFT JOIN VAITRO C ON A.Chuc_danh=C.ID LEFT JOIN ThanhVien D ON A.Nguoi_de_nghi=D.ID LEFT JOIN ChiTietThanhVien E ON D.Ten_DN=E.Ten_dang_nhap
			WHERE A.Tinh_trang>='2'
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
		IF(@Tinh_trang <> '')
		BEGIN
			SELECT * FROM(
			SELECT A.*,B.Ma_truong_khoa as Ma_truong_khoa,B.Ten as Ten_bo_phan,(E.Ho+' '+E.Ten_lot+' '+E.Ten) as Ten_nguoi_de_nghi,C.Ten_vai_tro AS Ten_Chuc_danh,CONVERT(VARCHAR(50),A.Ngay_lap,105) as Ngay_lap_mdy
			FROM DENGHINHANSU A LEFT JOIN KHOA_TRUNGTAM B ON A.Ma_bo_phan=B.ID LEFT JOIN VAITRO C ON A.Chuc_danh=C.ID LEFT JOIN ThanhVien D ON A.Nguoi_de_nghi=D.ID LEFT JOIN ChiTietThanhVien E ON D.Ten_DN=E.Ten_dang_nhap
			WHERE A.Tinh_trang>='2') AS TB1 WHERE Tinh_trang=@Tinh_trang ORDER BY NGAY_CAP_NHAT_CUOI DESC
		END
	END
	IF(@Ma_bo_phan = '0')
	BEGIN
		IF(@Tinh_trang = '')
		BEGIN
			SELECT A.*,B.Ma_truong_khoa as Ma_truong_khoa,B.Ten as Ten_bo_phan,(E.Ho+' '+E.Ten_lot+' '+E.Ten) as Ten_nguoi_de_nghi,C.Ten_vai_tro AS Ten_Chuc_danh,CONVERT(VARCHAR(50),A.Ngay_lap,105) as Ngay_lap_mdy
			FROM DENGHINHANSU A LEFT JOIN KHOA_TRUNGTAM B ON A.Ma_bo_phan=B.ID LEFT JOIN VAITRO C ON A.Chuc_danh=C.ID LEFT JOIN ThanhVien D ON A.Nguoi_de_nghi=D.ID LEFT JOIN ChiTietThanhVien E ON D.Ten_DN=E.Ten_dang_nhap
			WHERE A.Tinh_trang>='4'
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
		IF(@Tinh_trang <> '')
		BEGIN
			SELECT * FROM( 
			SELECT A.*,B.Ma_truong_khoa as Ma_truong_khoa,B.Ten as Ten_bo_phan,(E.Ho+' '+E.Ten_lot+' '+E.Ten) as Ten_nguoi_de_nghi,C.Ten_vai_tro AS Ten_Chuc_danh,CONVERT(VARCHAR(50),A.Ngay_lap,105) as Ngay_lap_mdy
			FROM DENGHINHANSU A LEFT JOIN KHOA_TRUNGTAM B ON A.Ma_bo_phan=B.ID LEFT JOIN VAITRO C ON A.Chuc_danh=C.ID LEFT JOIN ThanhVien D ON A.Nguoi_de_nghi=D.ID LEFT JOIN ChiTietThanhVien E ON D.Ten_DN=E.Ten_dang_nhap
			WHERE A.Tinh_trang>='4') AS TB3 WHERE Tinh_trang=@Tinh_trang ORDER BY NGAY_CAP_NHAT_CUOI DESC
		END
	END
	IF(@Ma_bo_phan = '16')
	BEGIN
		IF(@Tinh_trang = '')
		BEGIN
			SELECT A.*,B.Ma_truong_khoa as Ma_truong_khoa,B.Ten as Ten_bo_phan,(E.Ho+' '+E.Ten_lot+' '+E.Ten) as Ten_nguoi_de_nghi,C.Ten_vai_tro AS Ten_Chuc_danh,CONVERT(VARCHAR(50),A.Ngay_lap,105) as Ngay_lap_mdy
			FROM DENGHINHANSU A LEFT JOIN KHOA_TRUNGTAM B ON A.Ma_bo_phan=B.ID LEFT JOIN VAITRO C ON A.Chuc_danh=C.ID LEFT JOIN ThanhVien D ON A.Nguoi_de_nghi=D.ID LEFT JOIN ChiTietThanhVien E ON D.Ten_DN=E.Ten_dang_nhap
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
		IF(@Tinh_trang <> '')
		BEGIN
			IF(@Tinh_trang = '1')
			BEGIN
				SELECT A.*,B.Ma_truong_khoa as Ma_truong_khoa,B.Ten as Ten_bo_phan,(E.Ho+' '+E.Ten_lot+' '+E.Ten) as Ten_nguoi_de_nghi,C.Ten_vai_tro AS Ten_Chuc_danh,CONVERT(VARCHAR(50),A.Ngay_lap,105) as Ngay_lap_mdy
				FROM DENGHINHANSU A LEFT JOIN KHOA_TRUNGTAM B ON A.Ma_bo_phan=B.ID LEFT JOIN VAITRO C ON A.Chuc_danh=C.ID LEFT JOIN ThanhVien D ON A.Nguoi_de_nghi=D.ID LEFT JOIN ChiTietThanhVien E ON D.Ten_DN=E.Ten_dang_nhap
				WHERE A.Tinh_trang='2' OR A.Tinh_trang='3' OR A.Tinh_trang='4'
				ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
			END
			ELSE 
			BEGIN
				SELECT A.*,B.Ma_truong_khoa as Ma_truong_khoa,B.Ten as Ten_bo_phan,(E.Ho+' '+E.Ten_lot+' '+E.Ten) as Ten_nguoi_de_nghi,C.Ten_vai_tro AS Ten_Chuc_danh,CONVERT(VARCHAR(50),A.Ngay_lap,105) as Ngay_lap_mdy
				FROM DENGHINHANSU A LEFT JOIN KHOA_TRUNGTAM B ON A.Ma_bo_phan=B.ID LEFT JOIN VAITRO C ON A.Chuc_danh=C.ID LEFT JOIN ThanhVien D ON A.Nguoi_de_nghi=D.ID LEFT JOIN ChiTietThanhVien E ON D.Ten_DN=E.Ten_dang_nhap
				WHERE A.Tinh_trang=@Tinh_trang
				ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
			END
		END
	END
	IF(@Ma_bo_phan <> '0' AND @Ma_bo_phan <> '1' AND @Ma_bo_phan <> '2' AND @Ma_bo_phan <> '16')
	BEGIN
		IF(@Tinh_trang = '')
		BEGIN
			SELECT A.*,B.Ma_truong_khoa as Ma_truong_khoa,B.Ten as Ten_bo_phan,(E.Ho+' '+E.Ten_lot+' '+E.Ten) as Ten_nguoi_de_nghi,C.Ten_vai_tro AS Ten_Chuc_danh,CONVERT(VARCHAR(50),A.Ngay_lap,105) as Ngay_lap_mdy
			FROM DENGHINHANSU A LEFT JOIN KHOA_TRUNGTAM B ON A.Ma_bo_phan=B.ID LEFT JOIN VAITRO C ON A.Chuc_danh=C.ID LEFT JOIN ThanhVien D ON A.Nguoi_de_nghi=D.ID LEFT JOIN ChiTietThanhVien E ON D.Ten_DN=E.Ten_dang_nhap
			LEFT JOIN KHOA_TRUNGTAM F ON A.MA_BO_PHAN=F.ID
			WHERE A.Nguoi_de_nghi=@Nguoi_de_nghi OR F.ID=@Ma_bo_phan
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
		IF(@Tinh_trang <> '')
		BEGIN
			SELECT A.*,B.Ma_truong_khoa as Ma_truong_khoa,B.Ten as Ten_bo_phan,(E.Ho+' '+E.Ten_lot+' '+E.Ten) as Ten_nguoi_de_nghi,C.Ten_vai_tro AS Ten_Chuc_danh,CONVERT(VARCHAR(50),A.Ngay_lap,105) as Ngay_lap_mdy
			FROM DENGHINHANSU A LEFT JOIN KHOA_TRUNGTAM B ON A.Ma_bo_phan=B.ID LEFT JOIN VAITRO C ON A.Chuc_danh=C.ID LEFT JOIN ThanhVien D ON A.Nguoi_de_nghi=D.ID LEFT JOIN ChiTietThanhVien E ON D.Ten_DN=E.Ten_dang_nhap
			LEFT JOIN KHOA_TRUNGTAM F ON A.MA_BO_PHAN=F.ID
			WHERE A.Nguoi_de_nghi=@Nguoi_de_nghi AND A.Tinh_trang=@Tinh_trang OR F.ID=@Ma_bo_phan AND A.Tinh_trang=@Tinh_trang
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
	END
END
GO
/*
	sp_SelectAllDeNghiNhanSu '6','20',''
*/
GO

--sp_NhanSu_SelectAllDonXinThoiViec.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	29/05/2011
	Mục Đích	:	show Đề Nghị
	
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_SelectAllDonXinThoiViec')
BEGIN
	DROP PROC sp_NhanSu_SelectAllDonXinThoiViec
END
GO
CREATE PROC sp_NhanSu_SelectAllDonXinThoiViec
	@Tinh_trang			VARCHAR(5)
AS  
BEGIN
	IF(@Tinh_trang = '')
	BEGIN
		SELECT A.*,CONVERT(VARCHAR(10),A.NGAY_LAP,105) AS NGAY_LAP_DMY, (B.HO+' '+B.TEN_LOT+' '+B.TEN) AS TEN_NGUOI_DU_TUYEN, D.TEN AS TEN_BO_PHAN, D.ID AS MA_BO_PHAN,E.ID AS MA_VAI_TRO, E.TEN_VAI_TRO AS TEN_VAI_TRO
		FROM DONXINTHOIVIEC A INNER JOIN HOSODUTUYEN B ON A.NGUOI_DU_TUYEN=B.ID 
		INNER JOIN THANHVIEN C ON B.TEN_DANG_NHAP=C.TEN_DN
		INNER JOIN KHOA_TRUNGTAM D ON C.MA_BO_PHAN=D.ID
		INNER JOIN VAITRO E ON C.MA_VAI_TRO=E.ID
		ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
	END
	IF(@Tinh_trang <> '')
	BEGIN
		SELECT A.*, (B.HO+' '+B.TEN_LOT+' '+B.TEN) AS TEN_NGUOI_DU_TUYEN, D.TEN AS TEN_BO_PHAN, D.ID AS MA_BO_PHAN,E.ID AS MA_VAI_TRO, E.TEN_VAI_TRO AS TEN_VAI_TRO
		FROM DONXINTHOIVIEC A INNER JOIN HOSODUTUYEN B ON A.NGUOI_DU_TUYEN=B.ID 
		INNER JOIN THANHVIEN C ON B.TEN_DANG_NHAP=C.TEN_DN
		INNER JOIN KHOA_TRUNGTAM D ON C.MA_BO_PHAN=D.ID
		INNER JOIN VAITRO E ON C.MA_VAI_TRO=E.ID
		WHERE A.Tinh_trang=@Tinh_trang 
		ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
	END
END
GO
/*
	sp_NhanSu_SelectAllDeNghiKTV '6','20','0'
*/
GO

--sp_NhanSu_SelectAllHopDongLaoDong.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	18/06/2011
	Mục Đích	:	show Hợp Đồng
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_SelectAllHopDongLaoDong')
BEGIN
	DROP PROC sp_NhanSu_SelectAllHopDongLaoDong
END
GO
CREATE PROC sp_NhanSu_SelectAllHopDongLaoDong
	@Ma_bo_phan			VARCHAR(5),
	@Ma_thanh_vien		VARCHAR(5),
	@Tinh_trang			VARCHAR(5)
AS  
BEGIN
	IF(@Ma_bo_phan = '0')
	BEGIN
		IF(@Tinh_trang = '')
		BEGIN
			SELECT A.*,(B.HO+' '+B.TEN_LOT+' '+B.TEN) AS TEN_NGUOI_DU_TUYEN,(D.HO+' '+D.TEN_LOT+' '+D.TEN) AS TEN_NGUOI_LAP,CONVERT(VARCHAR(10),A.NGAY_LAP,105) AS NGAY_LAP_MDY,B.VI_TRI_DU_TUYEN AS VI_TRI_DU_TUYEN
			FROM HopDongLaoDong A LEFT JOIN HOSODUTUYEN B ON A.NGUOI_DU_TUYEN=B.ID LEFT JOIN THANHVIEN C ON A.Nguoi_lap=C.ID LEFT JOIN CHITIETTHANHVIEN D ON C.TEN_DN=D.TEN_DANG_NHAP
			WHERE A.Tinh_trang>='1'
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
		IF(@Tinh_trang <> '')
		BEGIN
			SELECT * FROM( 
			SELECT A.*,(B.HO+' '+B.TEN_LOT+' '+B.TEN) AS TEN_NGUOI_DU_TUYEN,(D.HO+' '+D.TEN_LOT+' '+D.TEN) AS TEN_NGUOI_LAP,CONVERT(VARCHAR(10),A.NGAY_LAP,105) AS NGAY_LAP_MDY,B.VI_TRI_DU_TUYEN AS VI_TRI_DU_TUYEN
			FROM HopDongLaoDong A LEFT JOIN HOSODUTUYEN B ON A.NGUOI_DU_TUYEN=B.ID LEFT JOIN THANHVIEN C ON A.Nguoi_lap=C.ID LEFT JOIN CHITIETTHANHVIEN D ON C.TEN_DN=D.TEN_DANG_NHAP
			WHERE A.Tinh_trang>='1') AS TB3 WHERE Tinh_trang=@Tinh_trang ORDER BY NGAY_CAP_NHAT_CUOI DESC
		END
	END
	IF(@Ma_bo_phan = '16' OR @Ma_bo_phan = '2')
	BEGIN
		IF(@Tinh_trang = '')
		BEGIN
			SELECT A.*,(B.HO+' '+B.TEN_LOT+' '+B.TEN) AS TEN_NGUOI_DU_TUYEN,(D.HO+' '+D.TEN_LOT+' '+D.TEN) AS TEN_NGUOI_LAP,CONVERT(VARCHAR(10),A.NGAY_LAP,105) AS NGAY_LAP_MDY,B.VI_TRI_DU_TUYEN AS VI_TRI_DU_TUYEN
			FROM HopDongLaoDong A LEFT JOIN HOSODUTUYEN B ON A.NGUOI_DU_TUYEN=B.ID LEFT JOIN THANHVIEN C ON A.Nguoi_lap=C.ID LEFT JOIN CHITIETTHANHVIEN D ON C.TEN_DN=D.TEN_DANG_NHAP
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
		IF(@Tinh_trang <> '')
		BEGIN
			SELECT A.*,(B.HO+' '+B.TEN_LOT+' '+B.TEN) AS TEN_NGUOI_DU_TUYEN,(D.HO+' '+D.TEN_LOT+' '+D.TEN) AS TEN_NGUOI_LAP,CONVERT(VARCHAR(10),A.NGAY_LAP,105) AS NGAY_LAP_MDY,B.VI_TRI_DU_TUYEN AS VI_TRI_DU_TUYEN
			FROM HopDongLaoDong A LEFT JOIN HOSODUTUYEN B ON A.NGUOI_DU_TUYEN=B.ID LEFT JOIN THANHVIEN C ON A.Nguoi_lap=C.ID LEFT JOIN CHITIETTHANHVIEN D ON C.TEN_DN=D.TEN_DANG_NHAP
			WHERE A.Tinh_trang=@Tinh_trang
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
	END
	IF(@Ma_bo_phan <> '0' AND @Ma_bo_phan <> '16' AND @Ma_bo_phan <> '2')
	BEGIN
		IF(@Tinh_trang = '')
		BEGIN
			SELECT A.*,(B.HO+' '+B.TEN_LOT+' '+B.TEN) AS TEN_NGUOI_DU_TUYEN,(D.HO+' '+D.TEN_LOT+' '+D.TEN) AS TEN_NGUOI_LAP,CONVERT(VARCHAR(10),A.NGAY_LAP,105) AS NGAY_LAP_MDY,B.VI_TRI_DU_TUYEN AS VI_TRI_DU_TUYEN
			FROM HopDongLaoDong A LEFT JOIN HOSODUTUYEN B ON A.NGUOI_DU_TUYEN=B.ID LEFT JOIN THANHVIEN C ON A.Nguoi_lap=C.ID LEFT JOIN CHITIETTHANHVIEN D ON C.TEN_DN=D.TEN_DANG_NHAP
			WHERE A.Tinh_trang>='1' AND A.Nguoi_du_tuyen = (SELECT B.ID FROM THANHVIEN A INNER JOIN HOSODUTUYEN B ON A.TEN_DN=B.TEN_DANG_NHAP WHERE A.ID=@Ma_thanh_vien)
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
		IF(@Tinh_trang <> '')
		BEGIN
			SELECT * FROM( 
			SELECT A.*,(B.HO+' '+B.TEN_LOT+' '+B.TEN) AS TEN_NGUOI_DU_TUYEN,(D.HO+' '+D.TEN_LOT+' '+D.TEN) AS TEN_NGUOI_LAP,CONVERT(VARCHAR(10),A.NGAY_LAP,105) AS NGAY_LAP_MDY,B.VI_TRI_DU_TUYEN AS VI_TRI_DU_TUYEN
			FROM HopDongLaoDong A LEFT JOIN HOSODUTUYEN B ON A.NGUOI_DU_TUYEN=B.ID LEFT JOIN THANHVIEN C ON A.Nguoi_lap=C.ID LEFT JOIN CHITIETTHANHVIEN D ON C.TEN_DN=D.TEN_DANG_NHAP
			WHERE A.Tinh_trang>='1' AND A.Nguoi_du_tuyen = (SELECT B.ID FROM THANHVIEN A INNER JOIN HOSODUTUYEN B ON A.TEN_DN=B.TEN_DANG_NHAP WHERE A.ID=@Ma_thanh_vien)) AS TB3 WHERE Tinh_trang=@Tinh_trang ORDER BY NGAY_CAP_NHAT_CUOI DESC
		END
	END
END
GO
/*
	sp_NhanSu_SelectAllHopDongLaoDong '2','',''
	SELECT * FROM KHOA_TRUNGTAM
*/
GO

--sp_NhanSu_SelectAllKeHoachTNS.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	29/06/2011
	Mục Đích	:	show Kế Hoạch TNS
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_SelectAllKeHoachTNS')
BEGIN
	DROP PROC sp_NhanSu_SelectAllKeHoachTNS
END
GO
CREATE PROC sp_NhanSu_SelectAllKeHoachTNS
	@Ma_bo_phan			VARCHAR(5),
	@Ma_thanh_vien		VARCHAR(5),
	@Tinh_trang			VARCHAR(5)
AS  
BEGIN
	IF(@Ma_bo_phan = '0' OR @Ma_bo_phan <> '0' AND @Ma_bo_phan <> '2')
	BEGIN
		IF(@Tinh_trang = '')
		BEGIN
			SELECT A.*,CONVERT(VARCHAR(10),A.Ngay_lap_ke_hoach,105) as Ngay_lap_ke_hoach_dmy,(B.Ho+' '+B.Ten_lot+' '+B.Ten) as Ten_nguoi_lap_ke_hoach
			FROM KeHoachTNS A LEFT JOIN THANHVIEN D ON A.Nguoi_lap_ke_hoach=D.ID LEFT JOIN CHITIETTHANHVIEN B ON D.Ten_DN=B.Ten_dang_nhap
			WHERE A.Tinh_trang>='0'
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
		IF(@Tinh_trang <> '')
		BEGIN
			SELECT * FROM(
			SELECT A.*,CONVERT(VARCHAR(10),A.Ngay_lap_ke_hoach,105) as Ngay_lap_ke_hoach_dmy,(B.Ho+' '+B.Ten_lot+' '+B.Ten) as Ten_nguoi_lap_ke_hoach
			FROM KeHoachTNS A LEFT JOIN THANHVIEN D ON A.Nguoi_lap_ke_hoach=D.ID LEFT JOIN CHITIETTHANHVIEN B ON D.Ten_DN=B.Ten_dang_nhap
			WHERE A.Tinh_trang>'0') AS TB1 WHERE Tinh_trang=@Tinh_trang 
			ORDER BY NGAY_CAP_NHAT_CUOI DESC
		END
	END
	IF(@Ma_bo_phan = '2')
	BEGIN
		IF(@Tinh_trang = '')
		BEGIN
			SELECT A.*,CONVERT(VARCHAR(10),A.Ngay_lap_ke_hoach,105) as Ngay_lap_ke_hoach_dmy,(B.Ho+' '+B.Ten_lot+' '+B.Ten) as Ten_nguoi_lap_ke_hoach
			FROM KeHoachTNS A LEFT JOIN THANHVIEN D ON A.Nguoi_lap_ke_hoach=D.ID LEFT JOIN CHITIETTHANHVIEN B ON D.Ten_DN=B.Ten_dang_nhap
			WHERE A.Nguoi_lap_ke_hoach=@Ma_thanh_vien
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
		IF(@Tinh_trang <> '')
		BEGIN
			SELECT A.*,CONVERT(VARCHAR(10),A.Ngay_lap_ke_hoach,105) as Ngay_lap_ke_hoach_dmy,(B.Ho+' '+B.Ten_lot+' '+B.Ten) as Ten_nguoi_lap_ke_hoach
			FROM KeHoachTNS A LEFT JOIN THANHVIEN D ON A.Nguoi_lap_ke_hoach=D.ID LEFT JOIN CHITIETTHANHVIEN B ON D.Ten_DN=B.Ten_dang_nhap
			WHERE A.Tinh_trang=@Tinh_trang AND A.Nguoi_lap_ke_hoach=@Ma_thanh_vien
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
	END
END
GO
/*
	sp_NhanSu_SelectAllKeHoachTNS '2','15','0'
*/
GO

--sp_NhanSu_SelectAllNhanXetKetQuaThuViec.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	18/06/2011
	Mục Đích	:	show Nhận Xét Kết Quả Thử Việc
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_SelectAllNhanXetKetQuaThuViec')
BEGIN
	DROP PROC sp_NhanSu_SelectAllNhanXetKetQuaThuViec
END
GO
CREATE PROC sp_NhanSu_SelectAllNhanXetKetQuaThuViec
	@Ma_bo_phan			VARCHAR(5),
	@Ma_vai_tro			VARCHAR(5),
	@Tinh_trang			VARCHAR(5)
AS  
BEGIN
	IF(@Ma_bo_phan = '1' or @Ma_bo_phan = '2' or @Ma_bo_phan = '16' or @Ma_bo_phan = '0')
	BEGIN
		IF(@Tinh_trang = '')
		BEGIN
			SELECT A.*,CONVERT(VARCHAR(10),A.NGAY_NHAN_XET,105) AS NGAY_NHAN_XET_MDY,(B.HO+' '+B.TEN_LOT+' '+B.TEN ) AS TEN_NGUOI_NHAN_XET,B.EMAIL AS EMAIL,(K.HO+' '+K.TEN_LOT+' '+K.TEN) AS TEN_NGUOI_DUYET,E.TEN_VAI_TRO AS TEN_VAI_TRO,F.MA_TRUONG_KHOA as MA_TRUONG_KHOA,F.TEN AS TEN_BO_PHAN
			FROM NHANXETKETQUATHUVIEC A LEFT JOIN HOSODUTUYEN B ON A.NGUOI_NHAN_XET=B.ID
			LEFT JOIN CHITIETKHTNS C ON B.Vi_tri_du_tuyen=C.ID
			LEFT JOIN DENGHINHANSU D ON C.Ma_de_nghi=D.ID
			LEFT JOIN VAITRO E ON D.Chuc_danh=E.ID
			LEFT JOIN KHOA_TRUNGTAM F ON D.Ma_bo_phan=F.ID
			LEFT JOIN THANHVIEN J ON A.NGUOI_DUYET=J.ID LEFT JOIN CHITIETTHANHVIEN K ON J.TEN_DN=K.TEN_DANG_NHAP
			WHERE A.Tinh_trang > '0'
			ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
		END
		IF(@Tinh_trang <> '')
		BEGIN
			SELECT * FROM(
			SELECT A.*,CONVERT(VARCHAR(10),A.NGAY_NHAN_XET,105) AS NGAY_NHAN_XET_MDY,(B.HO+' '+B.TEN_LOT+' '+B.TEN ) AS TEN_NGUOI_NHAN_XET,B.EMAIL AS EMAIL,(K.HO+' '+K.TEN_LOT+' '+K.TEN) AS TEN_NGUOI_DUYET,E.TEN_VAI_TRO AS TEN_VAI_TRO,F.MA_TRUONG_KHOA as MA_TRUONG_KHOA,F.TEN AS TEN_BO_PHAN
			FROM NHANXETKETQUATHUVIEC A LEFT JOIN HOSODUTUYEN B ON A.NGUOI_NHAN_XET=B.ID
			LEFT JOIN CHITIETKHTNS C ON B.Vi_tri_du_tuyen=C.ID
			LEFT JOIN DENGHINHANSU D ON C.Ma_de_nghi=D.ID
			LEFT JOIN VAITRO E ON D.Chuc_danh=E.ID
			LEFT JOIN KHOA_TRUNGTAM F ON D.Ma_bo_phan=F.ID
			LEFT JOIN THANHVIEN J ON A.NGUOI_DUYET=J.ID LEFT JOIN CHITIETTHANHVIEN K ON J.TEN_DN=K.TEN_DANG_NHAP
			WHERE A.Tinh_trang > '0') AS TB1 WHERE Tinh_trang=@Tinh_trang ORDER BY NGAY_CAP_NHAT_CUOI DESC
		END
	END
	ELSE
	BEGIN
		IF(@Ma_vai_tro = '5')
		BEGIN
			IF(@Tinh_trang = '')
			BEGIN
				SELECT A.*,CONVERT(VARCHAR(10),A.NGAY_NHAN_XET,105) AS NGAY_NHAN_XET_MDY,(B.HO+' '+B.TEN_LOT+' '+B.TEN ) AS TEN_NGUOI_NHAN_XET,B.EMAIL AS EMAIL,(K.HO+' '+K.TEN_LOT+' '+K.TEN) AS TEN_NGUOI_DUYET,E.TEN_VAI_TRO AS TEN_VAI_TRO,F.MA_TRUONG_KHOA as MA_TRUONG_KHOA,F.TEN AS TEN_BO_PHAN
				FROM NHANXETKETQUATHUVIEC A LEFT JOIN HOSODUTUYEN B ON A.NGUOI_NHAN_XET=B.ID
				LEFT JOIN CHITIETKHTNS C ON B.Vi_tri_du_tuyen=C.ID
				LEFT JOIN DENGHINHANSU D ON C.Ma_de_nghi=D.ID
				LEFT JOIN VAITRO E ON D.Chuc_danh=E.ID
				LEFT JOIN KHOA_TRUNGTAM F ON D.Ma_bo_phan=F.ID
				LEFT JOIN THANHVIEN J ON A.NGUOI_DUYET=J.ID LEFT JOIN CHITIETTHANHVIEN K ON J.TEN_DN=K.TEN_DANG_NHAP
				WHERE D.MA_BO_PHAN=@Ma_bo_phan
				ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
			END
			IF(@Tinh_trang <> '')
			BEGIN
				SELECT * FROM(
				SELECT A.*,CONVERT(VARCHAR(10),A.NGAY_NHAN_XET,105) AS NGAY_NHAN_XET_MDY,(B.HO+' '+B.TEN_LOT+' '+B.TEN ) AS TEN_NGUOI_NHAN_XET,B.EMAIL AS EMAIL,(K.HO+' '+K.TEN_LOT+' '+K.TEN) AS TEN_NGUOI_DUYET,E.TEN_VAI_TRO AS TEN_VAI_TRO,F.MA_TRUONG_KHOA as MA_TRUONG_KHOA,F.TEN AS TEN_BO_PHAN
				FROM NHANXETKETQUATHUVIEC A LEFT JOIN HOSODUTUYEN B ON A.NGUOI_NHAN_XET=B.ID
				LEFT JOIN CHITIETKHTNS C ON B.Vi_tri_du_tuyen=C.ID
				LEFT JOIN DENGHINHANSU D ON C.Ma_de_nghi=D.ID
				LEFT JOIN VAITRO E ON D.Chuc_danh=E.ID
				LEFT JOIN KHOA_TRUNGTAM F ON D.Ma_bo_phan=F.ID
				LEFT JOIN THANHVIEN J ON A.NGUOI_DUYET=J.ID LEFT JOIN CHITIETTHANHVIEN K ON J.TEN_DN=K.TEN_DANG_NHAP
				WHERE D.MA_BO_PHAN=@Ma_bo_phan) AS TB1 WHERE Tinh_trang=@Tinh_trang ORDER BY NGAY_CAP_NHAT_CUOI DESC
			END
		END
		ELSE
		BEGIN
			IF(@Tinh_trang = '')
			BEGIN
				SELECT A.*,CONVERT(VARCHAR(10),A.NGAY_NHAN_XET,105) AS NGAY_NHAN_XET_MDY,(B.HO+' '+B.TEN_LOT+' '+B.TEN ) AS TEN_NGUOI_NHAN_XET,B.EMAIL AS EMAIL,(K.HO+' '+K.TEN_LOT+' '+K.TEN) AS TEN_NGUOI_DUYET,E.TEN_VAI_TRO AS TEN_VAI_TRO,F.MA_TRUONG_KHOA as MA_TRUONG_KHOA,F.TEN AS TEN_BO_PHAN
				FROM NHANXETKETQUATHUVIEC A LEFT JOIN HOSODUTUYEN B ON A.NGUOI_NHAN_XET=B.ID
				LEFT JOIN CHITIETKHTNS C ON B.Vi_tri_du_tuyen=C.ID
				LEFT JOIN DENGHINHANSU D ON C.Ma_de_nghi=D.ID
				LEFT JOIN VAITRO E ON D.Chuc_danh=E.ID
				LEFT JOIN KHOA_TRUNGTAM F ON D.Ma_bo_phan=F.ID
				LEFT JOIN THANHVIEN J ON A.NGUOI_DUYET=J.ID LEFT JOIN CHITIETTHANHVIEN K ON J.TEN_DN=K.TEN_DANG_NHAP
				WHERE A.Tinh_trang > '0' AND D.MA_BO_PHAN=@Ma_bo_phan
				ORDER BY A.NGAY_CAP_NHAT_CUOI DESC
			END
			IF(@Tinh_trang <> '')
			BEGIN
				SELECT * FROM(
				SELECT A.*,CONVERT(VARCHAR(10),A.NGAY_NHAN_XET,105) AS NGAY_NHAN_XET_MDY,(B.HO+' '+B.TEN_LOT+' '+B.TEN ) AS TEN_NGUOI_NHAN_XET,B.EMAIL AS EMAIL,(K.HO+' '+K.TEN_LOT+' '+K.TEN) AS TEN_NGUOI_DUYET,E.TEN_VAI_TRO AS TEN_VAI_TRO,F.MA_TRUONG_KHOA as MA_TRUONG_KHOA,F.TEN AS TEN_BO_PHAN
				FROM NHANXETKETQUATHUVIEC A LEFT JOIN HOSODUTUYEN B ON A.NGUOI_NHAN_XET=B.ID
				LEFT JOIN CHITIETKHTNS C ON B.Vi_tri_du_tuyen=C.ID
				LEFT JOIN DENGHINHANSU D ON C.Ma_de_nghi=D.ID
				LEFT JOIN VAITRO E ON D.Chuc_danh=E.ID
				LEFT JOIN KHOA_TRUNGTAM F ON D.Ma_bo_phan=F.ID
				LEFT JOIN THANHVIEN J ON A.NGUOI_DUYET=J.ID LEFT JOIN CHITIETTHANHVIEN K ON J.TEN_DN=K.TEN_DANG_NHAP
				WHERE A.Tinh_trang > '0' AND D.MA_BO_PHAN=@Ma_bo_phan) AS TB1 WHERE Tinh_trang=@Tinh_trang ORDER BY NGAY_CAP_NHAT_CUOI DESC
			END
		END
		
	END
END
GO

GO

--sp_NhanSu_TangSoLuongDaTuyenKHTNS.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	09/07/1990
	Mục Đích	:	Tăng số lượng đã tuyển thành công
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_TangSoLuongDaTuyenKHTNS')
BEGIN
	DROP PROC sp_NhanSu_TangSoLuongDaTuyenKHTNS
END
GO
CREATE PROC sp_NhanSu_TangSoLuongDaTuyenKHTNS  
	@ID				INT,
	@KQ				INT OUTPUT  
AS  
BEGIN  
	SET @KQ = -1
	IF EXISTS (SELECT * FROM ChiTietKHTNS WHERE ID=@ID)
	BEGIN
		DECLARE @So_luong_da_tuyen INT
		SET @So_luong_da_tuyen = 0
		SELECT @So_luong_da_tuyen=So_luong_da_tuyen FROM ChiTietKHTNS WHERE ID=@ID
		SET @So_luong_da_tuyen = @So_luong_da_tuyen + 1
		UPDATE ChiTietKHTNS SET So_luong_da_tuyen=@So_luong_da_tuyen, Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
		SET @KQ = @ID 
	END  
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_InsertChiTietKHTNS 4,0,'CHI_TIET_KE_HOACH_TUYEN_NHAN_SU',@KQ OUTPUT
SELECT @KQ

SELECT * FROM ChiTietKHTNS

SELECT * FROM KeHoachTNS

SELECT * FROM DeNghiNhanSu

*/

GO

--sp_NhanSu_TimKiemNhanSu.sql

/*
		Nguoi Viet: AMIN
 		Ngay viet:	30/5/2011
		Muc dich:   SEARCH NHAN SU
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_TimKiemNhanSu')
BEGIN
	DROP PROC sp_NhanSu_TimKiemNhanSu
END
GO
CREATE PROC sp_NhanSu_TimKiemNhanSu
	@HO				NVARCHAR(200),
	@TEN_LOT		NVARCHAR(200),
	@TEN			NVARCHAR(200),
	@SO_NHA			NVARCHAR(50),
	@DUONG			NVARCHAR(200),
	@PHUONG_XA		NVARCHAR(200),
	@QUAN_HUYEN		NVARCHAR(200),
	@TINH_TP		NVARCHAR(200),
	@NGAYSINH		VARCHAR(10),
	@NGAYVAOLAM		VARCHAR(10),
	@EMAIL			VARCHAR(10),
	@BOPHAN			VARCHAR(10),
	@VAITRO			VARCHAR(10),
	@BANGCAP		NVARCHAR(50)
AS
BEGIN
DECLARE @DIEUKIENHOTEN			NVARCHAR(300)
DECLARE @DIEUKIENDIACHI			NVARCHAR(300)
DECLARE @DIEUKIENNGAYSINH		VARCHAR(100)
DECLARE @DIEUKIENNGAYVAOLAM		VARCHAR(100)
DECLARE @DIEUKIENEMAIL			VARCHAR(100)
DECLARE @DIEUKIENBOPHAN			VARCHAR(100)
DECLARE @DIEUKIENVAITRO			VARCHAR(100)
DECLARE @DIEUKIENBANGCAP		NVARCHAR(300)

SET @DIEUKIENHOTEN=''
SET @DIEUKIENDIACHI=''
SET @DIEUKIENNGAYSINH=''
SET @DIEUKIENNGAYVAOLAM=''
SET @DIEUKIENEMAIL=''
SET @DIEUKIENBOPHAN=''
SET @DIEUKIENVAITRO=''
SET @DIEUKIENBANGCAP=''

IF @HO <> ''  
	BEGIN  
		SET @DIEUKIENHOTEN=' AND D.HO LIKE N''%'+ @HO +'%'' '
	END  
IF @TEN_LOT <> ''  
	BEGIN  
		SET @DIEUKIENHOTEN = @DIEUKIENHOTEN + ' AND D.TEN_LOT LIKE N''%'+ @TEN_LOT +'%'' '
	END
IF @TEN <> ''  
	BEGIN  
		SET @DIEUKIENHOTEN = @DIEUKIENHOTEN + ' AND D.TEN LIKE N''%'+ @TEN +'%'' '
	END
IF @SO_NHA <> ''  
	BEGIN  
		SET @DIEUKIENDIACHI = @DIEUKIENDIACHI + ' AND E.SO_NHA LIKE N''%'+ @SO_NHA +'%'' '
	END 
IF @DUONG <> ''  
	BEGIN  
		SET @DIEUKIENDIACHI = @DIEUKIENDIACHI + ' AND E.DUONG LIKE N''%'+ @DUONG +'%'' '
	END 
IF @PHUONG_XA <> ''  
	BEGIN  
		SET @DIEUKIENDIACHI = @DIEUKIENDIACHI + ' AND E.PHUONG_XA LIKE N''%'+ @PHUONG_XA +'%'' '
	END 
IF @QUAN_HUYEN <> ''  
	BEGIN  
		SET @DIEUKIENDIACHI = @DIEUKIENDIACHI + ' AND E.QUAN_HUYEN LIKE N''%'+ @QUAN_HUYEN +'%'' '
	END 
IF @TINH_TP <> ''  
	BEGIN  
		SET @DIEUKIENDIACHI = @DIEUKIENDIACHI + ' AND E.TINH_THANHPHO LIKE N''%'+ @TINH_TP +'%'' '
	END 
IF @NGAYSINH <> ''  
	BEGIN  
		SET @DIEUKIENNGAYSINH=' AND convert(VARCHAR(10),D.NGAY_SINH,105) LIKE ''%' + @NGAYSINH + '%'' '
	END 
IF @NGAYVAOLAM <> ''  
	BEGIN  
		SET @DIEUKIENNGAYVAOLAM=' AND convert(VARCHAR(10),D.NGAY_BAT_DAU,105) LIKE ''%' + @NGAYVAOLAM +'%'' '
	END 
IF @EMAIL <> ''  
	BEGIN  
		SET @DIEUKIENEMAIL=' AND D.EMAIL LIKE ''%'+ @EMAIL +'%'' '
	END 
IF @BOPHAN <> ''  
	BEGIN  
		IF @BOPHAN = 'all'
		BEGIN
			SET @DIEUKIENBOPHAN=''
		END
		ELSE
		BEGIN
			SET @DIEUKIENBOPHAN=' AND C.ID='+@BOPHAN
		END
	END 
IF @VAITRO <> ''  
	BEGIN  
		IF @VAITRO = 'all'
		BEGIN
			SET @DIEUKIENVAITRO=''
		END
		ELSE
		BEGIN
			SET @DIEUKIENVAITRO=' AND B.ID='+@VAITRO
		END
	END 
IF @BANGCAP <> ''  
	BEGIN  
		SET @DIEUKIENBANGCAP=' AND F.LOAI_BANG LIKE N''%'+@BANGCAP +'%'' '
	END 

DECLARE @sql NVARCHAR(2000)

SET @sql = '
SELECT A.ID,(D.HO +'' ''+ D.TEN_LOT +'' ''+ D.TEN) AS HOTEN, 
(E.SO_NHA +'' ''+ E.DUONG +'' ''+ E.PHUONG_XA +'' ''+ E.QUAN_HUYEN +'' ''+ E.TINH_THANHPHO) AS DIACHI,
convert(VARCHAR(10),D.NGAY_SINH,105) AS NGAYSINH,
convert(VARCHAR(10),D.NGAY_BAT_DAU,105) AS NGAYVAOLAM,	
D.EMAIL,C.TEN AS BOPHAN,B.TEN_VAI_TRO AS VAITRO,F.LOAI_BANG AS BANGCAP
FROM ThanhVien A LEFT JOIN VAITRO B ON A.MA_VAI_TRO=B.ID 
LEFT JOIN KHOA_TRUNGTAM C ON A.MA_BO_PHAN=C.ID
LEFT JOIN CHITIETTHANHVIEN D ON A.TEN_DN=D.TEN_DANG_NHAP 
LEFT JOIN DIACHI E ON D.MA_DIA_CHI=E.ID 
LEFT JOIN BANGCAP F ON D.MA_BANG_CAP=F.ID
WHERE 1=1 '
+ @DIEUKIENHOTEN			
+ @DIEUKIENDIACHI			
+ @DIEUKIENNGAYSINH		
+ @DIEUKIENNGAYVAOLAM		
+ @DIEUKIENEMAIL			
+ @DIEUKIENBOPHAN			
+ @DIEUKIENVAITRO			
+ @DIEUKIENBANGCAP		
+ ' ORDER BY A.ID ASC'


	PRINT @SQL
	EXEC sp_executesql @sql
END
GO



 

GO

--sp_NhanSu_UpdateChiTietHoSoDuTuyen.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	24/05/2011
	Mục Đích	:	Cập nhật cột Tinh_trang ( 0 = mặc định, 1 = đạt, 2 = rớt )
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateChiTietHoSoDuTuyen')
BEGIN
	DROP PROC sp_NhanSu_UpdateChiTietHoSoDuTuyen
END
GO
CREATE PROC sp_NhanSu_UpdateChiTietHoSoDuTuyen
	@ID					INT,
	@Ho					NVARCHAR(50),
	@Ten_lot			NVARCHAR(200),
	@Ten				NVARCHAR(50),
	@Gioi_tinh			INT,
	@Ngay_sinh			DATETIME,
	@CMND				VARCHAR(20),
	@Ngay_cap			DATETIME,
	@Noi_cap			NVARCHAR(100),
	@So_nha				VARCHAR(20),	
	@Duong				NVARCHAR(500),
	@Phuong_xa			NVARCHAR(100),
	@Quan_huyen			NVARCHAR(100),
	@Tinh_thanhpho		NVARCHAR(200),		
	@Dien_thoai_nha		VARCHAR(20),
	@Email				VARCHAR(100),
	@Dien_thoai_dd		VARCHAR(50),
	@Trinh_do_van_hoa	NVARCHAR(1000),
	@Chuyen_mon			NVARCHAR(1000),
	@Tin_hoc			NVARCHAR(1000),
	@Ngoai_ngu			NVARCHAR(1000),
	@Tom_tat_ban_than	NVARCHAR(MAX),				
	@KQ					INT OUTPUT    
AS  
BEGIN  
	SET @KQ = -1  
	IF EXISTS (SELECT * FROM HoSoDuTuyen WHERE ID=@ID)   
	BEGIN  
		UPDATE HoSoDuTuyen SET Ho=@Ho,Ten_lot=@Ten_lot,Ten=@Ten,Gioi_tinh=@Gioi_tinh,Ngay_sinh=@Ngay_sinh,CMND=@CMND,Ngay_cap=@Ngay_cap,Noi_cap=@Noi_cap,So_nha=@So_nha,Duong=@Duong,Phuong_xa=@Phuong_xa,Quan_huyen=@Quan_huyen,Tinh_thanhpho=@Tinh_thanhpho,Dien_thoai_nha=@Dien_thoai_nha,Email=@Email,Dien_thoai_dd=@Dien_thoai_dd,Trinh_do_van_hoa=@Trinh_do_van_hoa,Chuyen_mon=@Chuyen_mon,Tin_hoc=@Tin_hoc,Ngoai_ngu=@Ngoai_ngu,Tom_tat_ban_than=@Tom_tat_ban_than,Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
		SET @KQ = @ID  
	END  
END
GO


GO

--sp_NhanSu_UpdateChiTietKHTNS.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	31/05/2011
	Mục Đích	:	Cập nhật Chi Tiết Kế Hoạch Tuyển Nhân Sự
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateChiTietKHTNS')
BEGIN
	DROP PROC sp_NhanSu_UpdateChiTietKHTNS
END
GO
CREATE PROC sp_NhanSu_UpdateChiTietKHTNS  
	@ID					INT,
	@Ghi_chu			NVARCHAR(500),
	@KQ					INT OUTPUT  
AS  
BEGIN  
	SET @KQ = -1
	IF EXISTS (SELECT * FROM ChiTietKHTNS WHERE ID=@ID)
	BEGIN
		BEGIN
			UPDATE ChiTietKHTNS SET Ghi_chu=@Ghi_chu,Ngay_cap_nhat_cuoi=GETDATE() WHERE ID=@ID
			SET @KQ = 1  
		END
	END  
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_InsertChiTietKHTNS 4,0,'CHI_TIET_KE_HOACH_TUYEN_NHAN_SU',@KQ OUTPUT
SELECT @KQ

SELECT * FROM ChiTietKHTNS

SELECT * FROM KeHoachTNS

SELECT * FROM DeNghiNhanSu

*/

GO

--sp_NhanSu_UpdateDeNghiKTV.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	26/05/2011
	Mục Đích	:	Cập Nhật Đề Nghị Khoán Thử Việc
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateDeNghiKTV')
BEGIN
	DROP PROC sp_NhanSu_UpdateDeNghiKTV
END
GO
CREATE PROC sp_NhanSu_UpdateDeNghiKTV  
	@ID						INT,
	@Thoi_gian				FLOAT,
	@Bat_dau				DATETIME,
	@Ket_thuc				DATETIME,
	@Luong_khoan			NUMERIC,
	@Tinh_trang				INT,
	@KQ						INT OUTPUT  
AS  
BEGIN  
	SET @KQ = -1 
	IF EXISTS (SELECT * FROM DeNghiKTV WHERE ID=@ID)   
	BEGIN  
		UPDATE DeNghiKTV SET Thoi_gian=@Thoi_gian, Bat_dau=@Bat_dau, Ket_thuc=@Ket_thuc, Luong_khoan=@Luong_khoan,Tinh_trang=@Tinh_trang,Ly_do_reject=null, Ngay_cap_nhat_cuoi=GETDATE() WHERE ID=@ID
		SET @KQ = @ID
	END  
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_InsertDeNghiKTV 0,3,1,'1/1/1991','1/1/1991','1',@KQ OUTPUT
SELECT @KQ

SELECT * FROM DeNghiNhanSu

SELECT * FROM DeNghiKTV

*/

GO

--sp_NhanSu_UpdateDeNghiKTV_Approve.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	26/05/2011
	Mục Đích	:	Duyệt Đề Nghị Khoán Thử Việc
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateDeNghiKTV_Approve')
BEGIN
	DROP PROC sp_NhanSu_UpdateDeNghiKTV_Approve
END
GO
CREATE PROC sp_NhanSu_UpdateDeNghiKTV_Approve  
	@ID					INT,
	@Ma_nguoi_duyet		INT,
	@KQ					INT OUTPUT
AS  
BEGIN  
	SET @KQ = -1
	DECLARE @BOPHAN INT
	IF EXISTS (SELECT * FROM DeNghiKTV WHERE ID=@ID)   
	BEGIN
		DECLARE @Tinh_trang INT
		SET @Tinh_trang = (SELECT Tinh_trang FROM DeNghiKTV WHERE ID=@ID)
		IF(@Tinh_trang = 1)
		BEGIN
			UPDATE DeNghiKTV SET Tinh_trang='2',Truong_khoa=@Ma_nguoi_duyet,Ngay_TK_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
			SET @KQ = 1
		END
		IF(@Tinh_trang = 2)
		BEGIN
			SELECT @BOPHAN=Ma_bo_phan FROM THANHVIEN WHERE ID=@Ma_nguoi_duyet
			IF (@BOPHAN = 1)
			BEGIN
				UPDATE DeNghiKTV SET Tinh_trang='3',Phong_DT=@Ma_nguoi_duyet,Ngay_DT_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
				SET @KQ = 1
			END
			IF (@BOPHAN = 2)
			BEGIN
				UPDATE DeNghiKTV SET Tinh_trang='3',Phong_HC=@Ma_nguoi_duyet,Ngay_HC_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
				SET @KQ = 1
			END
		END
		IF(@Tinh_trang = 3)
		BEGIN
			SELECT @BOPHAN = Ma_bo_phan FROM THANHVIEN WHERE ID=@Ma_nguoi_duyet
			IF (@BOPHAN = 1)
			BEGIN
				UPDATE DeNghiKTV SET Tinh_trang='4',Phong_DT=@Ma_nguoi_duyet,Ngay_DT_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
				SET @KQ = 1
			END
			IF (@BOPHAN = 2)
			BEGIN
				UPDATE DeNghiKTV SET Tinh_trang='4',Phong_HC=@Ma_nguoi_duyet,Ngay_HC_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
				SET @KQ = 1
			END
		END
		IF(@Tinh_trang = 4)
		BEGIN
			UPDATE DeNghiKTV SET Tinh_trang='5',Hieu_truong=@Ma_nguoi_duyet,Ngay_HT_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
			SET @KQ = 1
		END
	END  
END
GO

/*

DECLARE @KQ INT 
EXEC sp_InsertDeNghiKTV 0,3,1,'1/1/1991','1/1/1991','1',@KQ OUTPUT
SELECT @KQ

SELECT * FROM DeNghiKTV

SELECT * FROM DeNghiKTV

*/

GO

--sp_NhanSu_UpdateDeNghiKTV_Reject.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	26/05/2011
	Mục Đích	:	Hủy Đề Nghị Khoán Thử Việc
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateDeNghiKTV_Reject')
BEGIN
	DROP PROC sp_NhanSu_UpdateDeNghiKTV_Reject
END
GO
CREATE PROC sp_NhanSu_UpdateDeNghiKTV_Reject  
	@ID					INT,
	@Ly_do_reject		NVARCHAR(1000),
	@KQ					INT OUTPUT
AS  
BEGIN  
	SET @KQ = -1 
	IF EXISTS (SELECT * FROM DeNghiKTV WHERE ID=@ID)   
	BEGIN  
		UPDATE DeNghiKTV SET Ly_do_reject=@Ly_do_reject,Tinh_trang='6',Phong_HC=null,Ngay_HC_duyet=null,Phong_DT=null,Ngay_DT_duyet=null,Hieu_truong=null,Ngay_HT_duyet=null,Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
		SET @KQ = 1
	END  
END
GO


/*

DECLARE @KQ INT 
EXEC sp_InsertDeNghiKTV 0,3,1,'1/1/1991','1/1/1991','1',@KQ OUTPUT
SELECT @KQ

SELECT * FROM DeNghiNhanSu

SELECT * FROM DeNghiKTV

*/

GO

--sp_NhanSu_UpdateDeNghiNhanSu.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	24/05/2011
	Mục Đích	:	Cập nhật cột Tinh_trang( 0 = luu, 1 = gui )
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateDeNghiNhanSu')
BEGIN
	DROP PROC sp_NhanSu_UpdateDeNghiNhanSu
END
GO
CREATE PROC sp_NhanSu_UpdateDeNghiNhanSu
	@ID					INT,
	@Chuc_danh			INT,
	@So_luong			INT,
	@Cong_viec			NVARCHAR(2000),
	@Thoi_gian_bat_dau_lam DATETIME,
	@Tinh_trang			INT,
	@KQ					INT OUTPUT
AS  
BEGIN  
	SET @KQ = -1 
	IF EXISTS (SELECT * FROM DeNghiNhanSu WHERE ID=@ID)   
	BEGIN  
		UPDATE DeNghiNhanSu SET Chuc_danh=@Chuc_danh,Cong_viec=@Cong_viec,So_luong=@So_luong,Thoi_gian_bat_dau_lam=@Thoi_gian_bat_dau_lam,Ly_do_reject=null,Tinh_trang=@Tinh_trang,Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
		SET @KQ = @ID
	END  
END
GO


GO

--sp_NhanSu_UpdateDeNghiNhanSu_Approve.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	24/05/2011
	Mục Đích	:	Cập nhật cột tình trạng (2 = TruongKhoa, 3 = PDT, 4 = PHC, 5 = HT  )
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateDeNghiNhanSu_Approve')
BEGIN
	DROP PROC sp_NhanSu_UpdateDeNghiNhanSu_Approve
END
GO
CREATE PROC sp_NhanSu_UpdateDeNghiNhanSu_Approve
	@ID					INT,
	@Ma_nguoi_duyet		INT,
	@KQ					INT OUTPUT
AS  
BEGIN  
	SET @KQ = -1
	DECLARE @BOPHAN INT
	IF EXISTS (SELECT * FROM DeNghiNhanSu WHERE ID=@ID)   
	BEGIN
		DECLARE @Tinh_trang INT
		SET @Tinh_trang = (SELECT Tinh_trang FROM DeNghiNhanSu WHERE ID=@ID)

		IF(@Tinh_trang=1)
		BEGIN
			UPDATE DeNghiNhanSu SET Tinh_trang='2',Truong_khoa=@Ma_nguoi_duyet,Ngay_TK_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
			SET @KQ = 1
		END
		IF(@Tinh_trang=2)
		BEGIN
			SELECT @BOPHAN=Ma_bo_phan FROM THANHVIEN WHERE ID=@Ma_nguoi_duyet
			IF (@BOPHAN = 1)
			BEGIN
				UPDATE DeNghiNhanSu SET Tinh_trang='3',Phong_DT=@Ma_nguoi_duyet,Ngay_DT_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
				SET @KQ = 1
			END
			IF (@BOPHAN = 2)
			BEGIN
				UPDATE DeNghiNhanSu SET Tinh_trang='3',Phong_HC=@Ma_nguoi_duyet,Ngay_HC_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
				SET @KQ = 1
			END
		END
		IF(@Tinh_trang=3)
		BEGIN
			SELECT @BOPHAN=Ma_bo_phan FROM THANHVIEN WHERE ID=@Ma_nguoi_duyet
			IF (@BOPHAN = 1)
			BEGIN
				UPDATE DeNghiNhanSu SET Tinh_trang='4',Phong_DT=@Ma_nguoi_duyet,Ngay_DT_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
				SET @KQ = 1
			END
			IF (@BOPHAN = 2)
			BEGIN
				UPDATE DeNghiNhanSu SET Tinh_trang='4',Phong_HC=@Ma_nguoi_duyet,Ngay_HC_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
				SET @KQ = 1
			END
		END
		IF(@Tinh_trang=4)
		BEGIN
			UPDATE DeNghiNhanSu SET Tinh_trang='5',Hieu_truong=@Ma_nguoi_duyet,Ngay_HT_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
			SET @KQ = 1
		END
	END  
END
GO


GO

--sp_NhanSu_UpdateDeNghiNhanSu_Reject.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	24/05/2011
	Mục Đích	:	Cập nhật các cột tình trạng duyệt về mặc định là 0
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateDeNghiNhanSu_Reject')
BEGIN
	DROP PROC sp_NhanSu_UpdateDeNghiNhanSu_Reject
END
GO
CREATE PROC sp_NhanSu_UpdateDeNghiNhanSu_Reject
	@ID					INT,
	@Ly_do_reject		NVARCHAR(500),
	@KQ					INT OUTPUT
AS  
BEGIN  
	SET @KQ = -1  
	IF EXISTS (SELECT * FROM DeNghiNhanSu WHERE ID=@ID)   
	BEGIN  
		UPDATE DeNghiNhanSu SET Ly_do_reject=@Ly_do_reject,Tinh_trang='6',Truong_khoa=null,Ngay_TK_duyet=null,Phong_HC=null,Ngay_HC_duyet=null,Phong_DT=null,Ngay_DT_duyet=null,Hieu_truong=null,Ngay_HT_duyet=null,Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
		SET @KQ = 1
	END  
END
GO


GO

--sp_NhanSu_UpdateDonXinThoiViec.sql
/*
	Người Viết	:	Trần Cẩm thành
	Ngày Viết	:	19/08/2011
	Mục Đích	:	cập nhật đơn xin thôi việc
	SELECT * FROM DONXINTHOIVIEC
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateDonXinThoiViec')
BEGIN
	DROP PROC sp_NhanSu_UpdateDonXinThoiViec
END
GO
CREATE PROC sp_NhanSu_UpdateDonXinThoiViec  
	@ID					INT,
	@Ly_do				NVARCHAR(1000),
	@Ngay_thoi_viec		DATETIME,
	@Tinh_trang			INT,
	@KQ					INT OUTPUT
AS  
BEGIN  
	SET @KQ = -1
	IF EXISTS (SELECT * FROM DonXinThoiViec WHERE ID=@ID)
	BEGIN
		UPDATE DonXinThoiViec SET Ly_do=@Ly_do,Ngay_thoi_viec=@Ngay_thoi_viec,Tinh_trang=@Tinh_trang,Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
		SET @KQ=@ID
	END  
END  
GO


GO

--sp_NhanSu_UpdateDonXinThoiViec_Approve.sql
/*
	Người Viết	:	Trần Cẩm thành
	Ngày Viết	:	19/08/2011
	Mục Đích	:	Approve đơn xin thôi việc
	SELECT * FROM DONXINTHOIVIEC
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateDonXinThoiViec_Approve')
BEGIN
	DROP PROC sp_NhanSu_UpdateDonXinThoiViec_Approve
END
GO
CREATE PROC sp_NhanSu_UpdateDonXinThoiViec_Approve  
	@ID					INT,
	@Ma_nguoi_duyet		INT,
	@KQ					INT OUTPUT
AS  
BEGIN  
	SET @KQ = -1
	DECLARE @BOPHAN INT
	IF EXISTS (SELECT * FROM DonXinThoiViec WHERE ID=@ID)   
	BEGIN
		DECLARE @Tinh_trang INT
		SET @Tinh_trang = (SELECT Tinh_trang FROM DonXinThoiViec WHERE ID=@ID)
		IF(@Tinh_trang = 1)
		BEGIN
			UPDATE DonXinThoiViec SET Tinh_trang='2',Truong_khoa=@Ma_nguoi_duyet,Ngay_TK_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
			SET @KQ = @ID
		END
		IF(@Tinh_trang = 2)
		BEGIN
			SELECT @BOPHAN=Ma_bo_phan FROM THANHVIEN WHERE ID=@Ma_nguoi_duyet
			IF (@BOPHAN = 1)
			BEGIN
				UPDATE DonXinThoiViec SET Tinh_trang='3',Phong_DT=@Ma_nguoi_duyet,Ngay_DT_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
				SET @KQ = @ID
			END
			IF (@BOPHAN = 2)
			BEGIN
				UPDATE DonXinThoiViec SET Tinh_trang='3',Phong_HC=@Ma_nguoi_duyet,Ngay_HC_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
				SET @KQ = @ID
			END
		END
		IF(@Tinh_trang = 3)
		BEGIN
			SELECT @BOPHAN = Ma_bo_phan FROM THANHVIEN WHERE ID=@Ma_nguoi_duyet
			IF (@BOPHAN = 1)
			BEGIN
				UPDATE DonXinThoiViec SET Tinh_trang='4',Phong_DT=@Ma_nguoi_duyet,Ngay_DT_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
				SET @KQ = @ID
			END
			IF (@BOPHAN = 2)
			BEGIN
				UPDATE DonXinThoiViec SET Tinh_trang='4',Phong_HC=@Ma_nguoi_duyet,Ngay_HC_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
				SET @KQ = @ID
			END
		END
		IF(@Tinh_trang = 4)
		BEGIN
			UPDATE DonXinThoiViec SET Tinh_trang='5',Hieu_truong=@Ma_nguoi_duyet,Ngay_HT_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
			SET @KQ = @ID
		END
	END 
END  
GO


GO

--sp_NhanSu_UpdateDonXinThoiViec_Reject.sql
/*
	Người Viết	:	Trần Cẩm thành
	Ngày Viết	:	19/08/2011
	Mục Đích	:	Approve đơn xin thôi việc
	SELECT * FROM DONXINTHOIVIEC
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateDonXinThoiViec_Reject')
BEGIN
	DROP PROC sp_NhanSu_UpdateDonXinThoiViec_Reject
END
GO
CREATE PROC sp_NhanSu_UpdateDonXinThoiViec_Reject  
	@ID					INT,
	@Ly_do_reject		NVARCHAR(1000),
	@KQ					INT OUTPUT
AS  
BEGIN  
	SET @KQ = -1 
	IF EXISTS (SELECT * FROM DonXinThoiViec WHERE ID=@ID)   
	BEGIN  
		UPDATE DonXinThoiViec SET Ly_do_reject=@Ly_do_reject,Tinh_trang='6',Truong_khoa=null,ngay_TK_duyet=null,Phong_HC=null,Ngay_HC_duyet=null,Phong_DT=null,Ngay_DT_duyet=null,Hieu_truong=null,Ngay_HT_duyet=null,Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
		SET @KQ = @ID
	END  
END
GO


GO

--sp_NhanSu_UpdateHDLD.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	26/05/2011
	Mục Đích	:	Cập Nhật Hợp Đồng Lần Đầu
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateHDLD')
BEGIN
	DROP PROC sp_NhanSu_UpdateHDLD
END
GO
CREATE PROC sp_NhanSu_UpdateHDLD  
	@ID						INT,
	@Thoi_gian				FLOAT,
	@Bat_dau				DATETIME,
	@Ket_thuc				DATETIME,
	@Loai_vien_chuc			VARCHAR(10),
	@Ma_ngach				VARCHAR(20),
	@Bac					INT,
	@He_so_luong			FLOAT,
	@Tinh_trang				INT,
	@KQ						INT OUTPUT  
AS  
BEGIN  
	SET @KQ = -1 
	IF EXISTS (SELECT * FROM HopDongLaoDong WHERE ID=@ID)   
	BEGIN  
		UPDATE HopDongLaoDong SET Thoi_gian=@Thoi_gian, Bat_dau=@Bat_dau, Ket_thuc=@Ket_thuc, Loai_vien_chuc=@Loai_vien_chuc, Ma_ngach=@Ma_ngach, Bac=@Bac, He_so_luong=@He_so_luong,Tinh_trang=@Tinh_trang, Ngay_cap_nhat_cuoi=GETDATE() WHERE ID=@ID
		SET @KQ = @ID
	END  
END  
GO
/*
SELECT * FROM HOPDONGLAODONG

DECLARE @KQ INT 
EXEC sp_InsertDeNghiKTV 0,3,1,'1/1/1991','1/1/1991','1',@KQ OUTPUT
SELECT @KQ

SELECT * FROM DeNghiNhanSu

SELECT * FROM DeNghiKTV

*/

GO

--sp_NhanSu_UpdateHDLD_Approve.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	26/05/2011
	Mục Đích	:	Duyệt Đề Nghị Khoán Thử Việc
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateHDLD_Approve')
BEGIN
	DROP PROC sp_NhanSu_UpdateHDLD_Approve
END
GO
CREATE PROC sp_NhanSu_UpdateHDLD_Approve  
	@ID					INT,
	@Ma_nguoi_duyet		INT,
	@KQ					INT OUTPUT
AS  
BEGIN  
	SET @KQ = -1
	IF EXISTS (SELECT * FROM HopDongLaoDong WHERE ID=@ID)   
	BEGIN
		DECLARE @Tinh_trang INT
		SELECT @Tinh_trang=Tinh_trang FROM HopDongLaoDong WHERE ID=@ID
		IF ((SELECT ID FROM HoSoDuTuyen WHERE Ten_dang_nhap = (SELECT Ten_DN FROM ThanhVien WHERE ID=@Ma_nguoi_duyet)) = (SELECT Nguoi_du_tuyen FROM HopDongLaoDong WHERE ID=@ID))
		BEGIN
			UPDATE HopDongLaoDong SET Tinh_trang=@Tinh_trang+1,Ngay_NDT_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
			SET @KQ = @ID
		END
		ELSE
		BEGIN
			UPDATE HopDongLaoDong SET Tinh_trang=@Tinh_trang+1,Hieu_truong=@Ma_nguoi_duyet,Ngay_HT_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
			SET @KQ = @ID
		END
	END  
END
GO

/*

DECLARE @KQ INT 
EXEC sp_InsertHopDongLaoDong 0,3,1,'1/1/1991','1/1/1991','1',@KQ OUTPUT
SELECT @KQ

SELECT * FROM HopDongLaoDong

SELECT * FROM HopDongLaoDong

*/

GO

--sp_NhanSu_UpdateHDLD_Reject.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	26/05/2011
	Mục Đích	:	Từ Chối Hợp Đồng Lần Đầu
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateHDLD_Reject')
BEGIN
	DROP PROC sp_NhanSu_UpdateHDLD_Reject
END
GO
CREATE PROC sp_NhanSu_UpdateHDLD_Reject  
	@ID					INT,
	@Ly_do_reject		NVARCHAR(500),
	@KQ					INT OUTPUT
AS  
BEGIN  
	SET @KQ = -1  
	IF EXISTS (SELECT * FROM HopDongLaoDong WHERE ID=@ID)   
	BEGIN  
		UPDATE HopDongLaoDong SET Ly_do_reject=@Ly_do_reject,Tinh_trang='4',Ngay_NDT_duyet=null,Hieu_truong=null,Ngay_HT_duyet=null,Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
		SET @KQ = @ID
	END  
END
GO

/*
SELECT * FROM HOPDONGLAODONG
DECLARE @KQ INT 
EXEC sp_InsertDeNghiKTV 0,3,1,'1/1/1991','1/1/1991','1',@KQ OUTPUT
SELECT @KQ

SELECT * FROM DeNghiNhanSu

SELECT * FROM DeNghiKTV

*/

GO

--sp_NhanSu_UpdateHoSoDuTuyen.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	24/05/2011
	Mục Đích	:	Cập nhật cột Tinh_trang ( 0 = mặc định, 1 = đạt, 2 = rớt )
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateHoSoDuTuyen')
BEGIN
	DROP PROC sp_NhanSu_UpdateHoSoDuTuyen
END
GO
CREATE PROC sp_NhanSu_UpdateHoSoDuTuyen
	@ID					INT,
	@Ghi_chu			NVARCHAR(500),
	@Tinh_trang			INT,
	@KQ					INT OUTPUT  
AS  
BEGIN  
	SET @KQ = -1  
	IF EXISTS (SELECT * FROM HoSoDuTuyen WHERE ID=@ID)   
	BEGIN  
		UPDATE HoSoDuTuyen SET Ghi_chu=@Ghi_chu,Tinh_trang=@Tinh_trang,Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
		SET @KQ = 1  
	END  
END
GO


GO

--sp_NhanSu_UpdateKeHoachTNS.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	24/05/2011
	Mục Đích	:	Cập nhật cột Tinh_trang( 0 = luu, 1 = gui, 2 = Approve,3 = Reject )
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateKeHoachTNS')
BEGIN
	DROP PROC sp_NhanSu_UpdateKeHoachTNS
END
GO
CREATE PROC sp_NhanSu_UpdateKeHoachTNS
	@ID					INT,
	@Tinh_trang			INT,
	@KQ					INT OUTPUT  
AS  
BEGIN  
	SET @KQ = -1  
	IF EXISTS (SELECT * FROM KeHoachTNS WHERE ID=@ID)   
	BEGIN  
		UPDATE KeHoachTNS SET Tinh_trang=@Tinh_trang,Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
		SET @KQ = @ID
	END  
END



GO

--sp_NhanSu_UpdateNhanXetKetQuaThuViec.sql
/*
	Người Viết	:	Huỳnh Thị Ngoc Mai
	Ngày Viết	:	24/05/2011
	Mục Đích	:	STORE INSERT NHAN_XET_KET_QUA_THU_VIEC
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateNhanXetKetQuaThuViec')
BEGIN
	DROP PROC sp_NhanSu_UpdateNhanXetKetQuaThuViec
END
GO
CREATE PROC sp_NhanSu_UpdateNhanXetKetQuaThuViec
	@ID					INT,
	@NoiDung1			NVARCHAR(500),
	@NoiDung2			NVARCHAR(500),
	@NoiDung3			NVARCHAR(500),
	@NoiDung4			NVARCHAR(500),
	@Tinh_trang			INT,
	@KQ					INT OUTPUT
AS
BEGIN
	SET @KQ = -1  
	IF EXISTS (SELECT * FROM NhanXetKetQuaThuViec WHERE ID=@ID)   
	BEGIN  
		UPDATE NhanXetKetQuaThuViec SET Ngay_nhan_xet=GETDATE(),Ly_do_reject=null,NoiDung1=@NoiDung1,NoiDung2=@NoiDung2,NoiDung3=@NoiDung3,NoiDung4=@NoiDung4,Tinh_trang=@Tinh_trang,Ngay_cap_nhat_cuoi=GETDATE() WHERE ID=@ID
		SET @KQ=@ID
	END
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_InsertNhanXetKetQuaThuViec 1,2,3,4,5,6,'1/1/1991','8','9','10','11','12',@KQ OUTPUT
SELECT @KQ

SELECT * FROM NhanXetKetQuaThuViec
*/

GO

--sp_NhanSu_UpdateNhanXetKetQuaThuViec_Approve.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	17/06/2011
	Mục Đích	:	Approve Nhận Xét Kết Quả Thử Việc
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateNhanXetKetQuaThuViec_Approve')
BEGIN
	DROP PROC sp_NhanSu_UpdateNhanXetKetQuaThuViec_Approve
END
GO
CREATE PROC sp_NhanSu_UpdateNhanXetKetQuaThuViec_Approve
	@ID					INT,
	@Nguoi_duyet		INT,
	@Ghi_chu			INT,
	@KQ					INT OUTPUT
AS
BEGIN
	SET @KQ = -1  
	IF EXISTS (SELECT * FROM NhanXetKetQuaThuViec WHERE ID=@ID)   
	BEGIN  
		UPDATE NhanXetKetQuaThuViec SET Tinh_trang='2',Nguoi_duyet=@Nguoi_duyet,Ghi_chu=@Ghi_chu,Ngay_duyet=GETDATE(),Ngay_cap_nhat_cuoi=GETDATE() WHERE ID=@ID
		SET @KQ=@ID
	END
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_InsertNhanXetKetQuaThuViec 1,2,3,4,5,6,'1/1/1991','8','9','10','11','12',@KQ OUTPUT
SELECT @KQ

SELECT * FROM NhanXetKetQuaThuViec
*/

GO

--sp_NhanSu_UpdateNhanXetKetQuaThuViec_Reject.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	17/06/2011
	Mục Đích	:	Reject Nhận Xét Kết Quả Thử Việc
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateNhanXetKetQuaThuViec_Reject')
BEGIN
	DROP PROC sp_NhanSu_UpdateNhanXetKetQuaThuViec_Reject
END
GO
CREATE PROC sp_NhanSu_UpdateNhanXetKetQuaThuViec_Reject
	@ID					INT,
	@Ly_do_reject		NVARCHAR(100),
	@KQ					INT OUTPUT
AS
BEGIN
	SET @KQ = -1  
	IF EXISTS (SELECT * FROM NhanXetKetQuaThuViec WHERE ID=@ID)   
	BEGIN  
		UPDATE NhanXetKetQuaThuViec SET Tinh_trang='3',Ghi_chu=null,Ly_do_reject=@Ly_do_reject,Ngay_cap_nhat_cuoi=GETDATE() WHERE ID=@ID
		SET @KQ=@ID
	END
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_InsertNhanXetKetQuaThuViec 1,2,3,4,5,6,'1/1/1991','8','9','10','11','12',@KQ OUTPUT
SELECT @KQ

SELECT * FROM NhanXetKetQuaThuViec
*/

GO

--sp_NhanSu_UpdateTieuChuan.sql
/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	24/05/2011
	Mục Đích	:	Xóa tiêu chuẩn không thích hợp
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateTieuChuan')
BEGIN
	DROP PROC sp_NhanSu_UpdateTieuChuan
END
GO
CREATE PROC sp_NhanSu_UpdateTieuChuan
	@ID					INT,
	@Tieu_chuan			NVARCHAR(500),
	@KQ					INT OUTPUT
AS  
BEGIN  
	SET @KQ = -1 
	IF EXISTS (SELECT * FROM TieuChuan WHERE ID=@ID)   
	BEGIN  
		UPDATE TieuChuan SET Tieu_chuan=@Tieu_chuan,Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
		SET @KQ = @ID
	END  
END

GO

GO

--sp_UpdateChiTietCongViecThanhVien.sql
--Người Lập :	Trần Cẩm Thành
--Ngày Lập  :	06/08/2011
--Mục Đích  :	Cập Nhật Dữ Liệu Khen Thưởng/ Kỷ Luật cho Nhân Sự

IF EXISTS (SELECT * FROM SYS.OBJECTS WHERE NAME='sp_NhanSu_UpdateChiTietCongViecThanhVien')
BEGIN
	DROP PROC sp_NhanSu_UpdateChiTietCongViecThanhVien
END
GO
CREATE PROC sp_NhanSu_UpdateChiTietCongViecThanhVien
@ID				INT,
@Ghi_chu		NVARCHAR(1000),
@Loai_ghi_chu	INT,
@KQ				INT OUTPUT
AS
BEGIN
	SET @KQ = -1
	IF EXISTS(SELECT * FROM CHITIETCONGVIECTHANHVIEN WHERE ID=@ID)
	BEGIN
		UPDATE CHITIETCONGVIECTHANHVIEN SET Ghi_chu=@Ghi_chu,Loai_ghi_chu=@Loai_ghi_chu,Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
		SET @KQ = @ID
	END
END

GO
