
/***********************************************************
* Purpose : Insert "CHI TIET KE HOACH DAO TAO"
* Author : ThienVD
* Date: 02-04-2010
* Description: Insert "CHI TIET KE HOACH DAO TAO"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertChiTietKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertChiTietKHDT]
GO
CREATE PROCEDURE sp_ISO_InsertChiTietKHDT
	@ID						int			output,
	@Ma_ke_hoach			int,
	@Tuan					int,
	@Tu_ngay				datetime,
	@Den_ngay				datetime,
	@Ngay_cap_nhat_cuoi		datetime    output,
	@Ma_nam_hoc				int,
	@Tinh_trang_phan_cong_tac	int,
	@Delay_days				int,
	@Ghi_chu				nvarchar(4000),
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN	
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	DECLARE @Close_date datetime
	SET @Close_date = DATEADD(day, @Delay_days, @Den_ngay)
	INSERT INTO ChiTietKHDT
	VALUES ( 
		@Ma_ke_hoach,
		@Tuan,
		@Tu_ngay,
		@Den_ngay,
		@Ngay_cap_nhat_cuoi,
		@Ma_nam_hoc,
		@Tinh_trang_phan_cong_tac,
		@Close_date,
		@Ghi_chu,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	
	SELECT 	@ID=ID, @Ngay_cap_nhat_cuoi = Ngay_cap_nhat_cuoi FROM ChiTietKHDT WHERE Ngay_cap_nhat_cuoi=@Ngay_cap_nhat_cuoi
END

