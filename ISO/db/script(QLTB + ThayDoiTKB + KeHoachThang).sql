-- Tao Table To Trinh 
CREATE TABLE [dbo].[ToTrinh](
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Ten] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Ma_nguoi_tao] [int] NULL,
	[Ma_nguoi_duyet] [int] NULL,
	[Ngay_tao] [datetime] NULL,
	[Ngay_duyet] [datetime] NULL,
	[Ngay_gui] [datetime] NULL,
	[Ly_do_reject] [nvarchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Tinh_trang] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Ngay_cap_nhat_cuoi] [datetime] NULL,
	[User1] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[User2] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[User3] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[User4] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[User5] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)

GO
-- Tao table MonHocTKBThayDoi
CREATE TABLE [dbo].[MonHocTKBThayDoi](
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Ma_mon_hoc_TKB] [int] NULL,
	[Ma_giao_vien] [int] NULL,
	[Ma_to_trinh] [int] NULL,
	[Ma_nguoi_tao] [int] NULL,
	[Tinh_trang] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ID_thay_the] [int] NULL,
	[Ngay_cap_nhat_cuoi] [datetime] NULL,
	[User1] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[User2] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[User3] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[User4] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[User5] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)

GO
-- Tao table ChiTietTKBThayDoi
CREATE TABLE [dbo].[ChiTietTKBThayDoi](
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Ma_mon_hoc_TKB] [int] NULL,
	[Ma_chi_tiet_TKB] [int] NULL,
	[Thu_trong_tuan] [int] NULL,
	[Buoi] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Ma_phong] [int] NULL,
	[Tuan] [int] NULL,
	[Ngay_hoc] [datetime] NULL,
	[Ma_nguoi_tao] [int] NULL,
	[Ma_to_trinh] [int] NULL,
	[Tinh_trang] [int] NULL,
	[ID_thay_the] [int] NULL,
	[Ngay_cap_nhat_cuoi] [datetime] NULL,
	[User1] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[User2] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[User3] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[User4] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[User5] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)

GO
-- Tao table KeHoachThang
CREATE TABLE [dbo].[KeHoachThang](
	[ID] [int] IDENTITY(0,1) NOT NULL PRIMARY KEY,
	[Thang] [varchar](2) COLLATE Vietnamese_CI_AS NULL,
	[Noi_nhan] [nvarchar](1000) COLLATE Vietnamese_CI_AS NULL,
	[Ma_nguoi_tao] [int] NULL,
	[Ngay_cap_nhat_cuoi] [datetime] NULL,
	[Ngay_tao] [datetime] NULL,
	[Ma_nguoi_duyet] [int] NULL,
	[Ngay_duyet] [datetime] NULL,
	[Nam] [varchar](4) COLLATE Vietnamese_CI_AS NULL,
	[Tinh_trang] [int] NULL,
	[Ten_ke_hoach_thang] [nvarchar](200) COLLATE Vietnamese_CI_AS NULL,
	[Ngay_gui] [datetime] NULL,
	[Ly_do_reject] [nvarchar](2000) COLLATE Vietnamese_CI_AS NULL,
	[User1] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User2] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User3] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User4] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User5] [varchar](40) COLLATE Vietnamese_CI_AS NULL
)

GO
-- Tao table CongTacThang
CREATE TABLE [dbo].[CongTacThang](
	[ID] [int] IDENTITY(0,1) NOT NULL PRIMARY KEY,
	[Ma_ke_hoach_thang] [int] NULL,
	[Ma_cong_tac] [int] NULL,
	[Ngay_cap_nhat_cuoi] [datetime] NULL,
	[Bao_cao] [nvarchar](1000) COLLATE Vietnamese_CI_AS NULL,
	[Ghi_chu] [nvarchar](1000) COLLATE Vietnamese_CI_AS NULL,
	[Bo_phan_thuc_hien] [nvarchar](200) COLLATE Vietnamese_CI_AS NULL,
	[User1] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User2] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User3] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User4] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User5] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	FOREIGN KEY (Ma_ke_hoach_thang) REFERENCES KeHoachThang(ID)
)

GO
-- Tao table BoPhanThucHienCongTacThang
CREATE TABLE [dbo].[BoPhanThucHienCongTacThang](
	[ID] [int] IDENTITY(0,1) NOT NULL PRIMARY KEY,
	[Ma_cong_tac_thang] [int] NULL,
	[Ma_bo_phan] [int] NULL,
	[User1] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User2] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User3] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User4] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User5] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	FOREIGN KEY (Ma_cong_tac_thang) REFERENCES CongTacThang(ID)
)

GO
-- Tao table TinhTrangCongTac
CREATE TABLE [dbo].[TinhTrangCongTac](
	[ID] [int] IDENTITY(0,1) NOT NULL PRIMARY KEY,
	[Ma_cong_tac_thang] [int] NULL,
	[Tinh_trang] [int] NULL,
	[Thu_tu_tuan] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[Ngay_cap_nhat_cuoi] [datetime] NULL,
	[User1] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User2] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User3] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User4] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User5] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	FOREIGN KEY (Ma_cong_tac_thang) REFERENCES CongTacThang(ID)
)

-- Tao table ThietBi
CREATE TABLE [dbo].[ThietBi](
	[ID] [int] IDENTITY(0,1) NOT NULL PRIMARY KEY,
	[Ten] [nvarchar](100) COLLATE Vietnamese_CI_AS NULL,
	[Ma_loai] [int] NULL,
	[Ki_hieu] [nvarchar](100) COLLATE Vietnamese_CI_AS NULL,
	[Ma_tinh_trang] [int] NULL,
	[Ghi_chu] [nvarchar](1000) COLLATE Vietnamese_CI_AS NULL,
	[Ma_nguoi_tao] [int] NULL,
	[Ma_nha_cung_cap] [int] NULL,
	[Ngay_san_xuat] [datetime] NULL,
	[Ngay_mua] [datetime] NULL,
	[Han_bao_hanh] [datetime] NULL,
	[Ngay_bat_dau_su_dung] [datetime] NULL,
	[Tan_suat_toi_da] [int] NULL,
	[Gia_mua] [float] NULL,
	[Dac_tinh_ky_thuat] [nvarchar](1000) COLLATE Vietnamese_CI_AS NULL,
	[Nguyen_tac_su_dung] [nvarchar](1000) COLLATE Vietnamese_CI_AS NULL,
	[So_lan_su_dung] [int] NULL,
	[So_lan_bao_tri] [int] NULL,
	[Ma_tan_suat] [int] NULL,
	[Tan_suat_su_dung] [float] NULL,
	[Ngay_cap_nhat_cuoi] [datetime] NULL,
	[User1] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User2] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User3] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User4] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User5] [varchar](40) COLLATE Vietnamese_CI_AS NULL
)

GO
-- Tao table ChiTietThietBi
CREATE TABLE [dbo].[ChiTietThietBi](
	[ID] [int] IDENTITY(0,1) NOT NULL PRIMARY KEY,
	[Ten_linh_kien] [nvarchar](100) COLLATE Vietnamese_CI_AS NULL,
	[Ma_loai_linh_kien] [int] NULL,
	[Ki_hieu] [nvarchar](100) COLLATE Vietnamese_CI_AS NULL,
	[Ma_tinh_trang] [int] NULL,
	[Ghi_chu] [nvarchar](1000) COLLATE Vietnamese_CI_AS NULL,
	[Ma_nguoi_tao] [int] NULL,
	[Ma_nha_cung_cap] [int] NULL,
	[Ngay_san_xuat] [datetime] NULL,
	[Ngay_mua] [datetime] NULL,
	[Han_bao_hanh] [datetime] NULL,
	[Ngay_bat_dau_su_dung] [datetime] NULL,
	[Tan_suat_toi_da] [int] NULL,
	[Gia_mua] [float] NULL,
	[Dac_tinh_ky_thuat] [nvarchar](1000) COLLATE Vietnamese_CI_AS NULL,
	[Nguyen_tac_su_dung] [nvarchar](1000) COLLATE Vietnamese_CI_AS NULL,
	[So_lan_su_dung] [int] NULL,
	[So_lan_bao_tri] [int] NULL,
	[Ma_tan_suat] [int] NULL,
	[Tan_suat_su_dung] [float] NULL,
	[Ngay_cap_nhat_cuoi] [datetime] NULL,
	[User1] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User2] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User3] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User4] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User5] [varchar](40) COLLATE Vietnamese_CI_AS NULL
)

GO
-- Tao table PhieuMuonThietBi
CREATE TABLE [dbo].[PhieuMuonThietBi](
	[ID] [int] IDENTITY(0,1) NOT NULL PRIMARY KEY,
	[Nguoi_muon] [int] NULL,
	[Ngay_muon] [datetime] NULL,
	[Ghi_chu] [nvarchar](1000) COLLATE Vietnamese_CI_AS NULL,
	[Ngay_cap_nhat_cuoi] [datetime] NULL,
	[User1] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User2] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User3] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User4] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User5] [varchar](40) COLLATE Vietnamese_CI_AS NULL
)

GO
-- Tao table ChiTietPhieuMuon
CREATE TABLE [dbo].[ChiTietPhieuMuon](
	[ID] [int] IDENTITY(0,1) NOT NULL PRIMARY KEY,
	[Ma_phieu_muon] [int] NULL,
	[Ma_thiet_bi] [int] NULL,
	[Tinh_trang] [int] NULL,
	[Ghi_chu] [nvarchar](40) COLLATE Vietnamese_CI_AS NULL,
	[Thoi_gian_muon] [datetime] NULL,
	[Thoi_gian_tra] [datetime] NULL,
	[Phan_loai] [varchar](1) COLLATE Vietnamese_CI_AS NULL,
	[Ngay_cap_nhat_cuoi] [datetime] NULL,
	[User1] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User2] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User3] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User4] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User5] [varchar](40) COLLATE Vietnamese_CI_AS NULL
)

GO
-- Tao table TrinhTuThayDoiThietBi
CREATE TABLE [dbo].[TrinhTuThayDoiThietBi](
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Ma_thiet_bi] [int] NULL,
	[Ma_phong] [int] NULL,
	[Ma_bo_phan] [int] NULL,
	[Kiem_tra_ton_tai] [varchar](1) COLLATE Vietnamese_CI_AS NULL,
	[Ngay_cap_nhat_cuoi] [datetime] NULL,
	[User1] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User2] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User3] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User4] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User5] [varchar](40) COLLATE Vietnamese_CI_AS NULL
)

GO
-- Tao table TrinhTuThayDoiLinhKien
CREATE TABLE [dbo].[TrinhTuThayDoiLinhKien](
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Ma_thiet_bi] [int] NULL,
	[Ma_linh_kien] [int] NULL,
	[Ma_phong] [int] NULL,
	[Ma_bo_phan] [int] NULL,
	[Kiem_tra_ton_tai] [varchar](1) COLLATE Vietnamese_CI_AS NULL,
	[Ngay_cap_nhat_cuoi] [datetime] NULL,
	[User1] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User2] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User3] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User4] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User5] [varchar](40) COLLATE Vietnamese_CI_AS NULL
)

GO
-- Tao table NhaCungCap
CREATE TABLE [dbo].[NhaCungCap](
	[ID] [int] IDENTITY(0,1) NOT NULL PRIMARY KEY,
	[Ten] [nvarchar](100) COLLATE Vietnamese_CI_AS NULL,
	[Dia_chi] [nvarchar](100) COLLATE Vietnamese_CI_AS NULL,
	[Dien_thoai] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[Email] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[Ma_tai_khoan] [int] NULL,
	[Ghi_chu] [nvarchar](40) COLLATE Vietnamese_CI_AS NULL,
	[Ngay_cap_nhat_cuoi] [datetime] NULL,
	[User1] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User2] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User3] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User4] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User5] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
)

GO
-- Tao table DonViTinh
CREATE TABLE [dbo].[DonViTinh](
	[ID] [int] IDENTITY(0,1) NOT NULL PRIMARY KEY,
	[Ten] [nvarchar](40) COLLATE Vietnamese_CI_AS NULL,
	[Ghi_chu] [nvarchar](40) COLLATE Vietnamese_CI_AS NULL,
	[Ngay_cap_nhat_cuoi] [datetime] NULL,
	[User1] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User2] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User3] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User4] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User5] [varchar](40) COLLATE Vietnamese_CI_AS NULL
)

GO
-- Tao table LoaiBaoTri
CREATE TABLE [dbo].[LoaiBaoTri](
	[ID] [int] IDENTITY(0,1) NOT NULL PRIMARY KEY,
	[Ten] [nvarchar](40) COLLATE Vietnamese_CI_AS NULL,
	[Ghi_chu] [nvarchar](100) COLLATE Vietnamese_CI_AS NULL,
	[Ngay_cap_nhat_cuoi] [datetime] NULL,
	[User1] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User2] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User3] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User4] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User5] [varchar](40) COLLATE Vietnamese_CI_AS NULL
)

GO
-- Tao table LoaiLinhKien
CREATE TABLE [dbo].[LoaiLinhKien](
	[ID] [int] IDENTITY(0,1) NOT NULL PRIMARY KEY,
	[Ten_loai] [nvarchar](200) COLLATE Vietnamese_CI_AS NULL,
	[Ghi_chu] [nvarchar](40) COLLATE Vietnamese_CI_AS NULL,
	[Ngay_cap_nhat_cuoi] [datetime] NULL,
	[User1] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User2] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User3] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User4] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User5] [varchar](40) COLLATE Vietnamese_CI_AS NULL
)

GO
-- Tao table LoaiThietBi
CREATE TABLE [dbo].[LoaiThietBi](
	[ID] [int] IDENTITY(0,1) NOT NULL PRIMARY KEY,
	[Ten_loai] [nvarchar](200) COLLATE Vietnamese_CI_AS NULL,
	[Ghi_chu] [nvarchar](40) COLLATE Vietnamese_CI_AS NULL,
	[Ngay_cap_nhat_cuoi] [datetime] NULL,
	[User1] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User2] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User3] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User4] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User5] [varchar](40) COLLATE Vietnamese_CI_AS NULL
)

GO
-- Tao table PhieuBaoTriThietBi
CREATE TABLE [dbo].[PhieuBaoTriThietBi](
	[ID] [int] IDENTITY(0,1) NOT NULL PRIMARY KEY,
	[Ma_thiet_bi] [int] NULL,
	[Nguoi_de_xuat] [int] NULL,
	[Ngay_bao_tri] [datetime] NULL,
	[Tinh_trang] [int] NULL,
	[Ghi_chu] [nvarchar](40) COLLATE Vietnamese_CI_AS NULL,
	[Ngay_cap_nhat_cuoi] [datetime] NULL,
	[Ma_loai_bao_tri] [int] NULL,
	[User1] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User2] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User3] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User4] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User5] [varchar](40) COLLATE Vietnamese_CI_AS NULL
)

GO
-- Tao table TanSuat
CREATE TABLE [dbo].[TanSuat](
	[ID] [int] IDENTITY(0,1) NOT NULL PRIMARY KEY,
	[Ten] [nvarchar](40) COLLATE Vietnamese_CI_AS NULL,
	[Ghi_chu] [nvarchar](40) COLLATE Vietnamese_CI_AS NULL,
	[Ngay_cap_nhat_cuoi] [datetime] NULL,
	[User1] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User2] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User3] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User4] [varchar](40) COLLATE Vietnamese_CI_AS NULL,
	[User5] [varchar](40) COLLATE Vietnamese_CI_AS NULL
)