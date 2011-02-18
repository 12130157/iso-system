if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertGiaoAnThucHanh]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertGiaoAnThucHanh]
GO
CREATE PROCEDURE sp_ISO_InsertGiaoAnThucHanh
	@ID	int output,
	@MA_KHGD int,
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
	@Ngay_tao datetime,
	@Ten_Chuong nvarchar(2000),
	@Ma_Giao_Vien int

AS
BEGIN
	INSERT INTO GIAOAN(
		MA_KHGD,
		So_giao_an,
		Ngay_thuc_hien,
		Muc_tieu,
		Do_dung_PT_DH,
		Hinh_thuc_TC_DH,
		On_dinh_LH,
		Thoi_gian_on_dinh,
		Thoi_gian_TH_BH,
		Dan_nhap,
		HD_dan_nhap_GV,
		HD_dan_nhap_HS,
		Thoi_gian_dan_nhap,

		Huong_dan_ban_dau,
		HD_HDBD_GV,
		HD_HDBD_HS,
		Thoi_gian_HDBD,

		Huong_dan_thuong_xuyen,
		HD_HDTX_GV,
		HD_HDTX_HS,
		Thoi_gian_HDTX,

		Huong_dan_ket_thuc,
		HD_HDKT_GV,
		HD_HDKT_HS,
		Thoi_gian_HDKT,
		
		Huong_dan_ren_luyen,
		HD_HDRL_GV,
		Thoi_gian_HDRL,
		Rut_kinh_nghiem,
		Ngay_tao,
		Tinh_trang,
		Ten_Chuong,
		Ma_Giao_Vien
	)
	VALUES 
	(	
		@MA_KHGD,
		@So_giao_an,
		@Ngay_thuc_hien,
		@Muc_tieu,
		@Do_dung_PT_DH,
		@Hinh_thuc_TC_DH,
		@On_dinh_LH,
		@Thoi_gian_on_dinh,
		@Thoi_gian_TH_BH,
		@Dan_nhap,
		@HD_dan_nhap_GV,
		@HD_dan_nhap_HS,
		@Thoi_gian_dan_nhap,

		@Huong_dan_ban_dau,
		@HD_HDBD_GV,
		@HD_HDBD_HS,
		@Thoi_gian_HDBD,

		@Huong_dan_thuong_xuyen,
		@HD_HDTX_GV,
		@HD_HDTX_HS,
		@Thoi_gian_HDTX,

		@Huong_dan_ket_thuc,
		@HD_HDKT_GV,
		@HD_HDKT_HS,
		@Thoi_gian_HDKT,
		
		@Huong_dan_ren_luyen,
		@HD_HDRL_GV,
		@Thoi_gian_HDRL,

		@Rut_kinh_nghiem,
		@Ngay_tao,
		0,
		@Ten_Chuong,
		@Ma_Giao_Vien

	)
	
	SELECT @ID=MAX(ID) FROM GIAOAN 
END
