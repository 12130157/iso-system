/***********************************************************
* Purpose : SELECT ALL NORMAL MESSAGE INBOX
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: GET ALL NORMAL MESS
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_getAllNormalMessInbox') 
BEGIN
	DROP PROC sp_ISO_SMS_getAllNormalMessInbox
END
GO
CREATE PROC sp_ISO_SMS_getAllNormalMessInbox
AS
BEGIN
	SELECT	A.ID,A.So_dien_thoai,A.Noi_dung_tin_nhan,
			dbo.statusToString(A.Tinh_trang) AS 'Tinh_trang',
			A.Ngay_nhan

	FROM HopThuDen AS A 

	WHERE A.Loai_hop_thu = 2 AND A.tinh_trang != 3

	ORDER BY A.Tinh_trang ASC , A.id DESC
END