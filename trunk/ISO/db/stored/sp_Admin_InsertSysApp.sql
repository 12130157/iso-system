if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_InsertSysApp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_Admin_InsertSysApp]
GO
create proc sp_Admin_InsertSysApp
	@app_name nvarchar(100),
	@app_link nvarchar(100),
	@images nvarchar(100),
	@user1 varchar(40),
	@user2 varchar(40),
	@user3 varchar(40),
	@user4 varchar(40),
	@user5 varchar(40)
as
begin
	insert into SYS_APP([App_name],[app_link],[images],[user1],[user2],[user3],[user4],[user5]) values(@app_name,@app_link,@images,@user1,@user2,@user3,@user4,@user5)
end