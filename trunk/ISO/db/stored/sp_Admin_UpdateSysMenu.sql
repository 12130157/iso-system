if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_UpdateSysMenu]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_Admin_UpdateSysMenu]
GO
create proc sp_Admin_UpdateSysMenu
	@ID int,
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
	UPDATE SYS_MENU 
	SET Menu_name=@Menu_name,images=@images,Menu_link=@Menu_link,User1=@User1,User2=@User2,User3=@User3,User4=@User4,User5=@User5
	WHERE ID=@ID AND AppID=@appID 
end
