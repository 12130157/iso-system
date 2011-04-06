/***********************************************************
* Purpose : REMOVE MESSAGE SENT
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: REMOVE MESSAGE SENT
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_removeMessSent') 
BEGIN
	DROP PROC sp_SMS_removeMessSent
END
GO
CREATE PROC sp_SMS_removeMessSent
	@id		int
AS
BEGIN
	DELETE HopThuDi 

	WHERE id = @id
END