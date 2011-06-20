if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateMonHocTKBThayDoi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateMonHocTKBThayDoi]
GO
CREATE PROCEDURE sp_ISO_UpdateMonHocTKBThayDoi
	@ID						int,
	@Ma_giao_vien			int,
	@Ngay_cap_nhat_cuoi		datetime
AS
BEGIN	
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	
	UPDATE MonHocTKBThayDoi
	SET 
		Ma_giao_vien	=	@Ma_giao_vien,
		Ngay_cap_nhat_cuoi	=	@Ngay_cap_nhat_cuoi		
	WHERE ID = @ID
END