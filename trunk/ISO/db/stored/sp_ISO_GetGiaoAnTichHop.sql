if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetGiaoAnTichHop]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetGiaoAnTichHop]
GO
CREATE PROCEDURE sp_ISO_GetGiaoAnTichHop
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

		Gioi_thieu_chu_de,
		HD_GTCD_GV,
		HD_GTCD_HS,
		Thoi_gian_GTCD,

		Giai_quyet_van_de,
		HD_GQVD_GV,
		HD_GQVD_HS,
		Thoi_gian_GTVD,

		Huong_dan_ket_thuc,
		HD_HDKT_GV,
		HD_HDKT_HS,
		Thoi_gian_HDKT,
		

		Huong_dan_tu_hoc,
		HD_HDTH_GV,
		Thoi_gian_HDTH,

		Rut_kinh_nghiem,
		Ma_nguoi_duyet,
		Ngay_duyet,
		Ngay_tao		
	FROM GIAOAN
	WHERE ID=@maGiaoAn	
END
