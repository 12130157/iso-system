
/***********************************************************
* Purpose : INSERT HOP THU DI
* Author : NGUYEN VAN NUOI
* Date: 9-3-2011
* Description: INSERT HOP THU DI
*/

IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_InertHopThuDi' ) 
BEGIN
	DROP PROC sp_SMS_InertHopThuDi
END
GO
CREATE PROC sp_SMS_InertHopThuDi
	@So_dien_thoai			varchar(40),
	@Noi_dung_tin_nhan		nvarchar(200),
	@Tinh_trang				int,
	@Loai_hop_thu			int,
	@User1					varchar(100),
	@User2					varchar(100),
	@User3					varchar(100), 
	@User4					varchar(100),
	@User5					varchar(100)	
	
AS 
BEGIN
	DECLARE @Ngay_gui				datetime
	DECLARE	@Ngay_cap_nhat_cuoi		datetime

	SELECT	@Ngay_cap_nhat_cuoi = GETDATE()
	SELECT	@Ngay_gui = GETDATE()
	INSERT INTO HopThuDi 
	VALUES (@So_dien_thoai,
			@Noi_dung_tin_nhan,
			@Tinh_trang,
			@Loai_hop_thu,
			@Ngay_gui,
			@Ngay_cap_nhat_cuoi,
			@User1,
			@User2,
			@User3,
			@User4,
			@User5)
END

-- exec sp_SMS_InertHopThuDi '0975587553',,'abc',1,6,'','','','',''
