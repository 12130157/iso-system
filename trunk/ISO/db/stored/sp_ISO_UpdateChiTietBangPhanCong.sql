if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateChiTietBangPhanCong]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateChiTietBangPhanCong]
GO
CREATE PROCEDURE sp_ISO_UpdateChiTietBangPhanCong
	@ID						INT,
	@Ma_giao_vien			INT,
	@Nhiem_vu				NVARCHAR(2000),
	@Ghi_chu				NVARCHAR(2000),
	@Ngay_cap_nhat_cuoi		DATETIME
AS
BEGIN
	SET @Ngay_cap_nhat_cuoi	= GETDATE()	
	UPDATE ChiTietBangPhanCong
	SET
		Ma_giao_vien		=	@Ma_giao_vien,
		Nhiem_vu			=	@Nhiem_vu,
		Ghi_chu				=	@Ghi_chu,
		Ngay_cap_nhat_cuoi	=	@Ngay_cap_nhat_cuoi
	WHERE 
		ID	=	@ID
END