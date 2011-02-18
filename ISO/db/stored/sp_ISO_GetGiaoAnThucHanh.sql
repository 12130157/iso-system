if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetGiaoAnThucHanh]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetGiaoAnThucHanh]
GO
CREATE PROCEDURE sp_ISO_GetGiaoAnThucHanh
	@maGiaoAn int
AS
BEGIN
	SELECT 
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
		Ma_nguoi_duyet,
		Ngay_duyet,
		Ngay_tao		
	FROM GIAOAN
	WHERE ID=@maGiaoAn	
END
