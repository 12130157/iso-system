
/***********************************************************
* Purpose : INSERT LichTinNhan
* Author : NGUYEN VAN NUOI
* Date: 9-3-2011
* Description: INSERT LichTinNhan
*/

IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_InertLichTinNhan' ) 
BEGIN
	DROP PROC sp_SMS_InertLichTinNhan
END
GO
CREATE PROC sp_SMS_InertLichTinNhan
	@ID						int,
	@Loai_tai_khoan_SMS		int,
	@Lich_bieu				int,
	@Ma_cu_phap				int,
	@Thoi_gian				datetime,
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40), 
	@User4					varchar(40),
	@User5					varchar(40)
	
AS 
BEGIN
	SELECT	@Ngay_cap_nhat_cuoi = GETDATE()
	INSERT INTO LichTinNhan 
	VALUES (@Loai_tai_khoan_SMS,
			@Lich_bieu,
			@Ma_cu_phap,
			@Thoi_gian,
			@Ngay_cap_nhat_cuoi,
			@User1,
			@User2,
			@User3,
			@User4,
			@User5)
END 