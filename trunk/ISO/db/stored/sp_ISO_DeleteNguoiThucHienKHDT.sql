if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteNguoiThucHienKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteNguoiThucHienKHDT]
GO
CREATE PROCEDURE sp_ISO_DeleteNguoiThucHienKHDT
	@ID	int
AS
BEGIN
	DELETE FROM NguoiThucHien WHERE ID = @ID
END
