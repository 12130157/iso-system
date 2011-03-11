
/***********************************************************
* Purpose : INSERT Tai Khoan SMS
* Author : NGUYEN VAN NUOI
* Date: 9-3-2011
* Description: INSERT Tai Khoan SMS
*/

IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_InertTaiKhoanSMS' ) 
BEGIN
	DROP PROC sp_SMS_InertTaiKhoanSMS
END
GO
CREATE PROC sp_SMS_InertTaiKhoanSMS
	@ID						int,
	@So_dien_thoai			varchar(20),
	@Ma_sinh_vien			int,
	@Loai_tai_khoan			int,
	@Ngay_dang_ky			datetime,
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(100),
	@User2					varchar(100),
	@User3					varchar(100), 
	@User4					varchar(100),
	@User5					varchar(100)	
	
AS 
BEGIN
	SELECT	@Ngay_cap_nhat_cuoi = GETDATE()
	INSERT INTO TaiKhoanSMS 
	VALUES (@So_dien_thoai,
			@Ma_sinh_vien,
			@Loai_tai_khoan,
			@Ngay_dang_ky,
			@Ngay_cap_nhat_cuoi,
			@User1,
			@User2,
			@User3,
			@User4,
			@User5)
END 