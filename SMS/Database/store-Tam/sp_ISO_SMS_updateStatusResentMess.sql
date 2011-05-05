/***********************************************************
* Purpose : UPDATE STATUS RESENT MESS 
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: UPDATE STATUS RESENT MESS
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_updateStatusResentMess') 
BEGIN
	DROP PROC sp_ISO_SMS_updateStatusResentMess
END
GO
CREATE PROC sp_ISO_SMS_updateStatusResentMess
	@tinh_trang		int,
	@loai_hop_thu	int,
	@id				int
AS
BEGIN
	UPDATE HopThuDi 

	SET	tinh_trang = @tinh_trang , 
		loai_hop_thu = @loai_hop_thu 

	WHERE id = @id
END