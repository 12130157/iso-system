if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteDCMH]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteDCMH]
GO
CREATE PROCEDURE sp_ISO_DeleteDCMH
	@ID	int
AS
BEGIN
	
	DELETE
	FROM NoiDungDCMH
	WHERE Ma_de_cuong = @ID

	DELETE
	FROM DeCuongMonHoc
	WHERE ID=@ID
END
