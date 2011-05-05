/***********************************************************
* Purpose : SELECT ALL SYNTAX MESSAGE DELETED INBOX
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: GET ALL SYNTAX MESS DELETED
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_getAllSyntaxMessDeletedInbox') 
BEGIN
	DROP PROC sp_ISO_SMS_getAllSyntaxMessDeletedInbox
END
GO
CREATE PROC sp_ISO_SMS_getAllSyntaxMessDeletedInbox
AS
BEGIN
	SELECT	A.ID,A.So_dien_thoai,A.Noi_dung_tin_nhan,
			B.Cum_tu_1+' '+B.Cum_tu_2+' '+B.Cum_tu_3+
			' '+B.Cum_tu_4+' '+B.Cum_tu_5+' '+B.Cum_tu_6 +
			' '+B.Cum_tu_7 +' '+B.Cum_tu_8 +' '+B.Cum_tu_9 +
			' '+B.Cum_tu_10  AS 'Cu_phap',A.Ngay_nhan
	
	FROM HopThuDen AS A 

	INNER JOIN CuPhap AS B
	ON A.Ma_cu_phap = B.ID

	WHERE A.Loai_hop_thu = 0 AND A.tinh_trang = 3

	ORDER BY A.ngay_cap_nhat_cuoi ASC,A.id DESC
END