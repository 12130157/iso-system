
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_DeleteNhaCungCap]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_DeleteNhaCungCap]
GO
CREATE PROC sp_QLTB_DeleteNhaCungCap
	@ID	int
AS
BEGIN
	DELETE
	FROM nhacungcap 
	WHERE ID = @ID	
END
