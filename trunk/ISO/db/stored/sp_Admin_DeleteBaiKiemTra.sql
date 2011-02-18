/***********************************************************
* Purpose : delete bai kiem tra
* Author : AnhHX
* Date: 16-09-2010S
* Description: delete bai kiem tra
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_DeleteBaiKiemTra]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_DeleteBaiKiemTra]
GO
CREATE PROC sp_Admin_DeleteBaiKiemTra
	@ID	int

AS
BEGIN
	DELETE
	FROM baikiemtra
	WHERE ID = @ID
	
END
