if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateMonHocTKBByID]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateMonHocTKBByID]
GO
CREATE PROCEDURE sp_ISO_UpdateMonHocTKBByID 
	@ID						int,
	@So_noi_dung			int,
	@So_ca_thuc_hanh		int,
	@Ma_TKB					int,
	@Ma_mon_hoc				int,
	@Ma_giao_vien			int,
	@Ngay_bat_dau_LT		varchar(30) output,
	@Ngay_bat_dau_TH		varchar(30) output,
	@Ngay_ket_thuc_LT		varchar(30) output, 
	@Ngay_ket_thuc_TH		varchar(30) output,
	@Ghi_chu				nvarchar(1000),
	@Ngay_cap_nhat_cuoi		datetime,
	@Tuan_bat_dau_LT		int,
	@Tuan_bat_dau_TH		int,
	@Tuan_ket_thuc_LT		int,
	@Tuan_ket_thuc_TH		int,
	--@Ten_mon_hoc			nvarchar(200),
	--@Ten_giao_vien			nvarchar(200),
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)																					
AS
BEGIN 
	DECLARE @Nam_bat_dau int
	SELECT @Nam_bat_dau = Nam_bat_dau FROM ThoiKhoaBieu WHERE ID = @Ma_TKB
	DECLARE @Ma_nam_hoc int
	SELECT @Ma_nam_hoc = ID FROM NamHoc WHERE Nam_bat_dau = @Nam_bat_dau
	SELECT @Ngay_bat_dau_LT = Tu_ngay FROM TuanLe WHERE Ma_nam_hoc = @Ma_nam_hoc AND So_thu_tu = @Tuan_bat_dau_LT
	SELECT @Ngay_ket_thuc_LT = Den_ngay FROM TuanLe WHERE Ma_nam_hoc = @Ma_nam_hoc AND So_thu_tu = @Tuan_ket_thuc_LT
	SELECT @Ngay_bat_dau_TH = Tu_ngay FROM TuanLe WHERE Ma_nam_hoc = @Ma_nam_hoc AND So_thu_tu = @Tuan_bat_dau_TH
	SELECT @Ngay_ket_thuc_TH = Den_ngay FROM TuanLe WHERE Ma_nam_hoc = @Ma_nam_hoc AND So_thu_tu = @Tuan_ket_thuc_TH
	
	SET @Ngay_cap_nhat_cuoi=GETDATE()

	UPDATE MonHocTKB
	SET
		So_noi_dung				=	@So_noi_dung,
		So_ca_thuc_hanh			=	@So_ca_thuc_hanh,
		Ma_TKB					=	@Ma_TKB,
		Ma_mon_hoc				=	@Ma_mon_hoc,
		Ma_giao_vien			=	@Ma_giao_vien,
		Ngay_bat_dau_LT			=	@Ngay_bat_dau_LT,
		Ngay_bat_dau_TH			=	@Ngay_bat_dau_TH,
		Ngay_ket_thuc_LT		=	@Ngay_ket_thuc_LT,
		Ngay_ket_thuc_TH		=	@Ngay_ket_thuc_TH,
		Ghi_chu					=	@Ghi_chu,
		Ngay_cap_nhat_cuoi		=	@Ngay_cap_nhat_cuoi,
		Tuan_bat_dau_LT			=	@Tuan_bat_dau_LT,
		Tuan_bat_dau_TH			=	@Tuan_bat_dau_TH,
		Tuan_ket_thuc_LT		=	@Tuan_ket_thuc_LT,
		Tuan_ket_thuc_TH		=	@Tuan_ket_thuc_TH,	
		--Ten_mon_hoc				=	@Ten_mon_hoc,
		--Ten_giao_vien			=	@Ten_giao_vien,
		User1					=	@User1, -- Ma phong LT
		User2					=	@User2, -- Ma phong TH
		User3					=	@User3,
		User4					=	@User4,
		User5					=	@User5
	WHERE
		ID						=	@ID
	SELECT	@ID = A.ID, @Ngay_cap_nhat_cuoi = Convert(varchar(10), A.Ngay_cap_nhat_cuoi,110),
			@Ngay_bat_dau_LT = Convert(varchar(10), A.Ngay_bat_dau_LT,110),
				@Ngay_bat_dau_TH = Convert(varchar(10), A.Ngay_bat_dau_TH, 110),
					@Ngay_ket_thuc_LT = Convert(varchar(10), A.Ngay_ket_thuc_LT,110), 
						@Ngay_ket_thuc_TH = Convert(varchar(10), A.Ngay_ket_thuc_TH,110)
	FROM MonHocTKB A 
	WHERE A.ID = @ID
END			