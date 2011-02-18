if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateNoiDungChiTietKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateNoiDungChiTietKHDT]
GO
CREATE PROCEDURE sp_ISO_UpdateNoiDungChiTietKHDT
	@ID						int,
	@Ma_chi_tiet_KHDT		int,
	@Ma_cong_tac			int,
	@Noi_dung_cong_tac		nvarchar(4000),
	@Khoa					int,
	@Ngay_cap_nhat_cuoi		datetime    output,
	@Tinh_trang_thuc_hien	int,
	@Bo_sung				int,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40),
	@Gio					int,
	@Phut					int,
	@Thu					int,
	@Ghi_chu				nvarchar(4000),
	@Buoi					int,
	@Ngay					varchar(10),
	@Tinh_trang_phan_cong	varchar
AS
BEGIN	
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	UPDATE NoiDungChiTietKHDT 
	SET
		Ma_chi_tiet_KHDT	=	@Ma_chi_tiet_KHDT,
		Ma_cong_tac			=	@Ma_cong_tac,
		Khoa				=	@Khoa,
		Noi_dung_cong_tac	=	@Noi_dung_cong_tac,
		Ngay_cap_nhat_cuoi	=	@Ngay_cap_nhat_cuoi,
		Tinh_trang_thuc_hien	=	@Tinh_trang_thuc_hien,
		Tinh_trang_phan_cong	=	@Tinh_trang_phan_cong,
		Bo_sung				=	@Bo_sung,
		Gio						=	@Gio,
		Phut					=	@Phut,
		Thu						=	@Thu,
		Ghi_chu					=	@Ghi_chu,
		Buoi					=	@Buoi,
		Ngay					=	@Ngay,
		User1				=	@User1,
		User2				=	@User2,
		User3				=	@User3,
		User4				=	@User4,
		User5				=	@User5
	WHERE ID = @ID
	SELECT 	@Ngay_cap_nhat_cuoi = Ngay_cap_nhat_cuoi FROM NoiDungChiTietKHDT WHERE ID = @ID
END
