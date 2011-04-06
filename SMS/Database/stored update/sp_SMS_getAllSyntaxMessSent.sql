/***********************************************************
* Purpose : SELECT ALL SYNTAX MESSAGE SENT
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: GET ALL SYNTAX MESS SENT
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_getAllSyntaxMessSent') 
BEGIN
	DROP PROC sp_SMS_getAllSyntaxMessSent
END
GO
CREATE PROC sp_SMS_getAllSyntaxMessSent
AS
BEGIN
	SELECT A.id,A.so_dien_thoai,A.noi_dung_tin_nhan,
	C.cum_tu_1+''+C.cum_tu_2+''+C.cum_tu_3+''+C.cum_tu_4+''+
	C.cum_tu_5+''+C.cum_tu_6+''+C.cum_tu_7+''+C.cum_tu_8+''+
	C.cum_tu_9+''+C.cum_tu_10 AS 'Cu_Phap',A.ngay_gui 

	FROM  hopthudi AS A
	
	INNER JOIN hopthuden AS B
	ON A.id = B.ma_tin_nhan_tra_loi

	INNER JOIN cuphap AS C
	ON B.ma_cu_phap = C.id

	WHERE A.tinh_trang = 1 AND A.loai_hop_thu = 4 

	ORDER BY id DESC
END