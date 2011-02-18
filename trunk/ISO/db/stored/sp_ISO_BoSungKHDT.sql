if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_BoSungKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_BoSungKHDT]
GO
CREATE PROCEDURE sp_ISO_BoSungKHDT
	@ID	int,
	@Tinh_trang int,
	@Bo_sung int output
AS
BEGIN
	DECLARE @Lan_bo_sung int
	SELECT @Lan_bo_sung = Bo_sung FROM KeHoachDaoTao WHERE ID = @ID
	UPDATE KeHoachDaoTao SET Bo_sung = @Lan_bo_sung + 1, Tinh_trang = @Tinh_trang WHERE ID = @ID
	SELECT @Bo_sung = Bo_sung FROM KeHoachDaoTao WHERE ID = @ID
END
