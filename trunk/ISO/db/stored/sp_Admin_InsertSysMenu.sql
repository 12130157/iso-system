if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_InsertSysMenu]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_Admin_InsertSysMenu]
GO
create proc sp_Admin_InsertSysMenu
	@appID int,
	@Menu_name nvarchar(100),
	@images nvarchar(100),
	@Menu_link nvarchar(100),
	@user1 varchar(40),
	@user2 varchar(40),
	@user3 varchar(40),
	@user4 varchar(40),
	@user5 varchar(40)
as
begin
	INSERT INTO SYS_MENU(AppID,Menu_name,images,Menu_link,User1,User2,User3,User4,User5) 
	VALUES(@appID,@Menu_name,@images,@Menu_link,@User1,@User2,@User3,@User4,@User5)
end
