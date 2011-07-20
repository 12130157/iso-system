/* ---------------------------------------------------------------------- */
/* Add table "DeNghiNhanSu"                                               */
/* ---------------------------------------------------------------------- */

CREATE TABLE [DeNghiNhanSu] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Nam] INTEGER,
    [Ma_bo_phan] INTEGER,
    [Nguoi_de_nghi] INTEGER,
    [Chuc_danh] INTEGER,
    [So_luong] INTEGER,
    [Cong_viec] NVARCHAR(2000),
    [Luong] FLOAT,
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
    [Thoi_gian] FLOAT,
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

CREATE TABLE [HopDongLanDau] (
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
    CONSTRAINT [PK_HopDongLanDau] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "HoSuDuTuyen"                                                */
/* ---------------------------------------------------------------------- */

CREATE TABLE [HoSuDuTuyen] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ten_dang_nhap] VARCHAR(20),
    [Ho] NVARCHAR(50),
    [Ten_lot] NVARCHAR(50),
    [Ten] NVARCHAR(50),
    [Gioi_tinh] INTEGER,
    [Ngay_sinh] DATETIME,
    [Ghi_chu] NVARCHAR(200),
    [CMND] VARCHAR(20),
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
GO
IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE NAME='NhanXetKetQuaThuViec')
BEGIN
	DROP TABLE NhanXetKetQuaThuViec
END
GO
CREATE TABLE NhanXetKetQuaThuViec
(
	ID					INT				PRIMARY KEY		IDENTITY(1,1),
	Nguoi_nhan_xet		INT,
	Thoi_gian_thu_viec	INT,
	NoiDung1			NVARCHAR(500),
	NoiDung2			NVARCHAR(500),
	NoiDung3			NVARCHAR(500),
	NoiDung4			NVARCHAR(500),
	Tinh_trang			INT,
	Ghi_chu				NVARCHAR(100),
	Ly_do_reject		NVARCHAR(200),
	Nguoi_duyet			INT,
	Ngay_duyet			DATETIME,
	Ngay_nhan_xet		DATETIME,
	Ngay_cap_nhat_cuoi	DATETIME,
	User1				NVARCHAR(100),
	User2				NVARCHAR(100),
	User3				NVARCHAR(100),
	User4				NVARCHAR(100),
	User5				NVARCHAR(100)	
)
