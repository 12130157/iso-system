/***********************************************************
* Purpose : SELECT ALL NORMAL MESSAGE DELETED INBOX
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: GET ALL NORMAL MESS DELETED
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_getAllNormalMessDeletedInbox') 
BEGIN
	DROP PROC sp_ISO_SMS_getAllNormalMessDeletedInbox
END
GO
CREATE PROC sp_ISO_SMS_getAllNormalMessDeletedInbox
AS
BEGIN
	SELECT	ID,So_dien_thoai,Noi_dung_tin_nhan,Ngay_nhan,
			dbo.fnc_ISO_SMS_statusReply(A.Ma_Tin_Nhan_Tra_Loi) AS 'Tinh_trang_Tra_loi'

	FROM HopThuDen  

	WHERE Loai_hop_thu = 2 AND tinh_trang = 3

	ORDER BY ngay_cap_nhat_cuoi ASC , id DESC
END