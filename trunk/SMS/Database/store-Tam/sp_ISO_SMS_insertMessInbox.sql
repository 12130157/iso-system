/***********************************************************
* Purpose : INSERT HOPTHUDEN
* Author : Nguyen VAN NUOI
* Date: 8 -3 - 2011
* Description: INSERT HOPTHUDEN
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_insertMessInbox' ) 
BEGIN
	DROP PROC sp_ISO_SMS_insertMessInbox
END
GO
CREATE PROC sp_ISO_SMS_insertMessInbox
	@So_Dien_Thoai			varchar(20),
	@Ma_Cu_Phap				int,
	@Noi_Dung_Tin_Nhan		nvarchar(500),
	@Tinh_Trang				int,
	@Loai_Hop_Thu			int,
	@Ma_Tin_Nhan_Tra_Loi	int,
	@User1					varchar(max),
	@User2					varchar(max),
	@User3					varchar(max),
	@User4					varchar(max),
	@User5					varchar(max)	
	
AS 
BEGIN
	DECLARE @Ngay_Nhan				datetime
	DECLARE	@Ngay_Cap_Nhat_Cuoi		datetime

	SET	@Ngay_Cap_Nhat_Cuoi = GETDATE()
	SET	@Ngay_Nhan = GETDATE()

	INSERT INTO HopThuDen 
	VALUES (@So_Dien_Thoai,
			@Ma_Cu_Phap,
			@Noi_Dung_Tin_Nhan,
			@Tinh_Trang,
			@Loai_Hop_Thu,
			@Ma_Tin_Nhan_Tra_Loi,
			@Ngay_Nhan,
			@Ngay_cap_nhat_cuoi,
			@User1,
			@User2,
			@User3,
			@User4,
			@User5)
END 