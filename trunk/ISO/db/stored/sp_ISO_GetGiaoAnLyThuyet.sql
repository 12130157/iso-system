if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetGiaoAnLyThuyet]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetGiaoAnLyThuyet]
GO
CREATE PROCEDURE sp_ISO_GetGiaoAnLyThuyet
	@maGiaoAn int
AS
BEGIN
	SELECT 
		MA_KHGD,
		So_giao_an,
		Ngay_thuc_hien,
		Muc_tieu,
		Do_dung_PT_DH,
		On_dinh_LH,
		Thoi_gian_on_dinh,
		Thoi_gian_TH_BH,
		Dan_nhap,
		HD_dan_nhap_GV,
		HD_dan_nhap_HS,
		Thoi_gian_dan_nhap,
		Noi_dung_bai_giang,
		HD_giang_bai_moi_GV,
		HD_giang_bai_moi_HS,
		Thoi_gian_bai_giang,
		Cung_co_kien_thuc,
		HD_cung_co_GV,
		HD_cung_co_HS,
		Thoi_gian_cung_co,
		Huong_dan_tu_hoc,
		HD_HDTH_GV,
		HD_HDTH_HS,
		Thoi_gian_HDTH,
		Tai_lieu_tham_khao,
		Ma_nguoi_duyet,
		Ngay_duyet,
		Ngay_tao
	FROM GIAOAN
	WHERE ID=@maGiaoAn	
END
