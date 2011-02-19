if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteCongTacThang]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteCongTacThang]
GO
CREATE PROCEDURE sp_ISO_DeleteCongTacThang
	@ID	int
AS
BEGIN
	DELETE
	FROM TinhTrangCongTac
	WHERE Ma_cong_tac_thang = @ID

	DELETE
	FROM CongTacThang
	WHERE ID = @ID
END
