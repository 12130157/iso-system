if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteNoiDungDCMH]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteNoiDungDCMH]
GO
CREATE PROCEDURE sp_ISO_DeleteNoiDungDCMH
	@ID	int
AS
BEGIN

	DELETE
	FROM NoiDungDCMH
	WHERE ID=@ID
END
