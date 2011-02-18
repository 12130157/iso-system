
/***********************************************************
* Purpose : Insert "QUYET DINH MO LOP"
* Author : ToanTT
* Date: 12-04-2010
* Description: Insert "QUYET DINH MO LOP"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertQuyetDinhMoLop]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertQuyetDinhMoLop]
GO
CREATE PROCEDURE sp_ISO_InsertQuyetDinhMoLop
	@ID						int					output,
	@Ma_ke_hoach			int,
	@Ki_hieu				nvarchar(80),
	@Ten					nvarchar(200)		output,
	@Ma_khoa				int,
	@Nam_bat_dau			int,
	@Ma_he_dao_tao			int,
	@Thong_tin_chung		nvarchar(4000),
	@Dieu_mot				nvarchar(2000),
	@Tu_thang				varchar(10),
	@Den_thang				varchar(10),
	@Ma_nguoi_lap			int,
	@Ngay_lap				datetime,
	@Ma_nguoi_duyet			int,
	@Ngay_duyet				datetime,
	@Tinh_trang				int,
	@Noi_nhan				nvarchar(200),
	@Ly_do_reject			nvarchar(100),
	@Quyet_dinh_so			nvarchar(80),
	@Ngay_ra_QD_UBND		datetime,
	@Tong_so_hoc_sinh		int,
	@Tong_so_chuyen_nganh	int,
	@Ngay_cap_nhat_cuoi		datetime			output,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN   
	DECLARE @TenHeDaoTao nvarchar(200),
			@So_nam_dao_tao int
		SELECT @TenHeDaoTao = Ten, @So_nam_dao_tao = So_nam FROM HEDAOTAO WHERE @Ma_he_dao_tao = ID
	SET @Ten = N'Quyết định đào tạo năm học ' + Convert(varchar(4),@Nam_bat_dau) + '-' + Convert(varchar(4),(@Nam_bat_dau + @So_nam_dao_tao)) + N' Hệ ' + @TenHeDaoTao
	SET @Ngay_lap=GETDATE()
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	
	INSERT INTO QuyetDinhMoLop
	VALUES (
		@Ma_ke_hoach,
		@Ki_hieu,
		@Ten,
		@Ma_khoa,
		@Nam_bat_dau,
		@Ma_he_dao_tao,
		@Thong_tin_chung,
		@Dieu_mot,
		@Tu_thang,
		@Den_thang,
		@Ma_nguoi_lap,
		@Ngay_lap,
		@Ma_nguoi_duyet,
		@Ngay_duyet,
		@Tinh_trang,
		@Noi_nhan,
		@Ly_do_reject,
		@Quyet_dinh_so,
		@Ngay_ra_QD_UBND,
		@Tong_so_hoc_sinh,
		@Tong_so_chuyen_nganh,
		@Ngay_cap_nhat_cuoi,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	
	SELECT	@ID = A.ID, @Ten = Ten,
			@Ngay_cap_nhat_cuoi= Ngay_cap_nhat_cuoi
	FROM QuyetDinhMoLop A 
	WHERE A.Ngay_lap=@Ngay_lap
END