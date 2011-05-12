/***********************************************************
* Purpose : SELECT COUNT MESSAGE UNREAD
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: GET COUNT MESSAGE UNREAD
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_getCountMessUnread') 
BEGIN
	DROP PROC sp_ISO_SMS_getCountMessUnread
END
GO
CREATE PROC sp_ISO_SMS_getCountMessUnread	
AS
BEGIN
	SELECT COUNT(*) FROM HopThuDen WHERE Tinh_Trang = 0
END

--declare @i int 
--exec sp_ISO_SMS_getCountMessUnread @i output
--print @i