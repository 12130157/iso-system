if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteBoPhanThucHienKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteBoPhanThucHienKHDT]
GO
CREATE PROCEDURE sp_ISO_DeleteBoPhanThucHienKHDT
	@ID	int
AS
BEGIN
	DELETE FROM NguoiThucHien WHERE Ma_bo_phan = @ID
	DELETE FROM BoPhanThucHienKHDT WHERE ID = @ID
END
