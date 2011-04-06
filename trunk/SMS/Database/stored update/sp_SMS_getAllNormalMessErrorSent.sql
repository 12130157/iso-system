/***********************************************************
* Purpose : SELECT ALL NORMAL MESS ERROR SENT
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: SELECT ALL NORMAL MESS ERROR SENT
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_getAllNormalMessErrorSent') 
BEGIN
	DROP PROC sp_SMS_getAllNormalMessErrorSent
END
GO
CREATE PROC sp_SMS_getAllNormalMessErrorSent
AS
BEGIN
	SELECT id,so_dien_thoai,noi_dung_tin_nhan,ngay_gui 

	FROM HopThuDi 
	
	WHERE tinh_trang = 0 AND loai_hop_thu = 6

	ORDER BY id DESC
END