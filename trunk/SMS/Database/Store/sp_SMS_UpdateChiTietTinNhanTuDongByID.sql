/***********************************************************
* Purpose : UPDATE ChiTietTinNhanTuDong
* Author : NGUYEN VAN NUOI
* Date: 8-3-2011
* Description: UPDATE ChiTietTinNhanTuDong
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_UpdateChiTietTinNhanTuDongByID' ) 
BEGIN
	DROP PROC sp_SMS_UpdateChiTietTinNhanTuDongByID
END
GO
CREATE PROC sp_SMS_UpdateChiTietTinNhanTuDongByID
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
	SELECT @Ngay_cap_nhat_cuoi = GETDATE()
	IF EXISTS ( SELECT * FROM ChiTietTinNhanTuDong WHERE ID = @ID )
	BEGIN
		UPDATE ChiTietTinNhanTuDong
		SET
			Ma_tai_khoan_SMS	=	@Ma_tai_khoan_SMS,
			Ma_lich_tin_nhan	=	@Ma_lich_tin_nhan,
			Noi_dung			=	@Noi_dung,
			Tinh_trang			=	@Tinh_trang,
			Ngay_cap_nhat_cuoi	=	@Ngay_cap_nhat_cuoi,
			User1				=	@User1,
			User2				=	@User2,
			User3				=	@User3,
			User4				=	@User4,
			User5				=	@User5
		WHERE ID = @ID
	END
END 