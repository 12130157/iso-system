/***********************************************************
* Purpose : UPDATE MA_TIN_NHAN_TRA_LOI = -1 INBOX TO DELETE MESS SENT 
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: UPDATE MA_TIN_NHAN_TRA_LOI = -1 INBOX TO DELETE MESS SENT
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_updateMaTinNhanTraLoiInbox') 
BEGIN
	DROP PROC sp_SMS_updateMaTinNhanTraLoiInbox
END
GO
CREATE PROC sp_SMS_updateMaTinNhanTraLoiInbox
	@ma_tin_nhan_tra_loi		int
AS
BEGIN
	UPDATE hopthuden
	
	SET ma_tin_nhan_tra_loi = null 
	
	WHERE ma_tin_nhan_tra_loi = @ma_tin_nhan_tra_loi
END