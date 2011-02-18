
/***********************************************************
* Purpose : insert "Hoc Phan"
* Author : HuyenLY
* Date: 02-06-2010
* Description: insert "Hoc Phan"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_InsertHocPhan]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_InsertHocPhan]
GO
CREATE PROCEDURE sp_Admin_InsertHocPhan

	@Ten			NVARCHAR(100),
	@GhiChu			NVARCHAR(200)
	

AS
BEGIN
	insert into HocPhan(Ten_hoc_phan,Ghi_chu,Ngay_cap_nhat_cuoi)
	values(@Ten,@GhiChu,getdate())
END

