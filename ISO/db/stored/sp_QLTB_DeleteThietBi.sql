
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_DeleteThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_DeleteThietBi]
GO
CREATE PROC sp_QLTB_DeleteThietBi
	@ID	int
AS
BEGIN
	DELETE 
	FROM chitietthietbi
	WHERE Ma_thiet_bi = @ID	

	DELETE 
	FROM chitietphieumuon
	WHERE Ma_thiet_bi = @ID	

	DELETE
	FROM thietbi 
	WHERE ID = @ID	
END
