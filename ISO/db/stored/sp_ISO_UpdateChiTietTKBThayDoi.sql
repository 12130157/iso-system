if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateChiTietTKBThayDoi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateChiTietTKBThayDoi]
GO
CREATE PROCEDURE sp_ISO_UpdateChiTietTKBThayDoi
	@ID						int,
	@Ma_chi_tiet_TKB		int,
	@Thu_trong_tuan			int,
	@Buoi					nvarchar(10),
	@Ma_phong				int,
	@Tuan					int,
	@Ngay_hoc				datetime,
	@Ngay_cap_nhat_cuoi		datetime
AS
BEGIN	
	DECLARE @Nam_bat_dau nvarchar(10)
	SELECT @Nam_bat_dau = B.Nam_bat_dau FROM ChiTietTKB AS A
		INNER JOIN ThoiKhoaBieu AS B ON A.Ma_TKB = B.ID WHERE A.ID = @Ma_chi_tiet_TKB
	DECLARE @Ma_nam_hoc int
	SELECT @Ma_nam_hoc = ID FROM NamHoc WHERE Nam_bat_dau = @Nam_bat_dau
	SELECT @Ngay_hoc = DATEADD(Day, @Thu_trong_tuan-1, Tu_ngay) FROM TuanLe WHERE Ma_nam_hoc = @Ma_nam_hoc AND So_thu_tu = @Tuan
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	
	UPDATE ChiTietTKBThayDoi
	SET 
		Thu_trong_tuan	=	@Thu_trong_tuan,
		Buoi			=	@Buoi,
		Ma_phong		=	@Ma_phong,
		Tuan			=	@Tuan,
		Ngay_hoc		=	@Ngay_hoc,
		Ngay_cap_nhat_cuoi	=	@Ngay_cap_nhat_cuoi		
	WHERE ID = @ID
END