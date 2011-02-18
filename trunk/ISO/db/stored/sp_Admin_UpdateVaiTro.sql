
/***********************************************************
* Purpose : update vai tro
* Author : TuanHQ
* Date: 18-04-2010S
* Description: update vai tro
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_UpdateVaiTro]'))
drop proc sp_Admin_UpdateVaiTro
GO
CREATE PROC sp_Admin_UpdateVaiTro
	@ID int,
	@Ten_vai_tro nvarchar(40),
	@Ngay_cap_nhat_cuoi datetime
AS
BEGIN
	set @Ngay_cap_nhat_cuoi = GETDATE();
	Update VaiTro Set Ten_vai_tro = @Ten_vai_tro where ID = @ID
END