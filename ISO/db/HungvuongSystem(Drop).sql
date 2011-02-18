/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases v4.1.3                     */
/* Target DBMS:           MS SQL Server 2005                              */
/* Project file:          database.dez                                    */
/* Project name:                                                          */
/* Author:                                                                */
/* Script type:           Database drop script                            */
/* Created on:            2010-03-30 10:25                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Drop views                                                             */
/* ---------------------------------------------------------------------- */

DROP VIEW [`hungvuongsystem`.`view_tdtb`]
GO

DROP VIEW [`hungvuongsystem`.`view_tdtb_second`]
GO

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

ALTER TABLE [ChuongTrinhDaoTao] DROP CONSTRAINT [MoChuyenNganh_ChuongTrinhDaoTao]
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

ALTER TABLE [ChiTietKHGD] DROP CONSTRAINT [KeHoachGiangDay_ChiTietKHGD]
GO

ALTER TABLE [NoiDungChiTietKHGD] DROP CONSTRAINT [ChiTietKHGD_NoiDungChiTietKHGD]
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

ALTER TABLE [ChiTietDiem] DROP CONSTRAINT [DiemHocSinh_ChiTietDiem]
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
/* Drop table "NoiDungChiTietKHGD"                                        */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [NoiDungChiTietKHGD] DROP CONSTRAINT [PK_NoiDungChiTietKHGD]
GO

/* Drop table */

DROP TABLE [NoiDungChiTietKHGD]
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
/* Drop table "ChiTietDiem"                                               */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ChiTietDiem] DROP CONSTRAINT [PK_ChiTietDiem]
GO

/* Drop table */

DROP TABLE [ChiTietDiem]
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
