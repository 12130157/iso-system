
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_CopyGiaoAn]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_CopyGiaoAn]
GO
CREATE PROC [sp_ISO_CopyGiaoAn]
	@MaKHGDNew	varchar(10),
	@MaKHGDCopy	varchar(10)
AS
BEGIN
	DECLARE @CountCTKHGD int;
	DECLARE @CountGiaoAn int;


	SELECT * INTO #temp1 FROM ChiTietKHGD WHERE Ma_ke_hoach_giang_day=@MaKHGDCopy
	SELECT * INTO #temp2 FROM GiaoAn WHERE Ma_KHGD=@MaKHGDCopy

	SELECT @CountCTKHGD=Count(*) FROM #temp1
	SELECT @CountGiaoAn=Count(*) FROM #temp2

	UPDATE #temp1 SET Ma_ke_hoach_giang_day=@MaKHGDNew
	UPDATE #temp2 SET Ma_KHGD=@MaKHGDNew,Tinh_trang=0,Ngay_tao=GETDATE(),Ngay_cap_nhat_cuoi=NULL,NgayGui=NULL,Ma_nguoi_duyet=NULL
	
	--INSERT************************************************
	INSERT INTO ChiTietKHGD 
		SELECT 
		Ma_ke_hoach_giang_day,
		Ten_chuong,
		Co_hieu,
		Ngay_cap_nhat_cuoi,
		Tuan,
		Ngay_BD,
		Ngay_KT,
		Noi_dung_TH,
		Cong_viec_chuan_bi,
		Ma_giao_an,
		nhom,
		STT_Noi_Dung,
		Thu,
		Buoi,
		Ten_phong,
		Muc_tieu_bai_hoc,
		User1,
		User2,
		User3,
		User4,
		User5
		FROM #temp1 		 
	-------------------------------------------------------
	INSERT INTO GiaoAn 
		SELECT  
			Ma_KHGD,
			Thu_tu,
			Buoi_hoc,
			Ngay_thuc_hien,
			Muc_tieu,
			Thoi_gian_on_dinh,
			Cong_tac_chuan_bi,
			Ngay_tao,
			Ngay_cap_nhat_cuoi,
			Dan_nhap,
			Noi_dung_bai_giang,
			Cung_co_kien_thuc,
			Huong_dan_tu_hoc,
			Thoi_gian_dan_nhap,
			Thoi_gian_bai_giang,
			Thoi_gian_cung_co,
			Thoi_gian_HDTH,
			Tai_lieu_tham_khao,
			Ma_nguoi_duyet,
			Ngay_duyet,
			Tinh_trang,
			HD_dan_nhap_GV,
			HD_dan_nhap_HS,
			HD_giang_bai_moi_GV,
			HD_giang_bai_moi_HS,
			HD_cung_co_GV,
			HD_cung_co_HS,
			HD_HDTH_GV,
			HD_HDTH_HS,
			Loai_giao_an,
			Huong_dan_ban_dau,
			Huong_dan_thuong_xuyen,
			Huong_dan_ket_thuc,
			Huong_dan_ren_luyen,
			Thoi_gian_HDBD,
			Thoi_gian_HDTX,
			Thoi_gian_HDKT,
			Thoi_gian_HDRL,
			HD_HDBD_GV,
			HD_HDBD_HS,
			HD_HDTX_GV,
			HD_HDTX_HS,
			HD_HDKT_GV,
			HD_HDKT_HS,
			HD_HDRL_GV,
			HD_HDRL_HS,
			Gioi_thieu_chu_de,
			Giai_quyet_van_de,
			Thoi_gian_GTCD,
			Thoi_gian_GTVD,
			HD_GTCD_GV,
			HD_GTCD_HS,
			HD_GQVD_GV,
			HD_GQVD_HS,
			Rut_kinh_nghiem,
			So_giao_an,
			Do_dung_PT_DH,
			On_dinh_LH,
			Thoi_gian_TH_BH,
			Hinh_thuc_TC_DH,
			Ma_giao_vien,
			Ten_chuong,
			NgayGui,
			User1,
			User2,
			User3,
			User4,
			User5
		FROM #temp2				 --
--	
	--******************************************************
	DECLARE arrayCTKHGD CURSOR FOR
	(
		SELECT ID,Ma_giao_an
		FROM ChiTietKHGD WHERE Ma_ke_hoach_giang_day=@MaKHGDNew
	)

	DECLARE arrayGiaoAn CURSOR FOR
	(
		SELECT ID
		FROM GiaoAn 
		WHERE Ma_KHGD=@MaKHGDNew
	)

	OPEN arrayCTKHGD
	OPEN arrayGiaoAn 

	
	DECLARE @j int
	DECLARE @i int
		
	SET @i=0
	SET @j=0

	--*************************DECLARE CTKHGD**************************************************************
		DECLARE @MaCTKHGD int
		DECLARE @MaGiaoAnOfCTKHGD int
	--*****************************************************************************************************
	--*************************DECLARE GIAO AN**************************************************************
		DECLARE @MaGiaoAnOfGA int
	--*****************************************************************************************************


	FETCH NEXT FROM arrayCTKHGD INTO @MaCTKHGD,@MaGiaoAnOfCTKHGD
	FETCH NEXT FROM arrayGiaoAn INTO @MaGiaoAnOfGA
			
	WHILE @i<@CountCTKHGD 
	BEGIN
		IF ISNULL(@MaGiaoAnOfCTKHGD,'') <> '' AND @j<@CountGiaoAn
		BEGIN
	
			UPDATE ChiTietKHGD SET Ma_giao_an=@MaGiaoAnOfGA WHERE ID=@MaCTKHGD;
			SET @j=@j+1;
				
			FETCH NEXT FROM arrayGiaoAn INTO @MaGiaoAnOfGA
		END

		SET @i=@i+1;
		FETCH NEXT FROM arrayCTKHGD INTO @MaCTKHGD,@MaGiaoAnOfCTKHGD
	END


	CLOSE arrayCTKHGD
	DEALLOCATE arrayCTKHGD 
	CLOSE arrayGiaoAn
	DEALLOCATE arrayGiaoAn 

END

