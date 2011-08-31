if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertThoiKhoaBieu]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertThoiKhoaBieu]
GO
CREATE PROCEDURE sp_ISO_InsertThoiKhoaBieu
	@ID						int output,
	@Ma_lop					int,
	@Tuan_bat_dau			int,
	@Tuan_ket_thuc			int,
	@Ngay_bat_dau			datetime,
	@Ngay_ket_thuc			datetime,
	@Ma_nguoi_tao			int,
	@Ngay_tao				datetime,
	@Ma_nguoi_duyet			int,
	@Ngay_duyet				datetime,
	@Ngay_cap_nhat_cuoi		varchar(30) output,
	@Ten					nvarchar(200) output,
	@Tinh_trang				int output,
	@Ly_do_reject			nvarchar(2000),
	@Hoc_ki					int,
	@Nam_bat_dau			nvarchar(20),
	@Nam_ket_thuc			nvarchar(20),
	@Ngay_gui				datetime,
	@User1					nvarchar(100),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40) 
AS
BEGIN 
	--DECLARE @Ma_chuyen_nganh int
	--DECLARE @Ma_quyet_dinh int
	DECLARE @Hoc_ki_thuc int
	DECLARE @Ki_hieu_lop varchar(15)
	SELECT @Ki_hieu_lop = Ki_hieu FROM LopHoc WHERE ID = @Ma_lop
	select @Hoc_ki_thuc = @Hoc_ki + (CAST(@Nam_bat_dau AS INT) - CAST(b.nam_bat_dau AS INT)) * 2 from lophoc as a inner join quyetdinhmolop as b on a.ma_quyet_dinh = b.id where a.id = @Ma_lop
	--SELECT @Ma_chuyen_nganh = Ma_chuyen_nganh, @Ma_quyet_dinh = Ma_quyet_dinh FROM LopHoc WHERE ID = @Ma_lop
	--DECLARE @Ma_trinh_do int
	--DECLARE @Ten_trinh_do nvarchar(100)
	--DECLARE @Ten_trinh_do_tat varchar(10)
	--SELECT @Ma_trinh_do = Ma_trinh_do FROM ChuongTrinhDaoTao WHERE Ma_nghe = @Ma_chuyen_nganh AND Ma_quyet_dinh = @Ma_quyet_dinh
	--SELECT @Ten_trinh_do = Ten, @Ten_trinh_do_tat = User1 FROM HeDaoTao WHERE ID = @Ma_trinh_do
	--DECLARE @Ten_chuyen_nganh nvarchar(100)
	--DECLARE @Ten_chuyen_nganh_tat nvarchar(10)
	--SELECT @Ten_chuyen_nganh = Ten_chuyen_nganh, @Ten_chuyen_nganh_tat = User1 FROM ChuyenNganh WHERE ID = @Ma_chuyen_nganh
	SET @Ten = N'HỌC KÌ ' + cast(@Hoc_ki_thuc As nvarchar) + ' (' + @Nam_bat_dau + '-' + @Nam_ket_thuc + ') - ' +  @Ki_hieu_lop
	SET @Ngay_tao=GETDATE()
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	--SET @User1 = N'HỌC KÌ ' + cast(@Hoc_ki_thuc As nvarchar) + ' (' + @Nam_bat_dau + '-' + @Nam_ket_thuc + ') - ' +  @Ki_hieu_lop
	INSERT INTO ThoiKhoaBieu
	VALUES (
		@Ma_lop,
		@Tuan_bat_dau,
		@Tuan_ket_thuc,
		@Ngay_bat_dau,
		@Ngay_ket_thuc,
		@Ma_nguoi_tao,
		@Ngay_tao,
		@Ma_nguoi_duyet,
		@Ngay_duyet,
		@Ngay_cap_nhat_cuoi,
		@Ten,
		@Tinh_trang,
		@Ly_do_reject,
		@Hoc_ki,
		@Nam_bat_dau,
		@Nam_ket_thuc,
		@Ngay_gui,
		@Ten,
		@User2,
		@User3,
		@User4,
		@User5
	)
	
	SELECT	@ID = A.ID, @Ten = A.Ten,
			@Ngay_cap_nhat_cuoi= Convert(varchar(10),Ngay_cap_nhat_cuoi,110)
	FROM ThoiKhoaBieu A 
	WHERE A.Ngay_tao=@Ngay_tao	
END
