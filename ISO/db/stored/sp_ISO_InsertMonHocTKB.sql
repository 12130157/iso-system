if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertMonHocTKB]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertMonHocTKB]
GO
CREATE PROCEDURE sp_ISO_InsertMonHocTKB
	@ID						int output,
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
	@Ngay_cap_nhat_cuoi		datetime output,
	@Tuan_bat_dau_LT		int,
	@Tuan_bat_dau_TH		int,
	@Tuan_ket_thuc_LT		int,
	@Tuan_ket_thuc_TH		int,
	--@Ten_mon_hoc			nvarchar(200),
	--@Ten_giao_vien			nvarchar(200),
	@User1					varchar(40), -- Ma phong LT
	@User2					varchar(40), -- Ma phong TH
	@User3					varchar(40), -- so tiet 1 buoi
	@User4					varchar(40),
	@User5					varchar(40)																					
AS
BEGIN 
	DECLARE @Nam_bat_dau nvarchar(10)
	SELECT @Nam_bat_dau = Nam_bat_dau FROM ThoiKhoaBieu WHERE ID = @Ma_TKB
	DECLARE @Ma_nam_hoc int
	SELECT @Ma_nam_hoc = ID FROM NamHoc WHERE Nam_bat_dau = @Nam_bat_dau
	SELECT @Ngay_bat_dau_LT = Tu_ngay FROM TuanLe WHERE Ma_nam_hoc = @Ma_nam_hoc AND So_thu_tu = @Tuan_bat_dau_LT
	SELECT @Ngay_ket_thuc_LT = Den_ngay FROM TuanLe WHERE Ma_nam_hoc = @Ma_nam_hoc AND So_thu_tu = @Tuan_ket_thuc_LT
	SELECT @Ngay_bat_dau_TH = Tu_ngay FROM TuanLe WHERE Ma_nam_hoc = @Ma_nam_hoc AND So_thu_tu = @Tuan_bat_dau_TH
	SELECT @Ngay_ket_thuc_TH = Den_ngay FROM TuanLe WHERE Ma_nam_hoc = @Ma_nam_hoc AND So_thu_tu = @Tuan_ket_thuc_TH
	
	--SELECT @Ten_mon_hoc = Ten_mon_hoc FROM MonHoc WHERE ID = @Ma_mon_hoc
	--SELECT @Ten_giao_vien = (B.Ho + ' ' + B.Ten_lot + ' ' + B.Ten) FROM ThanhVien AS A INNER JOIN ChiTietThanhVien As B ON A.Ten_DN = Ten_dang_nhap WHERE A.ID = @Ma_giao_vien
	SET @Ngay_cap_nhat_cuoi=GETDATE()

	INSERT INTO MonHocTKB
	VALUES (
		@So_noi_dung,
		@So_ca_thuc_hanh,
		@Ma_TKB,
		@Ma_mon_hoc,
		@Ma_giao_vien,
		@Ngay_bat_dau_LT,
		@Ngay_bat_dau_TH,
		@Ngay_ket_thuc_LT,
		@Ngay_ket_thuc_TH,
		@Ghi_chu,
		@Ngay_cap_nhat_cuoi,
		@Tuan_bat_dau_LT,
		@Tuan_bat_dau_TH,
		@Tuan_ket_thuc_LT,
		@Tuan_ket_thuc_TH,	
		NULL, --Ten_mon_hoc
		NULL, --Ten_giao_vien
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	
	SELECT	@ID = A.ID, @Ngay_cap_nhat_cuoi = Convert(varchar(10), A.Ngay_cap_nhat_cuoi,110),
			@Ngay_bat_dau_LT = Convert(varchar(10), A.Ngay_bat_dau_LT,110),
				@Ngay_bat_dau_TH = Convert(varchar(10), A.Ngay_bat_dau_TH, 110),
					@Ngay_ket_thuc_LT = Convert(varchar(10), A.Ngay_ket_thuc_LT,110), 
						@Ngay_ket_thuc_TH = Convert(varchar(10), A.Ngay_ket_thuc_TH,110)
	FROM MonHocTKB A 
	WHERE A. Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
END			