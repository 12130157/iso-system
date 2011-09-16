/***********************************************************
* Purpose : update mon hoc
* Author : TuanHQ
* Date: 02-04-2010S
* Description: update mon hoc
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_UpdateMonHoc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_UpdateMonHoc]
GO
CREATE PROC sp_Admin_UpdateMonHoc
	@ID					nvarchar(5),
	@Ten_mon_hoc		nvarchar(200),
	@Ly_thuyet			nvarchar(5),
	@Thuc_hanh			nvarchar(5),
	@Kiem_tra			nvarchar(5),
	@Tinh_chat			nvarchar(200),
	@Ma_hoc_phan		nvarchar(5),
	@Ma_chuyen_nganh	nvarchar(5),
	@Ngay_tao			datetime,
	@Ma_nguoi_tao		nvarchar(5),
	@Ngay_cap_nhat_cuoi	datetime,
	@Ma_truong_bo_mon	nvarchar(5),
	@He_so				int
AS
BEGIN
	set @Ngay_cap_nhat_cuoi = getdate()
	update monhoc
	set				
		Ten_mon_hoc			=  @Ten_mon_hoc,
		Ly_thuyet			=  @Ly_thuyet,			
		Thuc_hanh			=  @Thuc_hanh,			
		Kiem_tra			=  @Kiem_tra,			
		Tinh_chat			=  @Tinh_chat,			
		Ma_hoc_phan			=  @Ma_hoc_phan,		
		Ma_chuyen_nganh		=  @Ma_chuyen_nganh,	
		Ngay_tao			=  @Ngay_tao,			
		Ma_nguoi_tao		=  @Ma_nguoi_tao,		
		Ngay_cap_nhat_cuoi	=  @Ngay_cap_nhat_cuoi,	
		Ma_truong_bo_mon	=  @Ma_truong_bo_mon,
		User1				=  @He_so
	where ID = @ID	
	
END
