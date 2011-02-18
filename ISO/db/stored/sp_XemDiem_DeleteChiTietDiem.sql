if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_XemDiem_DeleteChiTietDiem]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_XemDiem_DeleteChiTietDiem]
GO
CREATE PROCEDURE sp_XemDiem_DeleteChiTietDiem
	@ID	int
AS
BEGIN

	DELETE
	FROM ChiTietDiem
	WHERE ID=@ID
END