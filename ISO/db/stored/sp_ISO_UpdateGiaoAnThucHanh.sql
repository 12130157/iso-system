if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateGiaoAnThucHanh]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateGiaoAnThucHanh]
GO
CREATE PROCEDURE sp_ISO_UpdateGiaoAnThucHanh
	@MaGiaoAn int,
	@Ma_KHGD int,
	@So_giao_an int,
	@Ngay_thuc_hien datetime,
	@Muc_tieu nvarchar(2000),
	@Do_dung_PT_DH nvarchar(2000),
	@Hinh_thuc_TC_DH nvarchar(2000),
	@On_dinh_LH nvarchar(2000),
	@Thoi_gian_on_dinh int,
	@Thoi_gian_TH_BH int,
	@Dan_nhap nvarchar(2000),
	@HD_dan_nhap_GV nvarchar(2000),
	@HD_dan_nhap_HS nvarchar(2000),
	@Thoi_gian_dan_nhap int,
	@Huong_dan_ban_dau nvarchar(2000),
	@HD_HDBD_GV nvarchar(2000),
	@HD_HDBD_HS nvarchar(2000),
	@Thoi_gian_HDBD int,
	@Huong_dan_thuong_xuyen nvarchar(2000),
	@HD_HDTX_GV nvarchar(2000),
	@HD_HDTX_HS nvarchar(2000),
	@Thoi_gian_HDTX int,
	@Huong_dan_ket_thuc nvarchar(2000),
	@HD_HDKT_GV nvarchar(2000),
	@HD_HDKT_HS nvarchar(2000),
	@Thoi_gian_HDKT int,
	@Huong_dan_ren_luyen nvarchar(2000),
	@HD_HDRL_GV nvarchar(2000),
	@Thoi_gian_HDRL int,
	@Rut_kinh_nghiem nvarchar(2000),
	@Ngay_cap_nhat_cuoi datetime
AS
BEGIN
	UPDATE GIAOAN
		SET MA_KHGD=@MA_KHGD,
		So_giao_an=@So_giao_an,
		Ngay_thuc_hien=@Ngay_thuc_hien,
		Muc_tieu=@Muc_tieu,
		Do_dung_PT_DH=@Do_dung_PT_DH,
		Hinh_thuc_TC_DH=@Hinh_thuc_TC_DH,
		On_dinh_LH=@On_dinh_LH,
		Thoi_gian_on_dinh=@Thoi_gian_on_dinh,
		Thoi_gian_TH_BH=@Thoi_gian_TH_BH,
		Dan_nhap=@Dan_nhap,
		HD_dan_nhap_GV=@HD_dan_nhap_GV,
		HD_dan_nhap_HS=@HD_dan_nhap_HS,
		Thoi_gian_dan_nhap=@Thoi_gian_dan_nhap,
		Huong_dan_ban_dau=@Huong_dan_ban_dau,
		HD_HDBD_GV=@HD_HDBD_GV,
		HD_HDBD_HS=@HD_HDBD_HS,
		Thoi_gian_HDBD=@Thoi_gian_HDBD,
		Huong_dan_thuong_xuyen=@Huong_dan_thuong_xuyen,
		HD_HDTX_GV=@HD_HDTX_GV,
		HD_HDTX_HS=@HD_HDTX_HS,
		Thoi_gian_HDTX=@Thoi_gian_HDTX,
		Huong_dan_ket_thuc=@Huong_dan_ket_thuc,
		HD_HDKT_GV=@HD_HDKT_GV,
		HD_HDKT_HS=@HD_HDKT_HS,
		Thoi_gian_HDKT=@Thoi_gian_HDKT,
		Huong_dan_ren_luyen=@Huong_dan_ren_luyen,
		HD_HDRL_GV=@HD_HDRL_GV,
		Thoi_gian_HDRL=@Thoi_gian_HDRL,
		Rut_kinh_nghiem=@Rut_kinh_nghiem,
		Ngay_cap_nhat_cuoi=@Ngay_cap_nhat_cuoi,
		Tinh_trang=0
	WHERE ID=@MaGiaoAn

	UPDATE CHITIETKHGD SET Noi_dung_TH=@Huong_dan_ban_dau WHERE Ma_giao_an=@MaGiaoAn


END
