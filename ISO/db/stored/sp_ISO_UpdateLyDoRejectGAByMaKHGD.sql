if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateLyDoRejectGAByMaKHGD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateLyDoRejectGAByMaKHGD]
GO
CREATE PROCEDURE sp_ISO_UpdateLyDoRejectGAByMaKHGD
	@MaKHGD int,
	@LyDoReject nvarchar(2000)
AS
BEGIN
	UPDATE KEHOACHGIANGDAY
		SET Ly_do_reject=@LyDoReject
	WHERE ID=@MaKHGD
END


