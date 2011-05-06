IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_UpdateChiTietTaiKhoanByID' ) 
BEGIN
	DROP PROC sp_SMS_UpdateChiTietTaiKhoanByID
END
GO
CREATE PROC sp_SMS_UpdateChiTietTaiKhoanByID
	@ID						int,
	@Ma_tai_khoan_SMS		int,
	@Dang_ky_thang			int,
	@Dang_ky_nam			int,
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(100),
	@User2					varchar(100),
	@User3					varchar(100),
	@User4					varchar(100),
	@User5					varchar(100)	
AS
BEGIN
	SELECT @Ngay_cap_nhat_cuoi = GETDATE()
	IF EXISTS ( SELECT * FROM ChiTietTaiKhoanSMS WHERE ID = @ID )
	BEGIN
		UPDATE ChiTietTaiKhoanSMS
		SET
			Ma_tai_khoan_SMS	=	@Ma_tai_khoan_SMS,
			Dang_ky_thang		=	@Dang_ky_thang,
			Dang_ky_nam			=	@Dang_ky_nam,
			Ngay_cap_nhat_cuoi	=	@Ngay_cap_nhat_cuoi,
			User1				=	@User1,
			User2				=	@User2,
			User3				=	@User3,
			User4				=	@User4,
			User5				=	@User5
		WHERE ID = @ID
	END
END 