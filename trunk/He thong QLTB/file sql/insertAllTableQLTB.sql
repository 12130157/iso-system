/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases v4.1.3                     */
/* Target DBMS:           MS SQL Server 2005                              */
/* Project file:          database.dez                                    */
/* Project name:                                                          */
/* Author:                                                                */
/* Script type:           Database creation script                        */
/* Created on:            2012-01-29 19:46                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Tables                                                                 */
/* ---------------------------------------------------------------------- */

/* ---------------------------------------------------------------------- */
/* Add table "ThietBi"                                                    */
/* ---------------------------------------------------------------------- */

CREATE TABLE [ThietBi] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ten_thiet_bi] TEXT,
    [Ma] VARCHAR(100),
    [Ki_hieu] VARCHAR(100),
    [Vi_tri_lap_dat] INTEGER,
    [Muc_dich_su_dung] NTEXT,
    [Dac_tinh_ky_thuat] TEXT,
    [Nguyen_tac_su_dung] TEXT,
    [Ho_so_tai_lieu_ban_ve] TEXT,
    [Ghi_chu] NVARCHAR(500),
    [Tinh_trang] INTEGER,
    [Hien_trang] INTEGER,
    [Gia_tri_su_dung] INTEGER,
    [Ma_nha_cung_cap] INTEGER,
    [Ma_loai_thiet_bi] INTEGER,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_ThietBi] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "DanhMucThietBi"                                             */
/* ---------------------------------------------------------------------- */

CREATE TABLE [DanhMucThietBi] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_nam_hoc] INTEGER,
    [Nguoi_lap] INTEGER,
    [Ngay_lap] DATETIME,
    [Nguoi_tham_xet] INTEGER,
    [Ngay_tham_xet] DATETIME,
    [Nguoi_phe_duyet] INTEGER,
    [Ngay_phe_duyet] DATETIME,
    [Tinh_trang] INTEGER,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_DanhMucThietBi] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "ChiTietDanhMucThietBi"                                      */
/* ---------------------------------------------------------------------- */

CREATE TABLE [ChiTietDanhMucThietBi] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_DMTB] INTEGER,
    [Ma_thiet_bi] INTEGER,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_ChiTietDanhMucThietBi] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "LyLichThietBi"                                              */
/* ---------------------------------------------------------------------- */

CREATE TABLE [LyLichThietBi] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_thiet_bi] INTEGER,
    [Nuoc_san_xuat] NVARCHAR(100),
    [Nam_san_xuat] INTEGER,
    [Ngay_nhan] DATETIME,
    [Bo_phan_nhan] INTEGER,
    [Tinh_trang_thiet_bi] INTEGER,
    [Gia_thanh] NUMERIC,
    [Nguoi_lap] INTEGER,
    [Ngay_lap] DATETIME,
    [Nguoi_duyet] INTEGER,
    [Ngay_duyet] DATETIME,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_LyLichThietBi] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "KeHoachBaoTri"                                              */
/* ---------------------------------------------------------------------- */

CREATE TABLE [KeHoachBaoTri] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Nam] INTEGER,
    [Nguoi_lap] INTEGER,
    [Ngay_lap] DATETIME,
    [Nguoi_duyet] INTEGER,
    [Ngay_duyet] DATETIME,
    [Tinh_trang] INTEGER,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_KeHoachBaoTri] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "ChiTietKHBT"                                                */
/* ---------------------------------------------------------------------- */

CREATE TABLE [ChiTietKHBT] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_KHBT] INTEGER,
    [Ma_thiet_bi] INTEGER,
    [Thoi_gian_bao_tri] VARCHAR(100),
    [Nguoi_thuc_hien] INTEGER,
    [Ghi_chu] NVARCHAR(500),
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_ChiTietKHBT] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "LichSuThietBi"                                              */
/* ---------------------------------------------------------------------- */

CREATE TABLE [LichSuThietBi] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_thiet_bi] INTEGER,
    [Ngay] DATETIME,
    [Nguoi_thuc_hien] INTEGER,
    [Ma_hanh_dong] INTEGER,
    [Ghi_chu] NVARCHAR(100),
    [Vat_tu_thay_the] NVARCHAR(500),
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_LichSuThietBi] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "PhieuBaoHongThietBi"                                        */
/* ---------------------------------------------------------------------- */

CREATE TABLE [PhieuBaoHongThietBi] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Nguoi_bao] INTEGER,
    [Bo_phan] INTEGER,
    [Ma_thiet_bi] INTEGER,
    [Tinh_trang_thiet_bi] INTEGER,
    [Thoi_diem_phat_hien] TEXT,
    [Nguyen_nhan] TEXT,
    [Huong_de_xuat_xu_ly] TEXT,
    [Nguoi_lap_phieu] INTEGER,
    [Ngay_lap] DATETIME,
    [Nguoi_duyet] INTEGER,
    [Ngay_duyet] DATETIME,
    [Tinh_trang] INTEGER,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_PhieuBaoHongThietBi] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "SoGiaoNhanThietBi"                                          */
/* ---------------------------------------------------------------------- */

CREATE TABLE [SoGiaoNhanThietBi] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Phong] VARCHAR(40),
    [Hoc_ki] INTEGER,
    [Nam] INTEGER,
    [Ghi_chu] NVARCHAR(500),
    [Nguoi_lap] INTEGER,
    [Ngay_lap] DATETIME,
    [Nguoi_duyet] INTEGER,
    [Ngay_duyet] DATETIME,
    [Tinh_trang] INTEGER,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_SoGiaoNhanThietBi] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "ChiTietPhieuGiaoNhanThietBi"                                */
/* ---------------------------------------------------------------------- */

CREATE TABLE [ChiTietPhieuGiaoNhanThietBi] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_so_giao_nhan] INTEGER,
    [Ten_so_giao_nhan] NVARCHAR(300),
    [Nguoi_nhan] INTEGER,
    [Lop] INTEGER,
    [Ngay_nhan] DATETIME,
    [Tinh_trang_nhan] INTEGER,
    [Ky_nhan] INTEGER,
    [Tinh_trang_tra] INTEGER,
    [Ky_tra] INTEGER,
    [Ghi_chu] NVARCHAR(100),
    [Tinh_trang] INTEGER,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_ChiTietPhieuGiaoNhanThietBi] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "ChiTietMuonThietBi"                                         */
/* ---------------------------------------------------------------------- */

CREATE TABLE [ChiTietMuonThietBi] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_chi_tiet_PGNTB] INTEGER,
    [Ma_thiet_bi] INTEGER,
    [Thoi_gian_nhan] DATETIME,
    [Thoi_gian_tra] DATETIME,
    [Tinh_trang] INTEGER,
    [Ngay_cap_nhat_cuoi] VARCHAR(40),
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_ChiTietMuonThietBi] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "NhaCungCap"                                                 */
/* ---------------------------------------------------------------------- */

CREATE TABLE [NhaCungCap] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ten_nha_cung_cap] NVARCHAR(500),
    [Ghi_chu] NVARCHAR(100),
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_NhaCungCap] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "HanhDong"                                                   */
/* ---------------------------------------------------------------------- */

CREATE TABLE [HanhDong] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ten_hanh_dong] NVARCHAR(300),
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_HanhDong] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "LoaiThietBi"                                                */
/* ---------------------------------------------------------------------- */

CREATE TABLE [LoaiThietBi] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ten_loai_thiet_bi] NVARCHAR(300),
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_LoaiThietBi] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "ChiTietMuonThietBi_tmp"                                     */
/* ---------------------------------------------------------------------- */

CREATE TABLE [ChiTietMuonThietBi_tmp] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_chi_tiet_PGNTB] INTEGER,
    [Ma_thiet_bi] INTEGER,
    [Thoi_gian_nhan] DATETIME,
    [Thoi_gian_tra] DATETIME,
    [Tinh_trang] INTEGER,
    [Ngay_cap_nhat_cuoi] VARCHAR(40),
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_ChiTietMuonThietBi_tmp] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "TinhTrang"                                                  */
/* ---------------------------------------------------------------------- */

CREATE TABLE [TinhTrang] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ten_tinh_trang] NVARCHAR(200),
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_TinhTrang] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "HienTrang"                                                  */
/* ---------------------------------------------------------------------- */

CREATE TABLE [HienTrang] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ten_hien_trang] NVARCHAR(200),
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_HienTrang] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Foreign key constraints                                                */
/* ---------------------------------------------------------------------- */

ALTER TABLE [ThietBi] ADD CONSTRAINT [NhaCungCap_ThietBi] 
    FOREIGN KEY ([Ma_nha_cung_cap]) REFERENCES [NhaCungCap] ([ID])
GO

ALTER TABLE [ThietBi] ADD CONSTRAINT [LoaiThietBi_ThietBi] 
    FOREIGN KEY ([Ma_loai_thiet_bi]) REFERENCES [LoaiThietBi] ([ID])
GO

ALTER TABLE [ChiTietDanhMucThietBi] ADD CONSTRAINT [ThietBi_ChiTietDanhMucThietBi] 
    FOREIGN KEY ([Ma_thiet_bi]) REFERENCES [ThietBi] ([ID])
GO

ALTER TABLE [ChiTietDanhMucThietBi] ADD CONSTRAINT [DanhMucThietBi_ChiTietDanhMucThietBi] 
    FOREIGN KEY ([Ma_DMTB]) REFERENCES [DanhMucThietBi] ([ID])
GO

ALTER TABLE [LyLichThietBi] ADD CONSTRAINT [ThietBi_LyLichThietBi] 
    FOREIGN KEY ([Ma_thiet_bi]) REFERENCES [ThietBi] ([ID])
GO

ALTER TABLE [ChiTietKHBT] ADD CONSTRAINT [ThietBi_ChiTietKHBT] 
    FOREIGN KEY ([Ma_thiet_bi]) REFERENCES [ThietBi] ([ID])
GO

ALTER TABLE [ChiTietKHBT] ADD CONSTRAINT [KeHoachBaoTri_ChiTietKHBT] 
    FOREIGN KEY ([Ma_KHBT]) REFERENCES [KeHoachBaoTri] ([ID])
GO

ALTER TABLE [LichSuThietBi] ADD CONSTRAINT [ThietBi_LichSuThietBi] 
    FOREIGN KEY ([Ma_thiet_bi]) REFERENCES [ThietBi] ([ID])
GO

ALTER TABLE [LichSuThietBi] ADD CONSTRAINT [HanhDong_LichSuThietBi] 
    FOREIGN KEY ([Ma_hanh_dong]) REFERENCES [HanhDong] ([ID])
GO

ALTER TABLE [PhieuBaoHongThietBi] ADD CONSTRAINT [ThietBi_PhieuBaoHongThietBi] 
    FOREIGN KEY ([Ma_thiet_bi]) REFERENCES [ThietBi] ([ID])
GO

ALTER TABLE [ChiTietPhieuGiaoNhanThietBi] ADD CONSTRAINT [SoGiaoNhanThietBi_ChiTietPhieuGiaoNhanThietBi] 
    FOREIGN KEY ([Ma_so_giao_nhan]) REFERENCES [SoGiaoNhanThietBi] ([ID])
GO

ALTER TABLE [ChiTietMuonThietBi] ADD CONSTRAINT [ChiTietPhieuGiaoNhanThietBi_ChiTietMuonThietBi] 
    FOREIGN KEY ([Ma_chi_tiet_PGNTB]) REFERENCES [ChiTietPhieuGiaoNhanThietBi] ([ID])
GO

ALTER TABLE [ChiTietMuonThietBi] ADD CONSTRAINT [ThietBi_ChiTietMuonThietBi] 
    FOREIGN KEY ([Ma_thiet_bi]) REFERENCES [ThietBi] ([ID])
GO
