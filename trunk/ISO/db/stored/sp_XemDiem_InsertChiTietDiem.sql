if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_XemDiem_InsertChiTietDiem]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_XemDiem_InsertChiTietDiem]
GO
CREATE PROC sp_XemDiem_InsertChiTietDiem
	@ID						int output,
	@Ma_dang_ky_mon_hoc		int,
	@Ma_bai_kiem_tra		nvarchar(40),
	@Diem					float,
	@Ghi_chu				nvarchar(40),
	@Ngay_cap_nhat_cuoi		datetime


AS
BEGIN
	set @Ngay_cap_nhat_cuoi = getdate()
	insert into ChiTietDiem(
					Ma_dang_ky_mon_hoc,
					Ma_bai_kiem_tra,
					Diem,
					Ghi_chu,
					Ngay_cap_nhat_cuoi
				)
	values(				
					@Ma_dang_ky_mon_hoc,
					@Ma_bai_kiem_tra,
					@Diem,
					@Ghi_chu,
					@Ngay_cap_nhat_cuoi
	)
	
	SELECT @ID = ID FROM ChiTietDiem WHERE Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
END
