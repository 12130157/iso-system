if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertChiTietTKB]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertChiTietTKB]
GO
CREATE PROCEDURE sp_ISO_InsertChiTietTKB
	@ID						int output,
	@Ma_TKB					int,
	@Thu_trong_tuan			int,
	@Buoi					nvarchar(10),
	@Hinh_thuc_day			nvarchar(5), 
	@Nhom					int,
	@Ma_phong				int,
	@Ngay_cap_nhat_cuoi		datetime,
	@So_thu_tu				int,
	@Ma_mon_hoc_TKB			int,
	@Tuan					int,
	@Ngay_hoc				datetime,
	@STT_noi_dung			int,
	@Co_hieu				int,
	@User1					varchar, --Ma nam hoc
	@User2					varchar,
	@User3					varchar,
	@User4					varchar,
	@User5					varchar,
	@Ten_chuong				nvarchar(4000),
	@Muc_tieu				nvarchar(2000)
AS
BEGIN	
	DECLARE @Nam_bat_dau nvarchar(10)
	SELECT @Nam_bat_dau = Nam_bat_dau FROM ThoiKhoaBieu WHERE ID = @Ma_TKB
	DECLARE @Ma_nam_hoc int
	SELECT @Ma_nam_hoc = ID FROM NamHoc WHERE Nam_bat_dau = @Nam_bat_dau
	SELECT @Ngay_hoc = DATEADD(Day, @Thu_trong_tuan-1, Tu_ngay) FROM TuanLe WHERE Ma_nam_hoc = @Ma_nam_hoc AND So_thu_tu = @Tuan
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	
	INSERT INTO ChiTietTKB
	VALUES (
		@Ma_TKB,
		@Thu_trong_tuan,
		@Buoi,
		@Hinh_thuc_day,
		@Nhom,
		@Ma_phong,
		@Ngay_cap_nhat_cuoi,
		@So_thu_tu,
		@Ma_mon_hoc_TKB,
		@Tuan,
		@Ngay_hoc,
		@STT_noi_dung,
		@Co_hieu,
		@Ten_chuong,
		@Muc_tieu,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
		
	)
	
	SELECT 	@ID=ID FROM ChiTietTKB WHERE Ngay_cap_nhat_cuoi=@Ngay_cap_nhat_cuoi
END