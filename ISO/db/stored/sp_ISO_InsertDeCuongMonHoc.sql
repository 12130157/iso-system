if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertDeCuongMonHoc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertDeCuongMonHoc]
GO
CREATE PROCEDURE sp_ISO_InsertDeCuongMonHoc
	@ID							int output,
	@Ten						nvarchar(2000) output,
	@Ma_mon_hoc					int,
	@Ly_thuyet					int,
	@Thuc_hanh					int,
	@Kiem_tra					int,
	@Tinh_chat_mon_hoc			nvarchar(40),
	@Vi_tri_mon_hoc				nvarchar(1000),
	@Muc_tieu_1					nvarchar(4000),
	@Muc_tieu_2					nvarchar(4000),
	@Muc_tieu_3					nvarchar(4000),
	@Muc_tieu_4					nvarchar(4000),
	@Dieu_kien_1				nvarchar(4000),
	@Dieu_kien_2				nvarchar(4000),
	@Dieu_kien_3				nvarchar(4000),
	@Dieu_kien_4				nvarchar(4000),
	@Phuong_phap_1				nvarchar(4000),
	@Phuong_phap_2				nvarchar(4000),
	@Phuong_phap_3				nvarchar(4000),
	@Ngay_tao					datetime,
	@Ma_nguoi_tao				int,
	@Ma_nguoi_duyet				int,
	@Ngay_duyet					datetime,
	@Ngay_cap_nhat_cuoi			varchar(30) output,
	@Tinh_trang					int,
	@Ly_do_reject				nvarchar(100),
	@So_buoi_hoc_trong_tuan		int,
	@So_tiet_hoc_mot_buoi		int,
	@Ma_chuong_trinh			int,
	@Kieu_bien_soan				int,
	@Ten_khoa					nvarchar(50),
	@Ngay_gui					datetime,
	@User1						varchar(40),
	@User2						varchar(40),
	@User3						varchar(40),
	@User4						varchar(40),
	@User5						varchar(40),
	@Ma_nguoi_tao_chuong_trinh	varchar(5) output
AS
BEGIN
	DECLARE @Ten_mon_hoc nvarchar(40)
	DECLARE @Ten_chuyen_nganh nvarchar(40)
	DECLARE @Khoa nvarchar(10)
	DECLARE @Ma_trinh_do int
	DECLARE @Ten_trinh_do nvarchar(40)
	SELECT @Ten_mon_hoc = Ten_mon_hoc FROM MonHoc WHERE ID = @Ma_mon_hoc
	SELECT @Ten_chuyen_nganh = A.Ten_nghe, @Khoa = B.Ma_khoa , @Ma_trinh_do = A.Ma_trinh_do FROM ChuongTrinhDaoTao AS A INNER JOIN QuyetDinhMoLop AS B ON A.Ma_quyet_dinh = B.ID WHERE A.ID = @Ma_chuong_trinh
	SELECT @Ten_trinh_do = Ten FROM HeDaoTao WHERE ID = @Ma_trinh_do
	SET @Ten = @Ten_mon_hoc + ' - ' + @Ten_chuyen_nganh + ' - Khóa ' + @Khoa
	SET @Ngay_tao = GETDATE()
	SET @Ngay_cap_nhat_cuoi = GETDATE()
	INSERT INTO DeCuongMonHoc
	VALUES (
		@Ten,
		@Ma_mon_hoc,
		@Ly_thuyet,
		@Thuc_hanh,
		@Kiem_tra,
		@Tinh_chat_mon_hoc,
		@Vi_tri_mon_hoc,
		@Muc_tieu_1,
		@Muc_tieu_2,
		@Muc_tieu_3,
		@Muc_tieu_4,
		@Dieu_kien_1,
		@Dieu_kien_2,
		@Dieu_kien_3,
		@Dieu_kien_4,
		@Phuong_phap_1,
		@Phuong_phap_2,
		@Phuong_phap_3,
		@Ngay_tao,
		@Ma_nguoi_tao,
		@Ma_nguoi_duyet,
		@Ngay_duyet,
		@Ngay_cap_nhat_cuoi,
		@Tinh_trang,
		@Ly_do_reject,
		@So_buoi_hoc_trong_tuan,
		@So_tiet_hoc_mot_buoi,
		@Ma_chuong_trinh,
		@Kieu_bien_soan,
		@Ten_khoa,
		@Ngay_gui,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	SELECT	@ID = A.ID, @Ten = A.Ten,
				@Ngay_cap_nhat_cuoi= Convert(varchar(10),A.Ngay_cap_nhat_cuoi,110),
					@Ma_nguoi_tao_chuong_trinh = B.Ma_nguoi_tao
		FROM DeCuongMonHoc A 
		INNER JOIN ChuongTrinhDaoTao AS B ON B.ID = A.Ma_chuong_trinh
		WHERE A.Ngay_tao = @Ngay_tao	
END