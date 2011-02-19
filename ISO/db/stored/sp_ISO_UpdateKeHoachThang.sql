if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateKeHoachThang]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateKeHoachThang]
GO
CREATE PROCEDURE sp_ISO_UpdateKeHoachThang
	@ID	int,
	@Thang varchar(2),
	@Noi_nhan nvarchar(1000),
	@Ma_nguoi_tao int,
	@Ngay_cap_nhat_cuoi datetime,
	@Ngay_tao datetime,
	@Ngay_duyet datetime,
	@Ma_nguoi_duyet int,
	@Nam varchar(4),
	@Ten_ke_hoach_thang varchar(200),
	@Ngay_gui datetime,
	@Tinh_trang int,
	@Ly_do_reject varchar(2000),
	@User1 varchar(40),
	@User2 varchar(40),
	@User3 varchar(40),
	@User4 varchar(40),
	@User5 varchar(40)
AS
BEGIN
	SET @Ngay_cap_nhat_cuoi = GETDATE()
	UPDATE KeHoachThang
	SET
		--Thang = @Thang,
		Noi_nhan = @Noi_nhan,
		Ma_nguoi_tao = @Ma_nguoi_tao,
		Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi,
		--@Ngay_tao = @Ngay_tao
		Ma_nguoi_duyet = @Ma_nguoi_duyet,
		Ngay_duyet = @Ngay_duyet,
		--Nam = @Nam
		Ngay_gui = @Ngay_gui,
		Ten_ke_hoach_thang = @Ten_ke_hoach_thang,
		Tinh_trang = @Tinh_trang,
		Ly_do_reject = @Ly_do_reject,
		User1 = @User1,
		User2 = @User2,
		User3 = @User3,
		User4 = @User4,
		User5 = @User5
	WHERE ID = @ID
END