
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_KiemTraThietBiMuon]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_KiemTraThietBiMuon]
GO
CREATE PROC sp_QLTB_KiemTraThietBiMuon
	--@ID	int
	@Thoi_gian_muon datetime,
	@Thoi_gian_tra datetime
	--@Result int output
AS
BEGIN
	DECLARE @Sql nvarchar(1000)
	SELECT ID FROM ChiTietPhieuMuon 
					WHERE (@Thoi_gian_muon >= Thoi_gian_muon AND @Thoi_gian_muon < Thoi_gian_tra)
						OR (@Thoi_gian_tra > Thoi_gian_muon AND @Thoi_gian_tra <= Thoi_gian_tra)
						OR (Thoi_gian_muon > @Thoi_gian_muon AND Thoi_gian_muon < @Thoi_gian_tra)
						OR (Thoi_gian_tra > @Thoi_gian_muon AND Thoi_gian_tra < @Thoi_gian_tra)
END
--select Cast('04-28-2011' + ' ' + '8:' + '40' AS DATETIME) 
--exec sp_QLTB_KiemTraThietBiMuon '01-01-2010', '01-01-2011'