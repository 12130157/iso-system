if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteThoiKhoaBieu]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteThoiKhoaBieu]
GO
CREATE PROCEDURE sp_ISO_DeleteThoiKhoaBieu
	@ID	int
AS
BEGIN

	DELETE
	FROM ChiTietTKB
	WHERE Ma_TKB = @ID

	DELETE
	FROM MonHocTKB
	Where Ma_TKB = @ID

	DELETE
	FROM ThoiKhoaBieu
	WHERE ID=@ID
	
END