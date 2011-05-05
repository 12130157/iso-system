/***********************************************************
* Purpose : INSERT HOP THU DI
* Author : NGUYEN CHI TAM
* Date: 9-3-2011
* Description: INSERT HOP THU DI
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_insertMessSent' ) 
BEGIN
	DROP PROC sp_ISO_SMS_insertMessSent
END
GO
CREATE PROC sp_ISO_SMS_insertMessSent
	@So_Dien_Thoai			varchar(40),
	@Noi_Dung_Tin_Nhan		nvarchar(max),
	@Tinh_Trang				int,
	@Loai_Hop_Thu			int,
	@User1					varchar(100),
	@User2					varchar(100),
	@User3					varchar(100), 
	@User4					varchar(100),
	@User5					varchar(100)	
	
AS 
BEGIN
	DECLARE @Ngay_Gui				datetime
	DECLARE	@Ngay_Cap_Nhat_Cuoi		datetime

	SET	@Ngay_Cap_Nhat_Cuoi = GETDATE()
	SET	@Ngay_Gui = GETDATE()
	INSERT INTO HopThuDi 
	VALUES (@So_Dien_Thoai,
			@Noi_Dung_Tin_Nhan,
			@Tinh_Trang,
			@Loai_Hop_Thu,
			@Ngay_Gui,
			@Ngay_Cap_Nhat_Cuoi,
			@User1,
			@User2,
			@User3,
			@User4,
			@User5)
END

-- exec sp_SMS_InertHopThuDi '0975587553',,'abc',1,6,'','','','',''
