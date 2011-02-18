if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateDanNhapByMaGiaoAn]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateDanNhapByMaGiaoAn]
GO
CREATE PROCEDURE sp_ISO_UpdateDanNhapByMaGiaoAn
	@MaGiaoAn int,
	@DanNhap nvarchar(2000)
AS
BEGIN
	UPDATE GIAOAN
		SET Dan_nhap=@DanNhap
	WHERE ID=@MaGiaoAn
END
