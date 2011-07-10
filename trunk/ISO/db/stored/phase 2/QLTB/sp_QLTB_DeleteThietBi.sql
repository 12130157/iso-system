
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_DeleteThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_DeleteThietBi]
GO
CREATE PROC sp_QLTB_DeleteThietBi
	@ID	int -- Ma thiet bi
AS
BEGIN
	DELETE FROM TrinhTuThayDoiLinhKien 
	WHERE Ma_thiet_bi = @ID
 
	DELETE 
	FROM chitietthietbi
	WHERE ID IN (SELECT Distinct(B.ID) FROM TrinhTuThayDoiLinhKien AS A
		INNER JOIN ChiTietThietBi AS B ON A.Ma_linh_kien = B.ID
			WHERE A.Ma_thiet_bi = @ID)

	DELETE 
	FROM TrinhTuThayDoiThietBi
	WHERE Ma_thiet_bi = @ID

	DELETE
	FROM thietbi 
	WHERE ID = @ID	
END
