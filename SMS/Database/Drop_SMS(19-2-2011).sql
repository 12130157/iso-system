/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases v4.1.3                     */
/* Target DBMS:           MS SQL Server 2005                              */
/* Project file:          database.dez                                    */
/* Project name:                                                          */
/* Author:                                                                */
/* Script type:           Database drop script                            */
/* Created on:            2011-02-19 13:55                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Drop foreign key constraints                                           */
/* ---------------------------------------------------------------------- */

ALTER TABLE [ThanhVien] DROP CONSTRAINT [VaiTro_ThanhVien]
GO

ALTER TABLE [ThanhVien] DROP CONSTRAINT [ChiTietThanhVien_ThanhVien]
GO

ALTER TABLE [ChiTietThanhVien] DROP CONSTRAINT [DiaChi_ChiTietThanhVien]
GO

ALTER TABLE [ChiTietThanhVien] DROP CONSTRAINT [TaiKhoan_ChiTietThanhVien]
GO

ALTER TABLE [ChiTietThanhVien] DROP CONSTRAINT [BangCap_ChiTietThanhVien]
GO

ALTER TABLE [ChiTietKHDT] DROP CONSTRAINT [KeHoachDaoTao_ChiTietKHDT]
GO

ALTER TABLE [DeCuongMonHoc] DROP CONSTRAINT [MonHoc_DeCuongMonHoc]
GO

ALTER TABLE [NoiDungDCMH] DROP CONSTRAINT [DeCuongMonHoc_NoiDungDCMH]
GO

ALTER TABLE [ChiTietDCMH] DROP CONSTRAINT [NoiDungDCMH_ChiTietDCMH]
GO

ALTER TABLE [ChiTietMonHocCTDT] DROP CONSTRAINT [ChuongTrinhDaoTao_ChiTietMonHocCTDT]
GO

ALTER TABLE [ChiTietMonHocCTDT] DROP CONSTRAINT [MonHoc_ChiTietMonHocCTDT]
GO

ALTER TABLE [MonHoc] DROP CONSTRAINT [HocPhan_MonHoc]
GO

ALTER TABLE [MonHoc] DROP CONSTRAINT [ChuyenNganh_MonHoc]
GO

ALTER TABLE [ChuyenNganh] DROP CONSTRAINT [Khoa_TrungTam_ChuyenNganh]
GO

ALTER TABLE [ChiTietKHXDCT] DROP CONSTRAINT [KeHoachXayDungCT_ChiTietKHXDCT]
GO

ALTER TABLE [KeHoachGiangDay] DROP CONSTRAINT [NamHoc_KeHoachGiangDay]
GO

ALTER TABLE [KeHoachGiangDay] DROP CONSTRAINT [LopHoc_KeHoachGiangDay]
GO

ALTER TABLE [KeHoachGiangDay] DROP CONSTRAINT [MonHoc_KeHoachGiangDay]
GO

ALTER TABLE [GiaoAn] DROP CONSTRAINT [KeHoachGiangDay_GiaoAnLyThuyet]
GO

ALTER TABLE [LopHoc] DROP CONSTRAINT [ChuyenNganh_LopHoc]
GO

ALTER TABLE [ThoiKhoaBieu] DROP CONSTRAINT [LopHoc_ThoiKhoaBieu]
GO

ALTER TABLE [ChiTietTKB] DROP CONSTRAINT [ThoiKhoaBieu_ChiTietTKB]
GO

ALTER TABLE [ChiTietTKB] DROP CONSTRAINT [PhongBan_ChiTietTKB]
GO

ALTER TABLE [DiemHocSinh] DROP CONSTRAINT [ThoiKhoaBieu_DiemHocSinh]
GO

ALTER TABLE [FeedbackGiaoVien] DROP CONSTRAINT [ThoiKhoaBieu_FeedbackGiaoVien]
GO

ALTER TABLE [ChiTietFeedback] DROP CONSTRAINT [FeedbackGiaoVien_ChiTietFeedback]
GO

ALTER TABLE [sys_Menu] DROP CONSTRAINT [sys_App_sys_Menu]
GO

ALTER TABLE [sys_User_Menu] DROP CONSTRAINT [sys_Menu_sys_User_Menu]
GO

ALTER TABLE [sys_Role_Menu] DROP CONSTRAINT [sys_Menu_sys_Role_Menu]
GO

ALTER TABLE [sys_User_App] DROP CONSTRAINT [sys_App_sys_User_App]
GO

ALTER TABLE [sys_Role_App] DROP CONSTRAINT [sys_App_sys_Role_App]
GO

ALTER TABLE [QuyetDinhMoLop] DROP CONSTRAINT [KeHoachDaoTao_QuyetDinhMoLop]
GO

ALTER TABLE [MoChuyenNganh] DROP CONSTRAINT [ChuyenNganh_MoChuyenNganh]
GO

ALTER TABLE [MoChuyenNganh] DROP CONSTRAINT [QuyetDinhMoLop_MoChuyenNganh]
GO

ALTER TABLE [ThietBi] DROP CONSTRAINT [NhaCungCap_ThietBi]
GO

ALTER TABLE [ThietBi] DROP CONSTRAINT [DonViTinh_ThietBi]
GO

ALTER TABLE [ThietBi] DROP CONSTRAINT [TanSuat_ThietBi]
GO

ALTER TABLE [ThietBi] DROP CONSTRAINT [TinhTrangThietBi_ThietBi]
GO

ALTER TABLE [ThietBi] DROP CONSTRAINT [LoaiThietBi_ThietBi]
GO

ALTER TABLE [PhieuBaoTriThietBi] DROP CONSTRAINT [LoaiBaoTri_PhieuBaoTriThietBi]
GO

ALTER TABLE [PhieuBaoTriThietBi] DROP CONSTRAINT [ThietBi_PhieuBaoTriThietBi]
GO

ALTER TABLE [ChiTietPhieuMuon] DROP CONSTRAINT [PhieuMuonThietBi_ChiTietPhieuMuon]
GO

ALTER TABLE [ThanhVienDiemDanh] DROP CONSTRAINT [DiemDanh_ThanhVienDiemDanh]
GO

ALTER TABLE [ChiTietDiemDanh] DROP CONSTRAINT [ThanhVienDiemDanh_ChiTietDiemDanh]
GO

ALTER TABLE [ChiTietThietBi] DROP CONSTRAINT [ThietBi_ChiTietThietBi]
GO

ALTER TABLE [ChiTietThietBi] DROP CONSTRAINT [TinhTrangThietBi_ChiTietThietBi]
GO

ALTER TABLE [ChiTietDiem] DROP CONSTRAINT [DangKyMonHoc_ChiTietDiem]
GO

ALTER TABLE [ChiTietDiem] DROP CONSTRAINT [BaiKiemTra_ChiTietDiem]
GO

ALTER TABLE [CongViecChuanBi] DROP CONSTRAINT [LoaiCongViecChuanBi_CongViecChuanBi]
GO

ALTER TABLE [HopThuDen] DROP CONSTRAINT [LoaiTinNhan_HopThuDen]
GO

ALTER TABLE [HopThuDen] DROP CONSTRAINT [CuPhap_HopThuDen]
GO

ALTER TABLE [HopThuDen] DROP CONSTRAINT [LoaiHopThu_HopThuDen]
GO

ALTER TABLE [HopThuDen] DROP CONSTRAINT [HopThuDi_HopThuDen]
GO

ALTER TABLE [TaiKhoanSMS] DROP CONSTRAINT [LoaiTaiKhoanSMS_TaiKhoanSMS]
GO

ALTER TABLE [ChiTietTaiKhoanSMS] DROP CONSTRAINT [TaiKhoanSMS_ChiTietTaiKhoanSMS]
GO

ALTER TABLE [LichTinNhan] DROP CONSTRAINT [LoaiTaiKhoanSMS_LichTinNhan]
GO

ALTER TABLE [LichTinNhan] DROP CONSTRAINT [CuPhap_LichTinNhan]
GO

ALTER TABLE [ChiTietTinNhanTuDong] DROP CONSTRAINT [TaiKhoanSMS_ChiTietTinNhanTuDong]
GO

ALTER TABLE [ChiTietTinNhanTuDong] DROP CONSTRAINT [LichTinNhan_ChiTietTinNhanTuDong]
GO

ALTER TABLE [CongTacThang] DROP CONSTRAINT [KeHoachThang_CongTacThang]
GO

ALTER TABLE [BoPhanThucHienCongTacThang] DROP CONSTRAINT [CongTacThang_BoPhanThucHienCongTacThang]
GO

ALTER TABLE [TinhTrangCongTac] DROP CONSTRAINT [CongTacThang_TinhTrangCongTac]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "ThanhVien"                                                 */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ThanhVien] DROP CONSTRAINT [PK_ThanhVien]
GO

/* Drop table */

DROP TABLE [ThanhVien]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "VaiTro"                                                    */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [VaiTro] DROP CONSTRAINT [PK_VaiTro]
GO

/* Drop table */

DROP TABLE [VaiTro]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "ChiTietThanhVien"                                          */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ChiTietThanhVien] DROP CONSTRAINT [PK_ChiTietThanhVien]
GO

/* Drop table */

DROP TABLE [ChiTietThanhVien]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "DiaChi"                                                    */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [DiaChi] DROP CONSTRAINT [PK_DiaChi]
GO

/* Drop table */

DROP TABLE [DiaChi]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "TaiKhoan"                                                  */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [TaiKhoan] DROP CONSTRAINT [PK_TaiKhoan]
GO

/* Drop table */

DROP TABLE [TaiKhoan]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "KeHoachDaoTao"                                             */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [KeHoachDaoTao] DROP CONSTRAINT [PK_KeHoachDaoTao]
GO

/* Drop table */

DROP TABLE [KeHoachDaoTao]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "ChiTietKHDT"                                               */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ChiTietKHDT] DROP CONSTRAINT [PK_ChiTietKHDT]
GO

/* Drop table */

DROP TABLE [ChiTietKHDT]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "DeCuongMonHoc"                                             */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [DeCuongMonHoc] DROP CONSTRAINT [PK_DeCuongMonHoc]
GO

/* Drop table */

DROP TABLE [DeCuongMonHoc]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "NoiDungDCMH"                                               */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [NoiDungDCMH] DROP CONSTRAINT [PK_NoiDungDCMH]
GO

/* Drop table */

DROP TABLE [NoiDungDCMH]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "ChiTietDCMH"                                               */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ChiTietDCMH] DROP CONSTRAINT [PK_ChiTietDCMH]
GO

/* Drop table */

DROP TABLE [ChiTietDCMH]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "DeCuongKeHoach_TMP"                                        */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [DeCuongKeHoach_TMP] DROP CONSTRAINT [PK_DeCuongKeHoach_TMP]
GO

/* Drop table */

DROP TABLE [DeCuongKeHoach_TMP]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "ChuongTrinhDaoTao"                                         */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ChuongTrinhDaoTao] DROP CONSTRAINT [PK_ChuongTrinhDaoTao]
GO

/* Drop table */

DROP TABLE [ChuongTrinhDaoTao]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "ChiTietMonHocCTDT"                                         */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ChiTietMonHocCTDT] DROP CONSTRAINT [PK_ChiTietMonHocCTDT]
GO

/* Drop table */

DROP TABLE [ChiTietMonHocCTDT]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "MonHoc"                                                    */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [MonHoc] DROP CONSTRAINT [PK_MonHoc]
GO

/* Drop table */

DROP TABLE [MonHoc]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "HocPhan"                                                   */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [HocPhan] DROP CONSTRAINT [PK_HocPhan]
GO

/* Drop table */

DROP TABLE [HocPhan]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "ChuyenNganh"                                               */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ChuyenNganh] DROP CONSTRAINT [PK_ChuyenNganh]
GO

/* Drop table */

DROP TABLE [ChuyenNganh]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "Khoa_TrungTam"                                             */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [Khoa_TrungTam] DROP CONSTRAINT [PK_Khoa_TrungTam]
GO

/* Drop table */

DROP TABLE [Khoa_TrungTam]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "KeHoachXayDungCT"                                          */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [KeHoachXayDungCT] DROP CONSTRAINT [PK_KeHoachXayDungCT]
GO

/* Drop table */

DROP TABLE [KeHoachXayDungCT]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "ChiTietKHXDCT"                                             */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ChiTietKHXDCT] DROP CONSTRAINT [PK_ChiTietKHXDCT]
GO

/* Drop table */

DROP TABLE [ChiTietKHXDCT]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "KeHoachGiangDay"                                           */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [KeHoachGiangDay] DROP CONSTRAINT [PK_KeHoachGiangDay]
GO

/* Drop table */

DROP TABLE [KeHoachGiangDay]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "NamHoc"                                                    */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [NamHoc] DROP CONSTRAINT [PK_NamHoc]
GO

/* Drop table */

DROP TABLE [NamHoc]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "ChiTietKHGD"                                               */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ChiTietKHGD] DROP CONSTRAINT [PK_ChiTietKHGD]
GO

/* Drop table */

DROP TABLE [ChiTietKHGD]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "GiaoAn"                                                    */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [GiaoAn] DROP CONSTRAINT [PK_GiaoAn]
GO

/* Drop table */

DROP TABLE [GiaoAn]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "DoDungDayHoc"                                              */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [DoDungDayHoc] DROP CONSTRAINT [PK_DoDungDayHoc]
GO

/* Drop table */

DROP TABLE [DoDungDayHoc]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "HoatDongGiaoVien"                                          */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [HoatDongGiaoVien] DROP CONSTRAINT [PK_HoatDongGiaoVien]
GO

/* Drop table */

DROP TABLE [HoatDongGiaoVien]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "HoatDongHocSinh"                                           */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [HoatDongHocSinh] DROP CONSTRAINT [PK_HoatDongHocSinh]
GO

/* Drop table */

DROP TABLE [HoatDongHocSinh]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "LopHoc"                                                    */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [LopHoc] DROP CONSTRAINT [PK_LopHoc]
GO

/* Drop table */

DROP TABLE [LopHoc]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "ThoiKhoaBieu"                                              */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ThoiKhoaBieu] DROP CONSTRAINT [PK_ThoiKhoaBieu]
GO

/* Drop table */

DROP TABLE [ThoiKhoaBieu]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "ChiTietTKB"                                                */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ChiTietTKB] DROP CONSTRAINT [PK_ChiTietTKB]
GO

/* Drop table */

DROP TABLE [ChiTietTKB]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "DiemHocSinh"                                               */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [DiemHocSinh] DROP CONSTRAINT [PK_DiemHocSinh]
GO

/* Drop table */

DROP TABLE [DiemHocSinh]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "FeedbackGiaoVien"                                          */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [FeedbackGiaoVien] DROP CONSTRAINT [PK_FeedbackGiaoVien]
GO

/* Drop table */

DROP TABLE [FeedbackGiaoVien]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "ChiTietFeedback"                                           */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ChiTietFeedback] DROP CONSTRAINT [PK_ChiTietFeedback]
GO

/* Drop table */

DROP TABLE [ChiTietFeedback]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "BangCap"                                                   */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [BangCap] DROP CONSTRAINT [PK_BangCap]
GO

/* Drop table */

DROP TABLE [BangCap]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "PhongBan"                                                  */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [PhongBan] DROP CONSTRAINT [PK_PhongBan]
GO

/* Drop table */

DROP TABLE [PhongBan]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "sys_Menu"                                                  */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [sys_Menu] DROP CONSTRAINT [PK_sys_Menu]
GO

/* Drop table */

DROP TABLE [sys_Menu]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "sys_User_Menu"                                             */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [sys_User_Menu] DROP CONSTRAINT [PK_sys_User_Menu]
GO

/* Drop table */

DROP TABLE [sys_User_Menu]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "sys_Role_Menu"                                             */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [sys_Role_Menu] DROP CONSTRAINT [PK_sys_Role_Menu]
GO

/* Drop table */

DROP TABLE [sys_Role_Menu]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "sys_App"                                                   */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [sys_App] DROP CONSTRAINT [PK_sys_App]
GO

/* Drop table */

DROP TABLE [sys_App]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "sys_User_App"                                              */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [sys_User_App] DROP CONSTRAINT [PK_sys_User_App]
GO

/* Drop table */

DROP TABLE [sys_User_App]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "sys_Role_App"                                              */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [sys_Role_App] DROP CONSTRAINT [PK_sys_Role_App]
GO

/* Drop table */

DROP TABLE [sys_Role_App]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "QuyetDinhMoLop"                                            */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [QuyetDinhMoLop] DROP CONSTRAINT [PK_QuyetDinhMoLop]
GO

/* Drop table */

DROP TABLE [QuyetDinhMoLop]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "PhieuDeNghiMoLop"                                          */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [PhieuDeNghiMoLop] DROP CONSTRAINT [PK_PhieuDeNghiMoLop]
GO

/* Drop table */

DROP TABLE [PhieuDeNghiMoLop]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "MoChuyenNganh"                                             */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [MoChuyenNganh] DROP CONSTRAINT [PK_MoChuyenNganh]
GO

/* Drop table */

DROP TABLE [MoChuyenNganh]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "sys_Params"                                                */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [sys_Params] DROP CONSTRAINT [PK_sys_Params]
GO

/* Drop table */

DROP TABLE [sys_Params]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "HeDaoTao"                                                  */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [HeDaoTao] DROP CONSTRAINT [PK_HeDaoTao]
GO

/* Drop table */

DROP TABLE [HeDaoTao]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "TuanLe"                                                    */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [TuanLe] DROP CONSTRAINT [PK_TuanLe]
GO

/* Drop table */

DROP TABLE [TuanLe]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "NoiDungDCMH_TMP"                                           */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [NoiDungDCMH_TMP] DROP CONSTRAINT [PK_NoiDungDCMH_TMP]
GO

/* Drop table */

DROP TABLE [NoiDungDCMH_TMP]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "BangCapDaoTao"                                             */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [BangCapDaoTao] DROP CONSTRAINT [PK_BangCapDaoTao]
GO

/* Drop table */

DROP TABLE [BangCapDaoTao]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "SuDung"                                                    */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [SuDung] DROP CONSTRAINT [PK_SuDung]
GO

/* Drop table */

DROP TABLE [SuDung]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "MonHocTKB"                                                 */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [MonHocTKB] DROP CONSTRAINT [PK_MonHocTKB]
GO

/* Drop table */

DROP TABLE [MonHocTKB]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "NoiDungChiTietKHDT"                                        */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [NoiDungChiTietKHDT] DROP CONSTRAINT [PK_NoiDungChiTietKHDT]
GO

/* Drop table */

DROP TABLE [NoiDungChiTietKHDT]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "BoPhanThucHienKHDT"                                        */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [BoPhanThucHienKHDT] DROP CONSTRAINT [PK_BoPhanThucHienKHDT]
GO

/* Drop table */

DROP TABLE [BoPhanThucHienKHDT]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "CongTac"                                                   */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [CongTac] DROP CONSTRAINT [PK_CongTac]
GO

/* Drop table */

DROP TABLE [CongTac]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "NguoiThucHien"                                             */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [NguoiThucHien] DROP CONSTRAINT [PK_NguoiThucHien]
GO

/* Drop table */

DROP TABLE [NguoiThucHien]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "PhanCongTacTuan"                                           */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [PhanCongTacTuan] DROP CONSTRAINT [PK_PhanCongTacTuan]
GO

/* Drop table */

DROP TABLE [PhanCongTacTuan]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "ThietBi"                                                   */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ThietBi] DROP CONSTRAINT [PK_ThietBi]
GO

/* Drop table */

DROP TABLE [ThietBi]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "NhaCungCap"                                                */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [NhaCungCap] DROP CONSTRAINT [PK_NhaCungCap]
GO

/* Drop table */

DROP TABLE [NhaCungCap]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "DonViTinh"                                                 */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [DonViTinh] DROP CONSTRAINT [PK_DonViTinh]
GO

/* Drop table */

DROP TABLE [DonViTinh]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "TanSuat"                                                   */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [TanSuat] DROP CONSTRAINT [PK_TanSuat]
GO

/* Drop table */

DROP TABLE [TanSuat]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "PhieuMuonThietBi"                                          */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [PhieuMuonThietBi] DROP CONSTRAINT [PK_PhieuMuonThietBi]
GO

/* Drop table */

DROP TABLE [PhieuMuonThietBi]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "TinhTrangThietBi"                                          */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [TinhTrangThietBi] DROP CONSTRAINT [PK_TinhTrangThietBi]
GO

/* Drop table */

DROP TABLE [TinhTrangThietBi]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "PhieuBaoTriThietBi"                                        */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [PhieuBaoTriThietBi] DROP CONSTRAINT [PK_PhieuBaoTriThietBi]
GO

/* Drop table */

DROP TABLE [PhieuBaoTriThietBi]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "LoaiBaoTri"                                                */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [LoaiBaoTri] DROP CONSTRAINT [PK_LoaiBaoTri]
GO

/* Drop table */

DROP TABLE [LoaiBaoTri]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "ChiTietPhieuMuon"                                          */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ChiTietPhieuMuon] DROP CONSTRAINT [PK_ChiTietPhieuMuon]
GO

/* Drop table */

DROP TABLE [ChiTietPhieuMuon]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "DiemDanh"                                                  */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [DiemDanh] DROP CONSTRAINT [PK_DiemDanh]
GO

/* Drop table */

DROP TABLE [DiemDanh]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "ThanhVienDiemDanh"                                         */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ThanhVienDiemDanh] DROP CONSTRAINT [PK_ThanhVienDiemDanh]
GO

/* Drop table */

DROP TABLE [ThanhVienDiemDanh]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "ChiTietDiemDanh"                                           */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ChiTietDiemDanh] DROP CONSTRAINT [PK_ChiTietDiemDanh]
GO

/* Drop table */

DROP TABLE [ChiTietDiemDanh]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "LoaiThietBi"                                               */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [LoaiThietBi] DROP CONSTRAINT [PK_LoaiThietBi]
GO

/* Drop table */

DROP TABLE [LoaiThietBi]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "ChiTietThietBi"                                            */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ChiTietThietBi] DROP CONSTRAINT [PK_ChiTietThietBi]
GO

/* Drop table */

DROP TABLE [ChiTietThietBi]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "BaiKiemTra"                                                */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [BaiKiemTra] DROP CONSTRAINT [PK_BaiKiemTra]
GO

/* Drop table */

DROP TABLE [BaiKiemTra]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "DangKyMonHoc"                                              */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [DangKyMonHoc] DROP CONSTRAINT [PK_DangKyMonHoc]
GO

/* Drop table */

DROP TABLE [DangKyMonHoc]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "ChiTietDiem"                                               */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ChiTietDiem] DROP CONSTRAINT [PK_ChiTietDiem]
GO

/* Drop table */

DROP TABLE [ChiTietDiem]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "CongViecChuanBi"                                           */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [CongViecChuanBi] DROP CONSTRAINT [PK_CongViecChuanBi]
GO

/* Drop table */

DROP TABLE [CongViecChuanBi]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "LoaiCongViecChuanBi"                                       */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [LoaiCongViecChuanBi] DROP CONSTRAINT [PK_LoaiCongViecChuanBi]
GO

/* Drop table */

DROP TABLE [LoaiCongViecChuanBi]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "HinhThuc"                                                  */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [HinhThuc] DROP CONSTRAINT [PK_HinhThuc]
GO

/* Drop table */

DROP TABLE [HinhThuc]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "HocKy"                                                     */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [HocKy] DROP CONSTRAINT [PK_HocKy]
GO

/* Drop table */

DROP TABLE [HocKy]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "TenBaiKiemTra"                                             */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [TenBaiKiemTra] DROP CONSTRAINT [PK_TenBaiKiemTra]
GO

/* Drop table */

DROP TABLE [TenBaiKiemTra]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "HopThuDen"                                                 */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [HopThuDen] DROP CONSTRAINT [PK_HopThuDen]
GO

/* Drop table */

DROP TABLE [HopThuDen]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "LoaiTinNhan"                                               */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [LoaiTinNhan] DROP CONSTRAINT [PK_LoaiTinNhan]
GO

/* Drop table */

DROP TABLE [LoaiTinNhan]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "CuPhap"                                                    */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [CuPhap] DROP CONSTRAINT [PK_CuPhap]
GO

/* Drop table */

DROP TABLE [CuPhap]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "LoaiHopThu"                                                */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [LoaiHopThu] DROP CONSTRAINT [PK_LoaiHopThu]
GO

/* Drop table */

DROP TABLE [LoaiHopThu]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "HopThuDi"                                                  */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [HopThuDi] DROP CONSTRAINT [PK_HopThuDi]
GO

/* Drop table */

DROP TABLE [HopThuDi]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "TaiKhoanSMS"                                               */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [TaiKhoanSMS] DROP CONSTRAINT [PK_TaiKhoanSMS]
GO

/* Drop table */

DROP TABLE [TaiKhoanSMS]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "LoaiTaiKhoanSMS"                                           */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [LoaiTaiKhoanSMS] DROP CONSTRAINT [PK_LoaiTaiKhoanSMS]
GO

/* Drop table */

DROP TABLE [LoaiTaiKhoanSMS]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "ChiTietTaiKhoanSMS"                                        */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ChiTietTaiKhoanSMS] DROP CONSTRAINT [PK_ChiTietTaiKhoanSMS]
GO

/* Drop table */

DROP TABLE [ChiTietTaiKhoanSMS]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "LichTinNhan"                                               */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [LichTinNhan] DROP CONSTRAINT [PK_LichTinNhan]
GO

/* Drop table */

DROP TABLE [LichTinNhan]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "ChiTietTinNhanTuDong"                                      */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ChiTietTinNhanTuDong] DROP CONSTRAINT [PK_ChiTietTinNhanTuDong]
GO

/* Drop table */

DROP TABLE [ChiTietTinNhanTuDong]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "KeHoachThang"                                              */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [KeHoachThang] DROP CONSTRAINT [PK_KeHoachThang]
GO

/* Drop table */

DROP TABLE [KeHoachThang]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "CongTacThang"                                              */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [CongTacThang] DROP CONSTRAINT [PK_CongTacThang]
GO

/* Drop table */

DROP TABLE [CongTacThang]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "BoPhanThucHienCongTacThang"                                */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [BoPhanThucHienCongTacThang] DROP CONSTRAINT [PK_BoPhanThucHienCongTacThang]
GO

/* Drop table */

DROP TABLE [BoPhanThucHienCongTacThang]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "TinhTrangCongTac"                                          */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [TinhTrangCongTac] DROP CONSTRAINT [PK_TinhTrangCongTac]
GO

/* Drop table */

DROP TABLE [TinhTrangCongTac]
GO
