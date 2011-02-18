
/***********************************************************
* Purpose : insert vai tro
* Author : TuanHQ
* Date: 02-04-2010S
* Description: insert vai tro
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_InsertVaiTro]'))
drop proc sp_Admin_InsertVaiTro
GO
CREATE PROC sp_Admin_InsertVaiTro
	@Ten_vai_tro nvarchar(40),
	@Ngay_cap_nhat_cuoi datetime,
	@User1 varchar(40),
	@User2 varchar(40),
	@User3 varchar(40),
	@User4 varchar(40),
	@User5 varchar(40)
AS
BEGIN
	set @Ngay_cap_nhat_cuoi = GETDATE();
	INSERT INTO VaiTro VALUES(@Ten_vai_tro,@Ngay_cap_nhat_cuoi,@User1,@User2,@User3,@User4,@User5)		
END