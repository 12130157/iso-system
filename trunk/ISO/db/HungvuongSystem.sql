/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases v4.1.3                     */
/* Target DBMS:           MS SQL Server 2005                              */
/* Project file:          database.dez                                    */
/* Project name:                                                          */
/* Author:                                                                */
/* Script type:           Database creation script                        */
/* Created on:            2010-03-30 10:25                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Tables                                                                 */
/* ---------------------------------------------------------------------- */

/* ---------------------------------------------------------------------- */
/* Add table "ThanhVien"                                                  */
/* ---------------------------------------------------------------------- */

CREATE TABLE [ThanhVien] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ten_DN] VARCHAR(20),
    [Mat_khau] VARCHAR(20),
    [Ma_vai_tro] INTEGER,
    [Ngay_tao] DATETIME,
    [Ngay_truy_cap_cuoi] DATETIME,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_ThanhVien] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "VaiTro"                                                     */
/* ---------------------------------------------------------------------- */

CREATE TABLE [VaiTro] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ten_vai_tro] VARCHAR(40),
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_VaiTro] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "ChiTietThanhVien"                                           */
/* ---------------------------------------------------------------------- */

CREATE TABLE [ChiTietThanhVien] (
    [Ten_dang_nhap] VARCHAR(20) NOT NULL,
    [Ho] VARCHAR(20),
    [Ten_lot] VARCHAR(30),
    [Ten] VARCHAR(20),
    [Ngay_sinh] DATETIME,
    [Ma_dia_chi] INTEGER,
    [Email] VARCHAR(40),
    [Dien_thoai_dd] VARCHAR(20),
    [Ma_bang_cap] INTEGER,
    [Ngay_bat_dau] DATETIME,
    [Ngay_ket_thuc] DATETIME,
    [Ma_tai_khoan] INTEGER,
    [Tinh_trang] INTEGER,
    [Chung_minh_nhan_dan] VARCHAR(15),
    [Ma_lop_hoc] INTEGER,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_ChiTietThanhVien] PRIMARY KEY ([Ten_dang_nhap])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "DiaChi"                                                     */
/* ---------------------------------------------------------------------- */

CREATE TABLE [DiaChi] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [So_nha] VARCHAR(10),
    [Duong] VARCHAR(20),
    [Phuong_xa] VARCHAR(20),
    [Quan_huyen] VARCHAR(20),
    [Tinh_Thanhpho] VARCHAR(40),
    [Dien_thoai_nha] VARCHAR(20),
    [Lan_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_DiaChi] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "TaiKhoan"                                                   */
/* ---------------------------------------------------------------------- */

CREATE TABLE [TaiKhoan] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [So_tai_khoan] VARCHAR(20),
    [Ngan_hang] VARCHAR(20),
    [Ngay_lap_the] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_TaiKhoan] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "KeHoachDaoTao"                                              */
/* ---------------------------------------------------------------------- */

CREATE TABLE [KeHoachDaoTao] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Thong_tin_chung] NVARCHAR(4000),
    [Nhiem_vu_1] NVARCHAR(1000),
    [Nhiem_vu_2] NVARCHAR(1000),
    [Nhiem_vu_3] NVARCHAR(1000),
    [Nhiem_vu_4] NVARCHAR(1000),
    [Ma_nguoi_lap] INTEGER,
    [Ngay_lap] DATETIME,
    [Ma_nguoi_duyet] INTEGER,
    [Ngay_duyet] DATETIME,
    [Tinh_trang] INTEGER,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_KeHoachDaoTao] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "ChiTietKHDT"                                                */
/* ---------------------------------------------------------------------- */

CREATE TABLE [ChiTietKHDT] (
    [ID] INTEGER NOT NULL,
    [Ma_ke_hoach] INTEGER,
    [Tu_ngay] DATETIME,
    [Den_ngay] DATETIME,
    [Khoa_1] INTEGER,
    [Noi_dung_cong_tac_1] NVARCHAR(1000),
    [Bo_phan_thuc_hien_1] NVARCHAR(1000),
    [Ngay_cap_nhat_cuoi] DATETIME,
    [Khoa_2] INTEGER,
    [Noi_dung_cong_tac_2] NVARCHAR(1000),
    [Bo_phan_thuc_hien_2] NVARCHAR(1000),
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_ChiTietKHDT] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "DeCuongMonHoc"                                              */
/* ---------------------------------------------------------------------- */

CREATE TABLE [DeCuongMonHoc] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_mon_hoc] INTEGER,
    [Kiem_tra] INTEGER,
    [Hoc_ki] INTEGER,
    [Muc_tieu_1] NVARCHAR(4000),
    [Muc_tieu_2] NVARCHAR(4000),
    [Muc_tieu_3] NVARCHAR(4000),
    [Muc_tieu_4] NVARCHAR(4000),
    [Dieu_kien_1] NVARCHAR(4000),
    [Dieu_kien_2] NVARCHAR(4000),
    [Dieu_kien_3] NVARCHAR(4000),
    [Dieu_kien_4] NVARCHAR(4000),
    [Phuong_phap_1] NVARCHAR(4000),
    [Phuong_phap_2] NVARCHAR(4000),
    [Phuong_phap_3] NVARCHAR(4000),
    [Ngay_tao] DATETIME,
    [Ma_nguoi_tao] INTEGER,
    [Ma_nguoi_duyet] INTEGER,
    [Ngay_duyet] DATETIME,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_DeCuongMonHoc] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "NoiDungDCMH"                                                */
/* ---------------------------------------------------------------------- */

CREATE TABLE [NoiDungDCMH] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_de_cuong] INTEGER,
    [Ten_chuong] NVARCHAR(4000),
    [Ly_thuyet] INTEGER,
    [Thuc_hanh] INTEGER,
    [Flag_tich_hop] BIT,
    [Thuc_nghiem] INTEGER,
    [Bai_tap] INTEGER,
    [Kiem_tra] INTEGER,
    [Tong_gio] VARCHAR(40),
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_NoiDungDCMH] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "ChiTietDCMH"                                                */
/* ---------------------------------------------------------------------- */

CREATE TABLE [ChiTietDCMH] (
    [ID] INTEGER NOT NULL,
    [Ma_noi_dung] INTEGER,
    [Ten_de_muc] NVARCHAR(4000),
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_ChiTietDCMH] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "DeCuongKeHoach_TMP"                                         */
/* ---------------------------------------------------------------------- */

CREATE TABLE [DeCuongKeHoach_TMP] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_mon_hoc] INTEGER,
    [Buoi_hoc] INTEGER,
    [Ly_thuyet] INTEGER,
    [Thuc_hanh] INTEGER,
    [Noi_dung_ly_thuyet] NVARCHAR(4000),
    [Noi_dung_thuc_hanh] NVARCHAR(4000),
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_DeCuongKeHoach_TMP] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "ChuongTrinhDaoTao"                                          */
/* ---------------------------------------------------------------------- */

CREATE TABLE [ChuongTrinhDaoTao] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ten_nghe] NVARCHAR(40),
    [Ma_nghe] VARCHAR(40),
    [Ma_trinh_do] INTEGER,
    [Doi_tuong_1] NVARCHAR(1000),
    [Doi_tuong_2] NVARCHAR(1000),
    [Doi_tuong_3] NVARCHAR(1000),
    [So_luong_mon_hoc] INTEGER,
    [Muc_tieu_1] NVARCHAR(1000),
    [Muc_tieu_2] NVARCHAR(1000),
    [Muc_tieu_3] NVARCHAR(1000),
    [Muc_tieu_4] NVARCHAR(1000),
    [Muc_tieu_5] NVARCHAR(1000),
    [Phuong_phap_1] NVARCHAR(1000),
    [Phuong_phap_2] NVARCHAR(1000),
    [Phuong_phap_3] NVARCHAR(1000),
    [Thoi_gian_1] NVARCHAR(1000),
    [Thoi_gian_2] NVARCHAR(1000),
    [Thoi_gian_3] NVARCHAR(1000),
    [Thoi_gian_4] NVARCHAR(1000),
    [Phan_bo_1] NVARCHAR(1000),
    [Phan_bo_2] NVARCHAR(1000),
    [Phan_bo_3] NVARCHAR(1000),
    [Phan_bo_4] NVARCHAR(1000),
    [Phan_bo_5] NVARCHAR(1000),
    [Phan_bo_6] NVARCHAR(1000),
    [Thi_hoc_ki] NVARCHAR(1000),
    [Thi_tot_nghiep] NVARCHAR(1000),
    [Thuc_tap] NVARCHAR(1000),
    [Y_kien_de_xuat] NVARCHAR(4000),
    [Ngay_tao] DATETIME,
    [Ngay_cap_nhat_cuoi] VARCHAR(40),
    [Ma_nguoi_tao] INTEGER,
    [Ma_nguoi_duyet] INTEGER,
    [Ngay_duyet] INTEGER,
    [Tinh_trang] INTEGER,
    [Ma_chuyen_nganh_dang_mo] INTEGER,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_ChuongTrinhDaoTao] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "ChiTietMonHocCTDT"                                          */
/* ---------------------------------------------------------------------- */

CREATE TABLE [ChiTietMonHocCTDT] (
    [ID] INTEGER NOT NULL,
    [Ma_chuong_trinh] INTEGER,
    [Thu_tu] INTEGER,
    [Ma_mon_hoc] INTEGER,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_ChiTietMonHocCTDT] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "MonHoc"                                                     */
/* ---------------------------------------------------------------------- */

CREATE TABLE [MonHoc] (
    [ID] INTEGER NOT NULL,
    [Ten_mon_hoc] NVARCHAR(100),
    [Ly_thuyet] INTEGER,
    [Thuc_hanh] INTEGER,
    [Kiem_tra] INTEGER,
    [Tinh_chat] NVARCHAR(100),
    [Ma_hoc_phan] INTEGER,
    [Ma_chuyen_nganh] INTEGER,
    [Ngay_tao] DATETIME,
    [Ma_nguoi_tao] INTEGER,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_MonHoc] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "HocPhan"                                                    */
/* ---------------------------------------------------------------------- */

CREATE TABLE [HocPhan] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ten_hoc_phan] NVARCHAR(100),
    [Ghi_chu] NVARCHAR(200),
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_HocPhan] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "ChuyenNganh"                                                */
/* ---------------------------------------------------------------------- */

CREATE TABLE [ChuyenNganh] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ten_chuyen_nganh] NVARCHAR(100),
    [Ma_khoaTT] INTEGER,
    [Ngay_tao] DATETIME,
    [Ma_nguoi_tao] INTEGER,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_ChuyenNganh] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "Khoa_TrungTam"                                              */
/* ---------------------------------------------------------------------- */

CREATE TABLE [Khoa_TrungTam] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ten] NVARCHAR(100),
    [Ma_truong_khoa] INTEGER,
    [Ngay_tao] DATETIME,
    [Nguoi_tao] INTEGER,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_Khoa_TrungTam] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "KeHoachXayDungCT"                                           */
/* ---------------------------------------------------------------------- */

CREATE TABLE [KeHoachXayDungCT] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Nam_hoc] VARCHAR(10),
    [Ngay_tao] DATETIME,
    [Ma_nguoi_tao] INTEGER,
    [Ma_nguoi_duyet] INTEGER,
    [Ngay_duyet] DATETIME,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [Tinh_trang] INTEGER,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_KeHoachXayDungCT] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "ChiTietKHXDCT"                                              */
/* ---------------------------------------------------------------------- */

CREATE TABLE [ChiTietKHXDCT] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_ke_hoach] INTEGER,
    [Thoi_gian_thuc_hien] NVARCHAR(40),
    [Noi_dung_cong_tac] NVARCHAR(1000),
    [Giao_vien_thuc_hien] INTEGER,
    [Ket_qua_dat_duoc] NVARCHAR(1000),
    [Ghi_chu] NVARCHAR(1000),
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_ChiTietKHXDCT] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "KeHoachGiangDay"                                            */
/* ---------------------------------------------------------------------- */

CREATE TABLE [KeHoachGiangDay] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_mon_hoc] INTEGER,
    [Ma_lop] INTEGER,
    [Hoc_ki] INTEGER,
    [Ma_nam_hoc] INTEGER,
    [So_ca_thuc_hanh] INTEGER,
    [Ma_nguoi_tao] INTEGER,
    [Ngay_tao] DATETIME,
    [Ma_nguoi_duyet] INTEGER,
    [Ngay_duyet] DATETIME,
    [Tinh_trang] INTEGER,
    [So_buoi_hoc_trong_tuan] INTEGER,
    [Noi_dung_KT_thuc_hien] NVARCHAR(1000),
    [Ma_nguoi_kiem_tra] INTEGER,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_KeHoachGiangDay] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "NamHoc"                                                     */
/* ---------------------------------------------------------------------- */

CREATE TABLE [NamHoc] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Nam_bat_dau] INTEGER,
    [Nam_ket_thuc] INTEGER,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_NamHoc] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "ChiTietKHGD"                                                */
/* ---------------------------------------------------------------------- */

CREATE TABLE [ChiTietKHGD] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_ke_hoach] INTEGER,
    [Tuan_le] INTEGER,
    [Tu_ngay] DATETIME,
    [Den_ngay] DATETIME,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_ChiTietKHGD] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "NoiDungChiTietKHGD"                                         */
/* ---------------------------------------------------------------------- */

CREATE TABLE [NoiDungChiTietKHGD] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_chi_tiet_KHGD] INTEGER,
    [Buoi_hoc] INTEGER,
    [Ly_thuyet] INTEGER,
    [Thuc_hanh] INTEGER,
    [Ten_chuong_ly_thuyet] NVARCHAR(200),
    [Noi_dung_ly_thuyet] NVARCHAR(4000),
    [Ten_chuong_thuc_hanh] NVARCHAR(200),
    [Noi_dung_thuc_hanh] NVARCHAR(4000),
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_NoiDungChiTietKHGD] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "GiaoAn"                                                     */
/* ---------------------------------------------------------------------- */

CREATE TABLE [GiaoAn] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_KHGD] INTEGER,
    [Thu_tu] INTEGER,
    [Buoi_hoc] INTEGER,
    [Ngay_thuc_hien] DATETIME,
    [Muc_tieu] NVARCHAR(2000),
    [Thoi_gian_on_dinh] INTEGER,
    [Cong_tac_chuan_bi] NVARCHAR(2000),
    [Ngay_tao] DATETIME,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [Dan_nhap] NVARCHAR(2000),
    [Noi_dung_bai_giang] NVARCHAR(4000),
    [Cung_co_kien_thuc] NVARCHAR(2000),
    [Huong_dan_tu_hoc] VARCHAR(40),
    [Thoi_gian_dan_nhap] INTEGER,
    [Thoi_gian_bai_giang] INTEGER,
    [Thoi_gian_cung_co] INTEGER,
    [Thoi_gian_HDTH] INTEGER,
    [Tai_lieu_tham_khao] VARCHAR(40),
    [Ma_nguoi_duyet] INTEGER,
    [Ngay_duyet] DATETIME,
    [Tinh_trang] INTEGER,
    [HD_dan_nhap_GV] NVARCHAR(2000),
    [HD_dan_nhap_HS] NVARCHAR(2000),
    [HD_giang_bai_moi_GV] NVARCHAR(2000),
    [HD_giang_bai_moi_HS] NVARCHAR(2000),
    [HD_cung_co_GV] NVARCHAR(2000),
    [HD_cung_co_HS] NVARCHAR(2000),
    [HD_HDTH_GV] NVARCHAR(2000),
    [HD_HDTH_HS] NVARCHAR(2000),
    [Loai_giao_an] INTEGER,
    [Huong_dan_ban_dau] NVARCHAR(2000),
    [Huong_dan_thuong_xuyen] NVARCHAR(2000),
    [Huong_dan_ket_thuc] NVARCHAR(2000),
    [Huong_dan_ren_luyen] NVARCHAR(2000),
    [Thoi_gian_HDBD] INTEGER,
    [Thoi_gian_HDTX] INTEGER,
    [Thoi_gian_HDKT] INTEGER,
    [Thoi_gian_HDRL] INTEGER,
    [HD_HDBD_GV] NVARCHAR(2000),
    [HD_HDBD_HS] NVARCHAR(2000),
    [HD_HDTX_GV] NVARCHAR(2000),
    [HD_HDTX_HS] NVARCHAR(2000),
    [HD_HDKT_GV] NVARCHAR(2000),
    [HD_HDKT_HS] NVARCHAR(2000),
    [HD_HDRL_GV] NVARCHAR(2000),
    [HD_HDRL_HS] NVARCHAR(2000),
    [Gioi_thieu_chu_de] NVARCHAR(2000),
    [Giai_quyet_van_de] NVARCHAR(2000),
    [Thoi_gian_GTCD] INTEGER,
    [Thoi_gian_GTVD] INTEGER,
    [HD_GTCD_GV] NVARCHAR(2000),
    [HD_GTCD_HS] NVARCHAR(2000),
    [HD_GQVD_GV] NVARCHAR(2000),
    [HD_GQVD_HS] NVARCHAR(2000),
    [Rut_kinh_nghiem] NVARCHAR(2000),
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_GiaoAn] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "DoDungDayHoc"                                               */
/* ---------------------------------------------------------------------- */

CREATE TABLE [DoDungDayHoc] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ten_do_dung] NVARCHAR(100),
    [Ngay_mua] DATETIME,
    [Ngay_bao_tri_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_DoDungDayHoc] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "HoatDongGiaoVien"                                           */
/* ---------------------------------------------------------------------- */

CREATE TABLE [HoatDongGiaoVien] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Noi_dung] NVARCHAR(2000),
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_HoatDongGiaoVien] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "HoatDongHocSinh"                                            */
/* ---------------------------------------------------------------------- */

CREATE TABLE [HoatDongHocSinh] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Noi_dung] NVARCHAR(2000),
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_HoatDongHocSinh] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "LopHoc"                                                     */
/* ---------------------------------------------------------------------- */

CREATE TABLE [LopHoc] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_chuyen_nganh] INTEGER,
    [Ki_hieu] INTEGER,
    [Ma_lop_truong] INTEGER,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_LopHoc] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "ThoiKhoaBieu"                                               */
/* ---------------------------------------------------------------------- */

CREATE TABLE [ThoiKhoaBieu] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_lop] INTEGER,
    [Tuan_bat_dau] INTEGER,
    [Tuan_ket_thuc] INTEGER,
    [Ngay_bat_dau] DATETIME,
    [Ngay_ket_thuc] DATETIME,
    [Ma_nguoi_tao] INTEGER,
    [Ngay_tao] DATETIME,
    [Ma_nguoi_duyet] INTEGER,
    [Ngay_duyet] DATETIME,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_ThoiKhoaBieu] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "ChiTietTKB"                                                 */
/* ---------------------------------------------------------------------- */

CREATE TABLE [ChiTietTKB] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_TKB] INTEGER,
    [Thu_trong_tuan] INTEGER,
    [Buoi] INTEGER,
    [Ma_mon_hoc] INTEGER,
    [Ma_giao_vien] INTEGER,
    [Hinh_thuc_day] INTEGER,
    [Nhom] INTEGER,
    [Ma_phong] INTEGER,
    [Ngay_bat_dau] DATETIME,
    [Ngay_ket_thuc] DATETIME,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_ChiTietTKB] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "DiemHocSinh"                                                */
/* ---------------------------------------------------------------------- */

CREATE TABLE [DiemHocSinh] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_TKB] INTEGER,
    [Ma_mon_hoc] INTEGER,
    [Ma_hoc_vien] INTEGER,
    [Diem_tong] NUMERIC,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_DiemHocSinh] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "ChiTietDiem"                                                */
/* ---------------------------------------------------------------------- */

CREATE TABLE [ChiTietDiem] (
    [ID] INTEGER NOT NULL,
    [Ma_diem_HS] INTEGER,
    [Bai_kiem_tra] NVARCHAR(40),
    [Tinh_chat_KT] NVARCHAR(40),
    [Diem] NVARCHAR(40),
    CONSTRAINT [PK_ChiTietDiem] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "FeedbackGiaoVien"                                           */
/* ---------------------------------------------------------------------- */

CREATE TABLE [FeedbackGiaoVien] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_TKB] INTEGER,
    [Ma_mon_hoc] INTEGER,
    [Ma_giao_vien] INTEGER,
    [Ma_hoc_vien] INTEGER,
    [Ngay_tao] DATETIME,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_FeedbackGiaoVien] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "ChiTietFeedback"                                            */
/* ---------------------------------------------------------------------- */

CREATE TABLE [ChiTietFeedback] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_feedback] INTEGER,
    [Cau_hoi_feedback] NVARCHAR(2000),
    [Noi_dung_tra_loi] NVARCHAR(2000),
    [Diem_tong] NUMERIC,
    [Diem_dat_duoc] NUMERIC,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_ChiTietFeedback] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "BangCap"                                                    */
/* ---------------------------------------------------------------------- */

CREATE TABLE [BangCap] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Loai_bang] NVARCHAR(40),
    [Truong_cap] NVARCHAR(200),
    [Nam_tot_nghiep] INTEGER,
    [Loai_tot_nghiep] NVARCHAR(10),
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_BangCap] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "PhongBan"                                                   */
/* ---------------------------------------------------------------------- */

CREATE TABLE [PhongBan] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ki_hieu_phong] NVARCHAR(40),
    [Vi_tri] NVARCHAR(40),
    [Chuc_nang] INTEGER,
    [Suc_chua] INTEGER,
    [Ngay_cap_nhat_cuoi] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_PhongBan] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "sys_Menu"                                                   */
/* ---------------------------------------------------------------------- */

CREATE TABLE [sys_Menu] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [AppID] INTEGER,
    [Menu_name] NVARCHAR(100),
    [images] NVARCHAR(100),
    [Menu_link] NVARCHAR(100),
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_sys_Menu] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "sys_User_Menu"                                              */
/* ---------------------------------------------------------------------- */

CREATE TABLE [sys_User_Menu] (
    [UserID] INTEGER NOT NULL,
    [MenuID] INTEGER NOT NULL,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_sys_User_Menu] PRIMARY KEY ([UserID], [MenuID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "sys_Role_Menu"                                              */
/* ---------------------------------------------------------------------- */

CREATE TABLE [sys_Role_Menu] (
    [RoleID] INTEGER  NOT NULL,
    [Menu_ID] INTEGER NOT NULL,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_sys_Role_Menu] PRIMARY KEY ([RoleID], [Menu_ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "sys_App"                                                    */
/* ---------------------------------------------------------------------- */

CREATE TABLE [sys_App] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [App_name] NVARCHAR(100),
    [App_link] NVARCHAR(100),
    [images] NVARCHAR(100),
    [Create_date] DATETIME,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_sys_App] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "sys_User_App"                                               */
/* ---------------------------------------------------------------------- */

CREATE TABLE [sys_User_App] (
    [UserID] INTEGER NOT NULL,
    [AppID] INTEGER NOT NULL,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_sys_User_App] PRIMARY KEY ([UserID], [AppID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "sys_Role_App"                                               */
/* ---------------------------------------------------------------------- */

CREATE TABLE [sys_Role_App] (
    [RoleID] INTEGER NOT NULL,
    [AppID] INTEGER NOT NULL,
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_sys_Role_App] PRIMARY KEY ([RoleID], [AppID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "QuyetDinhMoLop"                                             */
/* ---------------------------------------------------------------------- */

CREATE TABLE [QuyetDinhMoLop] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_KHDT] INTEGER,
    [Ki_hieu] NVARCHAR(40),
    [Ma_khoa] INTEGER,
    [Ma_nien_khoa] INTEGER,
    [Thong_tin_chung] NVARCHAR(2000),
    [Dieu_mot] NVARCHAR(1000),
    [Tu_thang] VARCHAR(10),
    [Den_thang] VARCHAR(10),
    [Ma_nguoi_lap] INTEGER,
    [Ngay_lap] DATETIME,
    [Ma_nguoi_duyet] INTEGER,
    [Ngay_duyet] DATETIME,
    [Tinh_trang] INTEGER,
    [Noi_nhan] NVARCHAR(100),
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_QuyetDinhMoLop] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "PhieuDeNghiMoLop"                                           */
/* ---------------------------------------------------------------------- */

CREATE TABLE [PhieuDeNghiMoLop] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_lop] INTEGER,
    [Thong_tin_chung] NVARCHAR(1000),
    [Thoi_gian_dao_tao] NVARCHAR(40),
    [Noi_dung_chuong_trinh] NVARCHAR(2000),
    [Phuong_phap_day] NVARCHAR(2000),
    [Hoc_phi_dao_tao] NUMERIC,
    [Phan_nha_truong_quan_ly] INTEGER,
    [Thu_lao_giao_vien] INTEGER,
    [Chi_phi_thuc_hanh] INTEGER,
    [Ma_nguoi_tao] INTEGER,
    [Ngay_tao] DATETIME,
    [Ma_nguoi_duyet] INTEGER,
    [Ngay_duyet] VARCHAR(40),
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_PhieuDeNghiMoLop] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "MoChuyenNganh"                                              */
/* ---------------------------------------------------------------------- */

CREATE TABLE [MoChuyenNganh] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Ma_chuyen_nganh] INTEGER,
    [Ma_quyet_dinh] INTEGER,
    [Ghi_chu] NVARCHAR(40),
    [User1] VARCHAR(40),
    [User2] VARCHAR(40),
    [User3] VARCHAR(40),
    [User4] VARCHAR(40),
    [User5] VARCHAR(40),
    CONSTRAINT [PK_MoChuyenNganh] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Foreign key constraints                                                */
/* ---------------------------------------------------------------------- */

ALTER TABLE [ThanhVien] ADD CONSTRAINT [VaiTro_ThanhVien] 
    FOREIGN KEY ([Ma_vai_tro]) REFERENCES [VaiTro] ([ID])
GO

ALTER TABLE [ThanhVien] ADD CONSTRAINT [ChiTietThanhVien_ThanhVien] 
    FOREIGN KEY ([Ten_DN]) REFERENCES [ChiTietThanhVien] ([Ten_dang_nhap])
GO

ALTER TABLE [ChiTietThanhVien] ADD CONSTRAINT [DiaChi_ChiTietThanhVien] 
    FOREIGN KEY ([Ma_dia_chi]) REFERENCES [DiaChi] ([ID])
GO

ALTER TABLE [ChiTietThanhVien] ADD CONSTRAINT [TaiKhoan_ChiTietThanhVien] 
    FOREIGN KEY ([Ma_tai_khoan]) REFERENCES [TaiKhoan] ([ID])
GO

ALTER TABLE [ChiTietThanhVien] ADD CONSTRAINT [BangCap_ChiTietThanhVien] 
    FOREIGN KEY ([Ma_bang_cap]) REFERENCES [BangCap] ([ID])
GO

ALTER TABLE [ChiTietKHDT] ADD CONSTRAINT [KeHoachDaoTao_ChiTietKHDT] 
    FOREIGN KEY ([Ma_ke_hoach]) REFERENCES [KeHoachDaoTao] ([ID])
GO

ALTER TABLE [DeCuongMonHoc] ADD CONSTRAINT [MonHoc_DeCuongMonHoc] 
    FOREIGN KEY ([Ma_mon_hoc]) REFERENCES [MonHoc] ([ID])
GO

ALTER TABLE [NoiDungDCMH] ADD CONSTRAINT [DeCuongMonHoc_NoiDungDCMH] 
    FOREIGN KEY ([Ma_de_cuong]) REFERENCES [DeCuongMonHoc] ([ID])
GO

ALTER TABLE [ChiTietDCMH] ADD CONSTRAINT [NoiDungDCMH_ChiTietDCMH] 
    FOREIGN KEY ([Ma_noi_dung]) REFERENCES [NoiDungDCMH] ([ID])
GO

ALTER TABLE [ChuongTrinhDaoTao] ADD CONSTRAINT [MoChuyenNganh_ChuongTrinhDaoTao] 
    FOREIGN KEY ([Ma_chuyen_nganh_dang_mo]) REFERENCES [MoChuyenNganh] ([ID])
GO

ALTER TABLE [ChiTietMonHocCTDT] ADD CONSTRAINT [ChuongTrinhDaoTao_ChiTietMonHocCTDT] 
    FOREIGN KEY ([Ma_chuong_trinh]) REFERENCES [ChuongTrinhDaoTao] ([ID])
GO

ALTER TABLE [ChiTietMonHocCTDT] ADD CONSTRAINT [MonHoc_ChiTietMonHocCTDT] 
    FOREIGN KEY ([Ma_mon_hoc]) REFERENCES [MonHoc] ([ID])
GO

ALTER TABLE [MonHoc] ADD CONSTRAINT [HocPhan_MonHoc] 
    FOREIGN KEY ([Ma_hoc_phan]) REFERENCES [HocPhan] ([ID])
GO

ALTER TABLE [MonHoc] ADD CONSTRAINT [ChuyenNganh_MonHoc] 
    FOREIGN KEY ([Ma_chuyen_nganh]) REFERENCES [ChuyenNganh] ([ID])
GO

ALTER TABLE [ChuyenNganh] ADD CONSTRAINT [Khoa_TrungTam_ChuyenNganh] 
    FOREIGN KEY ([Ma_khoaTT]) REFERENCES [Khoa_TrungTam] ([ID])
GO

ALTER TABLE [ChiTietKHXDCT] ADD CONSTRAINT [KeHoachXayDungCT_ChiTietKHXDCT] 
    FOREIGN KEY ([Ma_ke_hoach]) REFERENCES [KeHoachXayDungCT] ([ID])
GO

ALTER TABLE [KeHoachGiangDay] ADD CONSTRAINT [NamHoc_KeHoachGiangDay] 
    FOREIGN KEY ([Ma_nam_hoc]) REFERENCES [NamHoc] ([ID])
GO

ALTER TABLE [KeHoachGiangDay] ADD CONSTRAINT [LopHoc_KeHoachGiangDay] 
    FOREIGN KEY ([Ma_lop]) REFERENCES [LopHoc] ([ID])
GO

ALTER TABLE [KeHoachGiangDay] ADD CONSTRAINT [MonHoc_KeHoachGiangDay] 
    FOREIGN KEY ([Ma_mon_hoc]) REFERENCES [MonHoc] ([ID])
GO

ALTER TABLE [ChiTietKHGD] ADD CONSTRAINT [KeHoachGiangDay_ChiTietKHGD] 
    FOREIGN KEY ([Ma_ke_hoach]) REFERENCES [KeHoachGiangDay] ([ID])
GO

ALTER TABLE [NoiDungChiTietKHGD] ADD CONSTRAINT [ChiTietKHGD_NoiDungChiTietKHGD] 
    FOREIGN KEY ([Ma_chi_tiet_KHGD]) REFERENCES [ChiTietKHGD] ([ID])
GO

ALTER TABLE [GiaoAn] ADD CONSTRAINT [KeHoachGiangDay_GiaoAnLyThuyet] 
    FOREIGN KEY ([Ma_KHGD]) REFERENCES [KeHoachGiangDay] ([ID])
GO

ALTER TABLE [LopHoc] ADD CONSTRAINT [ChuyenNganh_LopHoc] 
    FOREIGN KEY ([Ma_chuyen_nganh]) REFERENCES [ChuyenNganh] ([ID])
GO

ALTER TABLE [ThoiKhoaBieu] ADD CONSTRAINT [LopHoc_ThoiKhoaBieu] 
    FOREIGN KEY ([Ma_lop]) REFERENCES [LopHoc] ([ID])
GO

ALTER TABLE [ChiTietTKB] ADD CONSTRAINT [ThoiKhoaBieu_ChiTietTKB] 
    FOREIGN KEY ([Ma_TKB]) REFERENCES [ThoiKhoaBieu] ([ID])
GO

ALTER TABLE [ChiTietTKB] ADD CONSTRAINT [PhongBan_ChiTietTKB] 
    FOREIGN KEY ([Ma_phong]) REFERENCES [PhongBan] ([ID])
GO

ALTER TABLE [DiemHocSinh] ADD CONSTRAINT [ThoiKhoaBieu_DiemHocSinh] 
    FOREIGN KEY ([Ma_TKB]) REFERENCES [ThoiKhoaBieu] ([ID])
GO

ALTER TABLE [ChiTietDiem] ADD CONSTRAINT [DiemHocSinh_ChiTietDiem] 
    FOREIGN KEY ([Ma_diem_HS]) REFERENCES [DiemHocSinh] ([ID])
GO

ALTER TABLE [FeedbackGiaoVien] ADD CONSTRAINT [ThoiKhoaBieu_FeedbackGiaoVien] 
    FOREIGN KEY ([Ma_TKB]) REFERENCES [ThoiKhoaBieu] ([ID])
GO

ALTER TABLE [ChiTietFeedback] ADD CONSTRAINT [FeedbackGiaoVien_ChiTietFeedback] 
    FOREIGN KEY ([Ma_feedback]) REFERENCES [FeedbackGiaoVien] ([ID])
GO

ALTER TABLE [sys_Menu] ADD CONSTRAINT [sys_App_sys_Menu] 
    FOREIGN KEY ([AppID]) REFERENCES [sys_App] ([ID])
GO

ALTER TABLE [sys_User_Menu] ADD CONSTRAINT [sys_Menu_sys_User_Menu] 
    FOREIGN KEY ([MenuID]) REFERENCES [sys_Menu] ([ID])
GO

ALTER TABLE [sys_Role_Menu] ADD CONSTRAINT [sys_Menu_sys_Role_Menu] 
    FOREIGN KEY ([Menu_ID]) REFERENCES [sys_Menu] ([ID])
GO

ALTER TABLE [sys_User_App] ADD CONSTRAINT [sys_App_sys_User_App] 
    FOREIGN KEY ([AppID]) REFERENCES [sys_App] ([ID])
GO

ALTER TABLE [sys_Role_App] ADD CONSTRAINT [sys_App_sys_Role_App] 
    FOREIGN KEY ([AppID]) REFERENCES [sys_App] ([ID])
GO

ALTER TABLE [QuyetDinhMoLop] ADD CONSTRAINT [KeHoachDaoTao_QuyetDinhMoLop] 
    FOREIGN KEY ([Ma_KHDT]) REFERENCES [KeHoachDaoTao] ([ID])
GO

ALTER TABLE [MoChuyenNganh] ADD CONSTRAINT [ChuyenNganh_MoChuyenNganh] 
    FOREIGN KEY ([Ma_chuyen_nganh]) REFERENCES [ChuyenNganh] ([ID])
GO

ALTER TABLE [MoChuyenNganh] ADD CONSTRAINT [QuyetDinhMoLop_MoChuyenNganh] 
    FOREIGN KEY ([Ma_quyet_dinh]) REFERENCES [QuyetDinhMoLop] ([ID])
GO

