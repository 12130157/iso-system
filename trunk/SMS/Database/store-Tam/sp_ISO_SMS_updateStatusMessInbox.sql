/***********************************************************
* Purpose : UPDATE STATUS MESSAGE INBOX
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: UPDATE STATUS MESS INBOX (READ/UREAD)
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_updateStatusMessInbox') 
BEGIN
	DROP PROC sp_ISO_SMS_updateStatusMessInbox
END
GO
CREATE PROC sp_ISO_SMS_updateStatusMessInbox
	@id		int
AS
BEGIN
	UPDATE HopThuDen 

	SET tinh_trang = 1,
		ngay_cap_nhat_cuoi = GETDATE() 

	WHERE id = @id
END
