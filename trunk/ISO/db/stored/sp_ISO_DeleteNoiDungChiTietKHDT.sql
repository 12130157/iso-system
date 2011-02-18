if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteNoiDungChiTietKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteNoiDungChiTietKHDT]
GO
CREATE PROCEDURE sp_ISO_DeleteNoiDungChiTietKHDT
	@ID	int
AS
BEGIN
	DECLARE @Ma_bo_phan int

	DECLARE @Count_bo_phan int

	DECLARE @I int
	SET @I = 1
	SELECT @Count_bo_phan = COUNT(*) FROM BoPhanThucHienKHDT WHERE Ma_noi_dung_chi_tiet_KHDT = @ID
	WHILE(@I <= @Count_bo_phan)
	BEGIN
		SELECT TOP 1 @Ma_bo_phan = ID FROM BoPhanThucHienKHDT WHERE Ma_noi_dung_chi_tiet_KHDT = @ID
		DELETE FROM NguoiThucHien WHERE Ma_bo_phan = @Ma_Bo_phan
		DELETE FROM BoPhanThucHienKHDT WHERE ID = @Ma_bo_phan
		SET @I = @I + 1
	END
	DELETE FROM NoiDungChiTietKHDT WHERE ID = @ID
END
