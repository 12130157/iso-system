/***********************************************************
* Purpose : SELECT ALL NORMAL MESSAGE SENT
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: GET ALL NORMAL MESS SENT
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_getAllNormalMessSent') 
BEGIN
	DROP PROC sp_ISO_SMS_getAllNormalMessSent
END
GO
CREATE PROC sp_ISO_SMS_getAllNormalMessSent
AS
BEGIN
	SELECT id,so_dien_thoai,noi_dung_tin_nhan,ngay_gui 

	FROM hopthudi 
	
	WHERE tinh_trang = 1 AND loai_hop_thu = 6 

	ORDER BY id DESC
END