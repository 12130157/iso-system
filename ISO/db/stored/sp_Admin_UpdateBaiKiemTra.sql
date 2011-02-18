/***********************************************************
* Purpose : update bai kiem tra
* Author : AnhHX
* Date: 16-09-2010S
* Description: update bai kiemtra
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_UpdateBaiKiemTra]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_UpdateBaiKiemTra]
GO
CREATE PROC sp_Admin_UpdateBaiKiemTra
	@ID						nvarchar(5),
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
	update baikiemtra
	set				
		Ma_mon_hoc = @Ma_mon_hoc,
		Ma_bai_kiem_tra = @Ma_ten_bai_kiem_tra,
		Ma_hinh_thuc = @Ma_hinh_thuc,
		Thang_diem = @Thang_diem,
		Ghi_chu	= @Ghi_chu,
		Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi,
		User1 = @User1

	where ID = @ID	
	
END
