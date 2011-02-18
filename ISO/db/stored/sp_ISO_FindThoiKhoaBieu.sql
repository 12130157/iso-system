
/***********************************************************
* Purpose : Search "THOI KHOA BIEU" BY HOC KY, NAM HOC, LOP
* Author : PhuongTQ
* Date: 14-09-2010
* Description: Search "THOI KHOA BIEU" BY HOC KY, NAM HOC, LOP
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_FindThoiKhoaBieu]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_FindThoiKhoaBieu]
GO
CREATE PROCEDURE sp_ISO_FindThoiKhoaBieu
	@Hoc_ki varchar,
	@Ma_lop int,
	@Nam_bat_dau varchar(4),
	@result varchar(1) output
AS
BEGIN
	If exists(
		SELECT ID 
		FROM ThoiKhoaBieu
		WHERE Hoc_ki = @Hoc_ki
			and Nam_bat_dau = @Nam_bat_dau 
				and Ma_lop = @Ma_lop)
	Begin
		SET @result = '1'
	End
	Else
	Begin
		SET @result = '0'
	End
END

