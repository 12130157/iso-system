
/***********************************************************
* Purpose : Delete "CHI TIET KE HOACH DAO TAO"
* Author : ThienVD
* Date: 02-04-2010
* Description: Delete "CHI TIET KE HOACH DAO TAO"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteChiTietKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteChiTietKHDT]
GO
CREATE PROCEDURE sp_ISO_DeleteChiTietKHDT
	@ID	int
AS
BEGIN
	DECLARE @Ma_noi_dung int
	DECLARE @Ma_bo_phan int

	DECLARE @Count_noi_dung int
	DECLARE @Count_bo_phan int

	DECLARE @I int
	SET @I = 1
	DECLARE @J int
	SELECT @Count_noi_dung = Count(*) FROM NoiDungChiTietKHDT WHERE Ma_chi_tiet_KHDT = @ID 
	WHILE (@I <= @Count_noi_dung)
	BEGIN
		SELECT TOP 1 @Ma_noi_dung = ID FROM NoiDungChiTietKHDT WHERE Ma_chi_tiet_KHDT = @ID
		SELECT @Count_bo_phan = COUNT(*) FROM BoPhanThucHienKHDT WHERE Ma_noi_dung_chi_tiet_KHDT = @Ma_noi_dung
		SET @J = 1
		WHILE(@J <= @Count_bo_phan)
		BEGIN
			SELECT TOP 1 @Ma_bo_phan = ID FROM BoPhanThucHienKHDT WHERE Ma_noi_dung_chi_tiet_KHDT = @Ma_noi_dung
			DELETE FROM NguoiThucHien WHERE Ma_bo_phan = @Ma_Bo_phan
			DELETE FROM BoPhanThucHienKHDT WHERE ID = @Ma_bo_phan
			SET @J = @J + 1
		END
		DELETE FROM NoiDungChiTietKHDT WHERE ID = @Ma_noi_dung
		SET @I = @I + 1
	END
	DELETE
	FROM ChiTietKHDT
	WHERE ID=@ID
END

