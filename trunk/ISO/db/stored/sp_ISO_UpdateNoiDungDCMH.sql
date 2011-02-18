if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateNoiDungDCMH]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateNoiDungDCMH]
GO
CREATE PROCEDURE sp_ISO_UpdateNoiDungDCMH
	@ID					int,
	@So_thu_tu			int,
	@So_buoi			int,
	@Ma_de_cuong		int,
	@Ten_chuong			nvarchar(4000),
	@Co_hieu			int,
	@So_tiet			int,
	@Ngay_cap_nhat_cuoi	datetime,
	@User1				varchar(40),
	@User2				varchar(40),
	@User3				varchar(40),
	@User4				varchar(40),
	@User5				varchar(40),
	@Muc_tieu			nvarchar(2000)
AS
BEGIN	
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	
	UPDATE NoiDungDCMH
	SET
		So_thu_tu				=	@So_thu_tu,
		So_buoi					=	@So_buoi,
		Ma_de_cuong				=	@Ma_de_cuong,
		Ten_chuong				=	@Ten_chuong,
		Co_hieu					=	@Co_hieu,
		So_tiet					=	@So_tiet,
		Ngay_cap_nhat_cuoi		=	@Ngay_cap_nhat_cuoi,
		User1					=	@User1,
		User2					=	@User2,
		User3					=	@User3,
		User4					=	@User4,
		User5					=	@User5,
		Muc_tieu				=	@Muc_tieu
	WHERE
		ID = @ID
END