/***********************************************************
* Purpose : UPDATE LichTinNhan
* Author : NGUYEN VAN NUOI
* Date: 8-3-2011
* Description: UPDATE LichTinNhan
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_UpdateLichTinNhanByID' ) 
BEGIN
	DROP PROC sp_SMS_UpdateLichTinNhanByID
END
GO
CREATE PROC sp_SMS_UpdateLichTinNhanByID
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
	SELECT @Ngay_cap_nhat_cuoi = GETDATE()
	IF EXISTS ( SELECT * FROM LichTinNhan WHERE ID = @ID )
	BEGIN
		UPDATE LichTinNhan
		SET
			Loai_tai_khoan_SMS	=	@Loai_tai_khoan_SMS,
			Lich_bieu			=	@Lich_bieu,
			Ma_cu_phap			=	@Ma_cu_phap,
			Thoi_gian			=	@Thoi_gian,
			Ngay_cap_nhat_cuoi	=	@Ngay_cap_nhat_cuoi,
			User1				=	@User1,
			User2				=	@User2,
			User3				=	@User3,
			User4				=	@User4,
			User5				=	@User5
		WHERE ID = @ID
	END
END 