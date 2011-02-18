
/***********************************************************
* Purpose : Lay cac thong so tu database
* Author : ThienVD
* Date: 02-04-2010
* Description: Lay cac thong so tu database
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_getSysParams]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_getSysParams]
GO
CREATE PROCEDURE sp_ISO_getSysParams

AS
BEGIN
	SELECT Convert(varchar(10),GETDATE(),110) + ' ' + Convert(varchar(10),GETDATE(),108)  AS GioHeThong			
END