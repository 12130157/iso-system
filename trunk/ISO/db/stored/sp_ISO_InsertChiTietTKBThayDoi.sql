if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertChiTietTKBThayDoi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertChiTietTKBThayDoi]
GO
CREATE PROCEDURE sp_ISO_InsertChiTietTKBThayDoi
	@ID						int output,
	@Ma_mon_hoc_TKB			int,
	@Ma_chi_tiet_TKB		int,
	@Thu_trong_tuan			int,
	@Buoi					nvarchar(10),
	@Ma_phong				int,
	@Tuan					int,
	@Ngay_hoc				datetime,
	@Ma_nguoi_tao			int,
	@Ma_to_trinh			int,
	@Tinh_trang				int,
	@ID_thay_the			int,
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar, 
	@User2					varchar,
	@User3					varchar,
	@User4					varchar,
	@User5					varchar
AS
BEGIN	
	DECLARE @Nam_bat_dau nvarchar(10)
	SELECT @Nam_bat_dau = B.Nam_bat_dau FROM ChiTietTKB AS A
		INNER JOIN ThoiKhoaBieu AS B ON A.Ma_TKB = B.ID WHERE A.ID = @Ma_chi_tiet_TKB
	DECLARE @Ma_nam_hoc int
	SELECT @Ma_nam_hoc = ID FROM NamHoc WHERE Nam_bat_dau = @Nam_bat_dau
	SELECT @Ngay_hoc = DATEADD(Day, @Thu_trong_tuan-1, Tu_ngay) FROM TuanLe WHERE Ma_nam_hoc = @Ma_nam_hoc AND So_thu_tu = @Tuan
	SET @Ngay_cap_nhat_cuoi=GETDATE()

	DECLARE @Ngay_thay_the	datetime
	DECLARE @Count	int
	SELECT @Count = Count(*) FROM ChiTietTKBThayDoi WHERE Ma_chi_tiet_TKB = @Ma_chi_tiet_TKB
	IF(@Count > 0)
	BEGIN
		SELECT @Ngay_thay_the = MAX(Ngay_cap_nhat_cuoi) FROM ChiTietTKBThayDoi 
		SELECT @ID_thay_the = ID FROM ChiTietTKBThayDoi WHERE Ngay_cap_nhat_cuoi = @Ngay_thay_the
	END
	SET @Ma_to_trinh = -2
	INSERT INTO ChiTietTKBThayDoi
	VALUES (
		@Ma_mon_hoc_TKB,
		@Ma_chi_tiet_TKB,
		@Thu_trong_tuan,
		@Buoi,
		@Ma_phong,
		@Tuan,
		@Ngay_hoc,
		@Ma_nguoi_tao,
		@Ma_to_trinh,
		@Tinh_trang,
		@ID_thay_the,
		@Ngay_cap_nhat_cuoi,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
		
	)
	
	SELECT 	@ID=ID FROM ChiTietTKBThayDoi WHERE Ngay_cap_nhat_cuoi=@Ngay_cap_nhat_cuoi
END