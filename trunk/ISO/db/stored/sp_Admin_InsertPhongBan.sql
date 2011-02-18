/***********************************************************
* Purpose : insert phong ban
* Author : TuanHQ
* Date: 02-04-2010S
* Description: insert phong ban
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_InsertPhongBan]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_InsertPhongBan]
GO
CREATE PROC sp_Admin_InsertPhongBan

	@Ki_hieu_phong		nvarchar(80),
	@Vi_tri				nvarchar(80),
	@Chuc_nang			nvarchar(100),
	@Suc_chua			int,
	@Ngay_cap_nhat_cuoi	datetime

AS
BEGIN
	set @Ngay_cap_nhat_cuoi = getdate()
	insert into phongban (Ki_hieu_phong, Vi_tri, Chuc_nang, Suc_chua, ngay_cap_nhat_cuoi)
	values(@Ki_hieu_phong, @Vi_tri, @Chuc_nang, @Suc_chua, @Ngay_cap_nhat_cuoi)
END
