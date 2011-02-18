
/***********************************************************
* Purpose : insert cong tac
* Author : TuanHQ
* Date: 30-07-2010S
* Description: insert con tac
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_InsertCongTac]'))
drop proc [sp_Admin_InsertCongTac]
GO
CREATE PROC sp_Admin_InsertCongTac
	@Noi_dung	nvarchar(4000),
	@Ghi_chu	nvarchar(400)
AS
BEGIN
	insert into congtac (Noi_dung,Ghi_Chu) 
	values (@Noi_dung,@Ghi_chu)		
END