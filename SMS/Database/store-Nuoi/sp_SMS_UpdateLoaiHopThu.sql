/***********************************************************
* Purpose : UPDATE LOAIHOPTHUDEN
* Author : NGUYEN VAN NUOI
* Date: 8-3-2011
* Description: UPDATE LOAIHOPTHUDEN
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_UpdateLoaiHopThuByID' ) 
BEGIN
	DROP PROC sp_SMS_UpdateLoaiHopThuByID
END
GO
CREATE PROC sp_SMS_UpdateLoaiHopThuByID
	@ID						int,
	@Ten					nvarchar(40),
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
	IF EXISTS ( SELECT * FROM LoaiHopThu WHERE ID = @ID )
	BEGIN
		UPDATE LoaiHopThu
		SET
			Ten					=	@Ten,
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