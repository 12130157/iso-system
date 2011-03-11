/***********************************************************
* Purpose : INSERT HOPTHUDEN
* Author : Nguyen VAN NUOI
* Date: 8 -3 - 2011
* Description: INSERT HOPTHUDEN
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_InertHopThuDen' ) 
BEGIN
	DROP PROC sp_SMS_InertHopThuDen
END
GO
CREATE PROC sp_SMS_InertHopThuDen
	@ID						int,
	@So_dien_thoai			varchar(20),
	@Ma_cu_phap				int,
	@Noi_dung_tin_nhan		varchar(200),
	@Loai_tin_nhan			int,
	@Tinh_trang				int,
	@Loai_hop_thu			int,
	@Ma_tin_nhan_tra_loi	int,
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(100),
	@User2					varchar(100),
	@User3					varchar(100),
	@User4					varchar(100),
	@User5					varchar(100)	
	
AS 
BEGIN
	SELECT	@Ngay_cap_nhat_cuoi = GETDATE()
	INSERT INTO HopThuDen 
	VALUES (
			@So_dien_thoai,
			@Ma_cu_phap,
			@Noi_dung_tin_nhan,
			@Loai_tin_nhan,
			@Tinh_trang,
			@Loai_hop_thu,
			@Ma_tin_nhan_tra_loi,
			@Ngay_cap_nhat_cuoi,
			@User1,
			@User2,
			@User3,
			@User4,
			@User5)
END 