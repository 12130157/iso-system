if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_XemDiem_UpdateChiTietDiem]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_XemDiem_UpdateChiTietDiem]
GO
CREATE PROC sp_XemDiem_UpdateChiTietDiem
	@ID						int,
	@Ma_dang_ky_mon_hoc		int,
	@Ma_bai_kiem_tra		nvarchar(40),
	@Diem					float,
	@Ghi_chu				nvarchar(40),
	@Ngay_cap_nhat_cuoi		datetime


AS
BEGIN
	set @Ngay_cap_nhat_cuoi = getdate()
	Update ChiTietDiem SET
					Ma_dang_ky_mon_hoc = @Ma_dang_ky_mon_hoc,
					Ma_bai_kiem_tra = @Ma_bai_kiem_tra,
					Diem = @Diem,
					Ghi_chu = @Ghi_chu,
					Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
	Where ID = @ID			
END