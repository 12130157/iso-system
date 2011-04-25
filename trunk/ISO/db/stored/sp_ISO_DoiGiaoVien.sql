if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DoiGiaoVien]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DoiGiaoVien]
GO
CREATE PROCEDURE sp_ISO_DoiGiaoVien
	@Ma_mon_hoc_TKB	int,
	@Ma_giao_vien int
AS
BEGIN
	UPDATE MonHocTKB SET Ma_giao_vien = @Ma_giao_vien WHERE ID = @Ma_mon_hoc_TKB
END
