
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateKHGD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateKHGD]
GO
CREATE PROCEDURE sp_ISO_UpdateKHGD
	@ID				int,
	@maMonHoc		int,
	@maGiaoVien	nvarchar(50),
	@maLop			int,
	@hocKi			int,
	@namHoc			varchar(15),
	@soCaThucHanh	int,
	@maNguoiTao		int,
	@maNguoiDuyet	int,
	@maTruongKhoa	int,
	@tinhTrang		int,
	
	@tenKHGD		nvarchar(400),
	@lyDoReject		nvarchar(2000),
	@ngayCapNhatCuoi datetime output,
	@soGioLT		int,
	@soGioTH		int,
	@User1 varchar(40),
	@User2 varchar(40),
	@User3 varchar(40),
	@User4 varchar(40),
	@User5 varchar(40)
AS
BEGIN
	DECLARE @kiHieuLop nvarchar(20)
		SELECT @kiHieuLop = Ki_hieu FROM LOPHOC WHERE ID = @maLop
	DECLARE @tenMonHoc nvarchar(50)
		SELECT @tenMonHoc = Ten_mon_hoc FROM MonHoc WHERE ID = @maMonHoc
	DECLARE @maNamHoc int
		SELECT @maNamHoc = ID FROM NAMHOC WHERE (convert(varchar(4),Nam_bat_dau) + ' - ' + convert(varchar(4),Nam_ket_thuc)) = @namHoc
	SET @tenKHGD = N'Kế hoạch giảng dạy học kỳ ' + cast(@hocKi As varchar) + N' niên khóa ' + cast(@namHoc As varchar) + N' lớp ' + cast(@kiHieuLop As varchar) + N' môn ' + cast(@tenMonHoc As nvarchar)	
	SET @ngayCapNhatCuoi = GETDATE()
	
	UPDATE KeHoachGiangDay
	SET
		Ma_mon_hoc			= @maMonHoc,
		Ma_giao_vien		= @maGiaoVien,
		Ma_lop				= @maLop,
		Hoc_ki				= @hocKi,
		Ma_nam_hoc			= @maNamHoc,
		So_ca_thuc_hanh		= @soCaThucHanh,
		Ma_nguoi_tao		= @maNguoiTao,
		Ma_nguoi_duyet		= @maNguoiDuyet,
		Truong_khoa			= @maTruongKhoa,
		Tinh_trang			= @tinhTrang,
		
		Ten					= @tenKHGD,
		Ly_do_reject		= @lyDoReject,
		Ngay_cap_nhat_cuoi	= @ngayCapNhatCuoi,
		So_gio_LT			= @soGioLT,
		So_gio_TH			= @soGioTH,
		User1				=	@User1,
		User2				=	@User2,
		User3				=	@User3,
		User4				=	@User4,
		User5				=	@User5
	WHERE
		ID					=	@ID

	SELECT @ngayCapNhatCuoi = Ngay_cap_nhat_cuoi
		FROM KeHoachGiangDay
			WHERE ID = @ID
END

