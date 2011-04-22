--select * from thietbi
--select * from chitietthietbi

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_UpdateThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_UpdateThietBi]
GO
CREATE PROC sp_QLTB_UpdateThietBi
		@ID int,
		@Ten nvarchar(200),
		@Ma_loai int,
		@Ki_hieu nvarchar(100),
		--@Ma_tinh_trang int,
		@Ghi_chu nvarchar(200),
		@Ma_bo_phan int,
		@Ma_nguoi_tao int,
		@Ma_phong int,
		@Ma_nha_cung_cap int,
		@Ngay_san_xuat datetime,
		@Ngay_mua datetime,
		@Han_bao_hanh datetime,
		@Ngay_bat_dau_su_dung datetime,
		--@Ma_don_vi int
		@Tan_suat_toi_da int,
		--@Tan_suat_su_dung int,
		--@Ma_don_vi_tan_suat int,
		@Gia_mua float,
		--@So_lan_su_dung int,
		--@So_lan_bao_tri int,
		@Dac_tinh_ky_thuat nvarchar(2000),
		@Nguyen_tac_su_dung nvarchar(2000),
		--@So_may	int,
		@Ngay_cap_nhat_cuoi	datetime,
		@User1 varchar(40),
		@User2 varchar(40),
		@User3 varchar(40),
		@User4 varchar(40),
		@User5 varchar(40)
as
Begin
	set @Ngay_cap_nhat_cuoi = GETDATE()
	Update thietbi 
	set	Ten = @Ten,
		Ma_loai = @Ma_loai,
		Ki_hieu = @Ki_hieu,
		--Ma_tinh_trang = @Ma_tinh_trang,
		Ma_bo_phan = @Ma_bo_phan,
		Ma_nguoi_tao = @Ma_nguoi_tao,
		Ma_phong = @Ma_phong,
		Ma_nha_cung_cap = @Ma_nha_cung_cap,
		Ngay_san_xuat = @Ngay_san_xuat,
		Ngay_mua = @Ngay_mua,
		Han_bao_hanh = @Han_bao_hanh,
		Ngay_bat_dau_su_dung = @Ngay_bat_dau_su_dung,
		--Ma_don_vi_tinh = @Ma_don_vi_tinh,
		Tan_suat_toi_da = @Tan_suat_toi_da,
		--Tan_suat_su_dung = @Tan_suat_su_dung,
		--Ma_don_vi_tan_suat = @Ma_don_vi_tan_suat,
		Gia_mua = @Gia_mua,
		Nguyen_tac_su_dung = @Nguyen_tac_su_dung,
		Dac_tinh_ky_thuat = @Dac_tinh_ky_thuat,	
		Ghi_chu = @Ghi_chu,	
		Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
		--So_lan_su_dung = @So_lan_su_dung,
		--So_lan_bao_tri = @So_lan_bao_tri,
		--So_may = @So_may
	where id = @ID 
	
--update chitietthietbi
END

--select * from thietbi
--select * from chitietthietbi
--select * from chitietthanhvien