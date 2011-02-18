
--sp_Admin_InsertCongTac.sql

/***********************************************************
* Purpose : insert cong tac
* Author : TuanHQ
* Date: 30-07-2010S
* Description: insert con tac
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_InsertCongTac]'))
drop proc [sp_Admin_InsertCongTac]
GO
CREATE PROC sp_Admin_InsertCongTac
	@Noi_dung	nvarchar(4000),
	@Ghi_chu	nvarchar(400)
AS
BEGIN
	insert into congtac (Noi_dung,Ghi_Chu) 
	values (@Noi_dung,@Ghi_chu)		
END
GO

--sp_Admin_InsertHocPhan.sql

/***********************************************************
* Purpose : insert "Hoc Phan"
* Author : HuyenLY
* Date: 02-06-2010
* Description: insert "Hoc Phan"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_InsertHocPhan]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_InsertHocPhan]
GO
CREATE PROCEDURE sp_Admin_InsertHocPhan

	@Ten			NVARCHAR(100),
	@GhiChu			NVARCHAR(200)
	

AS
BEGIN
	insert into HocPhan(Ten_hoc_phan,Ghi_chu,Ngay_cap_nhat_cuoi)
	values(@Ten,@GhiChu,getdate())
END


GO

--sp_Admin_InsertKhoaTT.sql

/***********************************************************
* Purpose : Insert "KHOA_TT"
* Author : HuyenLY
* Date: 09-06-2010
* Description: Insert "KHOA_TT"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_InsertKhoaTT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_InsertKhoaTT]
GO
CREATE PROCEDURE sp_Admin_InsertKhoaTT
	
	@Ten					NVARCHAR(100),
	@Ma_truong_khoa			INT,
	@Nguoi_tao				INT
	
	
AS
BEGIN
	DECLARE	@Ngay_tao SMALLDATETIME
	DECLARE	@Ngay_cap_nhat_cuoi SMALLDATETIME
	SET @Ngay_tao = getdate()
	SET @Ngay_cap_nhat_cuoi = getdate()

		
	INSERT INTO Khoa_TrungTam(Ten,Ma_truong_khoa,Ngay_tao,Nguoi_tao,Ngay_cap_nhat_cuoi)
	VALUES (
		@Ten,
		@Ma_truong_khoa,
		@Ngay_tao,
		@Nguoi_tao,
		@Ngay_cap_nhat_cuoi
	)
END


GO

--sp_Admin_InsertMonHoc.sql
/***********************************************************
* Purpose : inset mon hoc
* Author : TuanHQ
* Date: 02-04-2010S
* Description: inset mon hoc
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_InsertMonHoc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_InsertMonHoc]
GO
CREATE PROC sp_Admin_InsertMonHoc
	@Ten_mon_hoc		nvarchar(200),
	@Ly_thuyet			int,
	@Thuc_hanh			int,
	@Kiem_tra			int,
	@Tinh_chat			nvarchar(200),
	@Ma_hoc_phan		int,
	@Ma_chuyen_nganh	int,
	@Ngay_tao			datetime,
	@Ma_nguoi_tao		int,
	@Ngay_cap_nhat_cuoi	datetime,
	@Ma_truong_bo_mon	int


AS
BEGIN
	set @Ngay_cap_nhat_cuoi = getdate()
	set @Ngay_tao = getdate()
	insert into monhoc(
					Ten_mon_hoc,
					Ly_thuyet,
					Thuc_hanh,
					Kiem_tra,
					Tinh_chat,
					Ma_hoc_phan,
					Ma_chuyen_nganh,
					Ngay_tao,
					Ma_nguoi_tao,
					Ngay_cap_nhat_cuoi,
					Ma_truong_bo_mon
				)
	values(				
		@Ten_mon_hoc,
		@Ly_thuyet,			
		@Thuc_hanh,			
		@Kiem_tra,			
		@Tinh_chat,			
		@Ma_hoc_phan,		
		@Ma_chuyen_nganh,	
		@Ngay_tao,			
		@Ma_nguoi_tao,		
		@Ngay_cap_nhat_cuoi,	
		@Ma_truong_bo_mon
	)
	
END

GO

--sp_Admin_InsertPhongBan.sql
/***********************************************************
* Purpose : insert phong ban
* Author : TuanHQ
* Date: 02-04-2010S
* Description: insert phong ban
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_InsertPhongBan]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_InsertPhongBan]
GO
CREATE PROC sp_Admin_InsertPhongBan

	@Ki_hieu_phong		nvarchar(80),
	@Vi_tri				nvarchar(80),
	@Chuc_nang			nvarchar(100),
	@Suc_chua			int,
	@Ngay_cap_nhat_cuoi	datetime

AS
BEGIN
	set @Ngay_cap_nhat_cuoi = getdate()
	insert into phongban (Ki_hieu_phong, Vi_tri, Chuc_nang, Suc_chua, ngay_cap_nhat_cuoi)
	values(@Ki_hieu_phong, @Vi_tri, @Chuc_nang, @Suc_chua, @Ngay_cap_nhat_cuoi)
END

GO

--sp_Admin_InsertSysApp.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_InsertSysApp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_Admin_InsertSysApp]
GO
create proc sp_Admin_InsertSysApp
	@app_name nvarchar(100),
	@app_link nvarchar(100),
	@images nvarchar(100),
	@user1 varchar(40),
	@user2 varchar(40),
	@user3 varchar(40),
	@user4 varchar(40),
	@user5 varchar(40)
as
begin
	insert into SYS_APP([App_name],[app_link],[images],[user1],[user2],[user3],[user4],[user5]) values(@app_name,@app_link,@images,@user1,@user2,@user3,@user4,@user5)
end
GO

--sp_Admin_InsertSysChuyenNganh.sql

/***********************************************************
* Purpose : update lop hoc
* Author : TuanHQ
* Date: 18-04-2010S
* Description: update lop hoc
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_InsertChuyenNganh]'))
drop proc [sp_Admin_InsertChuyenNganh]
GO
CREATE PROC sp_Admin_InsertChuyenNganh

	@Ten_chuyen_nganh	nvarchar(200),
	@Ki_hieu			nvarchar(80),
	@Ma_khoaTT			int,
	@Ngay_tao			datetime,
	@Ngay_cap_nhat_cuoi	datetime
AS
BEGIN

	set @Ngay_tao = getdate()
	set @Ngay_cap_nhat_cuoi = getdate()
	insert into chuyennganh (Ten_chuyen_nganh, Ki_hieu, Ma_khoaTT, Ngay_tao)
	values(@Ten_chuyen_nganh, @Ki_hieu, @Ma_khoaTT, @Ngay_tao)

END
GO

--sp_Admin_InsertSysMenu.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_InsertSysMenu]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_Admin_InsertSysMenu]
GO
create proc sp_Admin_InsertSysMenu
	@appID int,
	@Menu_name nvarchar(100),
	@images nvarchar(100),
	@Menu_link nvarchar(100),
	@user1 varchar(40),
	@user2 varchar(40),
	@user3 varchar(40),
	@user4 varchar(40),
	@user5 varchar(40)
as
begin
	INSERT INTO SYS_MENU(AppID,Menu_name,images,Menu_link,User1,User2,User3,User4,User5) 
	VALUES(@appID,@Menu_name,@images,@Menu_link,@User1,@User2,@User3,@User4,@User5)
end

GO

--sp_Admin_InsertThanhVien.sql

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
GO

--sp_Admin_InsertVaiTro.sql

/***********************************************************
* Purpose : insert vai tro
* Author : TuanHQ
* Date: 02-04-2010S
* Description: insert vai tro
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_InsertVaiTro]'))
drop proc sp_Admin_InsertVaiTro
GO
CREATE PROC sp_Admin_InsertVaiTro
	@Ten_vai_tro nvarchar(40),
	@Ngay_cap_nhat_cuoi datetime,
	@User1 varchar(40),
	@User2 varchar(40),
	@User3 varchar(40),
	@User4 varchar(40),
	@User5 varchar(40)
AS
BEGIN
	set @Ngay_cap_nhat_cuoi = GETDATE();
	INSERT INTO VaiTro VALUES(@Ten_vai_tro,@Ngay_cap_nhat_cuoi,@User1,@User2,@User3,@User4,@User5)		
END
GO

--sp_Admin_ShowThanhVien.sql

/***********************************************************
* Purpose : phan trang thanh vien
* Author : HuyenLY
* Date: 02-06-2010
* Description: phan trang thanh vien
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_ShowThanhVien]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_ShowThanhVien]
GO
CREATE PROCEDURE sp_Admin_ShowThanhVien

	@numRows		varchar(10),
	@totalPages		varchar(10)

AS
BEGIN
	DECLARE @sql NVarchar(1000)
	SELECT @sql = '
	select * from (
		select top ' + @numRows + ' * 
		from (
			select top ' + @totalPages + ' *
			from (
				SELECT 
					A.ID AS MaThanhVien, 
					A.Ten_DN AS TenDangNhap, 
					A.Mat_khau AS MatKhau, 
					B.Ho as Ho, 
					B.Ten_lot as TenLot, 
					B.Ten AS Ten, 
					C.Ten_vai_tro AS TenVaiTro,
					A.Ma_vai_tro AS MaVaiTro,
					A.Ma_bo_phan AS MaBoPhan,
					D.Ten AS TenBoPhan,
					B.Tinh_trang as TinhTrang, 
					B.Email As Email, 
					A.Ngay_tao AS NgayTao, 
					A.Ngay_truy_cap_cuoi AS NgayTruyCapCuoi, 
					A.Ngay_cap_nhat_cuoi AS NgayCapNhatCuoi, 
					A.User1,
					A.User2,
					A.User3,
					A.User4,
					A.User5 
				FROM ThanhVien A
						INNER JOIN ChiTietThanhVien B ON A.Ten_DN=B.Ten_dang_nhap 
						INNER JOIN VaiTro C ON A.Ma_vai_tro=C.ID
						INNER JOIN Khoa_TrungTam D ON A.Ma_bo_phan = D.ID
			) AS TB0
			order by TB0.Ten desc
		) as TB1 
		order by TB1.Ten asc
	) as TB2 
	order by TB2.Ten asc'

	exec  sp_executesql @sql
END

--select * from thanhvien
--sp_Admin_ShowThanhVien '5','19'
GO

--sp_Admin_ShowThanhVienByMaVaiTro.sql

/***********************************************************
* Purpose : phan trang thanh vien (tim thanh vien theo ma vai tro)
* Author : HuyenLY
* Date: 02-06-2010
* Description: phan trang thanh vien (tim thanh vien theo ma vai tro)
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_ShowThanhVienByMaVaiTro]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_ShowThanhVienByMaVaiTro]
GO
CREATE PROCEDURE sp_Admin_ShowThanhVienByMaVaiTro

	@MaVaiTro		varchar(10),
	@Ten			nvarchar(100)
AS
BEGIN
	IF @MaVaiTro = -1 AND @Ten = ''
	BEGIN
		SELECT 
			b.ID AS MaThanhVien, 
			b.Ten_DN AS TenDangNhap, 
			b.Mat_khau AS MatKhau,
			b.Ma_bo_phan AS MaBoPhan, 
			a.Ho as Ho, 
			a.Ten_lot as TenLot, 
			a.Ten AS Ten, 
			c.Ten_vai_tro As TenVaiTro,
			d.Ten AS TenBoPhan,
			b.Ma_vai_tro AS MaVaiTro, 
			a.Tinh_trang as TinhTrang, 
			a.Email As Email, 
			b.Ngay_tao AS NgayTao, 
			b.Ngay_truy_cap_cuoi AS NgayTruyCapCuoi, 
			b.Ngay_cap_nhat_cuoi AS NgayCapNhatCuoi, 
			b.User1,
			b.User2,
			b.User3,
			b.User4,
			b.User5
		FROM chitietthanhvien a
			inner join thanhvien b on a.Ten_dang_nhap = b.Ten_DN
			inner join vaitro c on c.ID = b.Ma_vai_tro
			inner join khoa_trungtam d on d.ID = b.Ma_bo_phan
	END
	
	IF @MaVaiTro <> -1 AND @Ten = ''
	BEGIN
		SELECT 
			b.ID AS MaThanhVien, 
			b.Ten_DN AS TenDangNhap, 
			b.Mat_khau AS MatKhau,
			b.Ma_bo_phan AS MaBoPhan, 
			a.Ho as Ho, 
			a.Ten_lot as TenLot, 
			a.Ten AS Ten, 
			c.Ten_vai_tro As TenVaiTro,
			d.Ten AS TenBoPhan,
			b.Ma_vai_tro AS MaVaiTro, 
			a.Tinh_trang as TinhTrang, 
			a.Email As Email, 
			b.Ngay_tao AS NgayTao, 
			b.Ngay_truy_cap_cuoi AS NgayTruyCapCuoi, 
			b.Ngay_cap_nhat_cuoi AS NgayCapNhatCuoi, 
			b.User1,
			b.User2,
			b.User3,
			b.User4,
			b.User5
		FROM chitietthanhvien a
			inner join thanhvien b on a.Ten_dang_nhap = b.Ten_DN
			inner join vaitro c on c.ID = b.Ma_vai_tro
			inner join khoa_trungtam d on d.ID = b.Ma_bo_phan 
		WHERE Ma_vai_tro = @MaVaiTro
	END
	
	IF @MaVaiTro = -1 AND @Ten <> ''
	BEGIN
		SELECT 
			b.ID AS MaThanhVien, 
			b.Ten_DN AS TenDangNhap, 
			b.Mat_khau AS MatKhau,
			b.Ma_bo_phan AS MaBoPhan, 
			a.Ho as Ho, 
			a.Ten_lot as TenLot, 
			a.Ten AS Ten, 
			c.Ten_vai_tro As TenVaiTro,
			d.Ten AS TenBoPhan,
			b.Ma_vai_tro AS MaVaiTro, 
			a.Tinh_trang as TinhTrang, 
			a.Email As Email, 
			b.Ngay_tao AS NgayTao, 
			b.Ngay_truy_cap_cuoi AS NgayTruyCapCuoi, 
			b.Ngay_cap_nhat_cuoi AS NgayCapNhatCuoi, 
			b.User1,
			b.User2,
			b.User3,
			b.User4,
			b.User5
		FROM chitietthanhvien a
			inner join thanhvien b on a.Ten_dang_nhap = b.Ten_DN
			inner join vaitro c on c.ID = b.Ma_vai_tro
			inner join khoa_trungtam d on d.ID = b.Ma_bo_phan  
		WHERE a.Ten LIKE '%' + @Ten + '%'
	END
	
	IF @MaVaiTro <> -1 AND @Ten <> ''
	BEGIN
		SELECT 
			b.ID AS MaThanhVien, 
			b.Ten_DN AS TenDangNhap, 
			b.Mat_khau AS MatKhau,
			b.Ma_bo_phan AS MaBoPhan, 
			a.Ho as Ho, 
			a.Ten_lot as TenLot, 
			a.Ten AS Ten, 
			c.Ten_vai_tro As TenVaiTro,
			d.Ten AS TenBoPhan,
			b.Ma_vai_tro AS MaVaiTro, 
			a.Tinh_trang as TinhTrang, 
			a.Email As Email, 
			b.Ngay_tao AS NgayTao, 
			b.Ngay_truy_cap_cuoi AS NgayTruyCapCuoi, 
			b.Ngay_cap_nhat_cuoi AS NgayCapNhatCuoi, 
			b.User1,
			b.User2,
			b.User3,
			b.User4,
			b.User5
		FROM chitietthanhvien a
			inner join thanhvien b on a.Ten_dang_nhap = b.Ten_DN
			inner join vaitro c on c.ID = b.Ma_vai_tro
			inner join khoa_trungtam d on d.ID = b.Ma_bo_phan
		WHERE a.Ten LIKE '%' + @Ten + '%'
			AND Ma_vai_tro = @MaVaiTro
	END 

END

GO

--sp_Admin_ShowVaiTro.sql

/***********************************************************
* Purpose : phan trang vai tro
* Author : HuyenLY
* Date: 02-06-2010
* Description: phan trang vai tro
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_ShowVaiTro]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_ShowVaiTro]
GO
CREATE PROCEDURE sp_Admin_ShowVaiTro

	@numRows		varchar(10),
	@totalPages		varchar(10)

AS
BEGIN
	DECLARE @sql NVarchar(1000)
	SELECT @sql = '
	select * from (
		select top ' + @numRows + ' * 
		from (
			select top ' + @totalPages + ' *
			from (
				select 
					A.ID AS MaVaiTro,  
					A.ten_vai_tro AS TenVaiTro,
					A.ngay_cap_nhat_cuoi AS NgayCapNhatCuoi 
				from vaitro A
			) AS TB0
			order by TB0.TenVaiTro desc
		) as TB1 
		order by TB1.TenVaiTro asc
	) as TB2 
	order by TB2.TenVaiTro asc'

	exec  sp_executesql @sql
END


--sp_Admin_ShowVaiTro '5','8'
GO

--sp_Admin_UpdateChuyenNganh.sql

/***********************************************************
* Purpose : update lop hoc
* Author : TuanHQ
* Date: 18-04-2010S
* Description: update lop hoc
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_UpdateChuyenNganh]'))
drop proc [sp_Admin_UpdateChuyenNganh]
GO
CREATE PROC sp_Admin_UpdateChuyenNganh

	@ID					int,
	@Ten_chuyen_nganh	nvarchar(200),
	@Ki_hieu			nvarchar(80),
	@Ma_khoaTT			int,
	@Ngay_tao			datetime,
	@Ngay_cap_nhat_cuoi	datetime
AS
BEGIN

	set @Ngay_tao = getdate()
	set @Ngay_cap_nhat_cuoi = getdate()
	Update chuyennganh 
	Set 
		Ten_chuyen_nganh = @Ten_chuyen_nganh,
		Ki_hieu = @Ki_hieu,
		Ma_khoaTT = @Ma_khoaTT,
		Ngay_tao = @Ngay_tao
	where ID = @ID
END
GO

--sp_Admin_UpdateCongTac.sql

/***********************************************************
* Purpose : updat cong tac
* Author : TuanHQ
* Date: 30-07-2010S
* Description: update cong tac
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_UpdateCongTac]'))
drop proc [sp_Admin_UpdateCongTac]
GO
CREATE PROC sp_Admin_UpdateCongTac
	@ID			int,
	@Noi_dung	nvarchar(4000),
	@Ghi_chu	nvarchar(400)
AS
BEGIN
	Update congtac 
	set
		Noi_dung = @Noi_dung,
		Ghi_chu = @Ghi_chu
	where ID = @ID	
END
GO

--sp_Admin_UpdateHocPhan.sql

/***********************************************************
* Purpose : Update "Hoc Phan"
* Author : HuyenLY
* Date: 02-06-2010
* Description: Update "Hoc Phan"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_UpdateHocPhan]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_UpdateHocPhan]
GO
CREATE PROCEDURE sp_Admin_UpdateHocPhan
	@ID				INT,
	@Ten			NVARCHAR(100),
	@GhiChu			NVARCHAR(200)

AS
BEGIN
	UPDATE HocPhan
	SET 
		Ten_hoc_phan=@Ten,
		Ghi_chu=@GhiChu,
		Ngay_cap_nhat_cuoi=getdate()
	WHERE ID=@ID
END


GO

--sp_Admin_UpdateKhoaTT.sql

/***********************************************************
* Purpose : Update "KHOA_TT"
* Author : HuyenLY
* Date: 02-06-2010
* Description: Update "KHOA_TT"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_UpdateKhoaTT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_UpdateKhoaTT]
GO
CREATE PROCEDURE sp_Admin_UpdateKhoaTT
	@ID				INT,
	@Ten			NVARCHAR(100),
	@Ma_truong_khoa	INT,
	@Nguoi_tao		INT
AS
BEGIN
	UPDATE Khoa_TrungTam
	SET 
		Ten=@Ten,
		Ma_truong_khoa=@Ma_truong_khoa,
		Nguoi_tao=@Nguoi_tao,
		Ngay_cap_nhat_cuoi=getdate()
	WHERE ID=@ID
END


GO

--sp_Admin_UpdateLopHoc.sql

/***********************************************************
* Purpose : update lop hoc
* Author : TuanHQ
* Date: 18-04-2010S
* Description: update lop hoc
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_UpdateLopHoc]'))
drop proc [sp_Admin_UpdateLopHoc]
GO
CREATE PROC sp_Admin_UpdateLopHoc
	@ID				int,
	@Ki_hieu		nvarchar(80),
	@Ma_lop_truong	int
AS
BEGIN
	Update LopHoc 
		Set 
			Ki_hieu = @Ki_hieu , 
			Ma_lop_truong = @Ma_lop_truong 
	where ID = @ID
END
GO

--sp_Admin_UpdateMonHoc.sql
/***********************************************************
* Purpose : update mon hoc
* Author : TuanHQ
* Date: 02-04-2010S
* Description: update mon hoc
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_UpdateMonHoc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_UpdateMonHoc]
GO
CREATE PROC sp_Admin_UpdateMonHoc
	@ID					nvarchar(5),
	@Ten_mon_hoc		nvarchar(200),
	@Ly_thuyet			nvarchar(5),
	@Thuc_hanh			nvarchar(5),
	@Kiem_tra			nvarchar(5),
	@Tinh_chat			nvarchar(200),
	@Ma_hoc_phan		nvarchar(5),
	@Ma_chuyen_nganh	nvarchar(5),
	@Ngay_tao			datetime,
	@Ma_nguoi_tao		nvarchar(5),
	@Ngay_cap_nhat_cuoi	datetime,
	@Ma_truong_bo_mon	nvarchar(5)


AS
BEGIN
	set @Ngay_cap_nhat_cuoi = getdate()
	update monhoc
	set				
		Ten_mon_hoc			=  @Ten_mon_hoc,
		Ly_thuyet			=  @Ly_thuyet,			
		Thuc_hanh			=  @Thuc_hanh,			
		Kiem_tra			=  @Kiem_tra,			
		Tinh_chat			=  @Tinh_chat,			
		Ma_hoc_phan			=  @Ma_hoc_phan,		
		Ma_chuyen_nganh		=  @Ma_chuyen_nganh,	
		Ngay_tao			=  @Ngay_tao,			
		Ma_nguoi_tao		=  @Ma_nguoi_tao,		
		Ngay_cap_nhat_cuoi	=  @Ngay_cap_nhat_cuoi,	
		Ma_truong_bo_mon	=  @Ma_truong_bo_mon
	where ID = @ID	
	
END

GO

--sp_Admin_UpdatePhongBan.sql
/***********************************************************
* Purpose : update phong ban
* Author : TuanHQ
* Date: 02-04-2010S
* Description: update phong ban
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_UpdatePhongBan]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_UpdatePhongBan]
GO
CREATE PROC sp_Admin_UpdatePhongBan
	@ID					int,
	@Ki_hieu_phong		nvarchar(80),
	@Vi_tri				nvarchar(80),
	@Chuc_nang			nvarchar(100),
	@Suc_chua			int,
	@Ngay_cap_nhat_cuoi	datetime

AS
BEGIN
	set @Ngay_cap_nhat_cuoi = getdate()
	update phongban 
	set	 
		Ki_hieu_phong = @Ki_hieu_phong, 
		Vi_tri = @Vi_tri, 
		Chuc_nang = @Chuc_nang, 
		Suc_chua = @Suc_chua, 
		ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
		where ID = @ID


END

GO

--sp_Admin_UpdateSysMenu.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_UpdateSysMenu]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_Admin_UpdateSysMenu]
GO
create proc sp_Admin_UpdateSysMenu
	@ID int,
	@appID int,
	@Menu_name nvarchar(100),
	@images nvarchar(100),
	@Menu_link nvarchar(100),
	@user1 varchar(40),
	@user2 varchar(40),
	@user3 varchar(40),
	@user4 varchar(40),
	@user5 varchar(40)
as
begin
	UPDATE SYS_MENU 
	SET Menu_name=@Menu_name,images=@images,Menu_link=@Menu_link,User1=@User1,User2=@User2,User3=@User3,User4=@User4,User5=@User5
	WHERE ID=@ID AND AppID=@appID 
end

GO

--sp_Admin_UpdateThanhVien.sql

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
GO

--sp_Admin_UpdateVaiTro.sql

/***********************************************************
* Purpose : update vai tro
* Author : TuanHQ
* Date: 18-04-2010S
* Description: update vai tro
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_UpdateVaiTro]'))
drop proc sp_Admin_UpdateVaiTro
GO
CREATE PROC sp_Admin_UpdateVaiTro
	@ID int,
	@Ten_vai_tro nvarchar(40),
	@Ngay_cap_nhat_cuoi datetime
AS
BEGIN
	set @Ngay_cap_nhat_cuoi = GETDATE();
	Update VaiTro Set Ten_vai_tro = @Ten_vai_tro where ID = @ID
END
GO

--sp_ISO_BoSungKHDT.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_BoSungKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_BoSungKHDT]
GO
CREATE PROCEDURE sp_ISO_BoSungKHDT
	@ID	int,
	@Tinh_trang int,
	@Bo_sung int output
AS
BEGIN
	DECLARE @Lan_bo_sung int
	SELECT @Lan_bo_sung = Bo_sung FROM KeHoachDaoTao WHERE ID = @ID
	UPDATE KeHoachDaoTao SET Bo_sung = @Lan_bo_sung + 1, Tinh_trang = @Tinh_trang WHERE ID = @ID
	SELECT @Bo_sung = Bo_sung FROM KeHoachDaoTao WHERE ID = @ID
END

GO

--sp_ISO_CheckCongTac.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_CheckCongTac]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_CheckCongTac]
GO
CREATE PROCEDURE sp_ISO_CheckCongTac
	@MaNguoiThucHien int,
	@MaBoPhanThucHien int,
	@MaNoiDungChiTietKHDT int
AS
BEGIN
	UPDATE NguoiThucHien SET Tinh_trang_thuc_hien = 1 WHERE ID = @MaNguoiThucHien
	If not exists(
		SELECT * 
			FROM NGUOITHUCHIEN
				WHERE Ma_bo_phan = @MaBoPhanThucHien AND Tinh_trang_thuc_hien = 0)
	Begin
		UPDATE NOIDUNGCHITIETKHDT SET Tinh_trang_thuc_hien = 1 WHERE ID = @MaNoiDungChiTietKHDT
	End
END

GO

--sp_ISO_CheckMonHocAndChuongTrinh.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_CheckMonHocAndChuongTrinh]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_CheckMonHocAndChuongTrinh]
GO
CREATE PROCEDURE sp_ISO_CheckMonHocAndChuongTrinh
	@Ma_chuong_trinh int,
	@Ma_mon_hoc int,
	@result varchar(1) output
AS
BEGIN
	If exists(
		SELECT * 
		FROM DeCuongMonHoc
		WHERE Ma_chuong_trinh = @Ma_chuong_trinh and Ma_mon_hoc = @Ma_mon_hoc)
	Begin
		SET @result = '1'
	End
	Else
	Begin
		SET @result = '0'
	End
END

GO

--sp_ISO_CheckNgheAndQuyetDinh.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_CheckNgheAndQuyetDinh]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_CheckNgheAndQuyetDinh]
GO
CREATE PROCEDURE sp_ISO_CheckNgheAndQuyetDinh
	@Ma_quyet_dinh int,
	@Ma_nghe int,
	@result varchar(1) output
AS
BEGIN
	If exists(
		SELECT * 
		FROM ChuongTrinhDaoTao
		WHERE Ma_quyet_dinh = @Ma_quyet_dinh and Ma_nghe = @Ma_nghe)
	Begin
		SET @result = '1'
	End
	Else
	Begin
		SET @result = '0'
	End
END

GO

--sp_ISO_DeleteBoPhanThucHienKHDT.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteBoPhanThucHienKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteBoPhanThucHienKHDT]
GO
CREATE PROCEDURE sp_ISO_DeleteBoPhanThucHienKHDT
	@ID	int
AS
BEGIN
	DELETE FROM NguoiThucHien WHERE Ma_bo_phan = @ID
	DELETE FROM BoPhanThucHienKHDT WHERE ID = @ID
END

GO

--sp_ISO_DeleteChiTietKHDT.sql

/***********************************************************
* Purpose : Delete "CHI TIET KE HOACH DAO TAO"
* Author : ThienVD
* Date: 02-04-2010
* Description: Delete "CHI TIET KE HOACH DAO TAO"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteChiTietKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteChiTietKHDT]
GO
CREATE PROCEDURE sp_ISO_DeleteChiTietKHDT
	@ID	int
AS
BEGIN
	DECLARE @Ma_noi_dung int
	DECLARE @Ma_bo_phan int

	DECLARE @Count_noi_dung int
	DECLARE @Count_bo_phan int

	DECLARE @I int
	SET @I = 1
	DECLARE @J int
	SELECT @Count_noi_dung = Count(*) FROM NoiDungChiTietKHDT WHERE Ma_chi_tiet_KHDT = @ID 
	WHILE (@I <= @Count_noi_dung)
	BEGIN
		SELECT TOP 1 @Ma_noi_dung = ID FROM NoiDungChiTietKHDT WHERE Ma_chi_tiet_KHDT = @ID
		SELECT @Count_bo_phan = COUNT(*) FROM BoPhanThucHienKHDT WHERE Ma_noi_dung_chi_tiet_KHDT = @Ma_noi_dung
		SET @J = 1
		WHILE(@J <= @Count_bo_phan)
		BEGIN
			SELECT TOP 1 @Ma_bo_phan = ID FROM BoPhanThucHienKHDT WHERE Ma_noi_dung_chi_tiet_KHDT = @Ma_noi_dung
			DELETE FROM NguoiThucHien WHERE Ma_bo_phan = @Ma_Bo_phan
			DELETE FROM BoPhanThucHienKHDT WHERE ID = @Ma_bo_phan
			SET @J = @J + 1
		END
		DELETE FROM NoiDungChiTietKHDT WHERE ID = @Ma_noi_dung
		SET @I = @I + 1
	END
	DELETE
	FROM ChiTietKHDT
	WHERE ID=@ID
END


GO

--sp_ISO_DeleteChiTietMonHocCTDT.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteChiTietMonHocCTDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteChiTietMonHocCTDT]
GO
CREATE PROCEDURE sp_ISO_DeleteChiTietMonHocCTDT
	@ID	int
AS
BEGIN

	DELETE
	FROM ChiTietMonHocCTDT
	WHERE ID=@ID
END


GO

--sp_ISO_DeleteChiTietTKB.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteChiTietTKB]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteChiTietTKB]
GO
CREATE PROCEDURE sp_ISO_DeleteChiTietTKB
	@ID	int
AS
BEGIN

	DELETE
	FROM ChiTietTKB
	WHERE ID=@ID
END

GO

--sp_ISO_DeleteDCMH.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteDCMH]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteDCMH]
GO
CREATE PROCEDURE sp_ISO_DeleteDCMH
	@ID	int
AS
BEGIN
	
	DELETE
	FROM NoiDungDCMH
	WHERE Ma_de_cuong = @ID

	DELETE
	FROM DeCuongMonHoc
	WHERE ID=@ID
END

GO

--sp_ISO_DeleteMoChuyenNganh.sql

/***********************************************************
* Purpose : Delete "Mo Chuyen Nganh"
* Author : ToanTT
* Date: 
* Description: Delete "Mo Chuyen Nganh"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteMoChuyenNganh]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteMoChuyenNganh]
GO
CREATE PROCEDURE sp_ISO_DeleteMoChuyenNganh
	@ID	int
AS
BEGIN

	DELETE
	FROM MoChuyenNganh
	WHERE ID=@ID
END


GO

--sp_ISO_DeleteMonHocTKB.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteMonHocTKB]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteMonHocTKB]
GO
CREATE PROCEDURE sp_ISO_DeleteMonHocTKB
	@Ma_mon_hoc			int,
	@Ma_TKB				int
AS
BEGIN
	DECLARE @Ma_mon_hoc_TKB	int
	SELECT @Ma_mon_hoc_TKB = ID FROM MonHocTKB WHERE Ma_mon_hoc = @Ma_mon_hoc AND Ma_TKB = @Ma_TKB
	DELETE
	FROM ChiTietTKB
	WHERE Ma_mon_hoc_TKB = @Ma_mon_hoc_TKB
	
	-- delete sudung(TKB chua sua)
	DELETE
	FROM SuDung
	WHERE Ma_mon_hoc_TKB = @Ma_mon_hoc_TKB
	--
	
	DELETE
	FROM MonHocTKB
	WHERE ID=@Ma_mon_hoc_TKB
END

GO

--sp_ISO_DeleteNguoiThucHienKHDT.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteNguoiThucHienKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteNguoiThucHienKHDT]
GO
CREATE PROCEDURE sp_ISO_DeleteNguoiThucHienKHDT
	@ID	int
AS
BEGIN
	DELETE FROM NguoiThucHien WHERE ID = @ID
END

GO

--sp_ISO_DeleteNoiDungChiTietKHDT.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteNoiDungChiTietKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteNoiDungChiTietKHDT]
GO
CREATE PROCEDURE sp_ISO_DeleteNoiDungChiTietKHDT
	@ID	int
AS
BEGIN
	DECLARE @Ma_bo_phan int

	DECLARE @Count_bo_phan int

	DECLARE @I int
	SET @I = 1
	SELECT @Count_bo_phan = COUNT(*) FROM BoPhanThucHienKHDT WHERE Ma_noi_dung_chi_tiet_KHDT = @ID
	WHILE(@I <= @Count_bo_phan)
	BEGIN
		SELECT TOP 1 @Ma_bo_phan = ID FROM BoPhanThucHienKHDT WHERE Ma_noi_dung_chi_tiet_KHDT = @ID
		DELETE FROM NguoiThucHien WHERE Ma_bo_phan = @Ma_Bo_phan
		DELETE FROM BoPhanThucHienKHDT WHERE ID = @Ma_bo_phan
		SET @I = @I + 1
	END
	DELETE FROM NoiDungChiTietKHDT WHERE ID = @ID
END

GO

--sp_ISO_DeleteNoiDungDCMH.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteNoiDungDCMH]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteNoiDungDCMH]
GO
CREATE PROCEDURE sp_ISO_DeleteNoiDungDCMH
	@ID	int
AS
BEGIN

	DELETE
	FROM NoiDungDCMH
	WHERE ID=@ID
END

GO

--sp_ISO_DeleteSuDung.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteSuDung]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteSuDung]
GO
CREATE PROCEDURE sp_ISO_DeleteSuDung
	@Ma_mon_hoc_TKB	int
AS
BEGIN

	DELETE
	FROM SuDung
	WHERE Ma_mon_hoc_TKB = @Ma_mon_hoc_TKB
END
GO

--sp_ISO_DeleteThoiKhoaBieu.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteThoiKhoaBieu]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteThoiKhoaBieu]
GO
CREATE PROCEDURE sp_ISO_DeleteThoiKhoaBieu
	@ID	int
AS
BEGIN

	DELETE
	FROM ChiTietTKB
	WHERE Ma_TKB = @ID

	DELETE
	FROM MonHocTKB
	Where Ma_TKB = @ID

	DELETE
	FROM ThoiKhoaBieu
	WHERE ID=@ID
	
END
GO

--sp_ISO_FindKeHoachDaoTaoByYear.sql

/***********************************************************
* Purpose : Search "KE HOACH DAO TAO" by YEAR
* Author : PhuongTQ
* Date: 06-04-2010
* Description: Search "KE HOACH DAO TAO" by YEAR
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_FindKeHoachDaoTaoByYear]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_FindKeHoachDaoTaoByYear]
GO
CREATE PROCEDURE sp_ISO_FindKeHoachDaoTaoByYear
	@Nam1 varchar(4),
	@result varchar(1) output
AS
BEGIN
	If exists(
		SELECT Nam1 
		FROM KeHoachDaoTao
		WHERE Nam1 = @Nam1)
	Begin
		SET @result = '1'
	End
	Else
	Begin
		SET @result = '0'
	End
END


GO

--sp_ISO_FindKHGDdByLopAndMonHoc.sql

/***********************************************************
* Purpose : Search "Ke Hoach Giang Day" by Lop && MonHoc
* Author : ToanTT
* Date: 15-06-2010
* Description: Search "Ke Hoach Giang Day" by Lop && MonHoc
***********************************************************/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_FindKHGDByLopAndMonHoc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_FindKHGDByLopAndMonHoc]
GO
CREATE PROCEDURE sp_ISO_FindKHGDByLopAndMonHoc
	@maLop			int,
	@maMonHoc		int,
	@result			varchar(1) output
AS
BEGIN
	If exists(
		SELECT Ma_lop, Ma_mon_hoc
		FROM KEHOACHGIANGDAY
		WHERE Ma_lop = @maLop AND Ma_mon_hoc = @maMonHoc)
		Begin
			SET @result = '1'
		End
	Else
		Begin
			SET @result = '0'
		End
END


GO

--sp_ISO_FindQuyetDinhByYearAndHeDaoTao.sql

/***********************************************************
* Purpose : Search "Quyet Dinh" by YEAR and HEDAOTAO
* Author : ToanTT
* Date: 12-04-2010
* Description: Search Quyet Dinh" by YEAR and HEDAOTAO
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].sp_ISO_FindQuyetDinhByYearAndHeDaoTao') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].sp_ISO_FindQuyetDinhByYearAndHeDaoTao
GO
CREATE PROCEDURE sp_ISO_FindQuyetDinhByYearAndHeDaoTao
	@Nam			varchar(4),
	@HeDaoTao	nvarchar(200),
	@result			varchar(1) output
AS
BEGIN
	If exists(
		SELECT Nam_bat_dau, Ma_he_dao_tao
		FROM QuyetDinhMoLop
		WHERE Nam_bat_dau = @Nam AND Ma_he_dao_tao = @HeDaoTao)
		Begin
			SET @result = '1'
		End
	Else
		Begin
			SET @result = '0'
		End
END


GO

--sp_ISO_GetChuongTrinhDaoTao.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetChuongTrinhDaoTao]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetChuongTrinhDaoTao]
GO
CREATE PROCEDURE sp_ISO_GetChuongTrinhDaoTao
	@NumRows		VARCHAR(2),
	@TotalRows      varchar(5),
	@CurrentPage	VARCHAR(2),
	@Tinh_trang		varchar(2),
	@Ma_nguoi_tao   varchar(2)		
AS
BEGIN
	DECLARE @sql NVarchar(1000)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_khong_phai_nguoi_tao nvarchar(100)
	DECLARE @Dieu_kien_ma_nguoi_tao nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(5)
	SET @Dieu_kien_tinh_trang = ''
	SET @Dieu_kien_khong_phai_nguoi_tao = ''
	SET @Dieu_kien_ma_nguoi_tao = ''
	SET @And = ''
	SET @Where = ''
	if(@Tinh_trang <> '' and @Ma_nguoi_tao <> '')
	BEGIN
		SET @And = ' and '
	END
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Where = 'Where '
		SET @Dieu_kien_tinh_trang = ' Tinh_trang = ' + @Tinh_trang
	END
	
	if(@Ma_nguoi_tao <> '')
	BEGIN
		SET @Where = 'Where '
		if not exists(Select * From ChuongTrinhDaoTao Where Ma_nguoi_tao = @Ma_nguoi_tao)
		BEGIN	
			SET @Dieu_kien_khong_phai_nguoi_tao = ' Tinh_trang <> 0 '
		END
		else
		BEGIN
			SET @Dieu_kien_ma_nguoi_tao = ' Ma_nguoi_tao = ' + @Ma_nguoi_tao
		END
	END
	--SELECT @sql = ''
	SELECT @sql = '
	SELECT TB2.ID As MaChuongTrinhDaoTao, TB2.Ten As TenChuongTrinhDaoTao, (C.Ho + '' '' + C.Ten_Lot + '' '' + C.Ten) As TenNguoiTao, 
	TB2.Tinh_trang As TinhTrang, TB2.Ly_do_reject As LyDoReject,
	cast(datepart(mm,TB2.Ngay_Cap_Nhat_Cuoi) as varchar) + ''-'' + cast(datepart(dd,TB2.Ngay_Cap_Nhat_Cuoi) as varchar) + ''-'' + cast(datepart(yy,TB2.Ngay_Cap_Nhat_Cuoi) as varchar) As NgayCapNhatCuoi,
	D.Ten As TenTrinhDo, E.Ten_chuyen_nganh As TenNghe
	FROM (
		SELECT TOP ' + @NumRows + '* 
		FROM (
			SELECT TOP ' + Cast(Cast(@TotalRows As Int) - (Cast(@CurrentPage As Int) - 1) * Cast(@NumRows As Int) As Varchar) + ' *
			FROM ChuongTrinhDaoTao '
			+ @Where + @Dieu_kien_tinh_trang + @And + @Dieu_kien_ma_nguoi_tao + @Dieu_kien_khong_phai_nguoi_tao +
			' ORDER BY Ngay_cap_nhat_cuoi ASC
		) AS TB1
		ORDER BY TB1.Ngay_cap_nhat_cuoi DESC
	) AS TB2 
	INNER JOIN ThanhVien As B On TB2.Ma_nguoi_tao = B.ID 
	INNER JOIN ChiTietThanhVien As C on B.Ten_DN = C.Ten_dang_nhap
	INNER JOIN HeDaoTao As D On TB2.Ma_trinh_do = D.ID
	INNER JOIN ChuyenNganh As E On TB2.Ma_nghe = E.ID'
	--ORDER BY TB2.Ngay_cap_nhat_cuoi DESC'
	exec  sp_executesql @sql
END

GO

--sp_ISO_GetCongTac.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetCongTac]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetCongTac]
GO
CREATE PROCEDURE sp_ISO_GetCongTac
	@Tinh_trang		varchar(2),
	@Ma_nhan_vien   varchar(10),
	@Ma_nam_hoc		varchar(4),
	@Tuan_le		varchar(4)
AS
BEGIN
	DECLARE @sql					nvarchar(4000)
	DECLARE @Dieu_kien_tuan			nvarchar(1000)
	DECLARE @Dieu_kien_nam_hoc		nvarchar(1000)
	DECLARE @Dieu_kien_tinh_trang	nvarchar(1000)

	SET @Dieu_kien_tinh_trang = ''

	if(@Tinh_trang <> '')
	BEGIN
		IF(@Tinh_trang = '0')
			BEGIN
				SET @Dieu_kien_tinh_trang = ' AND isNULL(E.Tinh_trang_thuc_hien,0) = ' + @Tinh_trang
			END
		ELSE
			BEGIN
				SET @Dieu_kien_tinh_trang = ' AND E.Tinh_trang_thuc_hien = ' + @Tinh_trang
			END
	END
	
	-- kiem tra dieu kien nam hoc
	IF(@Ma_nam_hoc = '')
		BEGIN
			SET @Dieu_kien_nam_hoc = ' AND (A.Nam1 = cast(datepart(yyyy,GETDATE()) as varchar) OR A.Nam2 = cast(datepart(yyyy,GETDATE()) as varchar)) '
		END
	ELSE
		BEGIN
			DECLARE @namBatDau	varchar(4)
			DECLARE @namKetThuc varchar(4)
			SELECT @namBatDau = Nam_bat_dau, @namKetThuc = Nam_ket_thuc FROM NAMHOC WHERE ID = @Ma_nam_hoc
			SET @Dieu_kien_nam_hoc = ' AND (A.Nam1 = ' + @namBatDau  + ' OR A.Nam2 = ' + @namKetThuc + ') '
		END

	-- kiem tra dieu kien tuan le
	IF(@Tuan_le = '')
		BEGIN
			SET @Dieu_kien_tuan = ' AND (convert(varchar(10),B.Tu_ngay,110) <= convert(varchar(10),GETDATE(),110) 
										AND convert(varchar(10),B.Den_ngay,110) >= convert(varchar(10),GETDATE(),110)) '
		END
	ELSE
		BEGIN
			IF(@Tuan_le = '0')
				BEGIN
					SET @Dieu_kien_tuan = ''
				END
			ELSE
				BEGIN
					DECLARE @ngayBatDau		varchar(20)
			DECLARE @ngayKetThuc	varchar(20)
			SELECT @ngayBatDau = convert(varchar(10),Tu_ngay,110), @ngayKetThuc = convert(varchar(10),Den_ngay,110) FROM TUANLE WHERE Ma_nam_hoc = @Ma_nam_hoc AND So_thu_tu = @Tuan_le
			SET @Dieu_kien_tuan = 'AND (convert(varchar(10),B.Tu_ngay,110) = ''' + @ngayBatDau + ''' AND convert(varchar(10),B.Den_ngay,110) = ''' + @ngayKetThuc + ''' ) '
				END
		END

	SELECT @sql = 'SELECT C.ID As MaNoiDungChiTietKHDT, D.ID As MaBoPhanThucHien, E.ID As MaNguoiThucHien, 
						A.Ten As Ten,C.Noi_dung_cong_tac As NoiDungCongTac, D.Ten_bo_phan As TenBoPhan, E.Ten_thanh_vien As TenThanhVien , G.Email As Email, 
						(cast(datepart(dd,B.Tu_ngay) as varchar) + ''-'' + cast(datepart(mm,B.Tu_ngay) as varchar) + ''-'' + cast(datepart(yyyy,B.Tu_ngay) as varchar)) As Tu_ngay, 
						(cast(datepart(dd,B.Den_ngay) as varchar) + ''-'' + cast(datepart(mm,B.Den_ngay) as varchar) + ''-'' + cast(datepart(yyyy,B.Den_ngay) as varchar)) As Den_ngay, 
						E.Tinh_trang_thuc_hien As TinhTrangThucHien 
					FROM KeHoachDaoTao A 
						INNER JOIN ChiTietKHDT B ON A.ID=B.Ma_ke_hoach 
						INNER JOIN NoiDungChiTietKHDT C ON B.ID=C.Ma_chi_tiet_KHDT 
						INNER JOIN BoPhanThucHienKHDT D ON C.ID=D.Ma_noi_dung_chi_tiet_KHDT 
						INNER JOIN NguoiThucHien E ON D.ID=E.Ma_bo_phan 
						INNER JOIN ThanhVien F ON E.Ma_thanh_vien=F.ID 
						INNER JOIN ChiTietThanhVien G ON F.Ten_DN=G.Ten_dang_nhap 
					WHERE A.Tinh_trang=2 
						AND F.ID = ' + @Ma_nhan_vien + @Dieu_kien_nam_hoc + @Dieu_kien_tuan + @Dieu_kien_tinh_trang + '
						ORDER BY B.Tu_ngay ASC'
	exec sp_executesql @sql
	--print @sql
END
--sp_help sp_executesql
--sp_ISO_GetCongTac '',0,'',''
--select * from thanhvien

/*	SELECT * FROM THANHVIENNGUOITHUCHIEN
	@Tinh_trang		varchar(2),
	@Ma_nhan_vien   varchar(10),
	@Ma_nam_hoc		varchar(4),
	@Tuan_le		varchar(4)

	NumRows  = 3
	TotalRows = 8
	CurrentPage = 1

	sp_ISO_GetQuyetDinhDaoTao NumRows,TotalRows-(CurrentPage-1)*NumRows

	sp_ISO_GetQuyetDinhDaoTao 3,2

	select count(*)/3 from ThanhVien
*/
--select count(*)/ from ThanhVien

GO

--sp_ISO_GetCongTacReport.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetCongTacReport]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetCongTacReport]
GO
CREATE PROCEDURE sp_ISO_GetCongTacReport
	@Ma_thanh_vien	varchar(5),
	@Tinh_trang		varchar(2),
	@Khoa			varchar(10),
	@Ma_nam_hoc		varchar(4),
	@Tuan_le		varchar(4)
AS
BEGIN
	DECLARE @sql					nvarchar(4000)
	DECLARE @Dieu_kien_tuan			nvarchar(1000)
	DECLARE @Dieu_kien_nam_hoc		nvarchar(1000)
	DECLARE @Dieu_kien_tinh_trang	nvarchar(1000)
	DECLARE @Dieu_kien_khoa			nvarchar(1000)
	DECLARE @Truong_khoa			nvarchar(1000)

	-- kiem tra dieu kien tinh trang
	SET @Dieu_kien_tinh_trang = ''
	IF(@Tinh_trang <> '')
		BEGIN
			IF(@Tinh_trang = '0')
				BEGIN
					SET @Dieu_kien_tinh_trang = ' AND isNULL(E.Tinh_trang_thuc_hien,0) = '+ @Tinh_trang
				END
			ELSE
				BEGIN
					SET @Dieu_kien_tinh_trang = ' AND E.Tinh_trang_thuc_hien = ' + @Tinh_trang
				END
		END
	
	-- kiem tra dieu kien khoa
	SET @Dieu_kien_khoa = ''
	IF not exists (SELECT * FROM Khoa_TrungTam WHERE Ma_truong_khoa = @Ma_thanh_vien)
		BEGIN
			IF(@Khoa <> '')
				BEGIN
					SET @Dieu_kien_khoa = ' AND D.Ma_khoa = ' + @Khoa
				END
		END
	ELSE
		BEGIN
			SELECT * INTO #TempKhoa FROM Khoa_TrungTam WHERE Ma_truong_khoa = @Ma_thanh_vien
			DECLARE @IDKhoa int		
			DECLARE @C CURSOR
			DECLARE @if varchar(4)
			DECLARE @count int
			SET @count = 0
			SET @C = CURSOR FOR SELECT ID FROM #TempKhoa
			OPEN @C 
			FETCH NEXT FROM @C INTO @IDKhoa
				WHILE @@fetch_status = 0
					BEGIN
						IF(@count = 0)
							BEGIN
								SET @if = ''
							END
						ELSE
							BEGIN
								SET @if = ' OR '
							END
						SET @Dieu_kien_khoa = @Dieu_kien_khoa + @if + ' D.Ma_khoa = ' + convert(varchar(10),(SELECT ID FROM Khoa_TrungTam WHERE ID = @IDKhoa))
						SET @count = @count + 1
						FETCH NEXT FROM @C INTO @IDKhoa
					END
				CLOSE @C
			DEALLOCATE @C
			SET @Dieu_kien_khoa = 'AND (' + @Dieu_kien_khoa + ')'
		END

	-- kiem tra dieu kien nam hoc
	IF(@Ma_nam_hoc = '')
		BEGIN
			SET @Dieu_kien_nam_hoc = ' AND (A.Nam1 = cast(datepart(yyyy,GETDATE()) as varchar) OR A.Nam2 = cast(datepart(yyyy,GETDATE()) as varchar)) '
		END
	ELSE
		BEGIN
			DECLARE @namBatDau	varchar(4)
			DECLARE @namKetThuc varchar(4)
			SELECT @namBatDau = Nam_bat_dau, @namKetThuc = Nam_ket_thuc FROM NAMHOC WHERE ID = @Ma_nam_hoc
			SET @Dieu_kien_nam_hoc = ' AND (A.Nam1 = ' + @namBatDau  + ' OR A.Nam2 = ' + @namKetThuc + ') '
		END

	-- kiem tra dieu kien tuan le
	IF(@Tuan_le = '')
		BEGIN
			SET @Dieu_kien_tuan = ' AND (convert(varchar(10),B.Tu_ngay,110) <= convert(varchar(10),GETDATE(),110) 
										AND convert(varchar(10),B.Den_ngay,110) >= convert(varchar(10),GETDATE(),110)) '
		END
	ELSE
		BEGIN
			IF(@Tuan_le = '0')
				BEGIN
					SET @Dieu_kien_tuan = ''
				END
			ELSE
				BEGIN
					DECLARE @ngayBatDau		varchar(20)
			DECLARE @ngayKetThuc	varchar(20)
			SELECT @ngayBatDau = convert(varchar(10),Tu_ngay,110), @ngayKetThuc = convert(varchar(10),Den_ngay,110) FROM TUANLE WHERE Ma_nam_hoc = @Ma_nam_hoc AND So_thu_tu = @Tuan_le
			SET @Dieu_kien_tuan = 'AND (convert(varchar(10),B.Tu_ngay,110) = ''' + @ngayBatDau + ''' AND convert(varchar(10),B.Den_ngay,110) = ''' + @ngayKetThuc + ''' ) '
				END
		END

	SET @sql = 'SELECT C.ID As MaNoiDungChiTietKHDT, D.ID As MaBoPhanThucHien, E.ID As MaNguoiThucHien, 
						A.Ten As Ten,C.Noi_dung_cong_tac As NoiDungCongTac, D.Ten_bo_phan As TenBoPhan, E.Ten_thanh_vien As TenThanhVien , G.Email As Email, 
						(cast(datepart(dd,B.Tu_ngay) as varchar) + ''-'' + cast(datepart(mm,B.Tu_ngay) as varchar) + ''-'' + cast(datepart(yyyy,B.Tu_ngay) as varchar)) As Tu_ngay, 
						(cast(datepart(dd,B.Den_ngay) as varchar) + ''-'' + cast(datepart(mm,B.Den_ngay) as varchar) + ''-'' + cast(datepart(yyyy,B.Den_ngay) as varchar)) As Den_ngay, 
						E.Tinh_trang_thuc_hien As TinhTrangThucHien 
					FROM KeHoachDaoTao A 
						INNER JOIN ChiTietKHDT B ON A.ID=B.Ma_ke_hoach 
						INNER JOIN NoiDungChiTietKHDT C ON B.ID=C.Ma_chi_tiet_KHDT 
						INNER JOIN BoPhanThucHienKHDT D ON C.ID=D.Ma_noi_dung_chi_tiet_KHDT 
						INNER JOIN NguoiThucHien E ON D.ID=E.Ma_bo_phan 
						INNER JOIN ThanhVien F ON E.Ma_thanh_vien=F.ID 
						INNER JOIN ChiTietThanhVien G ON F.Ten_DN=G.Ten_dang_nhap 
					WHERE A.Tinh_trang=2 
						' + @Dieu_kien_khoa
						+ @Dieu_kien_nam_hoc + @Dieu_kien_tuan + @Dieu_kien_tinh_trang + ' 
						ORDER BY B.Tu_ngay ASC, D.Ma_khoa ASC'
	exec sp_executesql @sql
	--print @sql
END
GO

--sp_ISO_GetCountChuongTrinhDaoTao.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetCountChuongTrinhDaoTao]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetCountChuongTrinhDaoTao]
GO
CREATE PROCEDURE sp_ISO_GetCountChuongTrinhDaoTao
	@Tinh_trang		varchar(2),
	@Ma_nguoi_tao   varchar(2)
AS
BEGIN
	DECLARE @sql NVarchar(200)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_khong_phai_nguoi_tao nvarchar(100)
	DECLARE @Dieu_kien_ma_nguoi_tao nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(5)
	SET @Dieu_kien_tinh_trang = ''
	SET @Dieu_kien_khong_phai_nguoi_tao = ''
	SET @Dieu_kien_ma_nguoi_tao = ''
	SET @And = ''
	SET @Where = ''
	if(@Tinh_trang <> '' and @Ma_nguoi_tao <> '')
	BEGIN
		SET @And = ' and '
	END
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Where = 'Where '
		SET @Dieu_kien_tinh_trang = ' Tinh_trang = ' + @Tinh_trang
	END

	if(@Ma_nguoi_tao <> '')
	BEGIN
		SET @Where = 'Where '
		if not exists(Select * From ChuongTrinhDaoTao Where Ma_nguoi_tao = @Ma_nguoi_tao)
		BEGIN	
			SET @Dieu_kien_khong_phai_nguoi_tao = ' Tinh_trang <> 0 '
		END
		else
		BEGIN
			SET @Dieu_kien_ma_nguoi_tao = ' Ma_nguoi_tao = ' + @Ma_nguoi_tao
		END
	END

	SELECT @sql = ' 
		SELECT COUNT(*) AS Count
		FROM ChuongTrinhDaoTao '
		+ @Where + @Dieu_kien_tinh_trang + @And + @Dieu_kien_ma_nguoi_tao + @Dieu_kien_khong_phai_nguoi_tao
	exec sp_executesql @sql
	--PRINT @sql	
END
GO

--sp_ISO_GetCountCongTac.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetCountCongTac]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetCountCongTac]
GO
CREATE PROCEDURE sp_ISO_GetCountCongTac
	@Ma_thanh_vien  varchar(4),
	@Ma_nam_hoc		varchar(4),
	@Tuan_le		varchar(4)
AS
BEGIN
	DECLARE @sql					nvarchar(4000)
	DECLARE @Dieu_kien_tuan			nvarchar(1000)
	DECLARE @Dieu_kien_nam_hoc		nvarchar(1000)
	-- kiem tra dieu kien nam hoc
	IF(@Ma_nam_hoc = '')
		BEGIN
			SET @Dieu_kien_nam_hoc = ' AND (A.Nam1 = cast(datepart(yyyy,GETDATE()) as varchar) OR A.Nam2 = cast(datepart(yyyy,GETDATE()) as varchar)) '
		END
	ELSE
		BEGIN
			DECLARE @namBatDau	varchar(4)
			DECLARE @namKetThuc varchar(4)
			SELECT @namBatDau = Nam_bat_dau, @namKetThuc = Nam_ket_thuc FROM NAMHOC WHERE ID = @Ma_nam_hoc
			SET @Dieu_kien_nam_hoc = ' AND (A.Nam1 = ' + @namBatDau  + ' OR A.Nam2 = ' + @namKetThuc + ') '
		END
	-- kiem tra dieu kien tuan le
	IF(@Tuan_le = '')
		BEGIN
			SET @Dieu_kien_tuan = ' AND (convert(varchar(10),B.Tu_ngay,110) <= convert(varchar(10),GETDATE(),110) 
										AND convert(varchar(10),B.Den_ngay,110) >= convert(varchar(10),GETDATE(),110)) '
		END
	ELSE
		BEGIN
			IF(@Tuan_le = '0')
				BEGIN
					SET @Dieu_kien_tuan = ''
				END
			ELSE
				BEGIN
					DECLARE @ngayBatDau		varchar(20)
			DECLARE @ngayKetThuc	varchar(20)
			SELECT @ngayBatDau = convert(varchar(10),Tu_ngay,110), @ngayKetThuc = convert(varchar(10),Den_ngay,110) FROM TUANLE WHERE Ma_nam_hoc = @Ma_nam_hoc AND So_thu_tu = @Tuan_le
			SET @Dieu_kien_tuan = 'AND (convert(varchar(10),B.Tu_ngay,110) = ''' + @ngayBatDau + ''' AND convert(varchar(10),B.Den_ngay,110) = ''' + @ngayKetThuc + ''' ) '
				END
		END
	-- thuc thi
	SELECT @sql = 'SELECT Count(C.ID) As Count
		FROM KeHoachDaoTao A 
			INNER JOIN ChiTietKHDT B ON A.ID=B.Ma_ke_hoach 
			INNER JOIN NoiDungChiTietKHDT C ON B.ID=C.Ma_chi_tiet_KHDT 
			INNER JOIN BoPhanThucHienKHDT D ON C.ID=D.Ma_noi_dung_chi_tiet_KHDT 
			INNER JOIN NguoiThucHien E ON D.ID=E.Ma_bo_phan 
			INNER JOIN ThanhVien F ON E.Ma_thanh_vien=F.ID 
			INNER JOIN ChiTietThanhVien G ON F.Ten_DN=G.Ten_dang_nhap 
		WHERE A.Tinh_trang=2 
		AND F.ID = ' + @Ma_thanh_vien + @Dieu_kien_nam_hoc + @Dieu_kien_tuan
	exec sp_executesql @sql
	--PRINT @sql
END
GO

--sp_ISO_GetCountDeCuongMonHoc.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetCountDeCuongMonHoc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetCountDeCuongMonHoc]
GO
CREATE PROCEDURE sp_ISO_GetCountDeCuongMonHoc
	@Tinh_trang		varchar(2),
	@Ma_nguoi_tao   varchar(2)
AS
BEGIN
	DECLARE @sql NVarchar(200)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_khong_phai_nguoi_tao nvarchar(100)
	DECLARE @Dieu_kien_ma_nguoi_tao nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(5)
	SET @Dieu_kien_tinh_trang = ''
	SET @Dieu_kien_khong_phai_nguoi_tao = ''
	SET @Dieu_kien_ma_nguoi_tao = ''
	SET @And = ''
	SET @Where = ''
	if(@Tinh_trang <> '' and @Ma_nguoi_tao <> '')
	BEGIN
		SET @And = ' and '
	END
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Where = 'Where '
		SET @Dieu_kien_tinh_trang = ' Tinh_trang = ' + @Tinh_trang
	END

	if(@Ma_nguoi_tao <> '')
	BEGIN
		SET @Where = 'Where '
		if not exists(Select * From DeCuongMonHoc Where Ma_nguoi_tao = @Ma_nguoi_tao)
		BEGIN	
			SET @Dieu_kien_khong_phai_nguoi_tao = ' Tinh_trang <> 0 '
		END
		else
		BEGIN
			SET @Dieu_kien_ma_nguoi_tao = ' Ma_nguoi_tao = ' + @Ma_nguoi_tao
		END
	END

	SELECT @sql = ' 
		SELECT COUNT(*) AS Count
		FROM DeCuongMonHoc '
		+ @Where + @Dieu_kien_tinh_trang + @And + @Dieu_kien_ma_nguoi_tao + @Dieu_kien_khong_phai_nguoi_tao
	exec sp_executesql @sql
	--PRINT @sql	
END
GO

--sp_ISO_GetCountKeHoachDaoTao.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetCountKeHoachDaoTao]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetCountKeHoachDaoTao]
GO
CREATE PROCEDURE sp_ISO_GetCountKeHoachDaoTao
	@Tinh_trang		varchar(2),
	@Ma_bo_phan		varchar(5),
	@Ma_PDT			varchar(5)
AS
BEGIN
	DECLARE @sql NVarchar(200)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_bo_phan nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(5)
	SET @Dieu_kien_tinh_trang = ''
	SET @Dieu_kien_bo_phan = ''
	SET @And = ''
	SET @Where = ''
	if(@Tinh_trang <> '' and @Ma_bo_phan <> '')
	BEGIN
		if (@Ma_bo_phan <> @Ma_PDT)
		BEGIN
			SET @And = ' and '
		END
	END
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Where = 'Where '
		SET @Dieu_kien_tinh_trang = ' Tinh_trang = ' + @Tinh_trang
	END

	if(@Ma_bo_phan <> '')
	BEGIN
		if (@Ma_bo_phan <> @Ma_PDT)
		BEGIN	
			SET @Where = 'Where '
			SET @Dieu_kien_bo_phan = ' Tinh_trang <> 0 '
		END
	END

	SELECT @sql = ' 
		SELECT COUNT(*) AS Count
		FROM KEHOACHDAOTAO '
		+ @Where + @Dieu_kien_tinh_trang + @And + @Dieu_kien_bo_phan
	exec sp_executesql @sql
	--PRINT @sql	
END
GO

--sp_ISO_GetCountKeHoachGiangDay.sql
/***********************************************************
* Purpose : Get Count "KE HOACH GIANG DAY"
* Author : ToanTT
* Date: 12-05-2010
* Description: Get Count "KE HOACH GIANG DAY"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetCountKeHoachGiangDay]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetCountKeHoachGiangDay]
GO
CREATE PROCEDURE sp_ISO_GetCountKeHoachGiangDay
	@Tinh_trang		varchar(2),
	@Ma_nguoi_tao   varchar(2)
AS
BEGIN
	DECLARE @sql NVarchar(200)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_khong_phai_nguoi_tao nvarchar(100)
	DECLARE @Dieu_kien_ma_nguoi_tao nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(5)
	SET @Dieu_kien_tinh_trang = ''
	SET @Dieu_kien_khong_phai_nguoi_tao = ''
	SET @Dieu_kien_ma_nguoi_tao = ''
	SET @And = ''
	SET @Where = ''
	if(@Tinh_trang <> '' and @Ma_nguoi_tao <> '')
	BEGIN
		SET @And = ' and '
	END
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Where = 'Where '
		SET @Dieu_kien_tinh_trang = ' Tinh_trang = ' + @Tinh_trang
	END

	if(@Ma_nguoi_tao <> '')
	BEGIN
		SET @Where = 'Where '
		if not exists(Select * From KeHoachGiangDay Where Ma_nguoi_tao = @Ma_nguoi_tao)
		BEGIN	
			SET @Dieu_kien_khong_phai_nguoi_tao = ' Tinh_trang <> 0 '
		END
		else
		BEGIN
			SET @Dieu_kien_ma_nguoi_tao = ' Ma_nguoi_tao = ' + @Ma_nguoi_tao
		END
	END

	SELECT @sql = ' 
		SELECT COUNT(*) AS Count
		FROM KeHoachGiangDay '
		+ @Where + @Dieu_kien_tinh_trang + @And + @Dieu_kien_ma_nguoi_tao + @Dieu_kien_khong_phai_nguoi_tao
	exec sp_executesql @sql
	--PRINT @sql	
END
GO

--sp_ISO_GetCountQuyetDinhDaoTao.sql
/***********************************************************
* Purpose : Get Count "QUYET DINH DAO TAO"
* Author : ToanTT
* Date: 05-05-2010
* Description: Get Count "QUYET DINH DAO TAO"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetCountQuyetDinhDaoTao]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetCountQuyetDinhDaoTao]
GO
CREATE PROCEDURE sp_ISO_GetCountQuyetDinhDaoTao
	@Tinh_trang		varchar(2),
	@Ma_nguoi_tao   varchar(2)
AS
BEGIN
	DECLARE @sql NVarchar(200)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_khong_phai_nguoi_tao nvarchar(100)
	DECLARE @Dieu_kien_ma_nguoi_tao nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(5)
	SET @Dieu_kien_tinh_trang = ''
	SET @Dieu_kien_khong_phai_nguoi_tao = ''
	SET @Dieu_kien_ma_nguoi_tao = ''
	SET @And = ''
	SET @Where = ''
	if(@Tinh_trang <> '' and @Ma_nguoi_tao <> '')
	BEGIN
		SET @And = ' and '
	END
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Where = 'Where '
		SET @Dieu_kien_tinh_trang = ' Tinh_trang = ' + @Tinh_trang
	END

	if(@Ma_nguoi_tao <> '')
	BEGIN
		SET @Where = 'Where '
		if not exists(Select * From QuyetDinhMoLop Where Ma_nguoi_lap = @Ma_nguoi_tao)
		BEGIN	
			SET @Dieu_kien_khong_phai_nguoi_tao = ' Tinh_trang <> 0 '
		END
		else
		BEGIN
			SET @Dieu_kien_ma_nguoi_tao = ' Ma_nguoi_lap = ' + @Ma_nguoi_tao
		END
	END

	SELECT @sql = ' 
		SELECT COUNT(*) AS Count
		FROM QuyetDinhMoLop '
		+ @Where + @Dieu_kien_tinh_trang + @And + @Dieu_kien_ma_nguoi_tao + @Dieu_kien_khong_phai_nguoi_tao
	exec sp_executesql @sql
	--PRINT @sql	
END
GO

--sp_ISO_GetCountThoiKhoaBieu.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetCountThoiKhoaBieu]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetCountThoiKhoaBieu]
GO
CREATE PROCEDURE sp_ISO_GetCountThoiKhoaBieu
	@Tinh_trang		varchar(2),
	@Ma_nguoi_tao   varchar(2)
AS
BEGIN
	DECLARE @sql NVarchar(200)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_khong_phai_nguoi_tao nvarchar(100)
	DECLARE @Dieu_kien_ma_nguoi_tao nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(5)
	SET @Dieu_kien_tinh_trang = ''
	SET @Dieu_kien_khong_phai_nguoi_tao = ''
	SET @Dieu_kien_ma_nguoi_tao = ''
	SET @And = ''
	SET @Where = ''
	if(@Tinh_trang <> '' and @Ma_nguoi_tao <> '')
	BEGIN
		SET @And = ' and '
	END
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Where = 'Where '
		SET @Dieu_kien_tinh_trang = ' Tinh_trang = ' + @Tinh_trang
	END

	if(@Ma_nguoi_tao <> '')
	BEGIN
		SET @Where = 'Where '
		if not exists(Select * From ThoiKhoaBieu Where Ma_nguoi_tao = @Ma_nguoi_tao)
		BEGIN	
			SET @Dieu_kien_khong_phai_nguoi_tao = ' Tinh_trang <> 0 '
		END
		else
		BEGIN
			SET @Dieu_kien_ma_nguoi_tao = ' Ma_nguoi_tao = ' + @Ma_nguoi_tao
		END
	END

	SELECT @sql = ' 
		SELECT COUNT(*) AS Count
		FROM ThoiKhoaBieu '
		+ @Where + @Dieu_kien_tinh_trang + @And + @Dieu_kien_ma_nguoi_tao + @Dieu_kien_khong_phai_nguoi_tao
	exec sp_executesql @sql
	--PRINT @sql	
END
GO

--sp_ISO_GetDeCuongMonHoc.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetDeCuongMonHoc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetDeCuongMonHoc]
GO
CREATE PROCEDURE sp_ISO_GetDeCuongMonHoc
	@NumRows		VARCHAR(5),
	@TotalRows      varchar(5),
	@CurrentPage	VARCHAR(5),
	@Tinh_trang		varchar(5),
	@Ma_nguoi_tao   varchar(5)		
AS
BEGIN
	DECLARE @sql NVarchar(1000)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_khong_phai_nguoi_tao nvarchar(100)
	DECLARE @Dieu_kien_ma_nguoi_tao nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(5)
	SET @Dieu_kien_tinh_trang = ''
	SET @Dieu_kien_khong_phai_nguoi_tao = ''
	SET @Dieu_kien_ma_nguoi_tao = ''
	SET @And = ''
	SET @Where = ''
	if(@Tinh_trang <> '' and @Ma_nguoi_tao <> '')
	BEGIN
		SET @And = ' and '
	END
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Where = 'Where '
		SET @Dieu_kien_tinh_trang = ' Tinh_trang = ' + @Tinh_trang
	END
	
	if(@Ma_nguoi_tao <> '')
	BEGIN
		SET @Where = 'Where '
		if not exists(Select * From DeCuongMonHoc Where Ma_nguoi_tao = @Ma_nguoi_tao)
		BEGIN	
			SET @Dieu_kien_khong_phai_nguoi_tao = ' Tinh_trang <> 0 '
		END
		else
		BEGIN
			SET @Dieu_kien_ma_nguoi_tao = ' Ma_nguoi_tao = ' + @Ma_nguoi_tao
		END
	END
	--SELECT @sql = ''
	SELECT @sql = '
	SELECT TB2.ID As MaDeCuongMonHoc, TB2.Ten As TenDeCuongMonHoc, (C.Ho + '' '' + C.Ten_Lot + '' '' + C.Ten) As TenNguoiTao, 
	TB2.Tinh_trang As TinhTrang, TB2.Ly_do_reject As LyDoReject, D.Tinh_trang As TinhTrangChuongTrinh,
	cast(datepart(mm,TB2.Ngay_Cap_Nhat_Cuoi) as varchar) + ''-'' + cast(datepart(dd,TB2.Ngay_Cap_Nhat_Cuoi) as varchar) + ''-'' + cast(datepart(yy,TB2.Ngay_Cap_Nhat_Cuoi) as varchar) As NgayCapNhatCuoi
	FROM (
		SELECT TOP ' + @NumRows + '* 
		FROM (
			SELECT TOP ' + Cast(Cast(@TotalRows As Int) - (Cast(@CurrentPage As Int) - 1) * Cast(@NumRows As Int) As Varchar) + ' *
			FROM DeCuongMonHoc '
			+ @Where + @Dieu_kien_tinh_trang + @And + @Dieu_kien_ma_nguoi_tao + @Dieu_kien_khong_phai_nguoi_tao +
			' ORDER BY Ngay_cap_nhat_cuoi ASC
		) AS TB1
		ORDER BY TB1.Ngay_cap_nhat_cuoi DESC
	) AS TB2 
	INNER JOIN ThanhVien As B On TB2.Ma_nguoi_tao = B.ID 
	INNER JOIN ChiTietThanhVien As C on B.Ten_DN = C.Ten_dang_nhap
	INNER JOIN ChuongTrinhDaoTao As D ON TB2.Ma_chuong_trinh = D.ID'
	--ORDER BY TB2.id ASC'
	exec  sp_executesql @sql
END

GO

--sp_ISO_GetGiaoAnLyThuyet.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetGiaoAnLyThuyet]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetGiaoAnLyThuyet]
GO
CREATE PROCEDURE sp_ISO_GetGiaoAnLyThuyet
	@maGiaoAn int
AS
BEGIN
	SELECT 
		MA_KHGD,
		So_giao_an,
		Ngay_thuc_hien,
		Muc_tieu,
		Do_dung_PT_DH,
		On_dinh_LH,
		Thoi_gian_on_dinh,
		Thoi_gian_TH_BH,
		Dan_nhap,
		HD_dan_nhap_GV,
		HD_dan_nhap_HS,
		Thoi_gian_dan_nhap,
		Noi_dung_bai_giang,
		HD_giang_bai_moi_GV,
		HD_giang_bai_moi_HS,
		Thoi_gian_bai_giang,
		Cung_co_kien_thuc,
		HD_cung_co_GV,
		HD_cung_co_HS,
		Thoi_gian_cung_co,
		Huong_dan_tu_hoc,
		HD_HDTH_GV,
		HD_HDTH_HS,
		Thoi_gian_HDTH,
		Tai_lieu_tham_khao,
		Ma_nguoi_duyet,
		Ngay_duyet,
		Ngay_tao
	FROM GIAOAN
	WHERE ID=@maGiaoAn	
END

GO

--sp_ISO_GetGiaoAnThucHanh.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetGiaoAnThucHanh]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetGiaoAnThucHanh]
GO
CREATE PROCEDURE sp_ISO_GetGiaoAnThucHanh
	@maGiaoAn int
AS
BEGIN
	SELECT 
		MA_KHGD,
		So_giao_an,
		Ngay_thuc_hien,
		Muc_tieu,
		Do_dung_PT_DH,
		Hinh_thuc_TC_DH,
		On_dinh_LH,
		Thoi_gian_on_dinh,
		Thoi_gian_TH_BH,
		Dan_nhap,
		HD_dan_nhap_GV,
		HD_dan_nhap_HS,
		Thoi_gian_dan_nhap,
		Huong_dan_ban_dau,
		HD_HDBD_GV,
		HD_HDBD_HS,
		Thoi_gian_HDBD,
		Huong_dan_thuong_xuyen,
		HD_HDTX_GV,
		HD_HDTX_HS,
		Thoi_gian_HDTX,
		Huong_dan_ket_thuc,
		HD_HDKT_GV,
		HD_HDKT_HS,
		Thoi_gian_HDKT,
		Huong_dan_ren_luyen,
		HD_HDRL_GV,
		Thoi_gian_HDRL,
		Rut_kinh_nghiem,
		Ma_nguoi_duyet,
		Ngay_duyet,
		Ngay_tao		
	FROM GIAOAN
	WHERE ID=@maGiaoAn	
END

GO

--sp_ISO_GetKeHoachDaoTao.sql

/***********************************************************
* Purpose : Get "KE HOACH DAO TAO"
* Author : ThienVD
* Date: 28-04-2010
* Description: Get "KE HOACH DAO TAO"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetKeHoachDaoTao]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetKeHoachDaoTao]
GO
CREATE PROCEDURE sp_ISO_GetKeHoachDaoTao
	@NumRows		VARCHAR(2),
	@TotalRows      varchar(5),
	@CurrentPage	VARCHAR(2),
	@Tinh_trang		varchar(2),
	@Ma_bo_phan		varchar(5),
	@Ma_PDT			varchar(5)		
AS
BEGIN
	DECLARE @sql NVarchar(1000)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_bo_phan nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(5)
	SET @Dieu_kien_tinh_trang = ''
	SET @Dieu_kien_bo_phan = ''
	SET @And = ''
	SET @Where = ''
	if(@Tinh_trang <> '' and @Ma_bo_phan <> '')
	BEGIN
		if (@Ma_bo_phan <> @Ma_PDT)
		BEGIN
			SET @And = ' and '
		END
	END
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Where = 'Where '
		SET @Dieu_kien_tinh_trang = ' Tinh_trang = ' + @Tinh_trang
	END
	
	if(@Ma_bo_phan <> '')
	BEGIN
		if (@Ma_bo_phan <> @Ma_PDT)
		BEGIN	
			SET @Where = 'Where '
			SET @Dieu_kien_bo_phan = ' Tinh_trang <> 0 '
		END
	END
	--SELECT @sql = ''
	SELECT @sql = '
	SELECT TB2.ID As MaKeHoachDaoTao, TB2.Ten As TenKeHoachDaoTao, (C.Ho + '' '' + C.Ten_Lot + '' '' + C.Ten) As TenNguoiLap, 
	TB2.Tinh_trang As TinhTrang, TB2.Ly_do_reject As LyDoReject,
	cast(datepart(mm,TB2.Ngay_Cap_Nhat_Cuoi) as varchar) + ''-'' + cast(datepart(dd,TB2.Ngay_Cap_Nhat_Cuoi) as varchar) + ''-'' + cast(datepart(yy,TB2.Ngay_Cap_Nhat_Cuoi) as varchar) As NgayCapNhatCuoi
	FROM (
		SELECT TOP ' + @NumRows + '* 
		FROM (
			SELECT TOP ' + Cast(Cast(@TotalRows As Int) - (Cast(@CurrentPage As Int) - 1) * Cast(@NumRows As Int) As Varchar) + ' *
			FROM KeHoachDaoTao '
			+ @Where + @Dieu_kien_tinh_trang + @And + @Dieu_kien_bo_phan +
			' ORDER BY Ngay_cap_nhat_cuoi ASC
		) AS TB1
		ORDER BY TB1.Ngay_cap_nhat_cuoi DESC
	) AS TB2 
	INNER JOIN ThanhVien As B On TB2.Ma_nguoi_lap = B.ID 
	INNER JOIN ChiTietThanhVien As C on B.Ten_DN = C.Ten_dang_nhap'
	--ORDER BY TB2.Ngay_cap_nhat_cuoi DESC'
	exec  sp_executesql @sql
END
--sp_help sp_executesql
--sp_ISO_GetKeHoachDaoTao 3,4,1,'',''
--select * from thanhvien

/*
	NumRows  = 3
	TotalRows = 8
	CurrentPage = 1

	sp_ISO_GetKeHoachDaoTao NumRows,TotalRows-(CurrentPage-1)*NumRows

	sp_ISO_GetKeHoachDaoTao 3,2

	select count(*)/3 from ThanhVien
*/
--select count(*)/ from ThanhVien

GO

--sp_ISO_GetKeHoachGiangDay.sql

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetKeHoachGiangDay]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetKeHoachGiangDay]
GO
CREATE PROCEDURE sp_ISO_GetKeHoachGiangDay
	@NumRows		VARCHAR(2),
	@TotalRows      varchar(5),
	@CurrentPage	VARCHAR(2),
	@Tinh_trang		varchar(2),
	@Ma_nguoi_tao   varchar(2)		
AS
BEGIN
	DECLARE @sql NVarchar(1000)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_khong_phai_nguoi_tao nvarchar(100)
	DECLARE @Dieu_kien_ma_nguoi_tao nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(5)
	SET @Dieu_kien_tinh_trang = ''
	SET @Dieu_kien_khong_phai_nguoi_tao = ''
	SET @Dieu_kien_ma_nguoi_tao = ''
	SET @And = ''
	SET @Where = ''
	if(@Tinh_trang <> '' and @Ma_nguoi_tao <> '')
	BEGIN
		SET @And = ' and '
	END
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Where = 'Where '
		SET @Dieu_kien_tinh_trang = ' Tinh_trang = ' + @Tinh_trang
	END
	
	if(@Ma_nguoi_tao <> '')
	BEGIN
		SET @Where = 'Where '
		if not exists(Select * From KeHoachGiangDay Where Ma_nguoi_tao = @Ma_nguoi_tao)
		BEGIN	
			SET @Dieu_kien_khong_phai_nguoi_tao = ' Tinh_trang <> 0 '
		END
		else
		BEGIN
			SET @Dieu_kien_ma_nguoi_tao = ' Ma_nguoi_tao = ' + @Ma_nguoi_tao
		END
	END
	--SELECT @sql = ''
	SELECT @sql = '
		SELECT TB2.ID As MaKeHoachGiangDay, TB2.Ten As TenKeHoachGiangDay, TB2.Ma_nguoi_tao As MaNguoiTao, (C.Ho + '' '' + C.Ten_Lot + '' '' + C.Ten) As TenNguoitao, 
			TB2.Tinh_trang As TinhTrang, TB2.Ly_do_reject As LyDoReject,TINH_TRANG_HT,
			convert(varchar(20),TB2.Ngay_tao,105) As Ngaytao 
			FROM (
				SELECT TOP ' + @NumRows + '* 
				FROM (
					SELECT TOP ' + Cast(Cast(@TotalRows As Int) - (Cast(@CurrentPage As Int) - 1) * Cast(@NumRows As Int) As Varchar) + ' *
					FROM KeHoachGiangDay '
					+ @Where + @Dieu_kien_tinh_trang + @And + @Dieu_kien_ma_nguoi_tao + @Dieu_kien_khong_phai_nguoi_tao +
					' ORDER BY id ASC
				) AS TB1
				ORDER BY TB1.id DESC
			) AS TB2 
			INNER JOIN ThanhVien As B On TB2.Ma_nguoi_tao = B.ID 
			INNER JOIN ChiTietThanhVien As C on B.Ten_DN = C.Ten_dang_nhap
			ORDER BY TB2.id DESC'
	exec  sp_executesql @sql
END

/*
sp_ISO_GetKeHoachGiangDay 1,1,1,'',''
@NumRows		VARCHAR(2),
	@TotalRows      varchar(5),
	@CurrentPage	VARCHAR(2),
	@Tinh_trang		varchar(2),
	@Ma_nguoi_tao   varchar(2)		
	SELECT * FROM KEHOACHGIANGDAY
		
*/
GO

--sp_ISO_GetLichSuDungPhong.sql

/***********************************************************
* Purpose : Get "LICH SU DUNG PHONG"
* Author : PhuongTQ
* Date: 07-08-2010
* Description: Get "LICH SU DUNG PHONG"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetLichSuDungPhong]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetLichSuDungPhong]
GO
CREATE PROCEDURE sp_ISO_GetLichSuDungPhong
	--@NumRows		VARCHAR(2),
	--@TotalRows      varchar(5),
	--@CurrentPage	VARCHAR(2),
	@Phong			varchar(5),
	@Nam_hoc		varchar(5),
	@Tuan			varchar(5),
	@Khoa			varchar(5)
AS
BEGIN
	DECLARE @sql NVarchar(2000)
	DECLARE @Dieu_kien_phong nvarchar(100)
	DECLARE @Dieu_kien_nam_hoc nvarchar(100)
	DECLARE @Dieu_kien_tuan nvarchar(200)
	DECLARE @Dieu_kien_khoa nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(7)
	DECLARE @Count int
	SET @Dieu_kien_phong = ''
	SET @Dieu_kien_nam_hoc = ''
	SET @Dieu_kien_tuan = ''
	SET @Dieu_kien_khoa = ''
	SET @And = ''
	SET @Where = ' Where '
	SET @Count = 1
	if(@Phong <> '')
	BEGIN
		SET @Count = @Count + 1
		SET @Dieu_kien_phong = ' H.ID = ' + @Phong
	END

	if(@Nam_hoc <> '')
	BEGIN
		if(@count > 1)
		BEGIN
			SET @And = ' And '
		END
		SET @Count = @Count + 1
		SET @Dieu_kien_nam_hoc = @And + ' A.Ma_nam_hoc = ' + @Nam_hoc
	END

	if(@Tuan <> '')
	BEGIN
		if(@Count > 1)
		BEGIN
			SET @And = ' And '
		END
		SET @Dieu_kien_tuan = @And + ' A.STT_Tuan = ' + @Tuan
	END
	else
	BEGIN
		if(@Count > 1)
		BEGIN
			SET @And = ' And '
		END
		SET @Dieu_kien_tuan = @And + ' (convert(varchar(10),G.Tu_ngay,110) <= convert(varchar(10),GETDATE(),110) AND convert(varchar(10),G.Den_ngay,110) >= convert(varchar(10),GETDATE(),110)) '
	END

	if(@Khoa <> '')
	BEGIN
		if(@Count > 1)
		BEGIN
			SET @And = ' And '
		END
		SET @Count = @Count + 1
		SET @Dieu_kien_khoa = @And + ' F.ID = ' + @Khoa
	END
	
	--SELECT @sql = ''
	SELECT @sql = '
	SELECT H.Ki_hieu_phong AS KiHieuPhong, L.Nhom AS Nhom, A.Buoi, A.Thu_trong_tuan AS ThuTrongTuan, 
			I.Ten_mon_hoc AS TenMonHoc, ISNULL((K.Ho + '' '' + K.Ten_Lot + '' '' + K.Ten),'''') As TenGiaoVien,
			Convert(varchar(10), L.Ngay_hoc, 110) As NgayHoc, F.Ten As TenKhoa
	FROM SuDung AS A 
		INNER JOIN MonHocTKB AS B ON B.ID = A.Ma_mon_hoc_TKB 
		INNER JOIN ThoiKhoaBieu AS C ON B.Ma_TKB = C.ID
		INNER JOIN LopHoc AS D ON C.Ma_lop = D.ID
		INNER JOIN ChuyenNganh AS E ON D.Ma_chuyen_nganh = E.ID
		INNER JOIN Khoa_TrungTam AS F ON E.Ma_khoaTT = F.ID
		INNER JOIN Tuanle AS G ON A.Ma_nam_hoc = G.Ma_nam_hoc AND A.STT_Tuan = G.So_thu_tu
		INNER JOIN PhongBan AS H ON A.Ma_phong = H.ID
		INNER JOIN MonHoc AS I ON B.Ma_mon_hoc = I.ID
		INNER JOIN ThanhVien AS J ON B.Ma_giao_vien = J.ID
		INNER JOIN ChiTietThanhVien AS K ON J.Ten_DN = K.Ten_dang_nhap
		INNER JOIN ChiTietTKB AS L ON A.Ma_mon_hoc_TKB = L.Ma_mon_hoc_TKB AND A.Buoi = L.Buoi AND A.Thu_trong_tuan = L.Thu_trong_tuan AND A.STT_Tuan = L.Tuan AND A.Ma_phong = L.Ma_phong'
		+ @Where + @Dieu_kien_phong + @Dieu_kien_nam_hoc + @Dieu_kien_tuan + @Dieu_kien_khoa +
		' ORDER BY A.Thu_trong_tuan, A.Buoi, A.Ma_phong, F.ID'
	exec  sp_executesql @sql
	--print @sql
END
--sp_help sp_executesql
--sp_ISO_GetLichSuDungPhong '','1','1',''
--select * from sudung

GO

--sp_ISO_getNgayGioHeThong.sql


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_getNgayGioHeThong]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_getNgayGioHeThong]
GO
CREATE PROCEDURE sp_ISO_getNgayGioHeThong

AS
BEGIN
	SELECT Convert(varchar(10),GETDATE(),110) As NgayHeThong ,Convert(varchar(10),GETDATE(),108)  AS GioHeThong			
END
GO

--sp_ISO_GetQuyetDinhDaoTao.sql

/***********************************************************
* Purpose : Get "QUYET DINH DAO TAO"
* Author : ToanTT
* Date: 05-05-2010
* Description: Get "QUYET DINH DAO TAO"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetQuyetDinhDaoTao]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetQuyetDinhDaoTao]
GO
CREATE PROCEDURE sp_ISO_GetQuyetDinhDaoTao
	@NumRows		VARCHAR(2),
	@TotalRows      varchar(5),
	@CurrentPage	VARCHAR(2),
	@Tinh_trang		varchar(2),
	@Ma_nguoi_tao   varchar(2)		
AS
BEGIN
	DECLARE @sql NVarchar(1000)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_khong_phai_nguoi_tao nvarchar(100)
	DECLARE @Dieu_kien_ma_nguoi_tao nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(5)
	SET @Dieu_kien_tinh_trang = ''
	SET @Dieu_kien_khong_phai_nguoi_tao = ''
	SET @Dieu_kien_ma_nguoi_tao = ''
	SET @And = ''
	SET @Where = ''
	if(@Tinh_trang <> '' and @Ma_nguoi_tao <> '')
	BEGIN
		SET @And = ' and '
	END
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Where = 'Where '
		SET @Dieu_kien_tinh_trang = ' Tinh_trang = ' + @Tinh_trang
	END
	
	if(@Ma_nguoi_tao <> '')
	BEGIN
		SET @Where = 'Where '
		if not exists(Select * From QuyetDinhMoLop Where Ma_nguoi_lap = @Ma_nguoi_tao)
		BEGIN	
			SET @Dieu_kien_khong_phai_nguoi_tao = ' Tinh_trang <> 0 '
		END
		else
		BEGIN
			SET @Dieu_kien_ma_nguoi_tao = ' Ma_nguoi_lap = ' + @Ma_nguoi_tao
		END
	END
	--SELECT @sql = ''
	SELECT @sql = '
	SELECT TB2.ID As MaQuyetDinhDaoTao, TB2.Ten As TenQuyetDinhDaoTao, (C.Ho + '' '' + C.Ten_Lot + '' '' + C.Ten) As TenNguoiLap, 
	TB2.Tinh_trang As TinhTrang, TB2.Ly_do_reject As LyDoReject,
	convert(varchar(20),TB2.Ngay_Lap,105) As NgayLap 
	FROM (
		SELECT TOP ' + @NumRows + '* 
		FROM (
			SELECT TOP ' + Cast(Cast(@TotalRows As Int) - (Cast(@CurrentPage As Int) - 1) * Cast(@NumRows As Int) As Varchar) + ' *
			FROM QuyetDinhMoLop '
			+ @Where + @Dieu_kien_tinh_trang + @And + @Dieu_kien_ma_nguoi_tao + @Dieu_kien_khong_phai_nguoi_tao +
			' ORDER BY id ASC
		) AS TB1
		ORDER BY TB1.id DESC
	) AS TB2 
	INNER JOIN ThanhVien As B On TB2.Ma_nguoi_lap = B.ID 
	INNER JOIN ChiTietThanhVien As C on B.Ten_DN = C.Ten_dang_nhap
	ORDER BY TB2.id DESC'
	exec  sp_executesql @sql
END
--sp_help sp_executesql
--sp_ISO_GetQuyetDinhDaoTao 3,4,1,'',''
--select * from thanhvien

/*
	NumRows  = 3
	TotalRows = 8
	CurrentPage = 1

	sp_ISO_GetQuyetDinhDaoTao NumRows,TotalRows-(CurrentPage-1)*NumRows

	sp_ISO_GetQuyetDinhDaoTao 3,2

	select count(*)/3 from ThanhVien
*/
--select count(*)/ from ThanhVien

GO

--sp_ISO_getSysParams.sql

/***********************************************************
* Purpose : Lay cac thong so tu database
* Author : ThienVD
* Date: 02-04-2010
* Description: Lay cac thong so tu database
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_getSysParams]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_getSysParams]
GO
CREATE PROCEDURE sp_ISO_getSysParams

AS
BEGIN
	SELECT Convert(varchar(10),GETDATE(),110) + ' ' + Convert(varchar(10),GETDATE(),108)  AS GioHeThong			
END
GO

--sp_ISO_GetThoiKhoaBieu.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetThoiKhoaBieu]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetThoiKhoaBieu]
GO
CREATE PROCEDURE sp_ISO_GetThoiKhoaBieu
	@NumRows		VARCHAR(2),
	@TotalRows      varchar(5),
	@CurrentPage	VARCHAR(2),
	@Tinh_trang		varchar(2),
	@Ma_nguoi_tao   varchar(2)		
AS
BEGIN
	DECLARE @sql NVarchar(1000)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_khong_phai_nguoi_tao nvarchar(100)
	DECLARE @Dieu_kien_ma_nguoi_tao nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(5)
	SET @Dieu_kien_tinh_trang = ''
	SET @Dieu_kien_khong_phai_nguoi_tao = ''
	SET @Dieu_kien_ma_nguoi_tao = ''
	SET @And = ''
	SET @Where = ''
	if(@Tinh_trang <> '' and @Ma_nguoi_tao <> '')
	BEGIN
		SET @And = ' and '
	END
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Where = 'Where '
		SET @Dieu_kien_tinh_trang = ' Tinh_trang = ' + @Tinh_trang
	END
	
	if(@Ma_nguoi_tao <> '')
	BEGIN
		SET @Where = 'Where '
		if not exists(Select * From ThoiKhoaBieu Where Ma_nguoi_tao = @Ma_nguoi_tao)
		BEGIN	
			SET @Dieu_kien_khong_phai_nguoi_tao = ' Tinh_trang <> 0 '
		END
		else
		BEGIN
			SET @Dieu_kien_ma_nguoi_tao = ' Ma_nguoi_tao = ' + @Ma_nguoi_tao
		END
	END
	--SELECT @sql = ''
	SELECT @sql = '
	SELECT TB2.ID As MaThoiKhoaBieu, (C.Ho + '' '' + C.Ten_Lot + '' '' + C.Ten) As TenNguoiTao, TB2.Ten As TenThoiKhoaBieu,
	TB2.Tinh_trang As TinhTrang, TB2.Ly_do_reject As LyDoReject,
	cast(datepart(mm,TB2.Ngay_Cap_Nhat_Cuoi) as varchar) + ''-'' + cast(datepart(dd,TB2.Ngay_Cap_Nhat_Cuoi) as varchar) + ''-'' + cast(datepart(yy,TB2.Ngay_Cap_Nhat_Cuoi) as varchar) As NgayCapNhatCuoi
	FROM (
		SELECT TOP ' + @NumRows + '* 
		FROM (
			SELECT TOP ' + Cast(Cast(@TotalRows As Int) - (Cast(@CurrentPage As Int) - 1) * Cast(@NumRows As Int) As Varchar) + ' *
			FROM ThoiKhoaBieu '
			+ @Where + @Dieu_kien_tinh_trang + @And + @Dieu_kien_ma_nguoi_tao + @Dieu_kien_khong_phai_nguoi_tao +
			' ORDER BY Ngay_cap_nhat_cuoi ASC
		) AS TB1
		ORDER BY TB1.Ngay_cap_nhat_cuoi DESC
	) AS TB2 
	INNER JOIN ThanhVien As B On TB2.Ma_nguoi_tao = B.ID 
	INNER JOIN ChiTietThanhVien As C on B.Ten_DN = C.Ten_dang_nhap'
	--ORDER BY TB2.id ASC
	exec  sp_executesql @sql
END

GO

--sp_ISO_InsertBoPhanThucHienKHDT.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertBoPhanThucHienKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertBoPhanThucHienKHDT]
GO
CREATE PROCEDURE sp_ISO_InsertBoPhanThucHienKHDT
	@ID							int			output,
	@Ma_noi_dung_chi_tiet_KHDT	int,
	@Ma_khoa						int,
	@Ten_bo_phan					nvarchar(200),
	@Ngay_cap_nhat_cuoi			datetime    output,
	@User1						varchar(40),
	@User2						varchar(40),
	@User3						varchar(40),
	@User4						varchar(40),
	@User5						varchar(40)
AS
BEGIN	
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	
	INSERT INTO BoPhanThucHienKHDT
	VALUES (
		@Ma_noi_dung_chi_tiet_KHDT,
		@Ma_khoa,
		@Ten_bo_phan,
		@Ngay_cap_nhat_cuoi,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	
	SELECT 	@ID=ID, @Ngay_cap_nhat_cuoi = Ngay_cap_nhat_cuoi FROM BoPhanThucHienKHDT WHERE Ngay_cap_nhat_cuoi=@Ngay_cap_nhat_cuoi
END


GO

--sp_ISO_InsertChiTietKHDT.sql

/***********************************************************
* Purpose : Insert "CHI TIET KE HOACH DAO TAO"
* Author : ThienVD
* Date: 02-04-2010
* Description: Insert "CHI TIET KE HOACH DAO TAO"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertChiTietKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertChiTietKHDT]
GO
CREATE PROCEDURE sp_ISO_InsertChiTietKHDT
	@ID						int			output,
	@Ma_ke_hoach			int,
	@Tuan					int,
	@Tu_ngay				datetime,
	@Den_ngay				datetime,
	@Ngay_cap_nhat_cuoi		datetime    output,
	@Ma_nam_hoc				int,
	@Tinh_trang_phan_cong_tac	int,
	@Delay_days				int,
	@Ghi_chu				nvarchar(4000),
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN	
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	DECLARE @Close_date datetime
	SET @Close_date = DATEADD(day, @Delay_days, @Den_ngay)
	INSERT INTO ChiTietKHDT
	VALUES ( 
		@Ma_ke_hoach,
		@Tuan,
		@Tu_ngay,
		@Den_ngay,
		@Ngay_cap_nhat_cuoi,
		@Ma_nam_hoc,
		@Tinh_trang_phan_cong_tac,
		@Close_date,
		@Ghi_chu,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	
	SELECT 	@ID=ID, @Ngay_cap_nhat_cuoi = Ngay_cap_nhat_cuoi FROM ChiTietKHDT WHERE Ngay_cap_nhat_cuoi=@Ngay_cap_nhat_cuoi
END


GO

--sp_ISO_InsertChiTietKHGD.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertChiTietKHGD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertChiTietKHGD]
GO
 
CREATE PROCEDURE sp_ISO_InsertChiTietKHGD
	@ID						int			output,
	@maKHGD					int,
	@tenChuong				nvarchar(4000),
	@noiDungTH				nvarchar(4000),
	@congViecChuanBi		nvarchar(4000),
	@coHieu					int,
	@tuan					int,
	@ngayBD					datetime,
	@ngayKT					datetime,
	@ngayCapNhatCuoi		datetime,
	@maGiaoAn				int,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN
	SET @ngayCapNhatCuoi = GETDATE()
	INSERT INTO ChiTietKHGD
	VALUES (
		@maKHGD,
		@tenChuong,
		@coHieu,
		@ngayCapNhatCuoi,
		@tuan,
		@ngayBD,
		@ngayKT,
		@noiDungTH,
		@congViecChuanBi,
		@maGiaoAn,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	SELECT 	@ID=ID FROM ChiTietKHGD WHERE Ngay_cap_nhat_cuoi=@ngayCapNhatCuoi
END


GO

--sp_ISO_InsertChiTietMonHocCTDT.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertChiTietMonHocCTDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertChiTietMonHocCTDT]
GO
CREATE PROCEDURE sp_ISO_InsertChiTietMonHocCTDT
	@ID int output,
	@Ma_chuong_trinh int,
	@Thu_tu int,
	@Ma_mon_hoc int,
	@Ngay_cap_nhat_cuoi datetime,
	@Ly_thuyet varchar(10),
	@Thuc_hanh varchar(10),
	@LT_TH varchar(10),
	@TTSX varchar(10),
	@Tinh_chat nvarchar(40),
	@Nam_hoc varchar(10),
	@Hoc_ky varchar(10),
	@Ma_hoc_phan int,
	@User1 varchar(40),
	@User2 varchar(40),
	@User3 varchar(40),
	@User4 varchar(40),
	@User5 varchar(40)
AS
BEGIN	
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	
	INSERT INTO ChiTietMonHocCTDT
	VALUES (
	@Ma_chuong_trinh, 
	@Thu_tu, 
	@Ma_mon_hoc, 
	@Ngay_cap_nhat_cuoi, 
	@Ly_thuyet, 
	@Thuc_hanh, 
	@LT_TH, 
	@TTSX, 
	@Tinh_chat, 
	@Nam_hoc, 
	@Hoc_ky,
	@Ma_hoc_phan,
	@User1,
	@User2,
	@User3,
	@User4,
	@User5
	)
	
	SELECT 	@ID = ID FROM ChiTietMonHocCTDT WHERE Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
END
GO

--sp_ISO_InsertChiTietTKB.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertChiTietTKB]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertChiTietTKB]
GO
CREATE PROCEDURE sp_ISO_InsertChiTietTKB
	@ID						int output,
	@Ma_TKB					int,
	@Thu_trong_tuan			int,
	@Buoi					nvarchar(10),
	@Hinh_thuc_day			nvarchar(5), 
	@Nhom					int,
	@Ma_phong				int,
	@Ngay_cap_nhat_cuoi		datetime,
	@So_thu_tu				int,
	@Ma_mon_hoc_TKB			int,
	@Tuan					int,
	@Ngay_hoc				datetime,
	@STT_noi_dung			int,
	@Co_hieu				int,
	@User1					varchar,
	@User2					varchar,
	@User3					varchar,
	@User4					varchar,
	@User5					varchar
AS
BEGIN	
	DECLARE @Nam_bat_dau nvarchar(10)
	SELECT @Nam_bat_dau = Nam_bat_dau FROM ThoiKhoaBieu WHERE ID = @Ma_TKB
	DECLARE @Ma_nam_hoc int
	SELECT @Ma_nam_hoc = ID FROM NamHoc WHERE Nam_bat_dau = @Nam_bat_dau
	SELECT @Ngay_hoc = DATEADD(Day, @Thu_trong_tuan-1, Tu_ngay) FROM TuanLe WHERE Ma_nam_hoc = @Ma_nam_hoc AND So_thu_tu = @Tuan
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	
	INSERT INTO ChiTietTKB
	VALUES (
		@Ma_TKB,
		@Thu_trong_tuan,
		@Buoi,
		@Hinh_thuc_day,
		@Nhom,
		@Ma_phong,
		@Ngay_cap_nhat_cuoi,
		@So_thu_tu,
		@Ma_mon_hoc_TKB,
		@Tuan,
		@Ngay_hoc,
		@STT_noi_dung,
		@Co_hieu,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	
	SELECT 	@ID=ID FROM ChiTietTKB WHERE Ngay_cap_nhat_cuoi=@Ngay_cap_nhat_cuoi
END
GO

--sp_ISO_InsertChuongTrinhDaoTao.sql
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
GO

--sp_ISO_InsertDeCuongMonHoc.sql
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
	@User5						varchar(40)
AS
BEGIN
	DECLARE @Ten_mon_hoc nvarchar(40)
	DECLARE @Ten_chuyen_nganh nvarchar(40)
	DECLARE @Ten_chuong_trinh nvarchar(100)
	DECLARE @Ma_trinh_do int
	DECLARE @Ten_trinh_do nvarchar(40)
	SELECT @Ten_mon_hoc = Ten_mon_hoc FROM MonHoc WHERE ID = @Ma_mon_hoc
	SELECT @Ten_chuyen_nganh = Ten_nghe, @Ten_chuong_trinh = Ten, @Ma_trinh_do = Ma_trinh_do FROM ChuongTrinhDaoTao WHERE ID = @Ma_chuong_trinh
	SELECT @Ten_trinh_do = Ten FROM HeDaoTao WHERE ID = @Ma_trinh_do
	SET @Ten = N'ĐỀ CƯƠNG MÔN HỌC ' + @Ten_mon_hoc + N' CTDT HỆ ' + @Ten_trinh_do + N' NGÀNH ' + @Ten_chuyen_nganh + ' ' + @Ten_chuong_trinh
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
				@Ngay_cap_nhat_cuoi= Convert(varchar(10),Ngay_cap_nhat_cuoi,110)
		FROM DeCuongMonHoc A 
		WHERE A.Ngay_tao = @Ngay_tao	
END
GO

--sp_ISO_InsertGiaoAnLyThuyet.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertGiaoAnLyThuyet]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertGiaoAnLyThuyet]
GO
CREATE PROCEDURE sp_ISO_InsertGiaoAnLyThuyet
	@ID	int output,
	@MA_KHGD int,
	@So_giao_an int,
	@Ngay_thuc_hien datetime,
	@Muc_tieu nvarchar(2000),
	@Do_dung_PT_DH nvarchar(2000),
	@On_dinh_LH nvarchar(2000),
	@Thoi_gian_on_dinh int,
	@Thoi_gian_TH_BH int,
	@Dan_nhap nvarchar(2000),
	@HD_dan_nhap_GV nvarchar(2000),
	@HD_dan_nhap_HS nvarchar(2000),
	@Thoi_gian_dan_nhap int,
	@Noi_dung_bai_giang nvarchar(4000),
	@HD_giang_bai_moi_GV nvarchar(2000),
	@HD_giang_bai_moi_HS nvarchar(2000),
	@Thoi_gian_bai_giang int,
	@Cung_co_kien_thuc nvarchar(2000),
	@HD_cung_co_GV nvarchar(2000),
	@HD_cung_co_HS nvarchar(2000),
	@Thoi_gian_cung_co int, 
	@Huong_dan_tu_hoc nvarchar(40),
	@HD_HDTH_GV nvarchar(2000),
	@HD_HDTH_HS nvarchar(2000),
	@Thoi_gian_HDTH int,
	@Tai_lieu_tham_khao nvarchar(40),
	@Ngay_tao datetime
AS
BEGIN
	INSERT INTO GIAOAN(
		MA_KHGD,
		So_giao_an,
		Ngay_thuc_hien,
		Muc_tieu,
		Do_dung_PT_DH,
		On_dinh_LH,
		Thoi_gian_on_dinh,
		Thoi_gian_TH_BH,
		Dan_nhap,
		HD_dan_nhap_GV,
		HD_dan_nhap_HS,
		Thoi_gian_dan_nhap,
		Noi_dung_bai_giang,
		HD_giang_bai_moi_GV,
		HD_giang_bai_moi_HS,
		Thoi_gian_bai_giang,
		Cung_co_kien_thuc,
		HD_cung_co_GV,
		HD_cung_co_HS,
		Thoi_gian_cung_co,
		Huong_dan_tu_hoc,
		HD_HDTH_GV,
		HD_HDTH_HS,
		Thoi_gian_HDTH,
		Tai_lieu_tham_khao,
		Ngay_tao,
		Tinh_trang
	)
	VALUES 
	(
		@MA_KHGD,
		@So_giao_an,
		@Ngay_thuc_hien,
		@Muc_tieu,
		@Do_dung_PT_DH,
		@On_dinh_LH,
		@Thoi_gian_on_dinh,
		@Thoi_gian_TH_BH,
		@Dan_nhap,
		@HD_dan_nhap_GV,
		@HD_dan_nhap_HS,
		@Thoi_gian_dan_nhap,
		@Noi_dung_bai_giang,
		@HD_giang_bai_moi_GV,
		@HD_giang_bai_moi_HS,
		@Thoi_gian_bai_giang,
		@Cung_co_kien_thuc,
		@HD_cung_co_GV,
		@HD_cung_co_HS,
		@Thoi_gian_cung_co,
		@Huong_dan_tu_hoc,
		@HD_HDTH_GV,
		@HD_HDTH_HS,
		@Thoi_gian_HDTH,
		@Tai_lieu_tham_khao,
		@Ngay_tao,
		0
	)
END

GO

--sp_ISO_InsertGiaoAnThucHanh.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertGiaoAnThucHanh]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertGiaoAnThucHanh]
GO
CREATE PROCEDURE sp_ISO_InsertGiaoAnThucHanh
	@ID	int output,
	@MA_KHGD int,
	@So_giao_an int,
	@Ngay_thuc_hien datetime,
	@Muc_tieu nvarchar(2000),
	@Do_dung_PT_DH nvarchar(2000),
	@Hinh_thuc_TC_DH nvarchar(2000),
	@On_dinh_LH nvarchar(2000),
	@Thoi_gian_on_dinh int,
	@Thoi_gian_TH_BH int,

	@Dan_nhap nvarchar(2000),
	@HD_dan_nhap_GV nvarchar(2000),
	@HD_dan_nhap_HS nvarchar(2000),
	@Thoi_gian_dan_nhap int,

	@Huong_dan_ban_dau nvarchar(2000),
	@HD_HDBD_GV nvarchar(2000),
	@HD_HDBD_HS nvarchar(2000),
	@Thoi_gian_HDBD int,

	@Huong_dan_thuong_xuyen nvarchar(2000),
	@HD_HDTX_GV nvarchar(2000),
	@HD_HDTX_HS nvarchar(2000),
	@Thoi_gian_HDTX int,

	@Huong_dan_ket_thuc nvarchar(2000),
	@HD_HDKT_GV nvarchar(2000),
	@HD_HDKT_HS nvarchar(2000),
	@Thoi_gian_HDKT int,

	@Huong_dan_ren_luyen nvarchar(2000),
	@HD_HDRL_GV nvarchar(2000),
	@Thoi_gian_HDRL int,
	@Rut_kinh_nghiem nvarchar(2000),
	@Ngay_tao datetime
AS
BEGIN
	INSERT INTO GIAOAN(
		MA_KHGD,
		So_giao_an,
		Ngay_thuc_hien,
		Muc_tieu,
		Do_dung_PT_DH,
		Hinh_thuc_TC_DH,
		On_dinh_LH,
		Thoi_gian_on_dinh,
		Thoi_gian_TH_BH,
		Dan_nhap,
		HD_dan_nhap_GV,
		HD_dan_nhap_HS,
		Thoi_gian_dan_nhap,

		Huong_dan_ban_dau,
		HD_HDBD_GV,
		HD_HDBD_HS,
		Thoi_gian_HDBD,

		Huong_dan_thuong_xuyen,
		HD_HDTX_GV,
		HD_HDTX_HS,
		Thoi_gian_HDTX,

		Huong_dan_ket_thuc,
		HD_HDKT_GV,
		HD_HDKT_HS,
		Thoi_gian_HDKT,
		
		Huong_dan_ren_luyen,
		HD_HDRL_GV,
		Thoi_gian_HDRL,
		Rut_kinh_nghiem,
		Ngay_tao,
		Tinh_trang
	)
	VALUES 
	(	
		@MA_KHGD,
		@So_giao_an,
		@Ngay_thuc_hien,
		@Muc_tieu,
		@Do_dung_PT_DH,
		@Hinh_thuc_TC_DH,
		@On_dinh_LH,
		@Thoi_gian_on_dinh,
		@Thoi_gian_TH_BH,
		@Dan_nhap,
		@HD_dan_nhap_GV,
		@HD_dan_nhap_HS,
		@Thoi_gian_dan_nhap,

		@Huong_dan_ban_dau,
		@HD_HDBD_GV,
		@HD_HDBD_HS,
		@Thoi_gian_HDBD,

		@Huong_dan_thuong_xuyen,
		@HD_HDTX_GV,
		@HD_HDTX_HS,
		@Thoi_gian_HDTX,

		@Huong_dan_ket_thuc,
		@HD_HDKT_GV,
		@HD_HDKT_HS,
		@Thoi_gian_HDKT,
		
		@Huong_dan_ren_luyen,
		@HD_HDRL_GV,
		@Thoi_gian_HDRL,

		@Rut_kinh_nghiem,
		@Ngay_tao,
		0
	)
END

GO

--sp_ISO_InsertKeHoachDaoTao.sql

/***********************************************************
* Purpose : Insert "KE HOACH DAO TAO"
* Author : ThienVD
* Date: 02-04-2010
* Description: Insert "KE HOACH DAO TAO"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertKeHoachDaoTao]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertKeHoachDaoTao]
GO
CREATE PROCEDURE sp_ISO_InsertKeHoachDaoTao
	@ID				int	output,	
	@Ten			nvarchar(200) output,
	@Nam1			varchar(4),
	@Nam2			varchar(4),
	@Nam3			varchar(4),
	@Nam4			varchar(4),
	@Nam5			varchar(4),
	@Nam6			varchar(4),
	@Nhiem_vu_1		nvarchar(2000),
	@Nhiem_vu_2		nvarchar(2000),
	@Nhiem_vu_3		nvarchar(2000),
	@Nhiem_vu_4		nvarchar(2000),
	@Ma_nguoi_lap	int,
	@Ngay_lap		datetime,
	@Ma_nguoi_duyet	int,
	@Ngay_duyet		datetime,
	@Tinh_trang		int,
	@Ngay_cap_nhat_cuoi	varchar(30)	output,
	@Ly_do_reject	nvarchar(80),
	@Ngay_gui		datetime,
	@Bo_sung		int,
	@User1			varchar(40), 
	@User2			varchar(40),
	@User3			varchar(40),
	@User4			varchar(40),
	@User5			varchar(40)
AS
BEGIN
	SET @Ten = N'KẾ HOẠCH ĐÀO TẠO NĂM HỌC: ' + @Nam1 + '-' + @Nam2
	SET @Ngay_lap=GETDATE()
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	
	INSERT INTO KEHOACHDAOTAO
	VALUES (
		@Ten,
		@Nam1,
		@Nam2,
		@Nam3,
		@Nam4,
		@Nam5,
		@Nam6,
		@Nhiem_vu_1,
		@Nhiem_vu_2,
		@Nhiem_vu_3,
		@Nhiem_vu_4,
		@Ma_nguoi_lap,
		@Ngay_lap,
		@Ma_nguoi_duyet,
		@Ngay_duyet,
		@Tinh_trang,
		@Ngay_cap_nhat_cuoi,
		@Ly_do_reject,
		@Ngay_gui,
		@Bo_sung,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5	
	)
	
	SELECT	@ID = A.ID,@Ten = Ten,
			@Ngay_cap_nhat_cuoi= Convert(varchar(10), Ngay_cap_nhat_cuoi,110)
	FROM KEHOACHDAOTAO A 
	WHERE A.Ngay_lap=@Ngay_lap	
END


GO

--sp_ISO_InsertKeHoachGiangDay.sql
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
		SELECT @maNamHoc = ID FROM NAMHOC WHERE (convert(varchar(4),Nam_bat_dau) + ' - ' + convert(varchar(4),Nam_ket_thuc)) = @namHoc
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
		@maGiaoVien,
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
GO

--sp_ISO_InsertLopHoc.sql

/***********************************************************
* Purpose : Insert "LOP HOC"
* Author : ToanTT
* Date: 12-05-2010
* Description: Insert "LOP HOC"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertLopHoc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertLopHoc]
GO
CREATE PROCEDURE sp_ISO_InsertLopHoc
	@Ma_chuyen_nganh		int,
	@Ki_hieu				varchar(10),
	@Ma_lop_truong			int,
	@Ma_quyet_dinh			int,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN	
	INSERT INTO LopHoc
	VALUES (
		@Ma_chuyen_nganh,
		@Ki_hieu,
		@Ma_lop_truong,
		@Ma_quyet_dinh,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
END


GO

--sp_ISO_InsertMoChuyenNganh.sql

/***********************************************************
* Purpose : Insert "MO CHUYEN NGANH"
* Author : ToanTT
* Date: 12-04-2010
* Description: Insert "MO CHUYEN NGANH"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertMoChuyenNganh]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertMoChuyenNganh]
GO
CREATE PROCEDURE sp_ISO_InsertMoChuyenNganh
	@ID						int			output,
	@Ma_chuyen_nganh		int,
	@Ma_quyet_dinh			int,
	@Ghi_chu				int,
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN	
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	
	INSERT INTO MoChuyenNganh
	VALUES (
		@Ma_chuyen_nganh,
		@Ma_quyet_dinh,
		@Ghi_chu,
		@Ngay_cap_nhat_cuoi,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	
	SELECT 	@ID=ID FROM MoChuyenNganh WHERE Ngay_cap_nhat_cuoi=@Ngay_cap_nhat_cuoi
END


GO

--sp_ISO_InsertMonHocTKB.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertMonHocTKB]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertMonHocTKB]
GO
CREATE PROCEDURE sp_ISO_InsertMonHocTKB
	@ID						int output,
	@So_noi_dung			int,
	@So_ca_thuc_hanh		int,
	@Ma_TKB					int,
	@Ma_mon_hoc				int,
	@Ma_giao_vien			int,
	@Ngay_bat_dau_LT		datetime,
	@Ngay_bat_dau_TH		datetime,
	@Ngay_ket_thuc_LT		datetime, 
	@Ngay_ket_thuc_TH		datetime,
	@Ghi_chu				nvarchar(1000),
	@Ngay_cap_nhat_cuoi		datetime output,
	@Tuan_bat_dau_LT		int,
	@Tuan_bat_dau_TH		int,
	@Tuan_ket_thuc_LT		int,
	@Tuan_ket_thuc_TH		int,
	@Ten_mon_hoc			nvarchar(200),
	@Ten_giao_vien			nvarchar(200),
	@User1					varchar,
	@User2					varchar,
	@User3					varchar,
	@User4					varchar,
	@User5					varchar																					
AS
BEGIN 
	DECLARE @Nam_bat_dau nvarchar(10)
	SELECT @Nam_bat_dau = Nam_bat_dau FROM ThoiKhoaBieu WHERE ID = @Ma_TKB
	DECLARE @Ma_nam_hoc int
	SELECT @Ma_nam_hoc = ID FROM NamHoc WHERE Nam_bat_dau = @Nam_bat_dau
	SELECT @Ngay_bat_dau_LT = Tu_ngay FROM TuanLe WHERE Ma_nam_hoc = @Ma_nam_hoc AND So_thu_tu = @Tuan_bat_dau_LT
	SELECT @Ngay_ket_thuc_LT = Den_ngay FROM TuanLe WHERE Ma_nam_hoc = @Ma_nam_hoc AND So_thu_tu = @Tuan_ket_thuc_LT
	SELECT @Ngay_bat_dau_TH = Tu_ngay FROM TuanLe WHERE Ma_nam_hoc = @Ma_nam_hoc AND So_thu_tu = @Tuan_bat_dau_TH
	SELECT @Ngay_ket_thuc_TH = Den_ngay FROM TuanLe WHERE Ma_nam_hoc = @Ma_nam_hoc AND So_thu_tu = @Tuan_ket_thuc_TH
	
	SELECT @Ten_mon_hoc = Ten_mon_hoc FROM MonHoc WHERE ID = @Ma_mon_hoc
	SELECT @Ten_giao_vien = (B.Ho + ' ' + B.Ten_lot + ' ' + B.Ten) FROM ThanhVien AS A INNER JOIN ChiTietThanhVien As B ON A.Ten_DN = Ten_dang_nhap WHERE A.ID = @Ma_giao_vien
	SET @Ngay_cap_nhat_cuoi=GETDATE()

	INSERT INTO MonHocTKB
	VALUES (
		@So_noi_dung,
		@So_ca_thuc_hanh,
		@Ma_TKB,
		@Ma_mon_hoc,
		@Ma_giao_vien,
		@Ngay_bat_dau_LT,
		@Ngay_bat_dau_TH,
		@Ngay_ket_thuc_LT,
		@Ngay_ket_thuc_TH,
		@Ghi_chu,
		@Ngay_cap_nhat_cuoi,
		@Tuan_bat_dau_LT,
		@Tuan_bat_dau_TH,
		@Tuan_ket_thuc_LT,
		@Tuan_ket_thuc_TH,	
		@Ten_mon_hoc,
		@ten_giao_vien,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	
	SELECT	@ID = A.ID
	FROM MonHocTKB A 
	WHERE A. Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
END			
GO

--sp_ISO_InsertNguoiThucHien.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertNguoiThucHien]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertNguoiThucHien]
GO
CREATE PROCEDURE sp_ISO_InsertNguoiThucHien
	@ID						int			output,
	@Ma_bo_phan				int,
	@Ma_thanh_vien			int,
	@Ten_thanh_vien			nvarchar(100),
	@Ngay_cap_nhat_cuoi		datetime    output,
	@Tinh_trang_thuc_hien	int,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN	
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	INSERT INTO NguoiThucHien
	VALUES (
		@Ma_bo_phan,
		@Ma_thanh_vien,
		@Ten_thanh_vien,
		@Ngay_cap_nhat_cuoi,
		@Tinh_trang_thuc_hien,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	
	SELECT 	@ID=ID, @Ngay_cap_nhat_cuoi = Ngay_cap_nhat_cuoi FROM NguoiThucHien WHERE Ngay_cap_nhat_cuoi=@Ngay_cap_nhat_cuoi
END

GO

--sp_ISO_InsertNoiDungChiTietKHDT.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertNoiDungChiTietKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertNoiDungChiTietKHDT]
GO
CREATE PROCEDURE sp_ISO_InsertNoiDungChiTietKHDT
	@ID						int			output,
	@Ma_chi_tiet_KHDT		int,
	@Ma_cong_tac			int,
	@Noi_dung_cong_tac		nvarchar(4000),
	@Khoa					int,
	@Ngay_cap_nhat_cuoi		datetime    output,
	@Tinh_trang_thuc_hien	int,
	@Bo_sung				int,
	@Thu					int,
	@Ngay					int,
	@Buoi					int,
	@Gio					int,
	@Phut					int,
	@Ghi_chu				nvarchar(4000),
	@Tinh_trang_phan_cong	int,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN	
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	INSERT INTO NoiDungChiTietKHDT 
	VALUES (
		@Ma_chi_tiet_KHDT,
		@Ma_cong_tac,
		@Khoa,
		@Noi_dung_cong_tac,
		@Ngay_cap_nhat_cuoi,
		@Tinh_trang_thuc_hien,
		@Bo_sung,
		--Phan_cong_tac
		@Thu,
		@Buoi,
		@Gio,
		@Phut,
		@Ghi_chu,
		@Tinh_trang_phan_cong,
		@Ngay,
		--
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	
	SELECT 	@ID=ID, @Ngay_cap_nhat_cuoi = Ngay_cap_nhat_cuoi FROM NoiDungChiTietKHDT WHERE Ngay_cap_nhat_cuoi=@Ngay_cap_nhat_cuoi
END


GO

--sp_ISO_InsertNoiDungDCMH.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertNoiDungDCMH]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertNoiDungDCMH]
GO
CREATE PROCEDURE sp_ISO_InsertNoiDungDCMH
	@ID					int output,
	@So_thu_tu			int,
	@So_buoi			int,
	@Ma_de_cuong		int,
	@Ten_chuong			nvarchar(4000),
	@Co_hieu			int,
	@So_tiet			int,
	@Ngay_cap_nhat_cuoi	datetime,
	@User1				varchar(40),
	@User2				varchar(40),
	@User3				varchar(40),
	@User4				varchar(40),
	@User5				varchar(40)
AS
BEGIN	
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	
	INSERT INTO NoiDungDCMH
	VALUES (
		@So_thu_tu,
		@So_buoi,
		@Ma_de_cuong,
		@Ten_chuong,
		@Co_hieu,
		@So_tiet,
		@Ngay_cap_nhat_cuoi,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	SELECT 	@ID = ID FROM NoiDungDCMH WHERE Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
END
GO

--sp_ISO_InsertQuyetDinhMoLop.sql

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
GO

--sp_ISO_InsertSuDung.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertSuDung]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertSuDung]
GO
CREATE PROCEDURE sp_ISO_InsertSuDung
	@ID						int,
	@Ma_mon_hoc_TKB			int,
	@Ma_phong				int,
	@Ma_nam_hoc				int,
	@STT_tuan				int,
	@Thu_trong_tuan			int,
	@Buoi					nvarchar(10),
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN	
	INSERT INTO SuDung
	VALUES (
		@Ma_phong,			
		@Ma_mon_hoc_TKB,	
		@Ma_nam_hoc,				
		@STT_tuan,				
		@Thu_trong_tuan,	
		@Buoi,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
END
GO

--sp_ISO_InsertThoiKhoaBieu.sql
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
	@Ten					nvarchar(200),
	@Tinh_trang				int,
	@Ly_do_reject			nvarchar(2000),
	@Hoc_ki					int,
	@Nam_bat_dau			nvarchar(20),
	@Nam_ket_thuc			nvarchar(20),
	@Ngay_gui				datetime,
	@User1					varchar,
	@User2					varchar,
	@User3					varchar,
	@User4					varchar,
	@User5					varchar 
AS
BEGIN 
	DECLARE @Ma_chuyen_nganh int
	DECLARE @Ma_quyet_dinh int
	SELECT @Ma_chuyen_nganh = Ma_chuyen_nganh, @Ma_quyet_dinh = Ma_quyet_dinh FROM LopHoc WHERE ID = @Ma_lop
	DECLARE @Ma_trinh_do int
	DECLARE @Ten_trinh_do nvarchar(100)
	SELECT @Ma_trinh_do = Ma_trinh_do FROM ChuongTrinhDaoTao WHERE Ma_nghe = @Ma_chuyen_nganh AND Ma_quyet_dinh = @Ma_quyet_dinh
	SELECT @Ten_trinh_do = Ten FROM HeDaoTao WHERE ID = @Ma_trinh_do
	DECLARE @Ten_chuyen_nganh nvarchar(100)
	SELECT @Ten_chuyen_nganh = Ten_chuyen_nganh FROM ChuyenNganh WHERE ID = @Ma_chuyen_nganh
	SET @Ten = N'THỜI KHÓA BIỂU HỌC KÌ ' + cast(@Hoc_ki As nvarchar) + N' HỆ ' + @Ten_trinh_do + N' NGÀNH ' +  @Ten_chuyen_nganh + N' NĂM HỌC ' + @Nam_bat_dau + '-' + @Nam_ket_thuc
	SET @Ngay_tao=GETDATE()
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	
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
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	
	SELECT	@ID = A.ID,
			@Ngay_cap_nhat_cuoi= Convert(varchar(10),Ngay_cap_nhat_cuoi,110)
	FROM ThoiKhoaBieu A 
	WHERE A.Ngay_tao=@Ngay_tao	
END
GO

--sp_ISO_KhongBoSungKHDT.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_KhongBoSungKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_KhongBoSungKHDT]
GO
CREATE PROCEDURE sp_ISO_KhongBoSungKHDT
	@ID	int,
	@Tinh_trang int,
	@Bo_sung int output
AS
BEGIN
	DECLARE @Lan_bo_sung int
	SELECT @Lan_bo_sung = Bo_sung FROM KeHoachDaoTao WHERE ID = @ID
	UPDATE KeHoachDaoTao SET Bo_sung = @Lan_bo_sung - 1, Tinh_trang = @Tinh_trang WHERE ID = @ID
	SELECT @Bo_sung = Bo_sung FROM KeHoachDaoTao WHERE ID = @ID
END

GO

--sp_ISO_PhanCongNoiDungChiTietKHDT.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_PhanCongNoiDungChiTietKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_PhanCongNoiDungChiTietKHDT]
GO
CREATE PROCEDURE sp_ISO_PhanCongNoiDungChiTietKHDT
	@ID					int,
	@Gio				int,
	@Phut				int,
	@Thu				int,
	@Ghi_chu			nvarchar(4000),
	@Buoi				int,
	@Ngay				datetime,
	@Tinh_trang_phan_cong	int,
	@Tu_ngay			datetime,
	@User1				varchar(40),
	@User2				varchar(40),
	@User3				varchar(40),
	@User4				varchar(40),  
	@User5				varchar(40)
AS
BEGIN	
	IF(@Thu > 0)
	BEGIN
		SET @Ngay = DATEADD(DAY, @Thu - 1, @Tu_ngay)
	END
	ELSE
	BEGIN
		SET @Ngay = NULL
	END
	UPDATE NoiDungChiTietKHDT
	SET
		Gio						=	@Gio,
		Phut					=	@Phut,
		Thu						=	@Thu,
		Ghi_chu					=	@Ghi_chu,
		Buoi					=	@Buoi,
		Ngay					=	@Ngay,
		Tinh_trang_phan_cong		=	@Tinh_trang_phan_cong,
		User1					=	@User1,
		User2					=	@User2,
		User3					=	@User3,
		User4					=	@User4,
		User5					=	@User5
	WHERE
		ID = @ID
END
GO

--sp_ISO_UpdateBoPhanThucHienKHDT.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateBoPhanThucHienKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateBoPhanThucHienKHDT]
GO
CREATE PROCEDURE sp_ISO_UpdateBoPhanThucHienKHDT
	@ID							int,
	@Ma_noi_dung_chi_tiet_KHDT	int,
	@Ma_khoa						int,
	@Ten_bo_phan					nvarchar(200),
	@Ngay_cap_nhat_cuoi			datetime    output,
	@User1						varchar(40),
	@User2						varchar(40),
	@User3						varchar(40),
	@User4						varchar(40),
	@User5						varchar(40)
AS
BEGIN	
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	
	UPDATE BoPhanThucHienKHDT
	SET
		Ma_noi_dung_chi_tiet_KHDT	=	@Ma_noi_dung_chi_tiet_KHDT,
		Ma_khoa						=	@Ma_khoa,
		Ten_bo_phan					=	@Ten_bo_phan,
		Ngay_cap_nhat_cuoi			=	@Ngay_cap_nhat_cuoi,
		User1						=	@User1,
		User2						=	@User2,
		User3						=	@User3,
		User4						=	@User4,
		User5						=	@User5
	WHERE ID = @ID
	
	SELECT 	@Ngay_cap_nhat_cuoi = Ngay_cap_nhat_cuoi FROM BoPhanThucHienKHDT WHERE ID = @ID
END


GO

--sp_ISO_UpdateChiTietKHDT.sql

/***********************************************************
* Purpose : Update "CHI TIET KE HOACH DAO TAO"
* Author : ThienVD
* Date: 02-04-2010
* Description: Update "CHI TIET KE HOACH DAO TAO"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateChiTietKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateChiTietKHDT]
GO
CREATE PROCEDURE sp_ISO_UpdateChiTietKHDT
	@ID						int,
	@Ma_ke_hoach			int,
	@Tuan					int,
	@Tu_ngay				datetime,
	@Den_ngay				datetime,
	@Ngay_cap_nhat_cuoi		datetime output,
	@Ma_nam_hoc				int,
	@Tinh_trang_phan_cong_tac int,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN

	SET @Ngay_cap_nhat_cuoi = GETDATE()	
			
	UPDATE ChiTietKHDT
	SET 
		Ma_ke_hoach				=	@Ma_ke_hoach,
		Tuan					=	@Tuan,
		Tu_ngay					=	@Tu_ngay,
		Den_ngay				=	@Den_ngay,
		Ngay_cap_nhat_cuoi		=	@Ngay_cap_nhat_cuoi,
		Ma_nam_hoc				=	@Ma_nam_hoc,
		Tinh_trang_phan_cong_tac	= @Tinh_trang_phan_cong_tac,
		User1					=	@User1,
		User2					=	@User2,
		User3					=	@User3,
		User4					=	@User4,
		User5					=	@User5
	WHERE
		ID						=	@ID
	SELECT @Ngay_cap_nhat_cuoi = Ngay_cap_nhat_cuoi FROM ChiTiietKHDT WHERE ID = @ID
END


GO

--sp_ISO_UpdateChiTietKHGD.sql

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateChiTietKHGD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateChiTietKHGD]
GO
CREATE PROCEDURE sp_ISO_UpdateChiTietKHGD
	@ID						int,
	@noiDungTH				nvarchar(4000),
	@congViecChuanBi		nvarchar(4000),
	@ngayCapNhatCuoi		datetime,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN
	SET @ngayCapNhatCuoi = GETDATE()
	UPDATE ChiTietKHGD
	SET 
		Noi_dung_TH				=	@noiDungTH,
		Cong_viec_chuan_bi		=	@congViecChuanBi,
		Ngay_cap_nhat_cuoi		=	@ngayCapNhatCuoi,
		User1					=	@User1,
		User2					=	@User2,
		User3					=	@User3,
		User4					=	@User4,
		User5					=	@User5
	WHERE
		ID						=	@ID
END


GO

--sp_ISO_UpdateChiTietMonHocCTDT.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateChiTietMonHocCTDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateChiTietMonHocCTDT]
GO
CREATE PROCEDURE sp_ISO_UpdateChiTietMonHocCTDT
	@ID int,
	@Ma_chuong_trinh int,
	@Thu_tu int,
	@Ma_mon_hoc int,
	@Ngay_cap_nhat_cuoi datetime,
	@Ly_thuyet varchar(10),
	@Thuc_hanh varchar(10),
	@LT_TH varchar(10),
	@TTSX varchar(10),
	@Tinh_chat nvarchar(40),
	@Nam_hoc varchar(10),
	@Hoc_ky varchar(10),
	@Ma_hoc_phan int,
	@User1 varchar(40),
	@User2 varchar(40),
	@User3 varchar(40),
	@User4 varchar(40),
	@User5 varchar(40)
AS
BEGIN	

	SET @Ngay_cap_nhat_cuoi = GETDATE()	
	UPDATE ChiTietMonHocCTDT
	SET
	Ma_chuong_trinh			=						@Ma_chuong_trinh, 
	Thu_tu					=						@Thu_tu, 
	Ma_mon_hoc				=						@Ma_mon_hoc, 
	Ngay_cap_nhat_cuoi		=						@Ngay_cap_nhat_cuoi, 
	Ly_thuyet				=						@Ly_thuyet, 
	Thuc_hanh				=						@Thuc_hanh,
	LT_TH					=						@LT_TH, 
	TTSX					=						@TTSX, 
	Tinh_chat				=						@Tinh_chat, 
	Nam_hoc					=						@Nam_hoc, 
	Hoc_ky					=						@Hoc_ky, 
	Ma_hoc_phan				=						@Ma_hoc_phan,
	User1					=						@User1, 
	User2					=						@User2, 
	User3					=						@User3, 
	User4					=						@User4, 
	User5					=						@User5 
	WHERE
		ID						=	@ID
END						
GO

--sp_ISO_UpdateChiTietTKB.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateChiTietTKB]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateChiTietTKB]
GO
CREATE PROCEDURE sp_ISO_UpdateChiTietTKB
	@ID						int,
	@Ma_TKB					int,
	@Thu_trong_tuan			int,
	@Buoi					nvarchar(10),
	@Hinh_thuc_day			nvarchar(5), 
	@Nhom					int,
	@Ma_phong				int,
	@Ngay_cap_nhat_cuoi		datetime output,
	@So_thu_tu				int,
	@Ma_mon_hoc_TKB			int,
	@Tuan					int,
	@Ngay_hoc				datetime,
	@STT_noi_dung			int,
	@Co_hieu				int,
	@User1					varchar,
	@User2					varchar,
	@User3					varchar,
	@User4					varchar,
	@User5					varchar
AS
BEGIN	
	DECLARE @Nam_bat_dau int
	SELECT @Nam_bat_dau = Nam_bat_dau FROM ThoiKhoaBieu WHERE ID = @Ma_TKB
	DECLARE @Ma_nam_hoc int
	SELECT @Ma_nam_hoc = ID FROM NamHoc WHERE Nam_bat_dau = @Nam_bat_dau
	SELECT @Ngay_hoc = DATEADD(Day, @Thu_trong_tuan-1, Tu_ngay) FROM TuanLe WHERE Ma_nam_hoc = @Ma_nam_hoc AND So_thu_tu = @Tuan
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	UPDATE ChiTietTKB
	SET
		Ma_TKB				=	@Ma_TKB,
		Thu_trong_tuan		=	@Thu_trong_tuan,
		Buoi				=	@Buoi,
		Hinh_thuc_day		=	@Hinh_thuc_day,
		Nhom				=	@Nhom,
		Ma_phong			=	@Ma_phong,
		Ngay_cap_nhat_cuoi	=	@Ngay_cap_nhat_cuoi,
		So_thu_tu			=	@So_thu_tu,
		Ma_mon_hoc_TKB		=   @Ma_mon_hoc_TKB,
		Tuan				=	@Tuan,
		Ngay_hoc			=	@Ngay_hoc,
		STT_noi_dung		=	@STT_noi_dung,
		Co_hieu				=	@Co_hieu,
		User1				=	@User1,
		User2				=	@User2,
		User3				=	@User3,
		User4				=	@User4,
		User5				=	@User5
	WHERE
		ID						=	@ID
END
GO

--sp_ISO_UpdateChuongTrinhDaoTao.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateChuongTrinhDaoTao]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateChuongTrinhDaoTao]
GO
CREATE PROCEDURE sp_ISO_UpdateChuongTrinhDaoTao
	@ID int,
	@Ten nvarchar(100) output,
	@Ten_nghe nvarchar(40) output,
	@Ma_nghe varchar(40),
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
	--@Ngay_tao datetime,
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
	SET @Ngay_cap_nhat_cuoi=GETDATE()

	UPDATE CHUONGTRINHDAOTAO
	SET
	Ten						=	@Ten,
	Ten_nghe				=	@Ten_nghe,
	Ma_nghe					= 	@Ma_nghe,
	Ma_trinh_do				=	@Ma_trinh_do,
	Doi_tuong_1				=	@Doi_tuong_1,
	Doi_tuong_2				=	@Doi_tuong_2,
	Doi_tuong_3				=	@Doi_tuong_3,
	So_luong_mon_hoc		=	@So_luong_mon_hoc,
	Muc_tieu_1				=	@Muc_tieu_1,
	Muc_tieu_2				=	@Muc_tieu_2,
	Muc_tieu_3				=	@Muc_tieu_3,
	Muc_tieu_4				=	@Muc_tieu_4,
	Muc_tieu_5				=	@Muc_tieu_5,
	Phuong_phap_1			=	@Phuong_phap_1,
	Phuong_phap_2			=	@Phuong_phap_2,
	Phuong_phap_3			=	@Phuong_phap_3,
	Thoi_gian_1				=	@Thoi_gian_1,
	Thoi_gian_2				=	@Thoi_gian_2,
	Thoi_gian_3				=	@Thoi_gian_3,
	Thoi_gian_4				=	@Thoi_gian_4,
	Thoi_gian_5				=	@Thoi_gian_5,
	Thoi_gian_6				=	@Thoi_gian_6,
	Thoi_gian_7				=	@Thoi_gian_7,
	Thoi_gian_8				=	@Thoi_gian_8,
	Phan_bo_1				=	@Phan_bo_1,
	Phan_bo_2				=	@Phan_bo_2,
	Phan_bo_3				=	@Phan_bo_3,
	Phan_bo_4				=	@Phan_bo_4,
	Phan_bo_5				=	@Phan_bo_5,
	Phan_bo_6				=	@Phan_bo_6,
	Thi_hoc_ki				=	@Thi_hoc_ki,
	Thi_tot_nghiep			=	@Thi_tot_nghiep,
	Thuc_tap				=	@Thuc_tap,
	Y_kien_de_xuat			=	@Y_kien_de_xuat,
	--Ngay_tao				=	@Ngay_tao,
	Ngay_cap_nhat_cuoi		=	@Ngay_cap_nhat_cuoi,
	Ma_nguoi_tao			=	@Ma_nguoi_tao,
	Ma_nguoi_duyet			=	@Ma_nguoi_duyet,
	Ngay_duyet				=	@Ngay_duyet,
	Tinh_trang				=	@Tinh_trang,
	Ly_do_reject			=	@Ly_do_reject,
	Ma_quyet_dinh			=	@Ma_quyet_dinh,
	Bang_cap				=	@Bang_cap,
	Ngay_gui				=	@Ngay_gui,
	User1					=	@User1,
	User2					=	@User2,
	User3					=	@User3,
	User4					=	@User4,
	User5					=	@User5
	WHERE 
	ID						=	@ID	
	SELECT @Ten = Ten, @Ngay_cap_nhat_cuoi=Convert(varchar(10),Ngay_cap_nhat_cuoi,110), @Ten_nghe = Ten_nghe
	FROM ChuongTrinhDaoTao
	WHERE ID=@ID
END
	
GO

--sp_ISO_UpdateDanNhapByMaGiaoAn.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateDanNhapByMaGiaoAn]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateDanNhapByMaGiaoAn]
GO
CREATE PROCEDURE sp_ISO_UpdateDanNhapByMaGiaoAn
	@MaGiaoAn int,
	@DanNhap nvarchar(2000)
AS
BEGIN
	UPDATE GIAOAN
		SET Dan_nhap=@DanNhap
	WHERE ID=@MaGiaoAn
END

GO

--sp_ISO_UpdateDeCuongMonHoc.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateDeCuongMonHoc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateDeCuongMonHoc]
GO 
CREATE PROCEDURE sp_ISO_UpdateDeCuongMonHoc
	@ID							int,
	@Ten						nvarchar (2000),
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
	--@Ngay_tao					datetime,
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
	@User5						varchar(40)
AS
BEGIN
	DECLARE @Ten_mon_hoc nvarchar(40)
	DECLARE @Ten_chuyen_nganh nvarchar(40)
	DECLARE @Ten_chuong_trinh nvarchar(100)
	DECLARE @Ma_trinh_do int
	DECLARE @Ten_trinh_do nvarchar(40)
	SELECT @Ten_mon_hoc = Ten_mon_hoc FROM MonHoc WHERE ID = @Ma_mon_hoc
	SELECT @Ten_chuyen_nganh = Ten_nghe, @Ten_chuong_trinh = Ten, @Ma_trinh_do = Ma_trinh_do FROM ChuongTrinhDaoTao WHERE ID = @Ma_chuong_trinh
	SELECT @Ten_trinh_do = Ten FROM HeDaoTao WHERE ID = @Ma_trinh_do
	SET @Ten = N'ĐỀ CƯƠNG MÔN HỌC ' + @Ten_mon_hoc + N' CTDT HỆ ' + @Ten_trinh_do + N' NGÀNH ' + @Ten_chuyen_nganh + ' ' + @Ten_chuong_trinh
	SET @Ngay_cap_nhat_cuoi = GETDATE()
	UPDATE DeCuongMonHoc
	SET 
		Ten						=	@Ten,
		Ma_mon_hoc				=	@Ma_mon_hoc,
		Ly_thuyet				=	@Ly_thuyet,
		Thuc_hanh				=	@Thuc_hanh,
		Kiem_tra				=	@Kiem_tra,
		Tinh_chat_mon_hoc		=	@Tinh_chat_mon_hoc,
		Vi_tri_mon_hoc			=	@Vi_tri_mon_hoc,
		Muc_tieu_1				=	@Muc_tieu_1,
		Muc_tieu_2				=	@Muc_tieu_2,
		Muc_tieu_3				=	@Muc_tieu_3,
		Muc_tieu_4				=	@Muc_tieu_4,
		Dieu_kien_1				=	@Dieu_kien_1,
		Dieu_kien_2				=	@Dieu_kien_2,
		Dieu_kien_3				=	@Dieu_kien_3,
		Dieu_kien_4				=	@Dieu_kien_4,
		Phuong_phap_1			=	@Phuong_phap_1,
		Phuong_phap_2			=	@Phuong_phap_2,
		Phuong_phap_3			=	@Phuong_phap_3,
		--Ngay_tao				=	@Ngay_tao,
		Ma_nguoi_tao			=	@Ma_nguoi_tao,
		Ma_nguoi_duyet			=	@Ma_nguoi_duyet,
		Ngay_duyet				=	@Ngay_duyet,
		Ngay_cap_nhat_cuoi		=	@Ngay_cap_nhat_cuoi,
		Tinh_trang				=	@Tinh_trang,
		Ly_do_reject			=	@Ly_do_reject,
		So_buoi_hoc_trong_tuan	=	@So_buoi_hoc_trong_tuan,
		So_tiet_hoc_mot_buoi	=	@So_tiet_hoc_mot_buoi,
		Ma_chuong_trinh			=	@Ma_chuong_trinh,
		Kieu_bien_soan			=	@Kieu_bien_soan,
		Ten_khoa				=	@ten_khoa,
		Ngay_gui				=	@Ngay_gui,
		User1					=	@User1,
		User2					=	@User2,
		User3					=	@User3,
		User4					=	@User4,
		User5					=	@User5
	WHERE 
		ID = @ID
	SELECT @Ngay_cap_nhat_cuoi=Convert(varchar(10),Ngay_cap_nhat_cuoi,110)
	FROM DeCuongMonHoc
	WHERE ID=@ID	
END
GO

--sp_ISO_UpdateGhiChuChiTietKHDT.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateGhiChuChiTietKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateGhiChuChiTietKHDT]
GO
CREATE PROCEDURE sp_ISO_UpdateGhiChuChiTietKHDT
	@ID						int,
	@Ghi_chu				nvarchar(4000),
	@Tinh_trang_phan_cong_tac int
AS
BEGIN	
	UPDATE ChiTietKHDT
	SET 
		Ghi_chu		=	@Ghi_chu,
		Tinh_trang_phan_cong_tac = @Tinh_trang_phan_cong_tac
	WHERE
		ID	=	@ID
END
GO

--sp_ISO_UpdateGiaoAnLyThuyet.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateGiaoAnLyThuyet]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateGiaoAnLyThuyet]
GO
CREATE PROCEDURE sp_ISO_UpdateGiaoAnLyThuyet
	@stt int output,
	@MaGiaoAn int,
	@MA_KHGD int,
	@So_giao_an int,
	@Ngay_thuc_hien datetime,
	@Muc_tieu nvarchar(2000),
	@Do_dung_PT_DH nvarchar(2000),
	@On_dinh_LH nvarchar(2000),
	@Thoi_gian_on_dinh int,
	@Thoi_gian_TH_BH int,
	@Dan_nhap nvarchar(2000),
	@HD_dan_nhap_GV nvarchar(2000),
	@HD_dan_nhap_HS nvarchar(2000),
	@Thoi_gian_dan_nhap int,
	@Noi_dung_bai_giang nvarchar(4000),
	@HD_giang_bai_moi_GV nvarchar(2000),
	@HD_giang_bai_moi_HS nvarchar(2000),
	@Thoi_gian_bai_giang int,
	@Cung_co_kien_thuc nvarchar(2000),
	@HD_cung_co_GV nvarchar(2000),
	@HD_cung_co_HS nvarchar(2000),
	@Thoi_gian_cung_co int, 
	@Huong_dan_tu_hoc nvarchar(40),
	@HD_HDTH_GV nvarchar(2000),
	@HD_HDTH_HS nvarchar(2000),
	@Thoi_gian_HDTH int,
	@Tai_lieu_tham_khao nvarchar(40),
	@Ngay_cap_nhat_cuoi datetime
AS
BEGIN
	UPDATE GIAOAN
		SET MA_KHGD=@MA_KHGD,
		So_giao_an=@So_giao_an,
		Ngay_thuc_hien=@Ngay_thuc_hien,
		Muc_tieu=@Muc_tieu,
		Do_dung_PT_DH=@Do_dung_PT_DH,
		On_dinh_LH=@On_dinh_LH,
		Thoi_gian_on_dinh=@Thoi_gian_on_dinh,
		Thoi_gian_TH_BH=@Thoi_gian_TH_BH,
		Dan_nhap=@Dan_nhap,
		HD_dan_nhap_GV=@HD_dan_nhap_GV,
		HD_dan_nhap_HS=@HD_dan_nhap_HS,
		Thoi_gian_dan_nhap=@Thoi_gian_dan_nhap,
		Noi_dung_bai_giang=@Noi_dung_bai_giang,
		HD_giang_bai_moi_GV=@HD_giang_bai_moi_GV,
		HD_giang_bai_moi_HS=@HD_giang_bai_moi_HS,
		Thoi_gian_bai_giang=@Thoi_gian_bai_giang,
		Cung_co_kien_thuc=@Cung_co_kien_thuc,
		HD_cung_co_GV=@HD_cung_co_GV,
		HD_cung_co_HS=@HD_cung_co_HS,
		Thoi_gian_cung_co=@Thoi_gian_cung_co,
		Huong_dan_tu_hoc=@Huong_dan_tu_hoc,
		HD_HDTH_GV=@HD_HDTH_GV,
		HD_HDTH_HS=@HD_HDTH_HS,
		Thoi_gian_HDTH=@Thoi_gian_HDTH,
		Tai_lieu_tham_khao=@Tai_lieu_tham_khao,
		Ngay_cap_nhat_cuoi=@Ngay_cap_nhat_cuoi,
		Tinh_trang=0
	WHERE ID=@MaGiaoAn
END

GO

--sp_ISO_UpdateGiaoAnThucHanh.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateGiaoAnThucHanh]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateGiaoAnThucHanh]
GO
CREATE PROCEDURE sp_ISO_UpdateGiaoAnThucHanh
	@MaGiaoAn int,
	@Ma_KHGD int,
	@So_giao_an int,
	@Ngay_thuc_hien datetime,
	@Muc_tieu nvarchar(2000),
	@Do_dung_PT_DH nvarchar(2000),
	@Hinh_thuc_TC_DH nvarchar(2000),
	@On_dinh_LH nvarchar(2000),
	@Thoi_gian_on_dinh int,
	@Thoi_gian_TH_BH int,
	@Dan_nhap nvarchar(2000),
	@HD_dan_nhap_GV nvarchar(2000),
	@HD_dan_nhap_HS nvarchar(2000),
	@Thoi_gian_dan_nhap int,
	@Huong_dan_ban_dau nvarchar(2000),
	@HD_HDBD_GV nvarchar(2000),
	@HD_HDBD_HS nvarchar(2000),
	@Thoi_gian_HDBD int,
	@Huong_dan_thuong_xuyen nvarchar(2000),
	@HD_HDTX_GV nvarchar(2000),
	@HD_HDTX_HS nvarchar(2000),
	@Thoi_gian_HDTX int,
	@Huong_dan_ket_thuc nvarchar(2000),
	@HD_HDKT_GV nvarchar(2000),
	@HD_HDKT_HS nvarchar(2000),
	@Thoi_gian_HDKT int,
	@Huong_dan_ren_luyen nvarchar(2000),
	@HD_HDRL_GV nvarchar(2000),
	@Thoi_gian_HDRL int,
	@Rut_kinh_nghiem nvarchar(2000),
	@Ngay_cap_nhat_cuoi datetime
AS
BEGIN
	UPDATE GIAOAN
		SET MA_KHGD=@MA_KHGD,
		So_giao_an=@So_giao_an,
		Ngay_thuc_hien=@Ngay_thuc_hien,
		Muc_tieu=@Muc_tieu,
		Do_dung_PT_DH=@Do_dung_PT_DH,
		Hinh_thuc_TC_DH=@Hinh_thuc_TC_DH,
		On_dinh_LH=@On_dinh_LH,
		Thoi_gian_on_dinh=@Thoi_gian_on_dinh,
		Thoi_gian_TH_BH=@Thoi_gian_TH_BH,
		Dan_nhap=@Dan_nhap,
		HD_dan_nhap_GV=@HD_dan_nhap_GV,
		HD_dan_nhap_HS=@HD_dan_nhap_HS,
		Thoi_gian_dan_nhap=@Thoi_gian_dan_nhap,
		Huong_dan_ban_dau=@Huong_dan_ban_dau,
		HD_HDBD_GV=@HD_HDBD_GV,
		HD_HDBD_HS=@HD_HDBD_HS,
		Thoi_gian_HDBD=@Thoi_gian_HDBD,
		Huong_dan_thuong_xuyen=@Huong_dan_thuong_xuyen,
		HD_HDTX_GV=@HD_HDTX_GV,
		HD_HDTX_HS=@HD_HDTX_HS,
		Thoi_gian_HDTX=@Thoi_gian_HDTX,
		Huong_dan_ket_thuc=@Huong_dan_ket_thuc,
		HD_HDKT_GV=@HD_HDKT_GV,
		HD_HDKT_HS=@HD_HDKT_HS,
		Thoi_gian_HDKT=@Thoi_gian_HDKT,
		Huong_dan_ren_luyen=@Huong_dan_ren_luyen,
		HD_HDRL_GV=@HD_HDRL_GV,
		Thoi_gian_HDRL=@Thoi_gian_HDRL,
		Rut_kinh_nghiem=@Rut_kinh_nghiem,
		Ngay_cap_nhat_cuoi=@Ngay_cap_nhat_cuoi,
		Tinh_trang=0
	WHERE ID=@MaGiaoAn
END

GO

--sp_ISO_UpdateHDTXByMaGiaoAn.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateHDTXByMaGiaoAn]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateHDTXByMaGiaoAn]
GO
CREATE PROCEDURE sp_ISO_UpdateHDTXByMaGiaoAn
	@MaGiaoAn int,
	@HuongDanThuongXuyen nvarchar(2000)
AS
BEGIN
	UPDATE GIAOAN
		SET Huong_dan_thuong_xuyen=@HuongDanThuongXuyen
	WHERE ID=@MaGiaoAn
END

GO

--sp_ISO_UpdateKeHoachDaoTao.sql

/***********************************************************
* Purpose : Update "KE HOACH DAO TAO"
* Author : ThienVD
* Date: 02-04-2010
* Description: Update "KE HOACH DAO TAO"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateKeHoachDaoTao]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateKeHoachDaoTao]
GO
CREATE PROCEDURE sp_ISO_UpdateKeHoachDaoTao
	@ID				int,	
	@Ten			nvarchar(200),
	@Nam1			varchar(4),
	@Nam2			varchar(4),
	@Nam3			varchar(4),
	@Nam4			varchar(4),
	@Nam5			varchar(4),
	@Nam6			varchar(4),
	@Nhiem_vu_1		nvarchar(2000),
	@Nhiem_vu_2		nvarchar(2000),
	@Nhiem_vu_3		nvarchar(2000),
	@Nhiem_vu_4		nvarchar(2000),
	@Ma_nguoi_lap	int,
--	@Ngay_lap		datetime,
	@Ma_nguoi_duyet	int,
	@Ngay_duyet		datetime,
	@Tinh_trang		int,
	@Ngay_cap_nhat_cuoi	varchar(30)		output,
	@Ly_do_reject	nvarchar(80),
	@Ngay_gui		datetime,
	@Bo_sung		int,
	@User1			varchar(40),
	@User2			varchar(40),
	@User3			varchar(40),
	@User4			varchar(40),
	@User5			varchar(40)
AS
BEGIN
	SET @Ten = N'KẾ HOẠCH ĐÀO TẠO NĂM HỌC: ' + @Nam1 + '-' + @Nam2	
	SET @Ngay_cap_nhat_cuoi=GETDATE()
		
	UPDATE KEHOACHDAOTAO
	SET 
		Ten				=	@Ten,
		Nam1			=	@Nam1,
		Nam2			=	@Nam2,
		Nam3			=	@Nam3,
		Nam4			=	@Nam4,
		Nam5			=	@Nam5,
		Nam6			=	@Nam6,
		Nhiem_vu_1		=	@Nhiem_vu_1,
		Nhiem_vu_2		=	@Nhiem_vu_2,
		Nhiem_vu_3		=	@Nhiem_vu_3,
		Nhiem_vu_4		=	@Nhiem_vu_4,
		Ma_nguoi_lap	=	@Ma_nguoi_lap,
--		Ngay_lap		=	@Ngay_lap,
		Ma_nguoi_duyet	=	@Ma_nguoi_duyet,
		Ngay_duyet		=	@Ngay_duyet,
		Tinh_trang		=	@Tinh_trang,
		Ngay_cap_nhat_cuoi	=	@Ngay_cap_nhat_cuoi,
		Ly_do_reject	=	@Ly_do_reject,
		Ngay_gui		=	@Ngay_gui,
		Bo_sung			=	@Bo_sung,
		User1			=	@User1,
		User2			=	@User2,
		User3			=	@User3,
		User4			=	@User4,
		User5			=	@User5
	WHERE
		ID				=	@ID
	
	
	SELECT @Ngay_cap_nhat_cuoi=Convert(varchar(10),Ngay_cap_nhat_cuoi,110)
	FROM KeHoachDaoTao
	WHERE ID=@ID
END


GO

--sp_ISO_UpdateKHGD.sql

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


GO

--sp_ISO_UpdateLyDoRejectGAByMaKHGD.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateLyDoRejectGAByMaKHGD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateLyDoRejectGAByMaKHGD]
GO
CREATE PROCEDURE sp_ISO_UpdateLyDoRejectGAByMaKHGD
	@MaKHGD int,
	@LyDoReject nvarchar(2000)
AS
BEGIN
	UPDATE KEHOACHGIANGDAY
		SET Ly_do_reject=@LyDoReject
	WHERE ID=@MaKHGD
END



GO

--sp_ISO_UpdateMaGiaoAnByMaCTKHGD.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateMaGiaoAnByMaCTKHGD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateMaGiaoAnByMaCTKHGD]
GO
CREATE PROCEDURE sp_ISO_UpdateMaGiaoAnByMaCTKHGD
	@stt int output,	
	@MaCTKHGD int
	
AS
BEGIN
	Declare @Ma_giao_an int
	SELECT TOP 1 @Ma_giao_an=ID  FROM GIAOAN ORDER BY ID DESC  
	UPDATE CHITIETKHGD
		SET Ma_giao_an=@Ma_giao_an 	
	WHERE ID=@MaCTKHGD
END
 
GO

--sp_ISO_UpdateMaNguoiDuyetGiaoAn.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateMaNguoiDuyetGiaoAn]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateMaNguoiDuyetGiaoAn]
GO
CREATE PROCEDURE sp_ISO_UpdateMaNguoiDuyetGiaoAn
	@MaGiaoAn int,
	@Ma_nguoi_duyet int
AS
BEGIN
	UPDATE GIAOAN
		SET MA_nguoi_duyet=@MA_nguoi_duyet,
			Ngay_duyet=getdate()
	WHERE ID=@MaGiaoAn
END

GO

--sp_ISO_UpdateMaNguoiDuyetGiaoAnByMaKHGD.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateMaNguoiDuyetGiaoAnByMaKHGD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateMaNguoiDuyetGiaoAnByMaKHGD]
GO
CREATE PROCEDURE sp_ISO_UpdateMaNguoiDuyetGiaoAnByMaKHGD
	@MaKHGD int,
	@Ma_nguoi_duyet int
AS
BEGIN
	UPDATE GIAOAN
		SET MA_nguoi_duyet=@Ma_nguoi_duyet,
			Ngay_duyet=getdate()
	WHERE Ma_KHGD=@MaKHGD
END

GO

--sp_ISO_UpdateMaNguoiDuyetKHGDByMaKHGD.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateMaNguoiDuyetKHGDByMaKHGD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateMaNguoiDuyetKHGDByMaKHGD]
GO
CREATE PROCEDURE sp_ISO_UpdateMaNguoiDuyetKHGDByMaKHGD
	@MaKHGD int,
	@Ma_nguoi_duyet int
AS
BEGIN
	UPDATE KEHOACHGIANGDAY
		SET MA_nguoi_duyet=@Ma_nguoi_duyet,
			Ngay_duyet=getdate()
	WHERE ID=@MaKHGD
END

GO

--sp_ISO_UpdateMatKhauTV.sql

/***********************************************************
* Purpose : Update "Mat_khau thanh vien"
* Author : TuanHQ
* Date: 02-04-2010
* Description: Update "Mat_khau thanh vien"
***********************************************************/

if exists (select * from dbo.sysobjects where name = 'sp_ISO_UpdateMatKhauTV')
drop procedure [dbo].[sp_ISO_UpdateMatKhauTV]
GO
CREATE PROCEDURE sp_ISO_UpdateMatKhauTV
	@Ten_dn  varchar(20),
	@Mat_khau varchar(20)
AS
BEGIN
	update thanhvien 
	set mat_khau = @Mat_khau
	where Ten_dn = @Ten_dn
END


GO

--sp_ISO_UpdateMoChuyenNganh.sql

/***********************************************************
* Purpose : Update "Mo Chuyen Nganh"
* Author : ToanTT
* Date: 12-04-2010
* Description: Update "Mo Chuyen Nganh"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateMoChuyenNganh]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateMoChuyenNganh]
GO
CREATE PROCEDURE sp_ISO_UpdateMoChuyenNganh
	@ID						int,
	@Ma_chuyen_nganh		int,
	@Ghi_chu				int,
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN
	SET @Ngay_cap_nhat_cuoi = GETDATE()	
			
	UPDATE MoChuyenNganh
	SET 
		Ma_chuyen_nganh			=	@Ma_chuyen_nganh,
		Ghi_chu					=	@Ghi_chu,
		User1					=	@User1,
		User2					=	@User2,
		User3					=	@User3,
		User4					=	@User4,
		User5					=	@User5
	WHERE
		ID						=	@ID
END


GO

--sp_ISO_UpdateMonHocTKB.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateMonHocTKB]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateMonHocTKB]
GO
CREATE PROCEDURE sp_ISO_UpdateMonHocTKB
	@ID						int,
	@So_noi_dung			int,
	@So_ca_thuc_hanh		int,
	@Ma_TKB					int,
	@Ma_mon_hoc				int,
	@Ma_giao_vien			int,
	@Ngay_bat_dau_LT		datetime,
	@Ngay_bat_dau_TH		datetime,
	@Ngay_ket_thuc_LT		datetime,
	@Ngay_ket_thuc_TH		datetime,
	@Ghi_chu				nvarchar(1000),
	@Ngay_cap_nhat_cuoi		datetime,
	@Tuan_bat_dau_LT		int,
	@Tuan_bat_dau_TH		int,
	@Tuan_ket_thuc_LT		int,
	@Tuan_ket_thuc_TH		int,
	@Ten_mon_hoc			nvarchar(200),
	@Ten_giao_vien			nvarchar(200),
	@User1					varchar,
	@User2					varchar,
	@User3					varchar,
	@User4					varchar,
	@User5					varchar																					
AS
BEGIN 
	DECLARE @Nam_bat_dau int
	SELECT @Nam_bat_dau = Nam_bat_dau FROM ThoiKhoaBieu WHERE ID = @Ma_TKB
	DECLARE @Ma_nam_hoc int
	SELECT @Ma_nam_hoc = ID FROM NamHoc WHERE Nam_bat_dau = @Nam_bat_dau
	SELECT @Ngay_bat_dau_LT = Tu_ngay FROM TuanLe WHERE Ma_nam_hoc = @Ma_nam_hoc AND So_thu_tu = @Tuan_bat_dau_LT
	SELECT @Ngay_ket_thuc_LT = Den_ngay FROM TuanLe WHERE Ma_nam_hoc = @Ma_nam_hoc AND So_thu_tu = @Tuan_ket_thuc_LT
	SELECT @Ngay_bat_dau_TH = Tu_ngay FROM TuanLe WHERE Ma_nam_hoc = @Ma_nam_hoc AND So_thu_tu = @Tuan_bat_dau_TH
	SELECT @Ngay_ket_thuc_TH = Den_ngay FROM TuanLe WHERE Ma_nam_hoc = @Ma_nam_hoc AND So_thu_tu = @Tuan_ket_thuc_TH
	
	SET @Ngay_cap_nhat_cuoi=GETDATE()

	UPDATE MonHocTKB
	SET
		So_noi_dung				=	@So_noi_dung,
		So_ca_thuc_hanh			=	@So_ca_thuc_hanh,
		Ma_TKB					=	@Ma_TKB,
		Ma_mon_hoc				=	@Ma_mon_hoc,
		Ma_giao_vien			=	@Ma_giao_vien,
		Ngay_bat_dau_LT			=	@Ngay_bat_dau_LT,
		Ngay_bat_dau_TH			=	@Ngay_bat_dau_TH,
		Ngay_ket_thuc_LT		=	@Ngay_ket_thuc_LT,
		Ngay_ket_thuc_TH		=	@Ngay_ket_thuc_TH,
		Ghi_chu					=	@Ghi_chu,
		Ngay_cap_nhat_cuoi		=	@Ngay_cap_nhat_cuoi,
		Tuan_bat_dau_LT			=	@Tuan_bat_dau_LT,
		Tuan_bat_dau_TH			=	@Tuan_bat_dau_TH,
		Tuan_ket_thuc_LT		=	@Tuan_ket_thuc_LT,
		Tuan_ket_thuc_TH		=	@Tuan_ket_thuc_TH,	
		Ten_mon_hoc				=	@Ten_mon_hoc,
		Ten_giao_vien			=	@Ten_giao_vien,
		User1				=	@User1,
		User2				=	@User2,
		User3				=	@User3,
		User4				=	@User4,
		User5				=	@User5
	WHERE
		ID						=	@ID
END			
GO

--sp_ISO_UpdateNguoiThucHien.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateNguoiThucHien]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateNguoiThucHien]
GO
CREATE PROCEDURE sp_ISO_UpdateNguoiThucHien
	@ID						int,
	@Ma_bo_phan				int,
	@Ma_thanh_vien			int,
	@Ten_thanh_vien			nvarchar(100),
	@Ngay_cap_nhat_cuoi		datetime    output,
	@Tinh_trang_thuc_hien	int,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN	
	SET @Ngay_cap_nhat_cuoi=GETDATE() select * from nguoithuchien
	UPDATE NguoiThucHien
	SET
		Ma_bo_phan				=	@Ma_bo_phan,
		Ma_thanh_vien			=	@Ma_thanh_vien,
		Ten_thanh_vien			=	@Ten_thanh_vien,
		Ngay_cap_nhat_cuoi		=	@Ngay_cap_nhat_cuoi,
		Tinh_trang_thuc_hien	=	@Tinh_trang_thuc_hien,
		User1					=	@User1,
		User2					=	@User2,
		User3					=	@User3,
		User4					=	@User4,
		User5					=	@User5
	WHERE ID = @ID
	
	SELECT 	@Ngay_cap_nhat_cuoi = Ngay_cap_nhat_cuoi FROM NguoiThucHien WHERE ID = @ID
END	
GO

--sp_ISO_UpdateNoiDungChiTietKHDT.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateNoiDungChiTietKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateNoiDungChiTietKHDT]
GO
CREATE PROCEDURE sp_ISO_UpdateNoiDungChiTietKHDT
	@ID						int,
	@Ma_chi_tiet_KHDT		int,
	@Ma_cong_tac			int,
	@Noi_dung_cong_tac		nvarchar(4000),
	@Khoa					int,
	@Ngay_cap_nhat_cuoi		datetime    output,
	@Tinh_trang_thuc_hien	int,
	@Bo_sung				int,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN	
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	
	UPDATE NoiDungChiTietKHDT 
	SET
		Ma_chi_tiet_KHDT	=	@Ma_chi_tiet_KHDT,
		Ma_cong_tac			=	@Ma_cong_tac,
		Khoa				=	@Khoa,
		Noi_dung_cong_tac	=	@Noi_dung_cong_tac,
		Ngay_cap_nhat_cuoi	=	@Ngay_cap_nhat_cuoi,
		Tinh_trang_thuc_hien	=	@Tinh_trang_thuc_hien,
		Bo_sung				=	@Bo_sung,
		User1				=	@User1,
		User2				=	@User2,
		User3				=	@User3,
		User4				=	@User4,
		User5				=	@User5
	WHERE ID = @ID
	SELECT 	@Ngay_cap_nhat_cuoi = Ngay_cap_nhat_cuoi FROM NoiDungChiTietKHDT WHERE ID = @ID
END

GO

--sp_ISO_UpdateNoiDungDCMH.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateNoiDungDCMH]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateNoiDungDCMH]
GO
CREATE PROCEDURE sp_ISO_UpdateNoiDungDCMH
	@ID					int,
	@So_thu_tu			int,
	@So_buoi			int,
	@Ma_de_cuong		int,
	@Ten_chuong			nvarchar(4000),
	@Co_hieu			int,
	@So_tiet			int,
	@Ngay_cap_nhat_cuoi	datetime,
	@User1				varchar(40),
	@User2				varchar(40),
	@User3				varchar(40),
	@User4				varchar(40),
	@User5				varchar(40)
AS
BEGIN	
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	
	UPDATE NoiDungDCMH
	SET
		So_thu_tu				=	@So_thu_tu,
		So_buoi					=	@So_buoi,
		Ma_de_cuong				=	@Ma_de_cuong,
		Ten_chuong				=	@Ten_chuong,
		Co_hieu					=	@Co_hieu,
		So_tiet					=	@So_tiet,
		Ngay_cap_nhat_cuoi		=	@Ngay_cap_nhat_cuoi,
		User1					=	@User1,
		User2					=	@User2,
		User3					=	@User3,
		User4					=	@User4,
		User5					=	@User5
	WHERE
		ID = @ID
END
GO

--sp_ISO_UpdateQuyetDinhMoLop.sql

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


GO

--sp_ISO_UpdateSuDung.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateSuDung]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateSuDung]
GO
CREATE PROCEDURE sp_ISO_UpdateSuDung
	@ID						int,
	@Ma_phong				int,
	@Ma_mon_hoc_TKB			int,
	@Ma_nam_hoc				int,
	@STT_tuan				int,
	@Thu_trong_tuan			int,
	@Buoi					nvarchar(10),
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN	
	UPDATE SuDung
	SET 
		Ma_phong				=	@Ma_phong,				
		Ma_nam_hoc				=	@Ma_nam_hoc,				
		STT_tuan				=	@STT_tuan,				
		Thu_trong_tuan			=	@Thu_trong_tuan,	
		Buoi					=	@Buoi,
		User1					=	@User1,
		User2					=	@User2,
		User3					=	@User3,
		User4					=	@User4,
		User5					=	@User5
	WHERE
		ID	=	@ID
END
GO

--sp_ISO_UpdateThoiKhoaBieu.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateThoiKhoaBieu]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateThoiKhoaBieu]
GO 
CREATE PROCEDURE sp_ISO_UpdateThoiKhoaBieu
	@ID						int output,
	@Ma_lop					int,
	@Tuan_bat_dau			int,
	@Tuan_ket_thuc			int,
	@Ngay_bat_dau			datetime,
	@Ngay_ket_thuc			datetime,
	@Ma_nguoi_tao			int,
	--@Ngay_tao				datetime,
	@Ma_nguoi_duyet			int,
	@Ngay_duyet				datetime,
	@Ngay_cap_nhat_cuoi		varchar(30) output,
	@Ten					nvarchar(200),
	@Tinh_trang				int,
	@Ly_do_reject			nvarchar(2000),
	@Hoc_ki					int,
	@Nam_bat_dau			nvarchar(20),
	@Nam_ket_thuc			nvarchar(20),
	@Ngay_gui				datetime,
	@User1					varchar,
	@User2					varchar,
	@User3					varchar,
	@User4					varchar,
	@User5					varchar 
AS
BEGIN
DECLARE @Ma_chuyen_nganh int
	DECLARE @Ma_quyet_dinh int
	SELECT @Ma_chuyen_nganh = Ma_chuyen_nganh, @Ma_quyet_dinh = Ma_quyet_dinh FROM LopHoc WHERE ID = @Ma_lop
	DECLARE @Ma_trinh_do int
	DECLARE @Ten_trinh_do nvarchar(100)
	SELECT @Ma_trinh_do = Ma_trinh_do FROM ChuongTrinhDaoTao WHERE Ma_nghe = @Ma_chuyen_nganh AND Ma_quyet_dinh = @Ma_quyet_dinh
	SELECT @Ten_trinh_do = Ten FROM HeDaoTao WHERE ID = @Ma_trinh_do
	DECLARE @Ten_chuyen_nganh nvarchar(100)
	SELECT @Ten_chuyen_nganh = Ten_chuyen_nganh FROM ChuyenNganh WHERE ID = @Ma_chuyen_nganh
	SET @Ten = N'THỜI KHÓA BIỂU HỌC KÌ ' + cast(@Hoc_ki As nvarchar) + N' HỆ ' + @Ten_trinh_do + N' NGÀNH ' +  @Ten_chuyen_nganh + N' NĂM HỌC ' + @Nam_bat_dau + '-' + @Nam_ket_thuc
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	
	UPDATE ThoiKhoaBieu
	SET 
		Ma_lop				=	@Ma_lop,
		Tuan_bat_dau		=	@Tuan_bat_dau,
		Tuan_ket_thuc		=	@Tuan_ket_thuc,
		Ngay_bat_dau		=	@Ngay_bat_dau,
		Ngay_ket_thuc		=	@Ngay_ket_thuc,
		Ma_nguoi_tao		=	@Ma_nguoi_tao,
		--Ngay_tao			=	@Ngay_tao,
		Ma_nguoi_duyet		=	@Ma_nguoi_duyet,
		Ngay_duyet			=	@Ngay_duyet,
		Ngay_cap_nhat_cuoi	=	@Ngay_cap_nhat_cuoi,
		Ten					=	@ten,
		Tinh_trang			=	@Tinh_trang,
		Ly_do_reject		=	@Ly_do_reject,
		Hoc_ki				=	@Hoc_ki,
		Nam_bat_dau			=	@Nam_bat_dau,
		Nam_ket_thuc		=	@Nam_ket_thuc,
		Ngay_gui			=	@Ngay_gui,
		User1				=	@User1,
		User2				=	@User2,
		User3				=	@User3,
		User4				=	@User4,
		User5				=	@User5
	WHERE
		ID				=	@ID
	
	SELECT	@Ngay_cap_nhat_cuoi= Convert(varchar(10),Ngay_cap_nhat_cuoi,110)
	FROM ThoiKhoaBieu A 
	WHERE A.ID = @ID	
END
GO
