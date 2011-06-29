--select * from thietbi
--select * from chitietthietbi

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_UpdateThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_UpdateThietBi]
GO
CREATE PROC sp_QLTB_UpdateThietBi
		@ID						int,
		@Ten					nvarchar(100),
		@Ma_loai				int,
		@Ki_hieu				nvarchar(100),
		@Ma_tinh_trang			int,
		@Ghi_chu				nvarchar(1000),
		@Ma_nguoi_tao			int,
		@Ma_nha_cung_cap		int,
		@Ngay_san_xuat			datetime,
		@Ngay_mua				datetime,
		@Han_bao_hanh			datetime,
		@Ngay_bat_dau_su_dung	datetime,
		@Tan_suat_toi_da		int,
		@Gia_mua				float,
		@Dac_tinh_ky_thuat		nvarchar(2000),
		@Nguyen_tac_su_dung		nvarchar(2000),
		@So_lan_su_dung			int,
		@So_lan_bao_tri			int,
		@Ma_tan_suat			int,
		@Tan_suat_su_dung		float,
		@Ngay_cap_nhat_cuoi		datetime,
		@User1					varchar(40),
		@User2					varchar(40),
		@User3					varchar(40),
		@User4					varchar(40),
		@User5					varchar(40)
as
Begin
	set @Ngay_cap_nhat_cuoi = GETDATE()
	Update thietbi 
	set	Ten								= @Ten,
		Ma_loai							= @Ma_loai,
		Ki_hieu							= @Ki_hieu,
		--Ma_tinh_trang					= @Ma_tinh_trang,
		--Ma_nguoi_tao					= @Ma_nguoi_tao,
		Ma_nha_cung_cap					= @Ma_nha_cung_cap,
		Ngay_san_xuat					= @Ngay_san_xuat,
		Ngay_mua						= @Ngay_mua,
		Han_bao_hanh					= @Han_bao_hanh,
		Ngay_bat_dau_su_dung			= @Ngay_bat_dau_su_dung,
		Tan_suat_toi_da					= @Tan_suat_toi_da,
		Gia_mua							= @Gia_mua,
		Dac_tinh_ky_thuat				= @Dac_tinh_ky_thuat,	
		Tan_suat_su_dung				= @Tan_suat_su_dung,
		Nguyen_tac_su_dung				= @Nguyen_tac_su_dung,
		--So_lan_su_dung				= @So_lan_su_dung,
		--So_lan_bao_tri				= @So_lan_bao_tri,
		Ghi_chu							= @Ghi_chu,	
		Ma_tan_suat						= @Ma_tan_suat,
		Ngay_cap_nhat_cuoi				= @Ngay_cap_nhat_cuoi,
		User1							= @User1,
		User2							= @User2,
		User3							= @User3,
		User4							= @User4,
		User5							= @User5
	where ID							= @ID 
	
--update chitietthietbi
END

--select * from thietbi
--select * from chitietthietbi
--select * from chitietthanhvien
--select * from tansuat