
/***********************************************************
* Purpose : insert thanh vien
* Author : TuanHQ
* Date: 02-04-2010S
* Description: insert thanh vien
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_InsertThanhVien]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_InsertThanhVien]
GO
CREATE PROC sp_Admin_InsertThanhVien
	--thanhvien
    @Mat_khau			VARCHAR(20),
    @Ma_vai_tro			VARCHAR(3),
	@Ma_bo_phan			VARCHAR(3),
    @Ngay_tao			DATETIME,
    @Ngay_truy_cap_cuoi DATETIME,
    @Ngay_cap_nhat_cuoi DATETIME,
	--chitietthanhvien
    @Ten_dang_nhap		VARCHAR(20),
    @Ho					NVARCHAR(40),
    @Ten_lot			NVARCHAR(40),
    @Ten				NVARCHAR(40),
    @Ngay_sinh			DATETIME,
    @Email				VARCHAR(40),
    @Dien_thoai_dd		VARCHAR(20),
    @Ngay_bat_dau		DATETIME,
    @Ngay_ket_thuc		DATETIME,
    @Tinh_trang			VARCHAR(3),
    @Chung_minh_nhan_dan VARCHAR(15),
    @Ma_lop_hoc			VARCHAR(3),
	--dia chi
	@So_nha				varchar(10),
	@Duong				nvarchar(20),
	@Phuong_xa			nvarchar(20),
	@Quan_huyen			nvarchar(20),
	@Tinh_Thanhpho		nvarchar(40),
	@Dien_thoai_nha		varchar(20),
	@Lan_cap_nhat_cuoi	datetime,
	--bang cap
	@Loai_bang			NVARCHAR(40),
	@Truong_cap			NVARCHAR(200),
	@Nam_tot_nghiep		VARCHAR(4),
	@Loai_tot_nghiep	NVARCHAR(10),
	--tai khoan
	@So_tai_khoan		varchar(20),
	@Ngan_hang			nvarchar(20),
	@Ngay_lap_the		datetime

AS
BEGIN

	set @Ngay_tao = GETDATE()
	set @Ngay_truy_cap_cuoi = GETDATE()
	set @Ngay_cap_nhat_cuoi = GETDATE()
	set @Ngay_bat_dau = GETDATE()
	set @Ngay_ket_thuc = GETDATE()

--insert tai khoang
	insert into taikhoan (So_tai_khoan,Ngan_hang,Ngay_lap_the)
		values (@So_tai_khoan,@Ngan_hang,@Ngay_lap_the)

	declare @Ma_tai_khoan int;
	set @Ma_tai_khoan = (select max(id) from taikhoan)
	
--insert bang cap
	insert into bangcap (Loai_bang,Truong_cap,Nam_tot_nghiep,Loai_tot_nghiep,Ngay_cap_nhat_cuoi)
		values (@Loai_bang,@Truong_cap,@Nam_tot_nghiep,@Loai_tot_nghiep,@Ngay_cap_nhat_cuoi)

	declare @Ma_bang_cap int;
	set @Ma_bang_cap = (select max(id) from bangcap)

--insert dia chi nha
	insert into DiaChi (So_nha,Duong,Phuong_xa,Quan_huyen,Tinh_Thanhpho,Dien_thoai_nha,Lan_cap_nhat_cuoi)
		values (@So_nha,@Duong,@Phuong_xa,@Quan_huyen,@Tinh_Thanhpho,@Dien_thoai_nha,@Lan_cap_nhat_cuoi)

	declare @Ma_dia_chi int;
	set @Ma_dia_chi = (select max(id) from DiaChi)
--insert chitietthanhvien
	insert into chitietthanhvien (
		Ten_dang_nhap,
		Ho,
		Ten_lot,
		Ten,
		Ngay_sinh,
		Ma_dia_chi,
		Email,
		Dien_thoai_dd,
		Ma_bang_cap,
		Ngay_bat_dau,
		Ngay_ket_thuc,
		Ma_tai_khoan,
		Tinh_trang,
		Chung_minh_nhan_dan,
		Ma_lop_hoc)  
	 values (
		@Ten_dang_nhap,
		@Ho,
		@Ten_lot,
		@Ten,
		@Ngay_sinh,
		@Ma_dia_chi,
		@Email,
		@Dien_thoai_dd,
		@Ma_bang_cap,
		@Ngay_bat_dau,
		@Ngay_ket_thuc,
		@Ma_tai_khoan,
		@Tinh_trang,
		@Chung_minh_nhan_dan,
		@Ma_lop_hoc)  

--insert thanhvien
	insert into thanhvien (Ten_DN,Mat_khau,Ma_vai_tro,Ngay_tao,Ngay_truy_cap_cuoi,Ngay_cap_nhat_cuoi,Ma_bo_phan)	
		values (@Ten_dang_nhap,@Mat_khau,@Ma_vai_tro,@Ngay_tao,@Ngay_truy_cap_cuoi,@Ngay_cap_nhat_cuoi,@Ma_bo_phan)		

END