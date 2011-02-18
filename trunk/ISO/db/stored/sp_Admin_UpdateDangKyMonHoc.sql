/***********************************************************
* Purpose : update dang ky mon hoc
* Author : AnhHX
* Date: 16-09-2010S
* Description: update dang ky mon hoc
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_UpdateDangKyMonHoc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_UpdateDangKyMonHoc]
GO
CREATE PROC sp_Admin_UpdateDangKyMonHoc
	@ID						nvarchar(5),
	@Ma_mon_hoc_TKB		int,
	@Ma_hoc_vien			int,
	@Diem_trung_binh		float,
	@Hanh_kiem				nvarchar(40),
	@Hoc_luc				nvarchar(40),
	@Danh_hieu				nvarchar(40),
	@Ghi_chu				nvarchar(40),
	@Ngay_cap_nhat_cuoi		datetime


AS
BEGIN
	set @Ngay_cap_nhat_cuoi = getdate()
	update dangkymonhoc
	set				
		--Ma_mon_hoc_TKB = @Ma_mon_hoc_TKB,
		--Ma_hoc_vien = @Ma_hoc_vien,
		Diem_trung_binh = @Diem_trung_binh,
		--Hanh_kiem = @Hanh_kiem,
		--Hoc_luc = @Hoc_luc,
		--Danh_hieu = @Danh_hieu,
		--Ghi_chu	= @Ghi_chu,
		Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi

	where ID = @ID	
	
END
