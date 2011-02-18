if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateMaNguoiDuyetGiaoAnByMaKHGD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateMaNguoiDuyetGiaoAnByMaKHGD]
GO
CREATE PROCEDURE sp_ISO_UpdateMaNguoiDuyetGiaoAnByMaKHGD
	@MaKHGD int,
	@Ma_nguoi_duyet int
AS
BEGIN
	UPDATE GIAOAN
		SET MA_nguoi_duyet=@Ma_nguoi_duyet,
			Ngay_duyet=getdate()
	WHERE Ma_KHGD=@MaKHGD
END
