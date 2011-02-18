
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_InsertThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_QLTB_InsertThietBi]
GO
create procedure sp_QLTB_InsertThietBi
		@Ten nvarchar(200),
		@MaLoai int,
		@KiHieu nvarchar(100),
		@GhiChu nvarchar(200),
		@MaBoPhan int,
		@MaNguoiTao int,
		@MaPhong int,
		@MaNhaCungCap int,
		@NgaySanXuat datetime,
		@NgayMua datetime,
		@NgayBaoHanh datetime,
		@MaDonViTinh int,
		@TanSuatToiDa numeric,
		@MaDonViTanSuat int,
		@PhuKien nvarchar(80),
		@GiaMua numeric,
		@NguyenTacSuDung nvarchar(2000),
		@DacTinhKyThuat nvarchar(2000),
		@User1 varchar(40),
		@User2 varchar(40),
		@User3 varchar(40),
		@User4 varchar(40),
		@User5 varchar(40)
as
begin			
	DECLARE @SoMay INT
	SELECT TOP 1 @SoMay=So_May FROM ThietBi WHERE ma_phong=@MaPhong ORDER BY So_May DESC
	if @SoMay<>0
		SET @SoMay=(@SoMay+1) 
	else
		SET @SoMay=1 

	INSERT INTO THIETBI
	(	
		Ten,
		Ma_Loai,
		Ki_hieu,
		Ghi_Chu,
		Ma_Bo_Phan,
		Ma_Nguoi_Tao,
		Ma_Phong,
		Ma_Nha_Cung_Cap,
		Ngay_San_Xuat,
		Ngay_Mua,
		Ngay_Bao_Hanh,
		Ma_Don_Vi_Tinh,
		Tan_Suat_Toi_Da,
		Ma_Don_Vi_Tan_Suat,
		Phu_Kien,
		Gia_Mua,
		Nguyen_Tac_Su_Dung,
		Dac_Tinh_Ky_Thuat,
		So_May,
		Ngay_bat_dau_su_dung,
		Ma_tinh_trang,
		So_lan_su_dung,
		So_lan_bao_tri,
		User1,
		User2,
		User3,
		User4,
		User5
	)
	VALUES
	(		
		@Ten,
		@MaLoai,
		@KiHieu,
		@GhiChu,
		@MaBoPhan,
		@MaNguoiTao,
		@MaPhong,
		@MaNhaCungCap,
		@NgaySanXuat,
		@NgayMua,
		@NgayBaoHanh,
		@MaDonViTinh,
		@TanSuatToiDa,
		@MaDonViTanSuat,
		@PhuKien,
		@GiaMua,
		@NguyenTacSuDung,
		@DacTinhKyThuat,
		@SoMay,
		getdate(),
		0,
		0,
		0,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
end