if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateThoiKhoaBieu]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateThoiKhoaBieu]
GO 
CREATE PROCEDURE sp_ISO_UpdateThoiKhoaBieu
	@ID						int output,
	@Ma_lop					int,
	@Tuan_bat_dau			int,
	@Tuan_ket_thuc			int,
	@Ngay_bat_dau			datetime,
	@Ngay_ket_thuc			datetime,
	@Ma_nguoi_tao			int,
	--@Ngay_tao				datetime,
	@Ma_nguoi_duyet			int,
	@Ngay_duyet				datetime,
	@Ngay_cap_nhat_cuoi		varchar(30) output,
	@Ten					nvarchar(200),
	@Tinh_trang				int,
	@Ly_do_reject			nvarchar(2000),
	@Hoc_ki					int,
	@Nam_bat_dau			nvarchar(20),
	@Nam_ket_thuc			nvarchar(20),
	@Ngay_gui				datetime,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40) 
AS
BEGIN
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	
	UPDATE ThoiKhoaBieu
	SET 
		Ma_lop				=	@Ma_lop,
		Tuan_bat_dau		=	@Tuan_bat_dau,
		Tuan_ket_thuc		=	@Tuan_ket_thuc,
		Ngay_bat_dau		=	@Ngay_bat_dau,
		Ngay_ket_thuc		=	@Ngay_ket_thuc,
		Ma_nguoi_tao		=	@Ma_nguoi_tao,
		--Ngay_tao			=	@Ngay_tao,
		Ma_nguoi_duyet		=	@Ma_nguoi_duyet,
		Ngay_duyet			=	@Ngay_duyet,
		Ngay_cap_nhat_cuoi	=	@Ngay_cap_nhat_cuoi,
		Ten					=	@ten,
		Tinh_trang			=	@Tinh_trang,
		Ly_do_reject		=	@Ly_do_reject,
		Hoc_ki				=	@Hoc_ki,
		Nam_bat_dau			=	@Nam_bat_dau,
		Nam_ket_thuc		=	@Nam_ket_thuc,
		Ngay_gui			=	@Ngay_gui,
		--User1				=	@User1,
		User2				=	@User2,
		User3				=	@User3,
		User4				=	@User4,
		User5				=	@User5
	WHERE
		ID				=	@ID
	
	SELECT	@Ngay_cap_nhat_cuoi= Convert(varchar(10),Ngay_cap_nhat_cuoi,110)
	FROM ThoiKhoaBieu A 
	WHERE A.ID = @ID	
END