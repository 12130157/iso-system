
/***********************************************************
* Purpose : Insert "KHOA_TT"
* Author : HuyenLY
* Date: 09-06-2010
* Description: Insert "KHOA_TT"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_InsertKhoaTT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_InsertKhoaTT]
GO
CREATE PROCEDURE sp_Admin_InsertKhoaTT
	
	@Ten					NVARCHAR(100),
	@Ma_truong_khoa			INT,
	@Nguoi_tao				INT
	
	
AS
BEGIN
	DECLARE	@Ngay_tao SMALLDATETIME
	DECLARE	@Ngay_cap_nhat_cuoi SMALLDATETIME
	SET @Ngay_tao = getdate()
	SET @Ngay_cap_nhat_cuoi = getdate()

		
	INSERT INTO Khoa_TrungTam(Ten,Ma_truong_khoa,Ngay_tao,Nguoi_tao,Ngay_cap_nhat_cuoi)
	VALUES (
		@Ten,
		@Ma_truong_khoa,
		@Ngay_tao,
		@Nguoi_tao,
		@Ngay_cap_nhat_cuoi
	)
END

