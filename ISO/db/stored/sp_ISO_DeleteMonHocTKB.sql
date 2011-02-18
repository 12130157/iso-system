if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteMonHocTKB]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteMonHocTKB]
GO
CREATE PROCEDURE sp_ISO_DeleteMonHocTKB
	@Ma_mon_hoc_TKB				int
	--@Ma_TKB					int
AS
BEGIN
	--DECLARE @Ma_mon_hoc_TKB	int
	--SELECT @Ma_mon_hoc_TKB = ID FROM MonHocTKB WHERE Ma_mon_hoc = @Ma_mon_hoc AND Ma_TKB = @Ma_TKB
	DELETE
	FROM ChiTietTKB
	WHERE Ma_mon_hoc_TKB = @Ma_mon_hoc_TKB
	
	-- delete sudung(TKB chua sua)
	DELETE
	FROM SuDung
	WHERE Ma_mon_hoc_TKB = @Ma_mon_hoc_TKB
	--
	
	DELETE
	FROM MonHocTKB
	WHERE ID=@Ma_mon_hoc_TKB
END
