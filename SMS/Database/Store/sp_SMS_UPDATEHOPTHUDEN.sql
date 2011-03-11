/***********************************************************
* Purpose : UPDATE HOPTHUDEN
* Author : NGUYEN VAN NUOI
* Date: 8-3-2011
* Description: UPDATE HOPTHUDEN
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_UpdateHopThuDenByID' ) 
BEGIN
	DROP PROC sp_SMS_UpdateHopThuDenByID
END
GO
CREATE PROC sp_SMS_UpdateHopThuDenByID
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
	SELECT @Ngay_cap_nhat_cuoi = GETDATE()
	IF EXISTS ( SELECT * FROM HopThuDen WHERE ID = @ID )
	BEGIN
		UPDATE HopThuDen
		SET
			So_dien_thoai		=	@So_dien_thoai,
			Ma_cu_phap			=	@Ma_cu_phap,
			Noi_dung_tin_nhan	=	@Noi_dung_tin_nhan,
			Loai_tin_nhan		=	@Loai_tin_nhan,
			Tinh_trang			=	@Tinh_trang,
			Loai_hop_thu		=	@Loai_hop_thu,
			Ma_tin_nhan_tra_loi	=	@Ma_tin_nhan_tra_loi,
			Ngay_cap_nhat_cuoi	=	@Ngay_cap_nhat_cuoi,
			User1				=	@User1,
			User2				=	@User2,
			User3				=	@User3,
			User4				=	@User4,
			User5				=	@User5
		WHERE ID = @ID
	END
END 