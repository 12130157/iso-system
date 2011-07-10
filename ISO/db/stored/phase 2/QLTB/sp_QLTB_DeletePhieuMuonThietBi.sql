
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_DeletePhieuMuonThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_DeletePhieuMuonThietBi]
GO
CREATE PROC sp_QLTB_DeletePhieuMuonThietBi
	@ID	int
AS
BEGIN
	DELETE 
	FROM PhieuMuonThietBi
	WHERE ID = @ID		
END
