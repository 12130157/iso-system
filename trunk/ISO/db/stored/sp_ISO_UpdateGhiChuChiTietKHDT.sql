if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateGhiChuChiTietKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateGhiChuChiTietKHDT]
GO
CREATE PROCEDURE sp_ISO_UpdateGhiChuChiTietKHDT
	@ID						int,
	@Ghi_chu				nvarchar(4000),
	@Tinh_trang_phan_cong_tac int
AS
BEGIN	
	UPDATE ChiTietKHDT
	SET 
		Ghi_chu		=	@Ghi_chu,
		Tinh_trang_phan_cong_tac = @Tinh_trang_phan_cong_tac
	WHERE
		ID	=	@ID
END