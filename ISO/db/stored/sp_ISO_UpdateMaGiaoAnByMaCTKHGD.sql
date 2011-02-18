if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateMaGiaoAnByMaCTKHGD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateMaGiaoAnByMaCTKHGD]
GO
CREATE PROCEDURE sp_ISO_UpdateMaGiaoAnByMaCTKHGD
	@stt int output,	
	@MaCTKHGD int
	
AS
BEGIN
	Declare @Ma_giao_an int
	SELECT TOP 1 @Ma_giao_an=ID  FROM GIAOAN ORDER BY ID DESC  
	UPDATE CHITIETKHGD
		SET Ma_giao_an=@Ma_giao_an 	
	WHERE ID=@MaCTKHGD
END
 