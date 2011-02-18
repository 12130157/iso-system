
/***********************************************************
* Purpose : update lop hoc
* Author : HuyTH
* Date: 18-09-2010S
* Description: update Chuyen Ca
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_UpdateChuyenCa]'))
drop proc [sp_Admin_UpdateChuyenCa]
GO
CREATE PROC sp_Admin_UpdateChuyenCa
	@ID				int,
	@User2		nvarchar(5)
	
AS
BEGIN
	Update ThanhVien 
		Set 
			User2 = @User2
	where ID = @ID
END