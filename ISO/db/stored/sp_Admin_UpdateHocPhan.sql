
/***********************************************************
* Purpose : Update "Hoc Phan"
* Author : HuyenLY
* Date: 02-06-2010
* Description: Update "Hoc Phan"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_UpdateHocPhan]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_UpdateHocPhan]
GO
CREATE PROCEDURE sp_Admin_UpdateHocPhan
	@ID				INT,
	@Ten			NVARCHAR(100),
	@GhiChu			NVARCHAR(200)

AS
BEGIN
	UPDATE HocPhan
	SET 
		Ten_hoc_phan=@Ten,
		Ghi_chu=@GhiChu,
		Ngay_cap_nhat_cuoi=getdate()
	WHERE ID=@ID
END

