
/***********************************************************
* Purpose : Update "Mo Chuyen Nganh"
* Author : ToanTT
* Date: 12-04-2010
* Description: Update "Mo Chuyen Nganh"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateMoChuyenNganh]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateMoChuyenNganh]
GO
CREATE PROCEDURE sp_ISO_UpdateMoChuyenNganh
	@ID						int,
	@Ma_chuyen_nganh		int,
	@Ghi_chu				int,
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN
	SET @Ngay_cap_nhat_cuoi = GETDATE()	
			
	UPDATE MoChuyenNganh
	SET 
		Ma_chuyen_nganh			=	@Ma_chuyen_nganh,
		Ghi_chu					=	@Ghi_chu,
		User1					=	@User1,
		User2					=	@User2,
		User3					=	@User3,
		User4					=	@User4,
		User5					=	@User5
	WHERE
		ID						=	@ID
END

