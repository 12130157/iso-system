if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteTinhTrangCongTac]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteTinhTrangCongTac]
GO
CREATE PROCEDURE sp_ISO_DeleteTinhTrangCongTac
	@ID	int
AS
BEGIN
	
	DELETE
	FROM TinhTrangCongTac
	WHERE ID = @ID
END
