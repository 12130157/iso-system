--select * from thietbi
--select * from chitietthietbi

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_UpdateThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_UpdateThietBi]
GO
CREATE PROC sp_QLTB_UpdateThietBi
	--thietbi
	@ID						int,
	@Ten_thiet_bi			VARCHAR(100),
	@Ma_loai				int,
    @Ki_hieu				VARCHAR(20),
    @Ma_tinh_trang			int,
    @Ma_bo_phan				int,
    @Ma_nguoi_tao			int,
	@Ma_phong				int,
	@Ma_nha_cung_cap		int,
	@Ngay_san_xuat			DATETIME,
    @Ngay_mua				DATETIME,
	@Ngay_bao_hanh			DATETIME,
    @Ngay_bat_dau_su_dung	DATETIME,
	@Ma_don_vi_tinh			int,
	@Tan_suat_toi_da		numeric,
	@Tan_suat_su_dung		numeric,
	@Ma_don_vi_tan_suat		int,
	@Phu_kien				VARCHAR(50),
	@Gia_mua				numeric,
	@Nguyen_tac_su_dung		VARCHAR(100),
	@Dac_tinh_ky_thuat		VARCHAR(100),
	@Ngay_cap_nhat_cuoi		DATETIME,
	@So_lan_su_dung			VARCHAR(3),
	@So_lan_bao_tri			VARCHAR(3),
	@So_may					VARCHAR(10),
--chitietthietbi
	--@Ma_chi_tiet_thiet_bi	int,
	@Ten_linh_kien			VARCHAR(100),
	@Dung_luong				VARCHAR(20)

--update thietbi
as
	set @Ngay_cap_nhat_cuoi = GETDATE()
Begin
	Update thietbi 
	set	Ten = @Ten_thiet_bi,
		Ma_loai = @Ma_loai,
		Ki_hieu = @Ki_hieu,
		Ma_tinh_trang = @Ma_tinh_trang,
		Ma_bo_phan = @Ma_bo_phan,
		Ma_nguoi_tao = @Ma_nguoi_tao,
		Ma_phong = @Ma_phong,
		Ma_nha_cung_cap = @Ma_nha_cung_cap,
		Ngay_san_xuat = @Ngay_san_xuat,
		Ngay_mua = @Ngay_mua,
		Ngay_bao_hanh = @Ngay_bao_hanh,
		Ngay_bat_dau_su_dung = @Ngay_bat_dau_su_dung,
		Ma_don_vi_tinh = @Ma_don_vi_tinh,
		Tan_suat_toi_da = @Tan_suat_toi_da,
		Tan_suat_su_dung = @Tan_suat_su_dung,
		Ma_don_vi_tan_suat = @Ma_don_vi_tan_suat,
		Phu_kien = @Phu_kien,
		Gia_mua = @Gia_mua,
		Nguyen_tac_su_dung = @Nguyen_tac_su_dung,
		Dac_tinh_ky_thuat = @Dac_tinh_ky_thuat,		
		Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi,
		So_lan_su_dung = @So_lan_su_dung,
		So_lan_bao_tri = @So_lan_bao_tri,
		So_may = @So_may
	where id = @ID 
	
--update chitietthietbi
	update chitietthietbi
		set		
				Ten_linh_kien = @Ten_linh_kien,
				Dung_luong = @Dung_luong
		where	id = @ID
END

--select * from thietbi
--select * from chitietthietbi
--select * from chitietthanhvien