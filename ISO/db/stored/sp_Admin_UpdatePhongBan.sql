/***********************************************************
* Purpose : update phong ban
* Author : TuanHQ
* Date: 02-04-2010S
* Description: update phong ban
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_UpdatePhongBan]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_UpdatePhongBan]
GO
CREATE PROC sp_Admin_UpdatePhongBan
	@ID					int,
	@Ki_hieu_phong		nvarchar(80),
	@Vi_tri				nvarchar(80),
	@Chuc_nang			nvarchar(100),
	@Suc_chua			int,
	@Ngay_cap_nhat_cuoi	datetime

AS
BEGIN
	set @Ngay_cap_nhat_cuoi = getdate()
	update phongban 
	set	 
		Ki_hieu_phong = @Ki_hieu_phong, 
		Vi_tri = @Vi_tri, 
		Chuc_nang = @Chuc_nang, 
		Suc_chua = @Suc_chua, 
		ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
		where ID = @ID


END
