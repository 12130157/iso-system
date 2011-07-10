

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_UpdateChiTietThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_QLTB_UpdateChiTietThietBi]
GO
create procedure sp_QLTB_UpdateChiTietThietBi
		@ID						int,
		@Ten_linh_kien			nvarchar(100),
		@Ma_loai_linh_kien		int,
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
begin			
	SET @Ngay_cap_nhat_cuoi = getdate()
	UPDATE CHITIETTHIETBI SET
		Ten_linh_kien					= @Ten_linh_kien,
		Ma_loai_linh_kien				= @Ma_loai_linh_kien,
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
	WHERE ID							= @ID 
end
