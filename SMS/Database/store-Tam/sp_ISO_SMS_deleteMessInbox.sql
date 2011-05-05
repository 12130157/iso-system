/***********************************************************
* Purpose : DELETE MESSAGE INBOX
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: DELETE MESSAGE INBOX INTO DELETED INBOX
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_deleteMessInbox') 
BEGIN
	DROP PROC sp_ISO_SMS_deleteMessInbox
END
GO
CREATE PROC sp_ISO_SMS_deleteMessInbox
	@id		int
AS
BEGIN
	UPDATE HopThuDen 

	SET tinh_trang = 3,
	ngay_cap_nhat_cuoi = GETDATE() 

	WHERE id = @id
END