
/***********************************************************
* Purpose : update lop hoc
* Author : TuanHQ
* Date: 18-04-2010S
* Description: update lop hoc
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_UpdateChuyenNganh]'))
drop proc [sp_Admin_UpdateChuyenNganh]
GO
CREATE PROC sp_Admin_UpdateChuyenNganh

	@ID					int,
	@Ten_chuyen_nganh	nvarchar(200),
	@Ki_hieu			nvarchar(80),
	@Ma_khoaTT			int,
	@Ngay_tao			datetime,
	@Ngay_cap_nhat_cuoi	datetime
AS
BEGIN

	set @Ngay_tao = getdate()
	set @Ngay_cap_nhat_cuoi = getdate()
	Update chuyennganh 
	Set 
		Ten_chuyen_nganh = @Ten_chuyen_nganh,
		Ki_hieu = @Ki_hieu,
		Ma_khoaTT = @Ma_khoaTT,
		Ngay_tao = @Ngay_tao
	where ID = @ID
END