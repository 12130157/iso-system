/***********************************************************
* Purpose : UPDATE Loaitinnhan
* Author : NGUYEN VAN NUOI
* Date: 8-3-2011
* Description: UPDATE Loaitinnhan
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_UpdateLoaiTinNhanByID' ) 
BEGIN
	DROP PROC sp_SMS_UpdateLoaiTinNhanByID
END
GO
CREATE PROC sp_SMS_UpdateLoaiTinNhanByID
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
	SELECT @Ngay_cap_nhat_cuoi = GETDATE()
	IF EXISTS ( SELECT * FROM LoaiTinNhan WHERE ID = @ID )
	BEGIN
		UPDATE LoaiTinNhan
		SET
			Ten					=	@Ten,
			Ngay_cap_nhat_cuoi	=	@Ngay_cap_nhat_cuoi,
			User1				=	@User1,
			User2				=	@User2,
			User3				=	@User3,
			User4				=	@User4,
			User5				=	@User5
		WHERE ID = @ID
	END
END 