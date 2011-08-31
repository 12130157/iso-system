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