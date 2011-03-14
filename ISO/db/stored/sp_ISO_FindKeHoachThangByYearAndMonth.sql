
/***********************************************************
* Purpose : Search "KE HOACH THANG" by YEAR and MONTH
* Author : PhuongTQ
* Date: 09-03-2011
* Description: Search "KE HOACH THANG" by YEAR and MONTH
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_FindKeHoachThangByYearAndMonth]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_FindKeHoachThangByYearAndMonth]
GO
CREATE PROCEDURE sp_ISO_FindKeHoachThangByYearAndMonth
	@Nam varchar(4),
	@Thang varchar(2),
	@result varchar(1) output
AS
BEGIN
	If exists(
		SELECT * 
		FROM KeHoachThang
		WHERE Nam = @Nam And Thang = @Thang)
	Begin
		SET @result = '1'
	End
	Else
	Begin
		SET @result = '0'
	End
END

