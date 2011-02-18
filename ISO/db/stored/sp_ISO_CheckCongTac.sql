if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_CheckCongTac]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_CheckCongTac]
GO
CREATE PROCEDURE sp_ISO_CheckCongTac
	@MaNguoiThucHien int,
	@MaBoPhanThucHien int,
	@MaNoiDungChiTietKHDT int
AS
BEGIN
	UPDATE NguoiThucHien SET Tinh_trang_thuc_hien = 1 WHERE ID = @MaNguoiThucHien
	If not exists(
		SELECT * 
			FROM NGUOITHUCHIEN
				WHERE Ma_bo_phan = @MaBoPhanThucHien AND Tinh_trang_thuc_hien = 0)
	Begin
		UPDATE NOIDUNGCHITIETKHDT SET Tinh_trang_thuc_hien = 1 WHERE ID = @MaNoiDungChiTietKHDT
	End
END
