
/***********************************************************
* Purpose : INSERT loai tin nhan
* Author : NGUYEN VAN NUOI
* Date: 28-2-2011
* Description: INSERT loai tin nhan
*/

IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_InertLoaiTinNhan' ) 
BEGIN
	DROP PROC sp_SMS_InertLoaiTinNhan
END
GO
CREATE PROC sp_SMS_InertLoaiTinNhan
	@ID						int,
	@Ten					nvarchar(40),
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40), 
	@User4					varchar(40),
	@User5					varchar(40)	
	
AS 
BEGIN
	SELECT	@Ngay_cap_nhat_cuoi = GETDATE()
	INSERT INTO LoaiTinNhan 
	VALUES (@Ten,
			@Ngay_cap_nhat_cuoi,
			@User1,
			@User2,
			@User3,
			@User4,
			@User5)
END 