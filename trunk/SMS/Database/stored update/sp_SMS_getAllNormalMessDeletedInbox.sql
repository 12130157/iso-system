/***********************************************************
* Purpose : SELECT ALL NORMAL MESSAGE DELETED INBOX
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: GET ALL NORMAL MESS DELETED
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_getAllNormalMessDeletedInbox') 
BEGIN
	DROP PROC sp_SMS_getAllNormalMessDeletedInbox
END
GO
CREATE PROC sp_SMS_getAllNormalMessDeletedInbox
AS
BEGIN
	SELECT	ID,So_dien_thoai,Noi_dung_tin_nhan,Ngay_nhan

	FROM HopThuDen  

	WHERE Loai_hop_thu = 2 AND tinh_trang = 3

	ORDER BY ngay_cap_nhat_cuoi ASC , id DESC
END