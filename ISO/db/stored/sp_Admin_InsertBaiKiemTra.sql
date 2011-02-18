/***********************************************************
* Purpose : inset bai kiem tra
* Author : AnhHX
* Date: 16-09-2010S
* Description: inset bai kiem tra
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_InsertBaiKiemTra]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_InsertBaiKiemTra]
GO
CREATE PROC sp_Admin_InsertBaiKiemTra
	@ID						int output,
	@Ma_mon_hoc				int,
	@Ma_ten_bai_kiem_tra	int,
	@Ma_hinh_thuc			int,
	@Thang_diem				nvarchar(40),
	@Ghi_chu				nvarchar(40),
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					nvarchar(40)


AS
BEGIN
	set @Ngay_cap_nhat_cuoi = getdate()
	insert into baikiemtra(
					Ma_mon_hoc,
					Ma_bai_kiem_tra,
					Ma_hinh_thuc,
					Thang_diem,
					Ghi_chu,
					Ngay_cap_nhat_cuoi,
					User1
				)
	values(				
					@Ma_mon_hoc,
					@Ma_ten_bai_kiem_tra,
					@Ma_hinh_thuc,
					@Thang_diem,
					@Ghi_chu,
					@Ngay_cap_nhat_cuoi,
					@User1
	)
	
	SELECT @ID = ID FROM BaiKiemTra WHERE Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
END
