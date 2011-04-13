/***********************************************************
* Purpose : INSERT CHI TIET TAI KHOAN
* Author : NGUYEN VAN NUOI
* Date: 28-2-2011
* Description: INSERT CU PHAP
*/

IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_InertChiTietTaiKhoan' ) 
BEGIN
	DROP PROC sp_SMS_InertChiTietTaiKhoan
END
GO
CREATE PROC sp_SMS_InertChiTietTaiKhoan
	@ID						int,
	@Ma_tai_khoan_SMS		int,
	@Dang_ky_thang			int,
	@Dang_ky_nam			int,
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)	
	
AS 
BEGIN
	SELECT	@Ngay_cap_nhat_cuoi = GETDATE()
	INSERT INTO ChiTietTaiKhoanSMS 
	VALUES (@Ma_tai_khoan_SMS,
			@Dang_ky_thang,
			@Dang_ky_nam,
			@Ngay_cap_nhat_cuoi,
			@User1,
			@User2,
			@User3,
			@User4,
			@User5)
END 