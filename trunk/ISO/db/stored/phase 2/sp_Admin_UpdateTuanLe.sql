
/***********************************************************
* Purpose : update Tuan LE
* Author : Huy
* Date: 10-09-2010S
* Description: update Tuan LE
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_UpdateTuanLe]'))
drop proc sp_Admin_UpdateTuanLe
GO
CREATE PROC sp_Admin_UpdateTuanLe
	@ID int,
	@Tu_Ngay datetime,
	@Den_Ngay datetime
AS
BEGIN
	
	Update TuanLe Set Tu_ngay = @Tu_Ngay, Den_ngay = @Den_Ngay where ID = @ID
END