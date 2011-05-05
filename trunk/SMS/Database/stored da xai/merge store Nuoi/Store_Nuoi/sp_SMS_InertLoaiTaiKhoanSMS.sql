
/***********************************************************
* Purpose : INSERT LoaiTaiKhoanSMS
* Author : NGUYEN VAN NUOI
* Date: 9-3-2011
* Description: INSERT LoaiTaiKhoanSMS
*/

IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_InertLoaiTaiKhoanSMS' ) 
BEGIN
	DROP PROC sp_SMS_InertLoaiTaiKhoanSMS
END
GO
CREATE PROC sp_SMS_InertLoaiTaiKhoanSMS
	@ID						int,
	@Ten					nvarchar(40),
	@Phi_dich_vu			float,
	@Ghi_chu				nvarchar(100),
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(100),
	@User2					varchar(100),
	@User3					varchar(100), 
	@User4					varchar(100),
	@User5					varchar(100)	
	
AS 
BEGIN
	SELECT	@Ngay_cap_nhat_cuoi = GETDATE()
	INSERT INTO LoaiTaiKhoanSMS 
	VALUES (@Ten,
			@Phi_dich_vu,
			@Ghi_chu,
			@Ngay_cap_nhat_cuoi,
			@User1,
			@User2,
			@User3,
			@User4,
			@User5)
END 