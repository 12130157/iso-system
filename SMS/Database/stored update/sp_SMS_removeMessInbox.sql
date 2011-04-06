/***********************************************************
* Purpose : REMOVE MESSAGE INBOX
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: REMOVE MESSAGE INBOX
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_removeMessInbox') 
BEGIN
	DROP PROC sp_SMS_removeMessInbox
END
GO
CREATE PROC sp_SMS_removeMessInbox
	@id		int
AS
BEGIN
	DELETE HopThuDen 

	WHERE id = @id
END