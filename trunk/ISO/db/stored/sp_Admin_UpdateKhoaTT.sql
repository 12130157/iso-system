
/***********************************************************
* Purpose : Update "KHOA_TT"
* Author : HuyenLY
* Date: 02-06-2010
* Description: Update "KHOA_TT"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_UpdateKhoaTT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_UpdateKhoaTT]
GO
CREATE PROCEDURE sp_Admin_UpdateKhoaTT
	@ID				INT,
	@Ten			NVARCHAR(100),
	@Ma_truong_khoa	INT,
	@Nguoi_tao		INT
AS
BEGIN
	UPDATE Khoa_TrungTam
	SET 
		Ten=@Ten,
		Ma_truong_khoa=@Ma_truong_khoa,
		Nguoi_tao=@Nguoi_tao,
		Ngay_cap_nhat_cuoi=getdate()
	WHERE ID=@ID
END

