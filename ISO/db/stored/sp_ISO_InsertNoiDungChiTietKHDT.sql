if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertNoiDungChiTietKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertNoiDungChiTietKHDT]
GO
CREATE PROCEDURE sp_ISO_InsertNoiDungChiTietKHDT
	@ID						int			output,
	@Ma_chi_tiet_KHDT		int,
	@Ma_cong_tac			int,
	@Noi_dung_cong_tac		nvarchar(4000),
	@Khoa					int,
	@Ngay_cap_nhat_cuoi		datetime    output,
	@Tinh_trang_thuc_hien	int,
	@Bo_sung				int,
	@Thu					int,
	@Ngay					int,
	@Buoi					int,
	@Gio					int,
	@Phut					int,
	@Ghi_chu				nvarchar(4000),
	@Tinh_trang_phan_cong	int,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN	
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	INSERT INTO NoiDungChiTietKHDT 
	VALUES (
		@Ma_chi_tiet_KHDT,
		@Ma_cong_tac,
		@Khoa,
		@Noi_dung_cong_tac,
		@Ngay_cap_nhat_cuoi,
		@Tinh_trang_thuc_hien,
		@Bo_sung,
		--Phan_cong_tac
		@Thu,
		@Buoi,
		@Gio,
		@Phut,
		@Ghi_chu,
		@Tinh_trang_phan_cong,
		@Ngay,
		--
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	
	SELECT 	@ID=ID, @Ngay_cap_nhat_cuoi = Ngay_cap_nhat_cuoi FROM NoiDungChiTietKHDT WHERE Ngay_cap_nhat_cuoi=@Ngay_cap_nhat_cuoi
END

