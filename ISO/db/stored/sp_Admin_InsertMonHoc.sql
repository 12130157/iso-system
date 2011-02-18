/***********************************************************
* Purpose : inset mon hoc
* Author : TuanHQ
* Date: 02-04-2010S
* Description: inset mon hoc
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_InsertMonHoc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_InsertMonHoc]
GO
CREATE PROC sp_Admin_InsertMonHoc
	@ID					int output,
	@Ten_mon_hoc		nvarchar(200),
	@Ly_thuyet			int,
	@Thuc_hanh			int,
	@Kiem_tra			int,
	@Tinh_chat			nvarchar(200),
	@Ma_hoc_phan		int,
	@Ma_chuyen_nganh	int,
	@Ngay_tao			datetime,
	@Ma_nguoi_tao		int,
	@Ngay_cap_nhat_cuoi	datetime,
	@Ma_truong_bo_mon	int


AS
BEGIN
	set @Ngay_cap_nhat_cuoi = getdate()
	set @Ngay_tao = getdate()
	insert into monhoc(
					Ten_mon_hoc,
					Ly_thuyet,
					Thuc_hanh,
					Kiem_tra,
					Tinh_chat,
					Ma_hoc_phan,
					Ma_chuyen_nganh,
					Ngay_tao,
					Ma_nguoi_tao,
					Ngay_cap_nhat_cuoi,
					Ma_truong_bo_mon
				)
	values(				
		@Ten_mon_hoc,
		@Ly_thuyet,			
		@Thuc_hanh,			
		@Kiem_tra,			
		@Tinh_chat,			
		@Ma_hoc_phan,		
		@Ma_chuyen_nganh,	
		@Ngay_tao,			
		@Ma_nguoi_tao,		
		@Ngay_cap_nhat_cuoi,	
		@Ma_truong_bo_mon
	)
	SELECT @ID = ID FROM MonHoc WHERE Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
END
