if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateMaNguoiDuyetKHGDByMaKHGD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateMaNguoiDuyetKHGDByMaKHGD]
GO
CREATE PROCEDURE sp_ISO_UpdateMaNguoiDuyetKHGDByMaKHGD
	@MaKHGD int,
	@Ma_nguoi_duyet int
AS
BEGIN
	UPDATE KEHOACHGIANGDAY
		SET MA_nguoi_duyet=@Ma_nguoi_duyet,
			Ngay_duyet=getdate()
	WHERE ID=@MaKHGD
END
