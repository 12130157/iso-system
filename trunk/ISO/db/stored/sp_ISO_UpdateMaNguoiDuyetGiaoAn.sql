if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateMaNguoiDuyetGiaoAn]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateMaNguoiDuyetGiaoAn]
GO
CREATE PROCEDURE sp_ISO_UpdateMaNguoiDuyetGiaoAn
	@MaGiaoAn int,
	@Ma_nguoi_duyet int
AS
BEGIN
	UPDATE GIAOAN
		SET MA_nguoi_duyet=@MA_nguoi_duyet,
			Ngay_duyet=getdate()
	WHERE ID=@MaGiaoAn
END
