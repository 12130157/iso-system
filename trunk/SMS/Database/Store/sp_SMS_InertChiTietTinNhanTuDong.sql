
/***********************************************************
* Purpose : INSERT ChiTietTinNhanTuDong
* Author : NGUYEN VAN NUOI
* Date: 9-3-2011
* Description: INSERT ChiTietTinNhanTuDong
*/

IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_InertChiTietTinNhanTuDong' ) 
BEGIN
	DROP PROC sp_SMS_InertChiTietTinNhanTuDong
END
GO
CREATE PROC sp_SMS_InertChiTietTinNhanTuDong
	@ID						int,
	@Ma_tai_khoan_SMS		int,
	@Ma_lich_tin_nhan		int,
	@Noi_dung				nvarchar(200),
	@Tinh_trang				int,
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40), 
	@User4					varchar(40),
	@User5					varchar(40)
	
AS 
BEGIN
	SELECT	@Ngay_cap_nhat_cuoi = GETDATE()
	INSERT INTO ChiTietTinNhanTuDong 
	VALUES (@Ma_tai_khoan_SMS,
			@Ma_lich_tin_nhan,
			@Noi_dung,
			@Tinh_trang,
			@Ngay_cap_nhat_cuoi,
			@User1,
			@User2,
			@User3,
			@User4,
			@User5)
END 