if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertKeHoachGiangDay]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertKeHoachGiangDay]
GO

CREATE PROCEDURE sp_ISO_InsertKeHoachGiangDay
	@ID				int output,
	@maMonHoc		int,
	@tenGiaoVien	nvarchar(50),
	@maLop			int,
	@hocKi			int,
	@namHoc			varchar(15),
	@soCaThucHanh	int,
	@maNguoiTao		int,
	@ngayTao		datetime,
	@maNguoiDuyet	int,
	@ngayDuyet		datetime,
	@tinhTrang		int,
	@soTietMoiBuoi	int,
	@tenKHGD		nvarchar(400) output,
	@lyDoReject		nvarchar(2000),
	@ngayCapNhatCuoi datetime output,
	@soGioLT		int,
	@soGioTH		int,
	@maTruongKhoa	int,
	@ngayTKDuyet	int,
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
	SELECT @maNamHoc = ID FROM NAMHOC WHERE convert(varchar(4),Nam_bat_dau)= SUBSTRING(@namHoc,1,4) 
	SET @tenKHGD = N'Kế hoạch giảng dạy học kỳ ' + cast(@hocKi As varchar) + N' niên khóa ' + cast(@namHoc As varchar) + N' lớp ' + cast(@kiHieuLop As varchar) + N' môn ' + cast(@tenMonHoc As nvarchar)	
	SET @ngayTao = GETDATE()
	SET @ngayCapNhatCuoi = GETDATE()
	DECLARE @tenDN varchar(30)
		SELECT @tenDN = Ten_dang_nhap FROM CHITIETTHANHVIEN WHERE (Ho + ' ' + Ten_lot + ' ' + Ten) = @tenGiaoVien
	DECLARE @maGiaoVien int
		SELECT @maGiaoVien = ID FROM THANHVIEN WHERE Ten_DN = @tenDN

	INSERT INTO KeHoachGiangDay
	VALUES (
		@maMonHoc,
		@maLop,
		@hocKi,
		@maNamHoc,
		@soCaThucHanh,
		@maNguoiTao,
		@ngayTao,
		@maNguoiDuyet,
		@ngayDuyet,
		@tinhTrang,
		@tenKHGD,
		@lyDoReject,
		@ngayCapNhatCuoi,
		@soGioLT,
		@soGioTH,
		@maNguoiTao,
		@soTietMoiBuoi,
		@maTruongKhoa,
		@ngayTKDuyet,
		0,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	SELECT	@ID = A.ID,	@ngayCapNhatCuoi= Ngay_cap_nhat_cuoi
		FROM KeHoachGiangDay A 
			WHERE A.Ngay_tao = @ngayTao	
END