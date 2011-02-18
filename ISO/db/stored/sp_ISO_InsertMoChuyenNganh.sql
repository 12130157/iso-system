
/***********************************************************
* Purpose : Insert "MO CHUYEN NGANH"
* Author : ToanTT
* Date: 12-04-2010
* Description: Insert "MO CHUYEN NGANH"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertMoChuyenNganh]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertMoChuyenNganh]
GO
CREATE PROCEDURE sp_ISO_InsertMoChuyenNganh
	@ID						int			output,
	@Ma_chuyen_nganh		int,
	@Ma_quyet_dinh			int,
	@Ghi_chu				int,
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN	
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	
	INSERT INTO MoChuyenNganh
	VALUES (
		@Ma_chuyen_nganh,
		@Ma_quyet_dinh,
		@Ghi_chu,
		@Ngay_cap_nhat_cuoi,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	
	SELECT 	@ID=ID FROM MoChuyenNganh WHERE Ngay_cap_nhat_cuoi=@Ngay_cap_nhat_cuoi
END

