/***********************************************************
* Purpose : SELECT 1 CUM CU PHAP 
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: SELECT 1 CUM CU PHAP
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_getCumCuPhap') 
BEGIN
	DROP PROC sp_ISO_SMS_getCumCuPhap
END
GO
CREATE PROC sp_ISO_SMS_getCumCuPhap
	@cumCuPhap		nvarchar(100)
AS
BEGIN
	SELECT * 

	FROM cuphap 

	WHERE cum_tu_1 + cum_tu_2 + cum_tu_3 + 
	cum_tu_4 + cum_tu_5 + cum_tu_6 + cum_tu_7 +
	cum_tu_8 + cum_tu_9 + cum_tu_10 = @cumCuPhap
END