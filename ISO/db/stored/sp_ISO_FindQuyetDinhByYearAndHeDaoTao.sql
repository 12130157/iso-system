
/***********************************************************
* Purpose : Search "Quyet Dinh" by YEAR and HEDAOTAO
* Author : ToanTT
* Date: 12-04-2010
* Description: Search Quyet Dinh" by YEAR and HEDAOTAO
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].sp_ISO_FindQuyetDinhByYearAndHeDaoTao') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].sp_ISO_FindQuyetDinhByYearAndHeDaoTao
GO
CREATE PROCEDURE sp_ISO_FindQuyetDinhByYearAndHeDaoTao
	@Nam			varchar(4),
	@HeDaoTao	nvarchar(200),
	@result			varchar(1) output
AS
BEGIN
	If exists(
		SELECT Nam_bat_dau, Ma_he_dao_tao
		FROM QuyetDinhMoLop
		WHERE Nam_bat_dau = @Nam AND Ma_he_dao_tao = @HeDaoTao)
		Begin
			SET @result = '1'
		End
	Else
		Begin
			SET @result = '0'
		End
END

