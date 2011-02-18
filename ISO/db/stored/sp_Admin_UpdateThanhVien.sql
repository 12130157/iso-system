
/***********************************************************
* Purpose : update thanh vien
* Author : TuanHQ
* Date: 02-04-2010S
* Description: update thanh vien
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_UpdateThanhVien]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_UpdateThanhVien]
GO
CREATE PROC sp_Admin_UpdateThanhVien
	--thanhvien
	@Ten_DN				VARCHAR(20),
    @Mat_khau			VARCHAR(20),
    @Ma_vai_tro			VARCHAR(3),
    @Ngay_tao			DATETIME,
    @Ngay_truy_cap_cuoi DATETIME,
    @Ngay_cap_nhat_cuoi DATETIME,
	@Ma_bo_phan			VARCHAR(3),
	--chitietthanhvien
	@id					VARCHAR(9),
    @Ho					NVARCHAR(40),
    @Ten_lot			NVARCHAR(40),
    @Ten				NVARCHAR(40),
    @Ngay_sinh			DATETIME,
    @Email				VARCHAR(40),
    @Dien_thoai_dd		VARCHAR(20),
    @Ngay_bat_dau		DATETIME,
    @Ngay_ket_thuc		DATETIME,
    @Tinh_trang			VARCHAR(1),
    @Chung_minh_nhan_dan VARCHAR(15),
	--dia chi
	@So_nha				VARCHAR(30),
	@Duong				NVARCHAR(20),
	@Phuong_xa			NVARCHAR(20),
	@Quan_huyen			NVARCHAR(20),
	@Tinh_Thanhpho		NVARCHAR(40),
	@Dien_thoai_nha		VARCHAR(20),
	@Lan_cap_nhat_cuoi	datetime,
	--bang cap
	@Loai_bang			NVARCHAR(40),
	@Truong_cap			NVARCHAR(200),
	@Nam_tot_nghiep		VARCHAR(4),
	@Loai_tot_nghiep	NVARCHAR(10),
	--tai khoan
	@So_tai_khoan		VARCHAR(20),
	@Ngan_hang			NVARCHAR(20),
	@Ngay_lap_the		datetime

AS
BEGIN

	set @Ngay_tao = GETDATE()
	set @Ngay_truy_cap_cuoi = GETDATE()
	set @Ngay_cap_nhat_cuoi = GETDATE()
	set @Ngay_bat_dau = GETDATE()
	set @Ngay_ket_thuc = GETDATE()
--update thanhvien
	Update thanhvien 
	set Ten_DN = @Ten_DN,
		Mat_khau = @Mat_khau,
		Ma_vai_tro = @Ma_vai_tro,
		Ngay_tao = @Ngay_tao,
		Ngay_truy_cap_cuoi = @Ngay_truy_cap_cuoi,
		Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi,
		Ma_bo_phan = @Ma_bo_phan	
	where id = @id

	declare @Ten_dang_nhap  VARCHAR(20)
	set @Ten_dang_nhap = (select Ten_DN from thanhvien where id = @id)
	
--update chitietthanhvien
	update chitietthanhvien 
		set Ho = @Ho,
			Ten_lot = @Ten_lot,
			Ten = @Ten,
			Ngay_sinh = @Ngay_sinh,
			--Ma_dia_chi = @Ma_dia_chi,
			Email = @Email,
			Dien_thoai_dd = @Dien_thoai_dd,
			--Ma_bang_cap = @Ma_bang_cap,
			Ngay_bat_dau = @Ngay_bat_dau,
			Ngay_ket_thuc = @Ngay_ket_thuc,
			--Ma_tai_khoan = @Ma_tai_khoan,
			Tinh_trang = @Tinh_trang,
			Chung_minh_nhan_dan = @Chung_minh_nhan_dan
			--Ma_lop_hoc = @Ma_lop_hoc
		where Ten_dang_nhap = @Ten_dang_nhap

	declare @Ma_dia_chi int
	declare @Ma_bang_cap int
	declare @Ma_tai_khoan int
	declare @Ma_lop_hoc int

	set @Ma_dia_chi = (select Ma_dia_chi from chitietthanhvien where Ten_dang_nhap = @Ten_DN)
	set @Ma_bang_cap = (select Ma_bang_cap from chitietthanhvien where Ten_dang_nhap = @Ten_DN)
	set @Ma_tai_khoan = (select Ma_tai_khoan from chitietthanhvien where Ten_dang_nhap = @Ten_DN)
	set @Ma_lop_hoc = (select Ma_lop_hoc from chitietthanhvien where Ten_dang_nhap = @Ten_DN)


--update tai khoang
	update taikhoan set So_tai_khoan = @So_tai_khoan, Ngan_hang = @Ngan_hang, Ngay_lap_the = @Ngay_lap_the
		where id = @Ma_tai_khoan
	
--insert bang cap
	update bangcap 
	set Loai_bang = @Loai_bang, 
		Truong_cap = @Truong_cap, 
		Nam_tot_nghiep = @Nam_tot_nghiep,
		Loai_tot_nghiep = @Loai_tot_nghiep,
		Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
	where id = @Ma_bang_cap

--insert dia chi nha
	update DiaChi 
	set So_nha = @So_nha,
		Duong = @Duong,
		Phuong_xa = @Phuong_xa,
		Quan_huyen = @Quan_huyen,
		Tinh_Thanhpho = @Tinh_Thanhpho,
		Dien_thoai_nha = @Dien_thoai_nha,
		Lan_cap_nhat_cuoi = @Lan_cap_nhat_cuoi
	where id = @Ma_dia_chi


END