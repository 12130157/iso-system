
/***********************************************************
* Purpose : Update "QUYET DINH MO LOP"
* Author : ToanTT
* Date: 12-04-2010
* Description: Update "QUYET DINH MO LOP"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateQuyetDinhMoLop]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateQuyetDinhMoLop]
GO
CREATE PROCEDURE sp_ISO_UpdateQuyetDinhMoLop
	@ID					int,
	@Ma_KHDT			int,
	@Ki_hieu			nvarchar(50),
	@Ten				nvarchar(200),
	@Ma_khoa			int,
	@Nam_bat_dau		int,
	@Ma_he_dao_tao		int,
	@Thong_tin_chung	nvarchar(4000),
	@Dieu_mot			nvarchar(2000),
	@Tu_thang			varchar,
	@Den_thang			varchar,
	@Ma_nguoi_lap		int,
	@Ma_nguoi_duyet		int,
	@Tinh_trang			int,
	@Noi_nhan			nvarchar(200),
	@Ly_do_reject		nvarchar(100),
	@Quyet_dinh_so		nvarchar(80),
	@Ngay_ra_QD_UBND	datetime,
	@Tong_so_hoc_sinh	int,
	@Tong_so_chuyen_nganh	int,
	@Ngay_cap_nhat_cuoi	datetime		output,
	@User1				varchar(40),
	@User2				varchar(40),
	@User3				varchar(40),
	@User4				varchar(40),
	@User5				varchar(40)

AS
BEGIN
	DECLARE @Ten_he_dao_tao nvarchar(500),
			@So_nam_dao_tao int
	SELECT @Ten_he_dao_tao = Ten, @So_nam_dao_tao = So_nam FROM HEDAOTAO WHERE @Ma_he_dao_tao = ID
	SET @Ten = N'Quyết định đào tạo năm học ' + Convert(varchar(4),@Nam_bat_dau) + '-' + Convert(varchar(4),(@Nam_bat_dau + @So_nam_dao_tao)) + N' Hệ ' + @Ten_he_dao_tao
	SET @Ngay_cap_nhat_cuoi=GETDATE()

	UPDATE QuyetDinhMoLop
	SET
		Ma_KHDT					=	@Ma_KHDT,
		Ki_hieu					=	@Ki_hieu,
		Ten						=	@Ten,
		Ma_khoa					=	@Ma_khoa,
		Nam_bat_dau				=	@Nam_bat_dau,
		Ma_he_dao_tao			=	@Ma_he_dao_tao,
		Thong_tin_chung			=	@Thong_tin_chung,
		Dieu_mot				=	@Dieu_mot,
		Tu_thang				=	@Tu_thang,
		Den_thang				=	@Den_thang,
		Ma_nguoi_lap			=	@Ma_nguoi_lap,
		Ma_nguoi_duyet			=	@Ma_nguoi_duyet,
		Tinh_trang				=	@Tinh_trang,
		Noi_nhan				=	@Noi_nhan,
		Ly_do_reject			=	@Ly_do_reject,
		Quyet_dinh_so			=	@Quyet_dinh_so,
		Ngay_ra_QD_UBND			=	@Ngay_ra_QD_UBND,
		Tong_so_hoc_sinh		=	@Tong_so_hoc_sinh,
		Tong_so_chuyen_nganh	=	@Tong_so_chuyen_nganh,
		Ngay_cap_nhat_cuoi		=	@Ngay_cap_nhat_cuoi,
		User1					=	@User1,
		User2					=	@User2,
		User3					=	@User3,
		User4					=	@User4,
		User5					=	@User5
	WHERE
		ID						=	@ID
	
	
	SELECT @Ngay_cap_nhat_cuoi=Ngay_cap_nhat_cuoi
	FROM QuyetDinhMoLop
	WHERE ID=@ID
END

