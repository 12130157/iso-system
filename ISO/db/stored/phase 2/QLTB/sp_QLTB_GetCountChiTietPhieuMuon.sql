if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_GetCountChiTietPhieuMuon]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_GetCountChiTietPhieuMuon]
GO
CREATE PROCEDURE sp_QLTB_GetCountChiTietPhieuMuon
	@Tinh_trang			varchar(1),
	@Ma_phieu_muon		int
AS
BEGIN
	DECLARE @sql NVarchar(1000)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	SET @Dieu_kien_tinh_trang = ' ''t'' = ''t'' '

	if(@Tinh_trang <> '')
	BEGIN
		SET @Dieu_kien_tinh_trang = ' Tinh_trang = ' + @Tinh_trang
	END
	SELECT @sql = ' 
		SELECT COUNT(*) AS Count
		FROM ChiTietPhieuMuon
		WHERE ' + @Dieu_kien_tinh_trang + ' AND Ma_phieu_muon = ' + Cast(@Ma_phieu_muon AS Varchar)
	exec sp_executesql @sql
	--PRINT @sql	
END
	
--select * from phieumuonthietbi
--exec sp_QLTB_GetCountChiTietPhieuMuon '2',4