if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteSuDung]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteSuDung]
GO
CREATE PROCEDURE sp_ISO_DeleteSuDung
	--@Ma_mon_hoc_TKB	int
	@ID		int
AS
BEGIN

	DELETE
	FROM SuDung
	WHERE ID = @ID
END