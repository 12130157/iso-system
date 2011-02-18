if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateHDTXByMaGiaoAn]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateHDTXByMaGiaoAn]
GO
CREATE PROCEDURE sp_ISO_UpdateHDTXByMaGiaoAn
	@MaGiaoAn int,
	@HuongDanThuongXuyen nvarchar(2000)
AS
BEGIN
	UPDATE GIAOAN
		SET Huong_dan_thuong_xuyen=@HuongDanThuongXuyen
	WHERE ID=@MaGiaoAn
END
