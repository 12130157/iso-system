
/***********************************************************
* Purpose : Insert "LOP HOC"
* Author : ToanTT
* Date: 12-05-2010
* Description: Insert "LOP HOC"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertLopHoc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertLopHoc]
GO
CREATE PROCEDURE sp_ISO_InsertLopHoc
	@Ma_chuyen_nganh		int,
	@Ki_hieu				varchar(10),
	@Ma_lop_truong			int,
	@Ma_quyet_dinh			int,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN	
	INSERT INTO LopHoc
	VALUES (
		@Ma_chuyen_nganh,
		@Ki_hieu,
		@Ma_lop_truong,
		@Ma_quyet_dinh,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
END

