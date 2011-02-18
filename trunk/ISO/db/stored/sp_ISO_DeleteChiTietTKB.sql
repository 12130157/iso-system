if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteChiTietTKB]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteChiTietTKB]
GO
CREATE PROCEDURE sp_ISO_DeleteChiTietTKB
	@ID	int
AS
BEGIN

	DELETE
	FROM ChiTietTKB
	WHERE ID=@ID
END
