
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_DeleteChiTietThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_DeleteChiTietThietBi]
GO
CREATE PROC sp_QLTB_DeleteChiTietThietBi
	@ID	int
AS
BEGIN
	DELETE 
	FROM ChiTietThietBi
	WHERE ID = @ID		
END
