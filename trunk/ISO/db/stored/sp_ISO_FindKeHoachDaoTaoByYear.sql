
/***********************************************************
* Purpose : Search "KE HOACH DAO TAO" by YEAR
* Author : PhuongTQ
* Date: 06-04-2010
* Description: Search "KE HOACH DAO TAO" by YEAR
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_FindKeHoachDaoTaoByYear]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_FindKeHoachDaoTaoByYear]
GO
CREATE PROCEDURE sp_ISO_FindKeHoachDaoTaoByYear
	@Nam1 varchar(4),
	@result varchar(1) output
AS
BEGIN
	If exists(
		SELECT Nam1 
		FROM KeHoachDaoTao
		WHERE Nam1 = @Nam1)
	Begin
		SET @result = '1'
	End
	Else
	Begin
		SET @result = '0'
	End
END

