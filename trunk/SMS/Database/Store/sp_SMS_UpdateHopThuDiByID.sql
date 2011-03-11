/***********************************************************
* Purpose : UPDATE HOPTHUDI
* Author : NGUYEN VAN NUOI
* Date: 8-3-2011
* Description: UPDATE HOPTHUDI
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_UpdateHopThuDiByID' ) 
BEGIN
	DROP PROC sp_SMS_UpdateHopThuDiByID
END
GO
CREATE PROC sp_SMS_UpdateHopThuDiByID
	@ID						int,
	@So_dien_thoai			varchar(40),
	@Noi_dung_tin_nhan		nvarchar(200),
	@Tinh_trang				int,
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(100),
	@User2					varchar(100),
	@User3					varchar(100), 
	@User4					varchar(100),
	@User5					varchar(100)

AS
BEGIN 
	SELECT @Ngay_cap_nhat_cuoi = GETDATE()
	IF EXISTS ( SELECT * FROM HopThuDi WHERE ID = @ID )
	BEGIN
		UPDATE HopThuDi
		SET
			So_dien_thoai		=	@So_dien_thoai,
			Noi_dung_tin_nhan	=	@Noi_dung_tin_nhan,
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