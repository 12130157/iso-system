if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteChiTietMonHocCTDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteChiTietMonHocCTDT]
GO
CREATE PROCEDURE sp_ISO_DeleteChiTietMonHocCTDT
	@ID	int
AS
BEGIN

	DELETE
	FROM ChiTietMonHocCTDT
	WHERE ID=@ID
END

