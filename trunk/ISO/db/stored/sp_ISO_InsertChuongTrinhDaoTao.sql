if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertChuongTrinhDaoTao]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertChuongTrinhDaoTao]
GO
CREATE PROCEDURE sp_ISO_InsertChuongTrinhDaoTao
	@ID int output,
	@Ten nvarchar(100),
	@Ten_nghe nvarchar(40),
	@Ma_nghe int,
	@Ma_trinh_do int,
	@Doi_tuong_1 nvarchar(1000),
	@Doi_tuong_2 nvarchar(1000),
	@Doi_tuong_3 nvarchar(1000),
	@So_luong_mon_hoc nvarchar(100),
	@Muc_tieu_1 nvarchar(1000),
	@Muc_tieu_2 nvarchar(1000),
	@Muc_tieu_3 nvarchar(1000),
	@Muc_tieu_4 nvarchar(1000),
	@Muc_tieu_5 nvarchar(1000),
	@Phuong_phap_1 nvarchar(1000),
	@Phuong_phap_2 nvarchar(1000),
	@Phuong_phap_3 nvarchar(1000),
	@Thoi_gian_1 nvarchar(10),
	@Thoi_gian_2 nvarchar(10),
	@Thoi_gian_3 nvarchar(10),
	@Thoi_gian_4 nvarchar(10),
	@Thoi_gian_5 nvarchar(10),
	@Thoi_gian_6 nvarchar(10),
	@Thoi_gian_7 nvarchar(10),
	@Thoi_gian_8 nvarchar(10),
	@Phan_bo_1 nvarchar(10),
	@Phan_bo_2 nvarchar(10),
	@Phan_bo_3 nvarchar(10),
	@Phan_bo_4 nvarchar(10),
	@Phan_bo_5 nvarchar(10),
	@Phan_bo_6 nvarchar(10),
	@Thi_hoc_ki nvarchar(1000),
	@Thi_tot_nghiep nvarchar(1000),
	@Thuc_tap nvarchar(1000),
	@Y_kien_de_xuat nvarchar(1000),
	@Ngay_tao datetime,
	@Ngay_cap_nhat_cuoi varchar(30) output,
	@Ma_nguoi_tao int,
	@Ma_nguoi_duyet int,
	@Ngay_duyet datetime,
	@Tinh_trang int,
	@Ly_do_reject nvarchar(1000),
	@Ma_quyet_dinh int,
	@Bang_cap nvarchar(40),
	@Ngay_gui		datetime,
	@User1 varchar(40),
	@User2 varchar(40),
	@User3 varchar(40),
	@User4 varchar(40),
	@User5 varchar(40)
	
AS
BEGIN
	DECLARE @Ten_nghe1 nvarchar(40)
	SELECT @Ten_nghe1 = Ten_chuyen_nganh FROM ChuyenNganh WHERE ID = @Ma_nghe
	SET @Ten_nghe = @Ten_nghe1 
	DECLARE @Ten_trinh_do nvarchar(40)
	DECLARE @Khoa int
	DECLARE @Nam_bat_dau int
	SELECT @Khoa = Ma_khoa, @Nam_bat_dau = Nam_bat_dau FROM QuyetDinhMoLop WHERE ID = @Ma_quyet_dinh
	SELECT @Ten_trinh_do = Ten FROM HeDaoTao WHERE ID = @Ma_trinh_do
	SET @Ten = N'Khóa ' + cast(@Khoa As varchar) + ' Niên khóa ' + cast(@Nam_bat_dau As varchar) + '-' + cast(@Nam_bat_dau + cast(@Thoi_gian_1 As int) As varchar) 
	SET @Ngay_tao = GETDATE()
	SET @Ngay_cap_nhat_cuoi = GETDATE()
	
	INSERT INTO CHUONGTRINHDAOTAO
	VALUES (
		@Ten,
		@Ten_nghe,
		@Ma_nghe,
		@Ma_trinh_do,
		@Doi_tuong_1,
		@Doi_tuong_2,
		@Doi_tuong_3,
		@So_luong_mon_hoc,
		@Muc_tieu_1,
		@Muc_tieu_2,
		@Muc_tieu_3,
		@Muc_tieu_4,
		@Muc_tieu_5,
		@Phuong_phap_1,
		@Phuong_phap_2,
		@Phuong_phap_3,
		@Thoi_gian_1,
		@Thoi_gian_2,
		@Thoi_gian_3,
		@Thoi_gian_4,
		@Thoi_gian_5,
		@Thoi_gian_6,
		@Thoi_gian_7,
		@Thoi_gian_8,
		@Phan_bo_1,
		@Phan_bo_2,
		@Phan_bo_3,
		@Phan_bo_4,
		@Phan_bo_5,
		@Phan_bo_6,
		@Thi_hoc_ki,
		@Thi_tot_nghiep,
		@Thuc_tap,
		@Y_kien_de_xuat,
		@Ngay_tao,
		@Ngay_cap_nhat_cuoi,
		@Ma_nguoi_tao,
		@Ma_nguoi_duyet,
		@Ngay_duyet,
		@Tinh_trang,
		@Ly_do_reject,
		@Ma_quyet_dinh,
		@Bang_cap,
		@Ngay_gui,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	SELECT	@ID = A.ID,
				@Ngay_cap_nhat_cuoi= Convert(varchar(10),Ngay_cap_nhat_cuoi,110)
		FROM CHUONGTRINHDAOTAO A 
		WHERE A.Ngay_tao = @Ngay_tao	
END