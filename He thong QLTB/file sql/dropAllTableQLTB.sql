/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases v4.1.3                     */
/* Target DBMS:           MS SQL Server 2005                              */
/* Project file:          database.dez                                    */
/* Project name:                                                          */
/* Author:                                                                */
/* Script type:           Database drop script                            */
/* Created on:            2012-01-29 19:46                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Drop foreign key constraints                                           */
/* ---------------------------------------------------------------------- */

ALTER TABLE [ThietBi] DROP CONSTRAINT [NhaCungCap_ThietBi]
GO

ALTER TABLE [ThietBi] DROP CONSTRAINT [LoaiThietBi_ThietBi]
GO

ALTER TABLE [ChiTietDanhMucThietBi] DROP CONSTRAINT [ThietBi_ChiTietDanhMucThietBi]
GO

ALTER TABLE [ChiTietDanhMucThietBi] DROP CONSTRAINT [DanhMucThietBi_ChiTietDanhMucThietBi]
GO

ALTER TABLE [LyLichThietBi] DROP CONSTRAINT [ThietBi_LyLichThietBi]
GO

ALTER TABLE [ChiTietKHBT] DROP CONSTRAINT [ThietBi_ChiTietKHBT]
GO

ALTER TABLE [ChiTietKHBT] DROP CONSTRAINT [KeHoachBaoTri_ChiTietKHBT]
GO

ALTER TABLE [LichSuThietBi] DROP CONSTRAINT [ThietBi_LichSuThietBi]
GO

ALTER TABLE [LichSuThietBi] DROP CONSTRAINT [HanhDong_LichSuThietBi]
GO

ALTER TABLE [PhieuBaoHongThietBi] DROP CONSTRAINT [ThietBi_PhieuBaoHongThietBi]
GO

ALTER TABLE [ChiTietPhieuGiaoNhanThietBi] DROP CONSTRAINT [SoGiaoNhanThietBi_ChiTietPhieuGiaoNhanThietBi]
GO

ALTER TABLE [ChiTietMuonThietBi] DROP CONSTRAINT [ChiTietPhieuGiaoNhanThietBi_ChiTietMuonThietBi]
GO

ALTER TABLE [ChiTietMuonThietBi] DROP CONSTRAINT [ThietBi_ChiTietMuonThietBi]
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
/* Drop table "DanhMucThietBi"                                            */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [DanhMucThietBi] DROP CONSTRAINT [PK_DanhMucThietBi]
GO

/* Drop table */

DROP TABLE [DanhMucThietBi]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "ChiTietDanhMucThietBi"                                     */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ChiTietDanhMucThietBi] DROP CONSTRAINT [PK_ChiTietDanhMucThietBi]
GO

/* Drop table */

DROP TABLE [ChiTietDanhMucThietBi]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "LyLichThietBi"                                             */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [LyLichThietBi] DROP CONSTRAINT [PK_LyLichThietBi]
GO

/* Drop table */

DROP TABLE [LyLichThietBi]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "KeHoachBaoTri"                                             */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [KeHoachBaoTri] DROP CONSTRAINT [PK_KeHoachBaoTri]
GO

/* Drop table */

DROP TABLE [KeHoachBaoTri]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "ChiTietKHBT"                                               */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ChiTietKHBT] DROP CONSTRAINT [PK_ChiTietKHBT]
GO

/* Drop table */

DROP TABLE [ChiTietKHBT]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "LichSuThietBi"                                             */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [LichSuThietBi] DROP CONSTRAINT [PK_LichSuThietBi]
GO

/* Drop table */

DROP TABLE [LichSuThietBi]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "PhieuBaoHongThietBi"                                       */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [PhieuBaoHongThietBi] DROP CONSTRAINT [PK_PhieuBaoHongThietBi]
GO

/* Drop table */

DROP TABLE [PhieuBaoHongThietBi]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "SoGiaoNhanThietBi"                                         */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [SoGiaoNhanThietBi] DROP CONSTRAINT [PK_SoGiaoNhanThietBi]
GO

/* Drop table */

DROP TABLE [SoGiaoNhanThietBi]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "ChiTietPhieuGiaoNhanThietBi"                               */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ChiTietPhieuGiaoNhanThietBi] DROP CONSTRAINT [PK_ChiTietPhieuGiaoNhanThietBi]
GO

/* Drop table */

DROP TABLE [ChiTietPhieuGiaoNhanThietBi]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "ChiTietMuonThietBi"                                        */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ChiTietMuonThietBi] DROP CONSTRAINT [PK_ChiTietMuonThietBi]
GO

/* Drop table */

DROP TABLE [ChiTietMuonThietBi]
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
/* Drop table "HanhDong"                                                  */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [HanhDong] DROP CONSTRAINT [PK_HanhDong]
GO

/* Drop table */

DROP TABLE [HanhDong]
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
/* Drop table "ChiTietMuonThietBi_tmp"                                    */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ChiTietMuonThietBi_tmp] DROP CONSTRAINT [PK_ChiTietMuonThietBi_tmp]
GO

/* Drop table */

DROP TABLE [ChiTietMuonThietBi_tmp]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "TinhTrang"                                                 */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [TinhTrang] DROP CONSTRAINT [PK_TinhTrang]
GO

/* Drop table */

DROP TABLE [TinhTrang]
GO

/* ---------------------------------------------------------------------- */
/* Drop table "HienTrang"                                                 */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [HienTrang] DROP CONSTRAINT [PK_HienTrang]
GO

/* Drop table */

DROP TABLE [HienTrang]
GO
