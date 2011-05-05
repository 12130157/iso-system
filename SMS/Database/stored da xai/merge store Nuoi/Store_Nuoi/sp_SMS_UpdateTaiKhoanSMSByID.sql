/***********************************************************
* Purpose : UPDATE Tai Khoan SMS
* Author : NGUYEN VAN NUOI
* Date: 8-3-2011
* Description: UPDATE Tai Khoan SMS
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_UpdateTaiKhoanSMSByID' ) 
BEGIN
	DROP PROC sp_SMS_UpdateTaiKhoanSMSByID
END
GO
CREATE PROC sp_SMS_UpdateTaiKhoanSMSByID
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
	SELECT @Ngay_cap_nhat_cuoi = GETDATE()
	IF EXISTS ( SELECT * FROM TaiKhoanSMS WHERE ID = @ID )
	BEGIN
		UPDATE TaiKhoanSMS
		SET
			So_dien_thoai		=	@So_dien_thoai,
			Ma_sinh_vien		=	@Ma_sinh_vien,
			Loai_tai_khoan		=	@Loai_tai_khoan,
			Ngay_dang_ky		=	@Ngay_dang_ky,
			Ngay_cap_nhat_cuoi	=	@Ngay_cap_nhat_cuoi,
			User1				=	@User1,
			User2				=	@User2,
			User3				=	@User3,
			User4				=	@User4,
			User5				=	@User5
		WHERE ID = @ID
	END
END 