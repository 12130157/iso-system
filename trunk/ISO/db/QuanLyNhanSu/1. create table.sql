
CREATE TABLE [DeNghiNhanSu] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Nam] INTEGER,
    [Ma_bo_phan] INTEGER,
    [Nguoi_de_nghi] INTEGER,
    [Chuc_danh] INTEGER,
    [So_luong] INTEGER,
    [Cong_viec] NVARCHAR(2000),
    [Thoi_gian_bat_dau_lam] DATETIME,
    [Tinh_trang] INTEGER,
    [Truong_khoa] INTEGER,
    [Ngay_lap] DATETIME,
    [Ngay_TK_duyet] DATETIME,
    [Phong_HC] INTEGER,
    [Ngay_HC_duyet] DATETIME,
    [Phong_DT] INTEGER,
    [Ngay_DT_duyet] DATETIME,
    [Hieu_truong] INTEGER,
    [Ngay_HT_duyet] DATETIME,
    [Ly_do_reject] NVARCHAR(1000),
	[Bo_sung] INTEGER,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] NVARCHAR(100),
    [User2] NVARCHAR(100),
    [User3] NVARCHAR(100),
    [User4] NVARCHAR(100),
    [User5] NVARCHAR(100),
    CONSTRAINT [PK_DeNghiNhanSu] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "ChiTietKHTNS"                                               */
/* ---------------------------------------------------------------------- */

CREATE TABLE [ChiTietKHTNS] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_ke_hoach] INTEGER,
    [Ma_de_nghi] INTEGER,
    [Ghi_chu] NVARCHAR(500),
    [So_luong_da_tuyen] INTEGER,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] NVARCHAR(100),
    [User2] NVARCHAR(100),
    [User3] NVARCHAR(100),
    [User4] NVARCHAR(100),
    [User5] NVARCHAR(100),
    CONSTRAINT [PK_ChiTietKHTNS] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "KeHoachTNS"                                                 */
/* ---------------------------------------------------------------------- */

CREATE TABLE [KeHoachTNS] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Nam] INTEGER,
    [Tinh_trang] INTEGER,
    [Nguoi_lap_ke_hoach] INTEGER,
    [Ngay_lap_ke_hoach] DATETIME,
	[Bo_sung] INTEGER,
	[Ngay_cap_nhat_cuoi] DATETIME,
    [User1] NVARCHAR(100),
    [User2] NVARCHAR(100),
    [User3] NVARCHAR(100),
    [User4] NVARCHAR(100),
    [User5] NVARCHAR(100),
    CONSTRAINT [PK_KeHoachTNS] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "ThoiGianTuyenDung"                                          */
/* ---------------------------------------------------------------------- */

CREATE TABLE [ThoiGianTuyenDung] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_CTKHTDNS] INTEGER,
    [Thoi_gian] VARCHAR(15),
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] NVARCHAR(100),
    [User2] NVARCHAR(100),
    [User3] NVARCHAR(100),
    [User4] NVARCHAR(100),
    [User5] NVARCHAR(100),
    CONSTRAINT [PK_ThoiGianTuyenDung] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "HopDongLanDau"                                              */
/* ---------------------------------------------------------------------- */

CREATE TABLE [HopDongLaoDong] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Nguoi_du_tuyen] INTEGER,
    [Thoi_gian] FLOAT,
    [Bat_dau] DATETIME,
    [Ket_thuc] DATETIME,
	[Loai_vien_chuc] VARCHAR(10),
    [Ma_ngach] VARCHAR(20),
	[Bac] INT,
	[He_so_luong] FLOAT,
	[Nhiem_vu] NVARCHAR(200),
	[Phuc_loi] INT,
    [Tinh_trang] INTEGER,
    [Ngay_lap] DATETIME,
	[Nguoi_lap] INT,
	[Ngay_NDT_duyet] DATETIME,
    [Hieu_truong] INTEGER,
    [Ngay_HT_duyet] DATETIME,
	[So_lan] INT,
    [Ly_do_reject] NVARCHAR(1000),
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] NVARCHAR(100),
    [User2] NVARCHAR(100),
    [User3] NVARCHAR(100),
    [User4] NVARCHAR(100),
    [User5] NVARCHAR(100),
    CONSTRAINT [PK_HopDongLanDau] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "HoSoDuTuyen"                                                */
/* ---------------------------------------------------------------------- */

CREATE TABLE [HoSoDuTuyen] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ten_dang_nhap] VARCHAR(20),
    [Ho] NVARCHAR(50),
    [Ten_lot] NVARCHAR(50),
    [Ten] NVARCHAR(50),
    [Gioi_tinh] INTEGER,
    [Ngay_sinh] DATETIME,
    [Ghi_chu] NVARCHAR(200),
    [CMND] VARCHAR(20),
	[Ngay_cap] DATETIME,
	[Noi_cap] NVARCHAR(30),
    [So_nha] NVARCHAR(10),
    [Duong] NVARCHAR(200),
    [Phuong_xa] NVARCHAR(20),
    [Quan_huyen] NVARCHAR(20),
    [Tinh_thanhpho] NVARCHAR(50),
    [Dien_thoai_nha] VARCHAR(20),
    [Email] VARCHAR(100),
    [Dien_thoai_dd] VARCHAR(20),
    [Trinh_do_van_hoa] NVARCHAR(1000),
    [Chuyen_mon] NVARCHAR(1000),
    [Tin_hoc] NVARCHAR(1000),
    [Ngoai_ngu] NVARCHAR(1000),
    [Tom_tat_ban_than] NVARCHAR(2000),
    [Vi_tri_du_tuyen] INTEGER,
    [Tinh_trang] INTEGER,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] NVARCHAR(100),
    [User2] NVARCHAR(100),
    [User3] NVARCHAR(100),
    [User4] NVARCHAR(100),
    [User5] NVARCHAR(100),
    CONSTRAINT [PK_HoSuDuTuyen] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "DeNghiKTV"                                                  */
/* ---------------------------------------------------------------------- */

CREATE TABLE [DeNghiKTV] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Nguoi_du_tuyen] INTEGER,
    [Thoi_gian] FLOAT,
    [Bat_dau] DATETIME,
    [Ket_thuc] DATETIME,
    [Luong_khoan] NUMERIC,
    [Tinh_trang] INTEGER,
    [Ngay_lap] DATETIME,
    [Truong_khoa] INTEGER,
    [Ngay_TK_duyet] DATETIME,
    [Phong_HC] INTEGER,
    [Ngay_HC_duyet] DATETIME,
    [Phong_DT] INTEGER,
    [Ngay_DT_duyet] DATETIME,
    [Hieu_truong] INTEGER,
    [Ngay_HT_duyet] DATETIME,
    [Ly_do_reject] NVARCHAR(1000),
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] NVARCHAR(100),
    [User2] NVARCHAR(100),
    [User3] NVARCHAR(100),
    [User4] NVARCHAR(100),
    [User5] NVARCHAR(100),
    CONSTRAINT [PK_DeNghiKTV] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "NhanXetKetQuaThuViec"                                       */
/* ---------------------------------------------------------------------- */

CREATE TABLE [NhanXetKetQuaThuViec] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Nguoi_nhan_xet] INTEGER,
    [Thoi_gian_thu_viec] FLOAT,
    [NoiDung1] NVARCHAR(500),
    [NoiDung2] NVARCHAR(500),
    [NoiDung3] NVARCHAR(500),
    [NoiDung4] NVARCHAR(500),
    [Ghi_chu] NVARCHAR(200),
    [Ly_do_reject] NVARCHAR(1000),
    [Nguoi_duyet] INTEGER,
    [Ngay_duyet] DATETIME,
    [Ngay_nhan_xet] DATETIME,
    [Tinh_trang] INTEGER,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] NVARCHAR(100),
    [User2] NVARCHAR(100),
    [User3] NVARCHAR(100),
    [User4] NVARCHAR(100),
    [User5] NVARCHAR(100),
    CONSTRAINT [PK_NhanXetKetQuaThuViec] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "TieuChuan"                                                  */
/* ---------------------------------------------------------------------- */

CREATE TABLE [TieuChuan] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_de_nghi] INTEGER,
    [Tieu_chuan] NVARCHAR(500),
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] NVARCHAR(100),
    [User2] NVARCHAR(100),
    [User3] NVARCHAR(100),
    [User4] NVARCHAR(100),
    [User5] NVARCHAR(100),
    CONSTRAINT [PK_TieuChuan] PRIMARY KEY ([ID])
)
GO
CREATE TABLE ChiTietCongViecThanhVien
(
	ID				INT				PRIMARY KEY			IDENTITY(0,1),
	Ma_nam_hoc		INT,
	Ma_thanh_vien	INT,
	Chuc_vu			INT,
	Ghi_chu			NVARCHAR(1000),
	Loai_ghi_chu	INT,
	Ngay_cap_nhat_cuoi	DATETIME,
	User1		NVARCHAR(100),
	User2		NVARCHAR(100),
	User3		NVARCHAR(100),
	User4		NVARCHAR(100),
	User5		NVARCHAR(100)
)	

CREATE TABLE ChiTietLopHoc
(
	ID				INT				PRIMARY KEY			IDENTITY(0,1),
	Ma_lop_hoc		INT,
	Ma_nam_hoc		INT,
	GV_chu_nhiem	INT,
	Ngay_cap_nhat_cuoi	DATETIME,
	User1		NVARCHAR(100),
	User2		NVARCHAR(100),
	User3		NVARCHAR(100),
	User4		NVARCHAR(100),
	User5		NVARCHAR(100)
)

IF EXISTS (SELECT * FROM SYS.FOREIGN_KEYS WHERE NAME='DiaChi_ChiTietThanhVien')
BEGIN
	ALTER TABLE ChiTietThanhVien
	DROP CONSTRAINT DiaChi_ChiTietThanhVien
END
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME='DiaChi')
BEGIN
	DROP TABLE DiaChi
END
CREATE TABLE DiaChi(
	ID		INT PRIMARY KEY IDENTITY(0,1),
	So_nha 	NVARCHAR(20),
	Duong 	NVARCHAR(200),
	Phuong_xa 	NVARCHAR(50),
	Quan_huyen 	NVARCHAR(50),
	Tinh_Thanhpho 	NVARCHAR(50),
	Dien_thoai_nha 	VARCHAR(20),
	Lan_cap_nhat_cuoi DATETIME,
	User1	NVARCHAR(100),
	User2	NVARCHAR(100),
	User3	NVARCHAR(100),
	User4	NVARCHAR(100),
	User5	NVARCHAR(100)
)

UPDATE ChiTietThanhVien SET Ma_dia_chi=null

ALTER TABLE ChiTietThanhVien
ADD CONSTRAINT DiaChi_ChiTietThanhVien FOREIGN KEY (Ma_dia_chi) REFERENCES DiaChi(ID)

DECLARE @count INT
DECLARE @n INT
DECLARE @id INT
SET @n=0
SELECT @count=COUNT(*) FROM CHITIETTHANHVIEN
WHILE @n<=@count
BEGIN
	INSERT INTO DiaChi VALUES ('','','','','','','','','','','','')
	SELECT @id=MAX(ID) FROM DiaChi
	IF(@n <> '98')
	BEGIN
		UPDATE CHITIETTHANHVIEN SET Ma_dia_chi=@id WHERE Ten_dang_nhap=(SELECT Ten_DN FROM THANHVIEN WHERE ID=@n)
	END
	SET @n=@n+1
END

DECLARE @NAM INT
DECLARE @NAM_BAT_DAU INT
SET @NAM='1960'
SELECT @NAM_BAT_DAU=MIN(Nam_bat_dau) FROM NAMHOC
WHILE(@NAM<@NAM_BAT_DAU)
BEGIN
	IF NOT EXISTS(SELECT * FROM NAMHOC WHERE Nam_bat_dau=@NAM)
	BEGIN
		INSERT INTO NAMHOC(Nam_bat_dau,Nam_ket_thuc) VALUES (@NAM,@NAM+1)
	END
	SET @NAM=@NAM+1
END

IF EXISTS (SELECT * FROM SYS.FOREIGN_KEYS WHERE NAME='BangCap_ChiTietThanhVien')
BEGIN
	ALTER TABLE CHITIETTHANHVIEN
	DROP CONSTRAINT BangCap_ChiTietThanhVien
END
GO
IF EXISTS (SELECT * FROM SYS.OBJECTS WHERE NAME='BANGCAP')
BEGIN
	DROP TABLE BANGCAP
END
GO
CREATE TABLE [BangCap] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
	[Ma_thanh_vien]	INT,
    [Loai_bang] NVARCHAR(40),
    [Truong_cap] NVARCHAR(200),
    [Nam_tot_nghiep] INTEGER,
    [Loai_tot_nghiep] NVARCHAR(20),
	[Chuyen_nganh] NVARCHAR(100),
	[Ngach_luong] FLOAT,
	[Bang_cap_chinh] INT,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_BangCap] PRIMARY KEY ([ID])
)
GO
IF EXISTS (SELECT * FROM SYS.FOREIGN_KEYS WHERE NAME='DiaChi_ChiTietThanhVien')
BEGIN
	ALTER TABLE CHITIETTHANHVIEN
	DROP CONSTRAINT DiaChi_ChiTietThanhVien
END
GO
IF EXISTS (SELECT * FROM SYS.FOREIGN_KEYS WHERE NAME='TaiKhoan_ChiTietThanhVien')
BEGIN
	ALTER TABLE CHITIETTHANHVIEN
	DROP CONSTRAINT TaiKhoan_ChiTietThanhVien
END
GO
IF EXISTS (SELECT * FROM SYS.FOREIGN_KEYS WHERE NAME='ChiTietThanhVien_ThanhVien')
BEGIN
	ALTER TABLE ThanhVien
	DROP CONSTRAINT ChiTietThanhVien_ThanhVien
END
GO
DECLARE @CHITIETTHANHVIEN TABLE
(
	Ten_dang_nhap varchar(20),
	Ho NVARCHAR(40),
	Ten_lot NVARCHAR(40),
	Ten NVARCHAR(40),
	Ngay_sinh DATETIME,
	Ma_dia_chi INT,
	Email VARCHAR(40),
	Dien_thoai_dd VARCHAR(20),
	Ma_bang_cap INT,
	Ngay_bat_dau DATETIME,
	Ngay_ket_thuc DATETIME,
	Ma_tai_khoan INT,
	Tinh_trang INT,
	Chung_minh_nhan_dan VARCHAR(15),
	Ma_lop_hoc INT,
	Hinh_thanh_vien NVARCHAR(100)
)
INSERT INTO @CHITIETTHANHVIEN(Ten_dang_nhap,Ho,Ten_lot,Ten,Ngay_sinh,Ma_dia_chi,Email,Dien_thoai_dd,Ma_bang_cap,Ngay_bat_dau,Ngay_ket_thuc,Ma_tai_khoan,Tinh_trang,Chung_minh_nhan_dan,Ma_lop_hoc,Hinh_thanh_vien)
 SELECT Ten_dang_nhap,Ho,Ten_lot,Ten,Ngay_sinh,Ma_dia_chi,Email,Dien_thoai_dd,Ma_bang_cap,Ngay_bat_dau,Ngay_ket_thuc,Ma_tai_khoan,Tinh_trang,Chung_minh_nhan_dan,Ma_lop_hoc,Hinh_thanh_vien FROM CHITIETTHANHVIEN
DROP TABLE CHITIETTHANHVIEN
CREATE TABLE ChiTietThanhVien
(
	Ten_dang_nhap VARCHAR(20) PRIMARY KEY,
	Ho NVARCHAR(40),
	Ten_lot NVARCHAR(40),
	Ten NVARCHAR(40),
	Ngay_sinh DATETIME,
	Ma_dia_chi INT,
	Email VARCHAR(40),
	Dien_thoai_dd VARCHAR(20),
	Ma_bang_cap	INT,
	Ngay_bat_dau DATETIME,
	Ngay_ket_thuc DATETIME,
	Ma_tai_khoan INT,
	Tinh_trang INT,
	Chung_minh_nhan_dan VARCHAR(15),
	Ngay_cap DATETIME,
	Noi_cap NVARCHAR(30),
	Ma_lop_hoc INT,
	Hinh_thanh_vien NVARCHAR(100),
	User1 VARCHAR(40),
	User2 VARCHAR(40),
	User3 VARCHAR(40),
	User4 VARCHAR(40),
	User5 VARCHAR(40)
)
INSERT INTO CHITIETTHANHVIEN(Ten_dang_nhap,Ho,Ten_lot,Ten,Ngay_sinh,Ma_dia_chi,Email,Dien_thoai_dd,Ma_bang_cap,Ngay_bat_dau,Ngay_ket_thuc,Ma_tai_khoan,Tinh_trang,Chung_minh_nhan_dan,Ma_lop_hoc,Hinh_thanh_vien)
 SELECT Ten_dang_nhap,Ho,Ten_lot,Ten,Ngay_sinh,Ma_dia_chi,Email,Dien_thoai_dd,Ma_bang_cap,Ngay_bat_dau,Ngay_ket_thuc,Ma_tai_khoan,Tinh_trang,Chung_minh_nhan_dan,Ma_lop_hoc,Hinh_thanh_vien FROM @CHITIETTHANHVIEN

GO

CREATE TABLE Luong
(
	ID	INT	IDENTITY(0,1) PRIMARY KEY,
	Ma_thanh_vien INT,
	Loai_vien_chuc	VARCHAR(10),
	Ma_ngach VARCHAR(20),
	Bac_luong INT,
	He_so_luong FLOAT,
	Luong_co_ban NUMERIC,
	Ngay_xep_luong DATETIME,
	Ngay_cap_nhat_cuoi DATETIME,
	Ghi_chu NVARCHAR(1000),
	User1 VARCHAR(40),
	User2 VARCHAR(40),
	User3 VARCHAR(40),
	User4 VARCHAR(40),
	User5 VARCHAR(40)
)
GO

CREATE TABLE DonXinThoiViec
(
	ID INT IDENTITY(0,1) PRIMARY KEY,
	Nguoi_du_tuyen INT,
	Ly_do NVARCHAR(1000),
	Ngay_lap DATETIME,
	Ngay_thoi_viec DATETIME,
	Truong_khoa INTEGER,
    Ngay_TK_duyet DATETIME,
    Phong_HC INTEGER,
    Ngay_HC_duyet DATETIME,
    Phong_DT INTEGER,
    Ngay_DT_duyet DATETIME,
    Hieu_truong INTEGER,
    Ngay_HT_duyet DATETIME,
    Ly_do_reject NVARCHAR(1000),
	Tinh_trang INT,
    Ngay_cap_nhat_cuoi DATETIME,
    User1 NVARCHAR(100),
    User2 NVARCHAR(100),
    User3 NVARCHAR(100),
    User4 NVARCHAR(100),
    User5 NVARCHAR(100)
)