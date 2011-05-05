/***********************************************************
* Purpose : SELECT ALL NORMAL MESS DELETED SENT
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: SELECT ALL NORMAL MESS DELETED SENT
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_getAllNormalMessDeletedSent') 
BEGIN
	DROP PROC sp_ISO_SMS_getAllNormalMessDeletedSent
END
GO
CREATE PROC sp_ISO_SMS_getAllNormalMessDeletedSent
AS
BEGIN
	SELECT id,so_dien_thoai,noi_dung_tin_nhan,ngay_gui 

	FROM HopThuDi 

	WHERE tinh_trang = 3 AND loai_hop_thu = 6
END