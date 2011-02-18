
/***********************************************************
* Purpose : Delete "Mo Chuyen Nganh"
* Author : ToanTT
* Date: 
* Description: Delete "Mo Chuyen Nganh"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteMoChuyenNganh]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteMoChuyenNganh]
GO
CREATE PROCEDURE sp_ISO_DeleteMoChuyenNganh
	@ID	int
AS
BEGIN

	DELETE
	FROM MoChuyenNganh
	WHERE ID=@ID
END

