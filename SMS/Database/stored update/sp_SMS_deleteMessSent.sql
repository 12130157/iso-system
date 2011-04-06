/***********************************************************
* Purpose : DELETE MESSAGE SENT
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: DELETE MESSAGE SENT INTO DELETED SENT
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_deleteMessSent') 
BEGIN
	DROP PROC sp_SMS_deleteMessSent
END
GO
CREATE PROC sp_SMS_deleteMessSent
	@id		int
AS
BEGIN
	UPDATE HopThuDi 

	SET tinh_trang = 3,
		ngay_cap_nhat_cuoi = GETDATE() 
	
	WHERE id = @id
END