IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE NAME='sp_NhanSu_CapNhatThongTin')
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
@Vai_tro INT,
@Bo_phan INT,
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
			IF @Ngay_thu_viec = 0
			BEGIN
				set @Ngay_thu_viec = NULL
			END
			INSERT INTO DENGHIKTV(Nguoi_du_tuyen,Bat_dau,Tinh_trang,Ngay_cap_nhat_cuoi) VALUES(@KQ,@Ngay_thu_viec,'-1',GETDATE())
		END
		ELSE
		BEGIN
			IF @Ngay_thu_viec = 0
			BEGIN
				set @Ngay_thu_viec = NULL
			END
			UPDATE DENGHIKTV SET Bat_dau=@Ngay_thu_viec,Ngay_cap_nhat_cuoi=GETDATE() WHERE Nguoi_du_tuyen=@KQ
		END
		
		IF NOT EXISTS (SELECT * FROM HOPDONGLAODONG WHERE Nguoi_du_tuyen=@KQ)
		BEGIN
			IF @Ngay_vao_lam = 0
			BEGIN
				set @Ngay_vao_lam = NULL
			END
			INSERT INTO HOPDONGLAODONG(Nguoi_du_tuyen,Bat_dau,Tinh_trang,Ngay_cap_nhat_cuoi) VALUES(@KQ,@Ngay_vao_lam,'-1',GETDATE())
		END
		ELSE
		BEGIN
			IF @Ngay_vao_lam = 0
			BEGIN
				set @Ngay_vao_lam = NULL
			END
			UPDATE HOPDONGLAODONG SET Bat_dau=@Ngay_vao_lam,Ngay_cap_nhat_cuoi=GETDATE() WHERE Nguoi_du_tuyen=@KQ
		END
		
		SELECT @KQ = ISNULL(Ma_dia_chi,'-1') FROM CHITIETTHANHVIEN WHERE Ten_dang_nhap=@Ten_dang_nhap
		
		IF @KQ = -1
		BEGIN
			INSERT INTO DIACHI(So_nha,Duong,Phuong_xa,Quan_huyen,Tinh_thanhpho,Dien_thoai_nha,Lan_cap_nhat_cuoi) VALUES (@So_nha,@Duong,@Phuong_xa,@Quan_huyen,@Tinh_thanhpho,@Dien_thoai_nha,GETDATE())
			SELECT @KQ=MAX(ID) FROM DIACHI
			UPDATE CHITIETTHANHVIEN SET Ma_dia_chi=@KQ WHERE Ten_dang_nhap=@Ten_dang_nhap
		END
		ELSE
		BEGIN
			UPDATE DIACHI SET So_nha=@So_nha,Duong=@Duong,Phuong_xa=@Phuong_xa,Quan_huyen=@Quan_huyen,Tinh_thanhpho=@Tinh_thanhpho,Dien_thoai_nha=@Dien_thoai_nha,Lan_cap_nhat_cuoi=GETDATE() WHERE ID=@KQ
		END
		SELECT * FROM THANHVIEN		

		UPDATE THANHVIEN SET Ma_vai_tro=@Vai_tro,Ma_bo_phan=@Bo_phan WHERE Ten_DN=@Ten_dang_nhap
		UPDATE CHITIETTHANHVIEN SET Ho=@Ho,Ten_lot=@Ten_lot,Ten=@Ten,Ngay_sinh=@Ngay_sinh,Email=@Email,Dien_thoai_dd=@Dien_thoai_dd,Chung_minh_nhan_dan=@CMND,Ngay_cap=@Ngay_cap,Noi_cap=@Noi_cap WHERE Ten_dang_nhap=@Ten_dang_nhap
		SET @KQ = @ID
	END
END
