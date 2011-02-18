
/***********************************************************
* Purpose : Update "CHI TIET KE HOACH DAO TAO"
* Author : ThienVD
* Date: 02-04-2010
* Description: Update "CHI TIET KE HOACH DAO TAO"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateChiTietKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateChiTietKHDT]
GO
CREATE PROCEDURE sp_ISO_UpdateChiTietKHDT
	@ID						int,
	@Ma_ke_hoach			int,
	@Tuan					int,
	@Tu_ngay				datetime,
	@Den_ngay				datetime,
	@Ngay_cap_nhat_cuoi		datetime output,
	@Ma_nam_hoc				int,
	@Tinh_trang_phan_cong_tac int,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN

	SET @Ngay_cap_nhat_cuoi = GETDATE()	
			
	UPDATE ChiTietKHDT
	SET 
		Ma_ke_hoach				=	@Ma_ke_hoach,
		Tuan					=	@Tuan,
		Tu_ngay					=	@Tu_ngay,
		Den_ngay				=	@Den_ngay,
		Ngay_cap_nhat_cuoi		=	@Ngay_cap_nhat_cuoi,
		Ma_nam_hoc				=	@Ma_nam_hoc,
		Tinh_trang_phan_cong_tac	= @Tinh_trang_phan_cong_tac,
		User1					=	@User1,
		User2					=	@User2,
		User3					=	@User3,
		User4					=	@User4,
		User5					=	@User5
	WHERE
		ID						=	@ID
	SELECT @Ngay_cap_nhat_cuoi = Ngay_cap_nhat_cuoi FROM ChiTiietKHDT WHERE ID = @ID
END

