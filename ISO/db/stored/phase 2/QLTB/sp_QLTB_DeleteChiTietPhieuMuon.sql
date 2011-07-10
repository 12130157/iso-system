
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_DeleteChiTietPhieuMuon]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_DeleteChiTietPhieuMuon]
GO
CREATE PROC sp_QLTB_DeleteChiTietPhieuMuon
	@ID	int
AS
BEGIN
	DELETE 
	FROM ChiTietPhieuMuon
	WHERE ID = @ID		
END
