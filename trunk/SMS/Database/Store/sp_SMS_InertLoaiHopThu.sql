
/***********************************************************
* Purpose : INSERT loai hop thu
* Author : NGUYEN VAN NUOI
* Date:8-3-2011
* Description: INSERT loai hop thu
*/

IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_InertLoaiHopThu' ) 
BEGIN
	DROP PROC sp_SMS_InertLoaiHopThu
END
GO
CREATE PROC sp_SMS_InertLoaiHopThu
	@ID						int,
	@Ten					nvarchar(40),
	@Ghi_chu				nvarchar(100),
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40), 
	@User4					varchar(40),
	@User5					varchar(40)	
	
AS 
BEGIN
	SELECT	@Ngay_cap_nhat_cuoi = GETDATE()
	INSERT INTO LoaiHopThu 
	VALUES (@Ten,
			@Ghi_chu,
			@Ngay_cap_nhat_cuoi,
			@User1,
			@User2,
			@User3,
			@User4,
			@User5)
END 