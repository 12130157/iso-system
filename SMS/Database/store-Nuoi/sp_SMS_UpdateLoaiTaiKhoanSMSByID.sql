/***********************************************************
* Purpose : UPDATE LoaiTaiKhoanSMS
* Author : NGUYEN VAN NUOI
* Date: 8-3-2011
* Description: UPDATE LoaiTaiKhoanSMS
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_UpdateLoaiTaiKhoanSMSByID' ) 
BEGIN
	DROP PROC sp_SMS_UpdateLoaiTaiKhoanSMSByID
END
GO
CREATE PROC sp_SMS_UpdateLoaiTaiKhoanSMSByID
	@ID						int,
	@Ten					nvarchar(40),
	@Phi_dich_vu			float,
	@Ghi_chu				nvarchar(500),
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(100),
	@User2					varchar(100),
	@User3					varchar(100), 
	@User4					varchar(100),
	@User5					varchar(100)	

AS
BEGIN 
	SELECT @Ngay_cap_nhat_cuoi = GETDATE()
	IF EXISTS ( SELECT * FROM LoaiTaiKhoanSMS WHERE ID = @ID )
	BEGIN
		UPDATE LoaiTaiKhoanSMS
		SET
			Ten					=	@Ten,
			Phi_dich_vu			=	@Phi_dich_vu,
			Ghi_chu				=	@Ghi_chu,
			Ngay_cap_nhat_cuoi	=	@Ngay_cap_nhat_cuoi,
			User1				=	@User1,
			User2				=	@User2,
			User3				=	@User3,
			User4				=	@User4,
			User5				=	@User5
		WHERE ID = @ID
	END
END 

select * from LoaiTaiKhoanSMS
exec sp_SMS_UpdateLoaiTaiKhoanSMSByID 1,'DK_3_Ngay',50000,'Dang ky theo tuan (nhan thong tin theo tuan)',getdate(),'','','','',''