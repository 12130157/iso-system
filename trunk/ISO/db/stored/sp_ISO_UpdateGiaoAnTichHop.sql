if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateGiaoAnTichHop]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateGiaoAnTichHop]
GO
CREATE PROCEDURE sp_ISO_UpdateGiaoAnTichHop
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

	@Gioi_thieu_chu_de nvarchar(2000),
	@HD_GTCD_GV nvarchar(2000),
	@HD_GTCD_HS nvarchar(2000),
	@Thoi_gian_GTCD int,

	@Giai_quyet_van_de nvarchar(2000),
	@HD_GQVD_GV nvarchar(2000),
	@HD_GQVD_HS nvarchar(2000),
	@Thoi_gian_GTVD int,

	@Ket_thuc_van_de nvarchar(2000),
	@HD_HDKT_GV nvarchar(2000),
	@HD_HDKT_HS nvarchar(2000),
	@Thoi_gian_HDKT int,

	@Huong_dan_tu_hoc nvarchar(2000),
	@HD_HDTH_GV nvarchar(2000),
	@Thoi_gian_HDTH int,	

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

		Gioi_thieu_chu_de=@Gioi_thieu_chu_de,
		HD_GTCD_GV=@HD_GTCD_GV,
		HD_GTCD_HS=@HD_GTCD_HS,
		Thoi_gian_GTCD=@Thoi_gian_GTCD,
		
		Giai_quyet_van_de=@Giai_quyet_van_de,
		HD_GQVD_GV=@HD_GQVD_GV,
		HD_GQVD_HS=@HD_GQVD_HS,
		Thoi_gian_GTVD=@Thoi_gian_GTVD,
		
		Huong_dan_ket_thuc=@Ket_thuc_van_de,
		HD_HDKT_GV=@HD_HDKT_GV,
		HD_HDKT_HS=@HD_HDKT_HS,
		Thoi_gian_HDKT=@Thoi_gian_HDKT,
		
		Huong_dan_tu_hoc=@Huong_dan_tu_hoc,
		HD_HDTH_GV=@HD_HDTH_GV,
		Thoi_gian_HDTH=@Thoi_gian_HDTH,
		Rut_kinh_nghiem=@Rut_kinh_nghiem,
		Ngay_cap_nhat_cuoi=@Ngay_cap_nhat_cuoi,
		Tinh_trang=0
	WHERE ID=@MaGiaoAn
END
