
--sp_Admin_DeleteBaiKiemTra.sql
/***********************************************************
* Purpose : delete bai kiem tra
* Author : AnhHX
* Date: 16-09-2010S
* Description: delete bai kiem tra
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_DeleteBaiKiemTra]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_DeleteBaiKiemTra]
GO
CREATE PROC sp_Admin_DeleteBaiKiemTra
	@ID	int

AS
BEGIN
	DELETE
	FROM baikiemtra
	WHERE ID = @ID
	
END

GO

--sp_Admin_InsertBaiKiemTra.sql
/***********************************************************
* Purpose : inset bai kiem tra
* Author : AnhHX
* Date: 16-09-2010S
* Description: inset bai kiem tra
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_InsertBaiKiemTra]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_InsertBaiKiemTra]
GO
CREATE PROC sp_Admin_InsertBaiKiemTra
	@ID						int output,
	@Ma_mon_hoc				int,
	@Ma_ten_bai_kiem_tra	int,
	@Ma_hinh_thuc			int,
	@Thang_diem				nvarchar(40),
	@Ghi_chu				nvarchar(40),
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					nvarchar(40)


AS
BEGIN
	set @Ngay_cap_nhat_cuoi = getdate()
	insert into baikiemtra(
					Ma_mon_hoc,
					Ma_bai_kiem_tra,
					Ma_hinh_thuc,
					Thang_diem,
					Ghi_chu,
					Ngay_cap_nhat_cuoi,
					User1
				)
	values(				
					@Ma_mon_hoc,
					@Ma_ten_bai_kiem_tra,
					@Ma_hinh_thuc,
					@Thang_diem,
					@Ghi_chu,
					@Ngay_cap_nhat_cuoi,
					@User1
	)
	
	SELECT @ID = ID FROM BaiKiemTra WHERE Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
END

GO

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
	@ID					int output,
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
	SELECT @ID = ID FROM MonHoc WHERE Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
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

--sp_Admin_ShowThanhVienByMaBoPhan.sql

/***********************************************************
* Purpose : phan trang thanh vien (tim thanh vien theo ma vai tro)
* Author : HuyenLY
* Date: 02-06-2010
* Description: phan trang thanh vien (tim thanh vien theo ma vai tro)
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_ShowThanhVienByMaBoPhan]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_ShowThanhVienByMaBoPhan]
GO
CREATE PROCEDURE sp_Admin_ShowThanhVienByMaBoPhan

	@MaBoPhan		varchar(10),
	@Ten			nvarchar(100)
AS
BEGIN
	IF @MaBoPhan = -1 AND @Ten = ''
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
	
	IF @MaBoPhan <> -1 AND @Ten = ''
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
		WHERE Ma_bo_phan = @MaBoPhan
	END
	
	IF @MaBoPhan = -1 AND @Ten <> ''
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
	
	IF @MaBoPhan <> -1 AND @Ten <> ''
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
		WHERE a.Ten LIKE '%' + @ten + '%'
			AND Ma_bo_phan = @MaBoPhan
	END 

END


--sp_Admin_ShowThanhVienByMaBoPhan '9',''
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

--sp_Admin_UpdateBaiKiemTra.sql
/***********************************************************
* Purpose : update bai kiem tra
* Author : AnhHX
* Date: 16-09-2010S
* Description: update bai kiemtra
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_UpdateBaiKiemTra]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_UpdateBaiKiemTra]
GO
CREATE PROC sp_Admin_UpdateBaiKiemTra
	@ID						nvarchar(5),
	@Ma_mon_hoc				int,
	@Ma_ten_bai_kiem_tra	int,
	@Ma_hinh_thuc			int,
	@Thang_diem				nvarchar(40),
	@Ghi_chu				nvarchar(40),
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					nvarchar(40)


AS
BEGIN
	set @Ngay_cap_nhat_cuoi = getdate()
	update baikiemtra
	set				
		Ma_mon_hoc = @Ma_mon_hoc,
		Ma_bai_kiem_tra = @Ma_ten_bai_kiem_tra,
		Ma_hinh_thuc = @Ma_hinh_thuc,
		Thang_diem = @Thang_diem,
		Ghi_chu	= @Ghi_chu,
		Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi,
		User1 = @User1

	where ID = @ID	
	
END

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
	UPDATE NoiDungChiTietKHDT
	SET 
		Noi_dung_cong_tac = @Noi_dung
	WHERE Ma_cong_tac = @ID
END
GO

--sp_Admin_UpdateDangKyMonHoc.sql
/***********************************************************
* Purpose : update dang ky mon hoc
* Author : AnhHX
* Date: 16-09-2010S
* Description: update dang ky mon hoc
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_UpdateDangKyMonHoc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_UpdateDangKyMonHoc]
GO
CREATE PROC sp_Admin_UpdateDangKyMonHoc
	@ID						nvarchar(5),
	@Ma_mon_hoc_TKB		int,
	@Ma_hoc_vien			int,
	@Diem_trung_binh		float,
	@Hanh_kiem				nvarchar(40),
	@Hoc_luc				nvarchar(40),
	@Danh_hieu				nvarchar(40),
	@Ghi_chu				nvarchar(40),
	@Ngay_cap_nhat_cuoi		datetime


AS
BEGIN
	set @Ngay_cap_nhat_cuoi = getdate()
	update dangkymonhoc
	set				
		--Ma_mon_hoc_TKB = @Ma_mon_hoc_TKB,
		--Ma_hoc_vien = @Ma_hoc_vien,
		Diem_trung_binh = @Diem_trung_binh,
		--Hanh_kiem = @Hanh_kiem,
		--Hoc_luc = @Hoc_luc,
		--Danh_hieu = @Danh_hieu,
		--Ghi_chu	= @Ghi_chu,
		Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi

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

--sp_DiemDanh_GetGiaoVienByDieuKien.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_DiemDanh_GetGiaoVienByDieuKien]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_DiemDanh_GetGiaoVienByDieuKien]
GO
CREATE PROCEDURE sp_DiemDanh_GetGiaoVienByDieuKien
	@Khoa			varchar(30),
	@Lop			varchar(10),
	@NamHoc			varchar(10),
	@GiaoVien		varchar(20),
	@MonHoc			varchar(30),
	@ThoiGian		varchar(10)
	--@TinhTrang		varchar(10)
AS
BEGIN
	DECLARE @sql NVarchar(2000)
	declare @Dieu_Kien_Khoa			nvarchar(100)
	declare @Dieu_Kien_Lop			nvarchar(100)
	declare @Dien_Kien_Nam_Hoc		nvarchar(100)
	declare @Dieu_Kien_Giao_Vien		nvarchar(100)
	declare @Dieu_Kien_Mon_Hoc		nvarchar(100)
	declare @Dieu_Kien_Thoi_Gian		nvarchar(200)
	declare @Dieu_Kien_Tinh_Trang		nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(7)
	set @Dieu_Kien_Thoi_Gian = ' ''t'' = ''t'' '
	set @Dieu_Kien_Tinh_Trang = ' ''t'' = ''t'' '
	SET @And = ' AND '
	SET @Where = ' WHERE '
	if(@Khoa <> '')
	BEGIN
		SET @Dieu_Kien_Khoa = ' F.ID = ' + @Khoa
	END
	if(@Lop <> '')
	BEGIN
		SET @Dieu_Kien_Lop = 'd.id =' + @Lop
	END
	if(@NamHoc <> '')
	BEGIN
		SET @Dien_Kien_Nam_Hoc = ' A.User1 = ' + @NamHoc
	END
	if(@GiaoVien<>'')
	Begin
		SET @Dieu_Kien_Giao_Vien = 'j.id =' + @GiaoVien
	END
	if(@MonHoc <> '')
	BEGIN
		SET @Dieu_Kien_Mon_Hoc = ' B.Ma_mon_hoc = ' + @MonHoc
	END
	if(@ThoiGian <> '')
	BEGIN
		if(Cast(@ThoiGian AS Int) < 61)
		BEGIN
			SET @Dieu_Kien_Thoi_Gian = ' A.Tuan = ' + @ThoiGian
		END
		if(Cast(@ThoiGian AS Int) < 81 AND Cast(@ThoiGian AS Int) > 60)
		BEGIN
			SET @Dieu_Kien_Thoi_Gian = ' Datepart(mm, A.Ngay_hoc) = ' + Cast(Cast(@ThoiGian AS Int) - 60 AS varchar) 
			print @Dieu_Kien_Thoi_Gian
		END
	END
	SELECT @sql = '
	SELECT A.ID, H.Ki_hieu_phong AS KiHieuPhong, A.Buoi, A.Thu_trong_tuan AS ThuTrongTuan, 
			I.Ten_mon_hoc AS TenMonHoc, ISNULL((K.Ho + '' '' + K.Ten_Lot + '' '' + K.Ten),'''') As TenGiaoVien,
			Convert(varchar(10), A.Ngay_hoc, 110) As NgayHoc, F.Ten As TenKhoa, D.Ki_hieu As KiHieuLop,a.Hinh_thuc_day as HinhThucDay
	FROM ChiTietTKB AS A 
		INNER JOIN MonHocTKB AS B ON B.ID = A.Ma_mon_hoc_TKB 
		INNER JOIN ThoiKhoaBieu AS C ON B.Ma_TKB = C.ID
		INNER JOIN LopHoc AS D ON C.Ma_lop = D.ID
		INNER JOIN ChuyenNganh AS E ON D.Ma_chuyen_nganh = E.ID
		INNER JOIN Khoa_TrungTam AS F ON E.Ma_khoaTT = F.ID
		INNER JOIN Tuanle AS G ON A.User1 = G.Ma_nam_hoc AND A.Tuan = G.So_thu_tu
		INNER JOIN PhongBan AS H ON A.Ma_phong = H.ID
		INNER JOIN MonHoc AS I ON B.Ma_mon_hoc = I.ID
		INNER JOIN ThanhVien AS J ON B.Ma_giao_vien = J.ID
		INNER JOIN ChiTietThanhVien AS K ON J.Ten_DN = K.Ten_dang_nhap'
		+ @Where + @Dieu_Kien_Khoa + @And + @Dieu_Kien_Lop + @And + @Dien_Kien_Nam_Hoc + @And + @Dieu_Kien_Giao_Vien + @And + @Dieu_Kien_Mon_Hoc + @And + @Dieu_Kien_Thoi_Gian +
		' ORDER BY A.Ngay_hoc, A.Thu_trong_tuan, A.Buoi DESC, A.Ma_phong, F.ID'
	exec  sp_executesql @sql
END

--exec sp_DiemDanh_GetGiaoVienByDieuKien 6,0,1,28,15,5
--sp_help sp_executesql
--sp_ISO_GetLichSuDungPhong '1','1','60','',''
--select * from lophoc
--select * from chitiettkb
GO

--sp_DiemDanh_UpdateSinhVien.sql
if exists (select * from dbo.sysobjects where name = 'sp_DiemDanh_UpdateSinhVien')
drop procedure [dbo].[sp_DiemDanh_UpdateSinhVien]
GO
CREATE PROCEDURE sp_DiemDanh_UpdateSinhVien
	@MaTVDD int
AS
BEGIN
	update chitietdiemdanh set tinh_trang = 4
	where  ma_tvdd = @MaTVDD
	and Convert(varchar(10),Ngay_hoc,110) = Convert(varchar(10), GetDate(), 110)
	
END

GO

--sp_DiemDanh_UpdateTinhTrang.sql
if exists (select * from dbo.sysobjects where name = 'sp_DiemDanh_UpdateTinhTrang')
drop procedure [dbo].[sp_DiemDanh_UpdateTinhTrang]
GO
CREATE PROCEDURE sp_DiemDanh_UpdateTinhTrang
	@MaTVDD int
AS
BEGIN
	update chitietdiemdanh set tinh_trang = 2 ,
	Gio_bat_dau = getdate()
	where  ma_tvdd = @MaTVDD
	and Convert(varchar(10),Ngay_hoc,110) = Convert(varchar(10), GetDate(), 110)
END

GO

--sp_DiemDanh_UpdateTinhTrang2.sql
if exists (select * from dbo.sysobjects where name = 'sp_DiemDanh_UpdateTinhTrang2')
drop procedure [dbo].[sp_DiemDanh_UpdateTinhTrang2]
GO
CREATE PROCEDURE sp_DiemDanh_UpdateTinhTrang2
	@MaTVDD int
AS
BEGIN
	update chitietdiemdanh set tinh_trang = 4,
	Gio_ket_thuc = getdate()
	where  ma_tvdd = @MaTVDD
	and Convert(varchar(10),Ngay_hoc,110) = Convert(varchar(10), GetDate(), 110)
	and tinh_trang = 3
END

GO

--sp_DiemDanh_UpdateTinhTrangDiemDanhGV.sql
if exists (select * from dbo.sysobjects where name = 'sp_DiemDanh_UpdateTinhTrangDiemDanhGV')
drop procedure [dbo].[sp_DiemDanh_UpdateTinhTrangDiemDanhGV]
GO
CREATE PROCEDURE sp_DiemDanh_UpdateTinhTrangDiemDanhGV
	@ID int
AS
BEGIN
	UPDATE chitietdiemdanh 
			SET Tinh_trang = 1
			WHERE ID IN (SELECT E.ID 
							FROM diemdanh C
									INNER JOIN thanhviendiemdanh D on C.ID = D.Ma_diem_danh
									INNER JOIN chitietdiemdanh E on E.Ma_TVDD = D.ID
							WHERE Convert(varchar(10),E.Ngay_hoc,110) = Convert(varchar(10), GetDate(), 110) 
									AND C.Ma_giao_vien = @ID
									AND E.Tinh_trang = 0)
END

GO

--sp_DiemDanh_UpdateTinhTrangDiemDanhGV2.sql
if exists (select * from dbo.sysobjects where name = 'sp_DiemDanh_UpdateTinhTrangDiemDanhGV2')
drop procedure [dbo].[sp_DiemDanh_UpdateTinhTrangDiemDanhGV2]
GO
CREATE PROCEDURE sp_DiemDanh_UpdateTinhTrangDiemDanhGV2
	@ID int
AS
BEGIN
	UPDATE chitietdiemdanh 
			SET Tinh_trang = 3
			WHERE ID IN (SELECT E.ID 
							FROM diemdanh C
									INNER JOIN thanhviendiemdanh D on C.ID = D.Ma_diem_danh
									INNER JOIN chitietdiemdanh E on E.Ma_TVDD = D.ID
							WHERE Convert(varchar(10),E.Ngay_hoc,110) = Convert(varchar(10), GetDate(), 110) 
									AND C.Ma_giao_vien = @ID
									AND E.Tinh_trang = 2)
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

--sp_ISO_CopyGiaoAn.sql

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_CopyGiaoAn]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_CopyGiaoAn]
GO
CREATE PROC [sp_ISO_CopyGiaoAn]
	@MaKHGDNew	varchar(10),
	@MaKHGDCopy	varchar(10)
AS
BEGIN
	DECLARE @CountCTKHGD int;
	DECLARE @CountGiaoAn int;


	SELECT * INTO #temp1 FROM ChiTietKHGD WHERE Ma_ke_hoach_giang_day=@MaKHGDCopy
	SELECT * INTO #temp2 FROM GiaoAn WHERE Ma_KHGD=@MaKHGDCopy

	SELECT @CountCTKHGD=Count(*) FROM #temp1
	SELECT @CountGiaoAn=Count(*) FROM #temp2

	UPDATE #temp1 SET Ma_ke_hoach_giang_day=@MaKHGDNew
	UPDATE #temp2 SET Ma_KHGD=@MaKHGDNew,Tinh_trang=0,Ngay_tao=GETDATE(),Ngay_cap_nhat_cuoi=NULL,NgayGui=NULL,Ma_nguoi_duyet=NULL
	
	--INSERT************************************************
	INSERT INTO ChiTietKHGD 
		SELECT 
		Ma_ke_hoach_giang_day,
		Ten_chuong,
		Co_hieu,
		Ngay_cap_nhat_cuoi,
		Tuan,
		Ngay_BD,
		Ngay_KT,
		Noi_dung_TH,
		Cong_viec_chuan_bi,
		Ma_giao_an,
		nhom,
		STT_Noi_Dung,
		Thu,
		Buoi,
		Ten_phong,
		Muc_tieu_bai_hoc,
		User1,
		User2,
		User3,
		User4,
		User5
		FROM #temp1 		 
	-------------------------------------------------------
	INSERT INTO GiaoAn 
		SELECT  
			Ma_KHGD,
			Thu_tu,
			Buoi_hoc,
			Ngay_thuc_hien,
			Muc_tieu,
			Thoi_gian_on_dinh,
			Cong_tac_chuan_bi,
			Ngay_tao,
			Ngay_cap_nhat_cuoi,
			Dan_nhap,
			Noi_dung_bai_giang,
			Cung_co_kien_thuc,
			Huong_dan_tu_hoc,
			Thoi_gian_dan_nhap,
			Thoi_gian_bai_giang,
			Thoi_gian_cung_co,
			Thoi_gian_HDTH,
			Tai_lieu_tham_khao,
			Ma_nguoi_duyet,
			Ngay_duyet,
			Tinh_trang,
			HD_dan_nhap_GV,
			HD_dan_nhap_HS,
			HD_giang_bai_moi_GV,
			HD_giang_bai_moi_HS,
			HD_cung_co_GV,
			HD_cung_co_HS,
			HD_HDTH_GV,
			HD_HDTH_HS,
			Loai_giao_an,
			Huong_dan_ban_dau,
			Huong_dan_thuong_xuyen,
			Huong_dan_ket_thuc,
			Huong_dan_ren_luyen,
			Thoi_gian_HDBD,
			Thoi_gian_HDTX,
			Thoi_gian_HDKT,
			Thoi_gian_HDRL,
			HD_HDBD_GV,
			HD_HDBD_HS,
			HD_HDTX_GV,
			HD_HDTX_HS,
			HD_HDKT_GV,
			HD_HDKT_HS,
			HD_HDRL_GV,
			HD_HDRL_HS,
			Gioi_thieu_chu_de,
			Giai_quyet_van_de,
			Thoi_gian_GTCD,
			Thoi_gian_GTVD,
			HD_GTCD_GV,
			HD_GTCD_HS,
			HD_GQVD_GV,
			HD_GQVD_HS,
			Rut_kinh_nghiem,
			So_giao_an,
			Do_dung_PT_DH,
			On_dinh_LH,
			Thoi_gian_TH_BH,
			Hinh_thuc_TC_DH,
			Ma_giao_vien,
			Ten_chuong,
			NgayGui,
			User1,
			User2,
			User3,
			User4,
			User5
		FROM #temp2				 --
--	
	--******************************************************
	DECLARE arrayCTKHGD CURSOR FOR
	(
		SELECT ID,Ma_giao_an
		FROM ChiTietKHGD WHERE Ma_ke_hoach_giang_day=@MaKHGDNew
	)

	DECLARE arrayGiaoAn CURSOR FOR
	(
		SELECT ID
		FROM GiaoAn 
		WHERE Ma_KHGD=@MaKHGDNew
	)

	OPEN arrayCTKHGD
	OPEN arrayGiaoAn 

	
	DECLARE @j int
	DECLARE @i int
		
	SET @i=0
	SET @j=0

	--*************************DECLARE CTKHGD**************************************************************
		DECLARE @MaCTKHGD int
		DECLARE @MaGiaoAnOfCTKHGD int
	--*****************************************************************************************************
	--*************************DECLARE GIAO AN**************************************************************
		DECLARE @MaGiaoAnOfGA int
	--*****************************************************************************************************


	FETCH NEXT FROM arrayCTKHGD INTO @MaCTKHGD,@MaGiaoAnOfCTKHGD
	FETCH NEXT FROM arrayGiaoAn INTO @MaGiaoAnOfGA
			
	WHILE @i<@CountCTKHGD 
	BEGIN
		IF ISNULL(@MaGiaoAnOfCTKHGD,'') <> '' AND @j<@CountGiaoAn
		BEGIN
	
			UPDATE ChiTietKHGD SET Ma_giao_an=@MaGiaoAnOfGA WHERE ID=@MaCTKHGD;
			SET @j=@j+1;
				
			FETCH NEXT FROM arrayGiaoAn INTO @MaGiaoAnOfGA
		END

		SET @i=@i+1;
		FETCH NEXT FROM arrayCTKHGD INTO @MaCTKHGD,@MaGiaoAnOfCTKHGD
	END


	CLOSE arrayCTKHGD
	DEALLOCATE arrayCTKHGD 
	CLOSE arrayGiaoAn
	DEALLOCATE arrayGiaoAn 

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

--sp_ISO_DeleteCongTacThang.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteCongTacThang]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteCongTacThang]
GO
CREATE PROCEDURE sp_ISO_DeleteCongTacThang
	@ID	int
AS
BEGIN
	DELETE
	FROM TinhTrangCongTac
	WHERE Ma_cong_tac_thang = @ID

	DELETE
	FROM CongTacThang
	WHERE ID = @ID
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
	@Ma_mon_hoc_TKB				int
	--@Ma_TKB					int
AS
BEGIN
	--DECLARE @Ma_mon_hoc_TKB	int
	--SELECT @Ma_mon_hoc_TKB = ID FROM MonHocTKB WHERE Ma_mon_hoc = @Ma_mon_hoc AND Ma_TKB = @Ma_TKB
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
	--@Ma_mon_hoc_TKB	int
	@ID		int
AS
BEGIN

	DELETE
	FROM SuDung
	WHERE ID = @ID
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

--sp_ISO_DeleteTinhTrangCongTac.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DeleteTinhTrangCongTac]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DeleteTinhTrangCongTac]
GO
CREATE PROCEDURE sp_ISO_DeleteTinhTrangCongTac
	@ID	int
AS
BEGIN
	
	DELETE
	FROM TinhTrangCongTac
	WHERE ID = @ID
END

GO

--sp_ISO_DoiGiaoVien.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DoiGiaoVien]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DoiGiaoVien]
GO
CREATE PROCEDURE sp_ISO_DoiGiaoVien
	@Ma_mon_hoc_TKB	int,
	@Ma_giao_vien int
AS
BEGIN
	UPDATE MonHocTKB SET Ma_giao_vien = @Ma_giao_vien WHERE ID = @Ma_mon_hoc_TKB
END

GO

--sp_iso_DropTableKetQuaTimGiaoAn.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_iso_DropTableKetQuaTimGiaoAn]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_iso_DropTableKetQuaTimGiaoAn]
GO
create procedure sp_iso_DropTableKetQuaTimGiaoAn
as
begin			

	IF EXISTS (SELECT * FROM SYSOBJECTS	WHERE XTYPE='U' AND NAME='KetQuaTimGiaoAn')
			DROP TABLE KetQuaTimGiaoAn 

end















GO

--sp_iso_FindGiaoAn.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_iso_FindGiaoAn]') and OBJECTPROPERTY(id,N'IsProcedure') = 1)
	drop procedure [dbo].[sp_iso_FindGiaoAn]
GO
CREATE PROCEDURE sp_iso_FindGiaoAn    
 @IndexPage varchar(10),    
 @LengthPage varchar(10),    
 @MaNguoiTao varchar(10),    
 @MaNamHoc varchar(10),    
 @MaLop varchar(10),    
 @MaMonHoc varchar(10),    
 @HocKi varchar(10),    
 @TinhTrang varchar(10),    
 @NgayTimBD varchar(11),    
 @NgayTimKT varchar(11),    
 @MaBoPhan varchar(5),    
 @MaKhoa  varchar(5)    
AS    
BEGIN       
    
 IF @IndexPage = '' OR  ISNULL(@IndexPage,'')=''    
 BEGIN    
  SET @IndexPage='1'    
 END    
     
    
 DECLARE @DieuKienMaNguoiTao varchar(100)    
 DECLARE @DieuKienMaLop varchar(100)    
 DECLARE @DieuKienMaMonHoc varchar(100)    
 DECLARE @DieuKienTinhTrang varchar(100)    
 DECLARE @DieuKienHocKi varchar(100)    
 DECLARE @DieuKienMaNamHoc varchar(100)    
 DECLARE @DieuKienTimNgay varchar(100)    
 DECLARE @DieuKienMaBoPhan varchar(100)    
    
    
 SET @DieuKienMaNguoiTao=''    
 SET @DieuKienMaLop=''    
 SET @DieuKienMaMonHoc=''    
 SET @DieuKienTinhTrang=''    
 SET @DieuKienHocKi=''    
 SET @DieuKienMaNamHoc=''    
 SET @DieuKienTimNgay=''    
    
 IF (@MaBoPhan = 0 OR @MaBoPhan = 1 OR @MaBoPhan=16 OR @MaBoPhan=4 OR @MaBoPhan=2) AND @MaKhoa = ''    
 BEGIN    
  SET @DieuKienMaBoPhan=''    
 END    
 ELSE    
 BEGIN    
  IF @MaKhoa = ''    
  BEGIN    
   SET @DieuKienMaBoPhan=' AND E.Ma_bo_phan='+@MaBoPhan    
  END    
  BEGIN    
    SET @DieuKienMaBoPhan=' AND E.Ma_bo_phan='+@MaKhoa    
  END     
 END    
    
      
 IF @NgayTimBD = ''    
 BEGIN    
  SET @NgayTimBD='1/1/1'    
 END    
     
 IF @NgayTimKT =''    
 BEGIN    
  SET @DieuKienTimNgay= ' WHERE U.Ngay_BD >= ''' +  @NgayTimBD+''''     
 END    
 ELSE    
 BEGIN    
  SET @DieuKienTimNgay= ' WHERE U.Ngay_BD >= ''' + @NgayTimBD  + ''' AND U.Ngay_BD <= ''' + @NgayTimKT +''''    
 END     
    
 IF @MaNguoiTao <> ''    
 BEGIN    
  SET @DieuKienMaNguoiTao=' AND A.Ma_nguoi_tao = '+@MaNguoiTao    
 END    
     
 IF @MaLop <> ''    
 BEGIN    
  SET @DieuKienMaLop=' AND Ma_Lop = '+@MaLop    
 END    
     
 IF @MaMonHoc <> ''    
 BEGIN    
  SET @DieuKienMaMonHoc =' AND Ma_mon_hoc ='+ @MaMonHoc    
 END    
    
 IF @TinhTrang <>''    
 BEGIN    
  SET @DieuKienTinhTrang =' AND B.Tinh_trang = '+@TinhTrang     
 END    
    
 IF @HocKi <>''    
 BEGIN    
  SET @DieuKienHocKi=' AND Hoc_ki = '+@HocKi    
 END     
 IF @MaNamHoc <>''    
 BEGIN    
  SET @DieuKienMaNamHoc=' AND Ma_nam_hoc  = '+ @MaNamHoc    
 END    
     
    
 DECLARE @sql nvarchar(2000)    
 DECLARE @MaLoaiCT varchar(10)    
 SET @MaLoaiCT='1'    
    
    
SET @sql=' SELECT U.Co_Hieu As CoHieu,U.ID As MaCTKHGD,A.ID As MaKHGD,A.Ma_Nguoi_Tao As MaNguoiTao,A.Ma_mon_hoc As MaMonHoc,U.Ngay_BD As NgayThucHien    
  ,A.Ma_lop As MaLop,B.ID As MaGiaoAn,B.Tinh_Trang As TinhTrang,B.So_Giao_An As SoGiaoAn     
  ,B.NgayGui As NgayGui,B.Ngay_duyet As NgayDuyet,B.Ma_nguoi_duyet As MaNguoiDuyet    
,ISNULL(K.Ho+'' ''+'' ''+K.Ten_lot+'' ''+K.Ten,'''') As NguoiDuyet    
  ,C.Ten_Mon_Hoc As TenMonHoc,D.Ki_hieu As KiHieu,F.Ho+'' ''+'' ''+F.Ten_lot+'' ''+F.Ten As NguoiTao    
  ,KPPN1.Ma_phieu As MaPhieu    
INTO #TEMP     
FROM KeHoachGiangDay As A    
INNER JOIN GiaoAn As B    
ON 1=1 '         
    +@DieuKienMaNguoiTao      
    +@DieuKienHocKi    
    +@DieuKienMaNamHoc    
    +@DieuKienMaLop    
    +@DieuKienMaMonHoc     
    +' AND B.Ma_KHGD=A.ID '     
    +@DieuKienTinhTrang    
        
+' INNER JOIN MonHoc As C    
ON C.ID=A.Ma_Mon_Hoc    
INNER JOIN LopHoc As D    
ON D.ID=A.Ma_Lop     
INNER JOIN ThanhVien As E    
On E.ID=A.Ma_Giao_Vien '+ @DieuKienMaBoPhan +'    
INNER JOIN ChiTietThanhVien As F    
ON E.Ten_DN=F.Ten_dang_nhap    
LEFT JOIN ThanhVien As G    
On G.ID=B.Ma_nguoi_duyet    
LEFT JOIN ChiTietThanhVien As K    
ON G.Ten_DN=K.Ten_dang_nhap    
INNER JOIN ChiTietKHGD As U    
On U.Ma_giao_an=B.ID     
LEFT JOIN DSThuocPhieuKPPN AS KPPN1     
ON  KPPN1.Ma_Chuong_Trinh=B.ID AND KPPN1.Tinh_trang=0 AND KPPN1.Ma_loai='+@MaLoaiCT+' '+    
    
@DieuKienTimNgay +'      
ORDER BY A.Ma_nguoi_tao DESC,A.Ma_mon_hoc DESC, A.Ma_lop DESC     
    
SELECT * FROM (SELECT     
(SELECT COUNT(*) FROM #TEMP AS A WHERE A.MaGiaoAn<= B.MaGiaoAn) AS [Index],*      
FROM #TEMP  AS B) AS C    
WHERE C.[Index] BETWEEN '+@IndexPage+' AND '+CAST((CAST(@LengthPage AS INT)+CAST(@IndexPage AS INT)-1)AS VARCHAR) +' ORDER BY [Index] ASC '    
    
exec sp_executesql @sql    
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

--sp_iso_FindKeHoachGiangDay.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].sp_iso_FindKeHoachGiangDay') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].sp_iso_FindKeHoachGiangDay
GO
CREATE PROCEDURE sp_iso_FindKeHoachGiangDay      
 @MaNguoiTao varchar(10),      
 @MaNamHoc varchar(10),      
 @MaLop varchar(10),      
 @MaMonHoc varchar(10),      
 @HocKi varchar(10),      
 @TinhTrang varchar(10),      
 @NgayTimBD varchar(11),      
 @NgayTimKT varchar(11),      
 @MaBoPhan varchar(5),    
 @MaKhoa varchar(5)      
AS      
BEGIN         
 DECLARE @DieuKienMaNguoiTao varchar(100)      
 DECLARE @DieuKienMaLop varchar(100)      
 DECLARE @DieuKienMaMonHoc varchar(100)      
 DECLARE @DieuKienTinhTrang varchar(100)      
 DECLARE @DieuKienHocKi varchar(100)      
 DECLARE @DieuKienMaNamHoc varchar(100)      
 DECLARE @DieuKienTimNgay varchar(100)      
 DECLARE @DieuKienMaBoPhan varchar(100)     
      
 SET @DieuKienMaNguoiTao=''      
 SET @DieuKienMaLop=''      
 SET @DieuKienMaMonHoc=''      
 SET @DieuKienTinhTrang=''      
 SET @DieuKienHocKi=''      
 SET @DieuKienMaNamHoc=''      
 SET @DieuKienTimNgay=''      
     
 IF (@MaBoPhan = 0 OR @MaBoPhan = 1 OR @MaBoPhan=16 OR @MaBoPhan=4 OR @MaBoPhan=2 ) AND @MaKhoa = ''    
 BEGIN      
  SET @DieuKienMaBoPhan=''      
 END      
 ELSE      
 BEGIN      
 IF @MaKhoa = ''    
 BEGIN    
  SET @DieuKienMaBoPhan=' AND T1.Ma_bo_phan='+@MaBoPhan    
 END    
 ELSE    
 BEGIN    
  SET @DieuKienMaBoPhan=' AND T1.Ma_bo_phan='+@MaKhoa    
 END      
 END     
     
      
 IF @NgayTimBD = ''      
 BEGIN      
  SET @NgayTimBD='1/1/1'      
 END      
       
 IF @NgayTimKT =''      
 BEGIN      
  SET @DieuKienTimNgay= ' AND A.NgayHocBD >= ''' +  @NgayTimBD+' 00:00:00.000'''       
 END      
 ELSE      
 BEGIN      
  SET @DieuKienTimNgay= ' AND A.NgayHocBD >= ''' + @NgayTimBD  + ' 00:00:00.000'' AND A.NgayHocBD <= ''' + @NgayTimKT +' 23:59:59.000'' '      
 END       
      
      
      
 IF @MaNguoiTao <> ''      
 BEGIN      
  SET @DieuKienMaNguoiTao=' AND A.Ma_giao_vien = '+@MaNguoiTao      
 END      
       
 IF @MaLop <> ''      
 BEGIN      
  SET @DieuKienMaLop=' AND A.Ma_Lop = '+@MaLop      
 END      
       
 IF @MaMonHoc <> ''      
 BEGIN      
  SET @DieuKienMaMonHoc =' AND A.Ma_mon_hoc ='+ @MaMonHoc      
 END      
      
 IF @TinhTrang <>''      
 BEGIN      
  IF @TinhTrang = 5       
   BEGIN      
     SET @DieuKienTinhTrang =' AND ISNULL(B.Tinhtrang,5) = 5 '      
   END      
          
  ELSE      
   BEGIN       
    SET @DieuKienTinhTrang =' AND B.Tinhtrang = '+@TinhTrang       
   END      
 END      
      
 IF @HocKi <>''      
 BEGIN      
  SET @DieuKienHocKi=' AND B.HocKi = '+@HocKi      
 END       
 IF @MaNamHoc <>''      
 BEGIN      
  SET @DieuKienMaNamHoc=' AND B.MaNamHoc  = '+ @MaNamHoc      
 END      
       
 DECLARE @sql nvarchar(2000)      
      
 DECLARE @MaLoaiCT varchar(10)    
 SET @MaLoaiCT='0'     
      
 SET @sql='      
       
 SELECT MonHocTKB.Ma_mon_hoc,ThoiKhoaBieu.Ma_lop,MonHocTKB.User5 As NgayHocBD,MonHocTKB.Ma_giao_vien INTO #temp1 FROM MonHocTKB,ThoiKhoaBieu WHERE MonHocTKB.Ma_tkb=ThoiKhoaBieu.ID AND ThoiKhoaBieu.Tinh_trang=2        
       
 SELECT  A.Tinh_Trang_HT,A.ID As MaKHGD,A.Ma_Nguoi_Tao As MaNguoiTao,A.Ma_mon_hoc As MaMonHoc,A.Ngay_tao As NgayThucHien      
  ,A.Ma_lop As MaLop,A.Tinh_Trang As TinhTrang,A.User2 As NgayBatDau      
  ,A.User1 As NgayGui,A.Ngay_duyet As NgayDuyet,A.Ma_nguoi_duyet As MaNguoiDuyet,A.Hoc_ki As HocKi,A.Ma_nam_hoc As MaNamHoc      
        
 INTO #temp2       
 FROM KeHoachGiangDay As A       
      
       
 SELECT B.Tinh_trang_Ht As TinhTrangHT,B.MaKHGD,A.NgayHocBD As NgayThucHien,B.NgayGui,B.NgayDuyet,B.TinhTrang,A.Ma_mon_hoc As MaMonHoc,A.Ma_lop As MaLop,A.Ma_giao_vien As MaNguoiTao,M.Ten_mon_hoc As TenMonHoc,L.Ki_hieu As KiHieu,ISNULL(C1.Ho+ '' '' +C1.Ten_lot+'' ''+C1.Ten,'' '') As NguoiTao,C2.Ho+ '' '' +C2.Ten_lot+'' ''+C2.Ten As NguoiDuyet ,KPPN1.Ma_phieu As MaPhieu     
 FROM #temp1 As A      
 LEFT JOIN #temp2 As B ON A.Ma_mon_hoc=B.MaMonHoc AND A.Ma_lop=B.MaLop      
 INNER JOIN MonHoc AS M ON M.ID=A.Ma_mon_hoc      
 INNER JOIN LopHoc As L ON L.ID=A.Ma_lop      
 LEFT JOIN Thanhvien As T1 ON T1.ID=A.Ma_Giao_vien       
 LEFT JOIN ChiTietThanhVien As C1 ON T1.Ten_DN=C1.Ten_dang_nhap      
 LEFT JOIN Thanhvien As T2 ON T2.ID=B.MaNguoiDuyet      
 LEFT JOIN ChiTietThanhVien As C2 ON T2.Ten_DN=C2.Ten_dang_nhap      
 LEFT JOIN DSThuocPhieuKPPN AS KPPN1     
 ON  KPPN1.Ma_Chuong_Trinh=B.MaKHGD AND KPPN1.Tinh_trang=0 AND KPPN1.Ma_loai='+@MaLoaiCT+'     
    
  WHERE 1 = 1 '       
 + @DieuKienMaNguoiTao      
 + @DieuKienMaLop      
 + @DieuKienMaMonHoc      
 + @DieuKienTinhTrang      
 + @DieuKienHocKi      
 + @DieuKienMaNamHoc      
 + @DieuKienTimNgay      
 +@DieuKienMaBoPhan      
 +' ORDER BY A.Ma_Giao_Vien DESC,A.Ma_mon_hoc DESC,A.Ma_lop DESC   '      
        
EXEC sp_executesql @sql      
END      
      
GO

--sp_ISO_FindKeHoachThangByYearAndMonth.sql

/***********************************************************
* Purpose : Search "KE HOACH THANG" by YEAR and MONTH
* Author : PhuongTQ
* Date: 09-03-2011
* Description: Search "KE HOACH THANG" by YEAR and MONTH
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_FindKeHoachThangByYearAndMonth]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_FindKeHoachThangByYearAndMonth]
GO
CREATE PROCEDURE sp_ISO_FindKeHoachThangByYearAndMonth
	@Nam varchar(4),
	@Thang varchar(2),
	@result varchar(1) output
AS
BEGIN
	If exists(
		SELECT * 
		FROM KeHoachThang
		WHERE Nam = @Nam And Thang = @Thang)
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

--sp_ISO_FindThoiKhoaBieu.sql

/***********************************************************
* Purpose : Search "THOI KHOA BIEU" BY HOC KY, NAM HOC, LOP
* Author : PhuongTQ
* Date: 14-09-2010
* Description: Search "THOI KHOA BIEU" BY HOC KY, NAM HOC, LOP
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_FindThoiKhoaBieu]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_FindThoiKhoaBieu]
GO
CREATE PROCEDURE sp_ISO_FindThoiKhoaBieu
	@Hoc_ki varchar,
	@Ma_lop int,
	@Nam_bat_dau varchar(4),
	@result varchar(1) output
AS
BEGIN
	If exists(
		SELECT ID 
		FROM ThoiKhoaBieu
		WHERE Hoc_ki = @Hoc_ki
			and Nam_bat_dau = @Nam_bat_dau 
				and Ma_lop = @Ma_lop)
	Begin
		SET @result = '1'
	End
	Else
	Begin
		SET @result = '0'
	End
END


GO

--sp_ISO_GetChiTietJoinAllTableByMaKHDTAndNgay.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetChiTietJoinAllTableByMaKHDTAndNgay]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetChiTietJoinAllTableByMaKHDTAndNgay]
GO
CREATE PROC sp_ISO_GetChiTietJoinAllTableByMaKHDTAndNgay
	@Ma_ke_hoach	int,
	@Nam_bat_dau	varchar(4),
	@Kieu_tuan varchar -- Tuan hien tai hoac tuan sau
AS
BEGIN
	DECLARE @Ngay varchar(10)
	SET @Ngay = convert(varchar(10), getdate(), 110)
	DECLARE @Tu_ngay varchar(10)
	DECLARE @Den_ngay varchar(10)
	SELECT TOP 1 @Tu_ngay = Convert(varchar(10), C.Tu_ngay, 110) FROM (SELECT TOP 10 A.Tu_ngay FROM TuanLe AS A INNER JOIN NamHoc AS B ON A.Ma_nam_hoc = B.ID
		WHERE B.Nam_bat_dau = Cast(2010 AS Int) - 1
		ORDER BY A.So_thu_tu DESC ) C
	ORDER BY C.Tu_ngay 

	SELECT TOP 1 @Den_ngay = Convert(varchar(10), A.Den_ngay, 110) FROM TuanLe AS A INNER JOIN NamHoc AS B ON A.Ma_nam_hoc = B.ID 
		WHERE B.Nam_bat_dau = @Nam_bat_dau ORDER BY A.So_thu_tu DESC

	IF(@Kieu_tuan = '2')
	BEGIN
		SET @Ngay = convert(varchar(10), DATEADD(DAY, 7, @Ngay), 110)
	END
	DECLARE @sql nvarchar(3000)
	SELECT @sql = 'SELECT B.ID AS MaChiTietKHDT, Convert(varchar(10),J.Tu_ngay,110) AS TuNgay, 
		Convert(varchar(10),J.Den_ngay,110) AS DenNgay, J.Ma_nam_hoc AS MaNamHoc, 
		J.ID AS Tuan, B.Tinh_trang_phan_cong_tac AS TinhTrangPhanCongTableChiTietKHDT, 
		B.User1 AS User1TableChiTietKHDT,B.User2 AS User2TableChiTietKHDT,B.User3 AS User3TableChiTietKHDT, 
		B.User4 AS User4TableChiTietKHDT,B.User5 AS User5TableChiTietKHDT, J.So_thu_tu As ThuTuTuan, 
		C.ID AS MaNoiDungChiTietKHDT, C.Ma_cong_tac As MaCongTac, C.Khoa, C.Noi_dung_cong_tac As NoiDungCongTac, 
		C.Tinh_trang_thuc_hien As TinhTrangThucHienTableNoiDungKHDT, C.Bo_sung As BoSungTableNoiDungKHDT, 
		C.User1 AS User1TableNoiDungKHDT,C.User2 AS User2TableNoiDungKHDT, C.User3 AS User3TableNoiDungKHDT,
		C.User4 AS User4TableNoiDungKHDT,C.User5 AS User5TableNoiDungKHDT, C.Thu As Thu, C.Buoi As Buoi, 
		C.Ngay As Ngay, C.Gio As Gio, C.Phut As Phut, C.Tinh_trang_phan_cong As TinhTrangPhanCong, 
		(''<+na+>'' + IsNull(C.Ghi_chu,'''') + ''<-reg->'' + Cast(C.Gio As varchar) + ''<-reg->'' + Cast(C.Phut As varchar) + ''<-reg->'' + Cast(C.Buoi As varchar) + ''<-reg->'' + Cast(C.Thu As Varchar) + ''<-reg->'' + Convert(varchar(10), C.Ngay, 101)) As ThoiGian,
		D.ID AS MaBoPhanThucHien, D.Ma_khoa As MaKhoa, D.Ten_bo_phan As TenBoPhan, D.User1  AS User1TableBoPhanKHDT,
		D.User2 AS User2TableBoPhanKHDT,D.User3 AS User3TableBoPhanKHDT, D.User4 AS User4TableBoPhanKHDT,
		D.User5 AS User5TableBoPhanKHDT, E.ID AS MaNguoiThucHien, E.Ma_thanh_vien As MaThanhVien, 
		ISNULL(L.Ho + '' '' + L.Ten_Lot + '' '' + L.Ten,'''') As TenThanhVien, 
		E.Tinh_trang_thuc_hien As TinhTrangThucHienTableNguoiThucHien, E.User1 AS User1TableNguoiThucHienKHDT,
		E.User2 AS User2TableNguoiThucHienKHDT, E.User3 AS User3TableNguoiThucHienKHDT,E.User4 AS User4TableNguoiThucHienKHDT,
		E.User5  AS User5TableNguoiThucHienKHDT, J.So_thu_tu AS ThuTuTuan 
	FROM TuanLe AS J 
		LEFT JOIN ChiTietKHDT AS B ON B.Tuan = J.ID And B.Ma_ke_hoach = ' + Cast(@Ma_ke_hoach AS varchar) + '
		LEFT JOIN NoiDungChiTietKHDT AS C ON C.Ma_chi_tiet_KHDT = B.ID 
		LEFT JOIN BoPhanThucHienKHDT AS D ON D.Ma_noi_dung_chi_tiet_KHDT = C.ID 
		LEFT JOIN NguoiThucHien AS E ON D.ID = E.Ma_bo_phan 
		LEFT JOIN ThanhVien AS K ON E.Ma_thanh_vien = K.ID 
		LEFT JOIN ChiTietThanhVien AS L ON K.Ten_DN = L.Ten_dang_nhap 
		WHERE Cast(Convert(varchar(10), J.Tu_ngay, 110) As datetime) <= Cast(''' + @Ngay + ''' As datetime)
			And Cast(''' + @Ngay + ''' As datetime) <= Cast(Convert(varchar(10), J.Den_ngay, 110) As datetime)
			And Cast(''' + @Tu_ngay + ''' As datetime) <= Cast(''' + @Ngay + ''' As datetime)
			And Cast(''' + @Ngay + ''' As datetime) <= Cast(''' + @Den_ngay + ''' As datetime)
		ORDER BY B.Tu_ngay, C.Khoa, C.ID, D.ID, E.ID '
	exec  sp_executesql @sql
--print @sql
END

--exec sp_ISO_GetChiTietJoinAllTableByMaKHDTAndNgay 0,'2010','1'
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
	@Ma_bo_phan		varchar(5),
	@Ma_truong_khoa	varchar(2),
	@Check			varchar
	--@Ma_nguoi_tao   varchar(2)		
AS
BEGIN
	DECLARE @sql NVarchar(2000)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_bo_phan nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(5)
	DECLARE @Vai_tro_truong_bo_phan varchar(5)
	SET @Vai_tro_truong_bo_phan = ''
	SET @Dieu_kien_tinh_trang = ' ''t'' = ''t'' '
	SET @Dieu_kien_bo_phan = ' ''t'' = ''t'' '
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Dieu_kien_tinh_trang = ' CTDT.Tinh_trang = ' + @Tinh_trang
	END
	if(@Ma_bo_phan <> '')
	BEGIN
		SELECT @Vai_tro_truong_bo_phan = B.Ma_vai_tro FROM Khoa_trungtam AS A INNER JOIN ThanhVien AS B ON A.Ma_truong_khoa = B.ID WHERE B.Ma_bo_phan = @Ma_bo_phan
		if(@Vai_tro_truong_bo_phan = @Ma_truong_khoa)
		BEGIN
			SET @Dieu_kien_bo_phan = ' B.Ma_bo_phan = ' + @Ma_bo_phan
		END
		else
		BEGIN
			IF(@Check = '1')
			BEGIN
				SET @Dieu_kien_bo_phan = ' CTDT.Tinh_trang <> 0 '
			END
			ELSE
			BEGIN
				SET @Dieu_kien_bo_phan = ' CTDT.Tinh_trang <> 0 AND CTDT.Tinh_trang <> 4 '
			END
		END
	END
	--if(@Ma_nguoi_tao <> '')
	--BEGIN
		--SET @Where = 'Where '
		--if not exists(Select * From ChuongTrinhDaoTao Where Ma_nguoi_tao = @Ma_nguoi_tao)
		--BEGIN	
		--	SET @Dieu_kien_khong_phai_nguoi_tao = ' Tinh_trang <> 0 '
		--END
		--else
		--BEGIN
		--	SET @Dieu_kien_ma_nguoi_tao = ' Ma_nguoi_tao = ' + @Ma_nguoi_tao
		--END
	--END
	--SELECT @sql = ''
	SELECT @sql = '
		SELECT TOP ' + @NumRows + '* , cast(datepart(mm,TB1.Ngay_Cap_Nhat_Cuoi) as varchar) + ''-'' + cast(datepart(dd,TB1.Ngay_Cap_Nhat_Cuoi) as varchar) + ''-'' + cast(datepart(yy,TB1.Ngay_Cap_Nhat_Cuoi) as varchar) As NgayCapNhatCuoi
		FROM (
			SELECT TOP ' + Cast(Cast(@TotalRows As Int) - (Cast(@CurrentPage As Int) - 1) * Cast(@NumRows As Int) As Varchar) + ' 
				CTDT.ID As MaChuongTrinhDaoTao, CTDT.Ten As TenChuongTrinhDaoTao, (C.Ho + '' '' + C.Ten_Lot + '' '' + C.Ten) As TenNguoiTao, 
				CTDT.Tinh_trang As TinhTrang, CTDT.Ly_do_reject As LyDoReject, CTDT.Ma_nguoi_tao AS MaNguoiTao,
				CTDT.Ngay_cap_nhat_cuoi AS Ngay_cap_nhat_cuoi,
				D.Ten As TenTrinhDo, E.Ten_chuyen_nganh As TenNghe, F.Ma_khoa AS MaKhoa
			FROM ChuongTrinhDaoTao AS CTDT
			INNER JOIN ThanhVien AS B ON CTDT.Ma_nguoi_tao = B.ID 
			INNER JOIN ChiTietThanhVien As C on B.Ten_DN = C.Ten_dang_nhap
			INNER JOIN HeDaoTao As D On CTDT.Ma_trinh_do = D.ID
			INNER JOIN ChuyenNganh As E On CTDT.Ma_nghe = E.ID 
			INNER JOIN QuyetDinhMoLop AS F On CTDT.Ma_quyet_dinh = F.ID
			WHERE ' + @Dieu_kien_tinh_trang + ' And ' + @Dieu_kien_bo_phan +
			' ORDER BY CTDT.Ngay_cap_nhat_cuoi ASC
		) AS TB1
		ORDER BY TB1.Ngay_cap_nhat_cuoi DESC'
	 
	--ORDER BY TB2.Ngay_cap_nhat_cuoi DESC
	exec  sp_executesql @sql
	--PRINT @sql
END
--INNER JOIN ThanhVien As B On TB2.Ma_nguoi_tao = B.ID 
--INNER JOIN ChiTietThanhVien As C on B.Ten_DN = C.Ten_dang_nhap
--exec sp_ISO_GetChuongTrinhDaoTao 3,1,1,'',4,5,'1'
GO

--sp_ISO_GetCongTac.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetCongTac]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetCongTac]
GO
CREATE PROCEDURE sp_ISO_GetCongTac
	@Tinh_trang		varchar(2),
	@Ma_nhan_vien   varchar(10),
	@Ma_nam_hoc		varchar(4),
	@Tuan_le		varchar(4),
	@Check			varchar,
	@Bo_phan_BGH	varchar(4)
AS
BEGIN
	DECLARE @sql					nvarchar(4000)
	DECLARE @Dieu_kien_tuan			nvarchar(1000)
	DECLARE @Dieu_kien_nam_hoc		nvarchar(1000)
	DECLARE @Dieu_kien_tinh_trang	nvarchar(1000)
	DECLARE @Dieu_kien_thanh_vien	nvarchar(1000)

	SET @Dieu_kien_tuan = ' ''t'' = ''t'' '
	SET @Dieu_kien_nam_hoc = ' ''t'' = ''t'' '
	SET @Dieu_kien_tinh_trang = ' ''t'' = ''t'' '
	SET @Dieu_kien_thanh_vien = ' F.ID = ' + @Ma_nhan_vien

	IF(@Tinh_trang <> '')
		BEGIN
			SET @Dieu_kien_tinh_trang = ' ISNULL(E.Tinh_trang_thuc_hien, 0) = ' + @Tinh_trang
		END
	
	-- kiem tra dieu kien nam hoc
	IF(@Ma_nam_hoc <> '')
		BEGIN
			SET @Dieu_kien_nam_hoc = ' B.Ma_nam_hoc = ' + @Ma_nam_hoc
		END

	-- kiem tra dieu kien tuan le
	IF(@Tuan_le = '')
		BEGIN
			SET @Dieu_kien_tuan = ' Cast(convert(varchar(10),B.Tu_ngay,110) As DateTime) <= Cast(convert(varchar(10),GETDATE(),110) as datetime) 
										AND Cast(convert(varchar(10),B.Den_ngay,110) as datetime) >= Cast(convert(varchar(10),GETDATE(),110) as datetime) '
		END
	ELSE IF(@Tuan_le < '60')
		BEGIN
			SET @Dieu_kien_tuan = ' H.So_thu_tu = ' + @Tuan_le			
		END
	ELSE IF(@Tuan_le < '80')
		BEGIN
			SET @Dieu_kien_tuan = ' H.User1 = ' + Cast((Cast(@Tuan_le AS Int) - 60) AS VARCHAR)
		END

	IF(@Check = '1')
	BEGIN
		SET @Dieu_kien_thanh_vien = ' (' + @Dieu_kien_thanh_vien + ' OR D.Ma_khoa = ' + @Bo_phan_BGH + ') '
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
						INNER JOIN TuanLe H ON B.Tuan = H.ID
					WHERE A.Tinh_trang=2 
						AND ' + @Dieu_kien_thanh_vien + ' AND ' + @Dieu_kien_nam_hoc + ' AND ' + @Dieu_kien_tuan + ' AND ' + @Dieu_kien_tinh_trang + '
						ORDER BY Cast(B.Tu_ngay As Datetime) ASC'
	exec sp_executesql @sql
	--print @sql
END
--sp_help sp_executesql
--sp_ISO_GetCongTac '',15,'','','1','0'
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
	@Tuan_le		varchar(4),
	@Check			varchar
AS
BEGIN
	DECLARE @sql				nvarchar(4000)
	DECLARE @Dieu_kien_tuan			nvarchar(1000)
	DECLARE @Dieu_kien_nam_hoc		nvarchar(1000)
	DECLARE @Dieu_kien_tinh_trang		nvarchar(1000)
	DECLARE @Dieu_kien_khoa			nvarchar(1000)
	DECLARE @Truong_khoa			nvarchar(1000)
	DECLARE @temp				nvarchar(1000)
	SET @Dieu_kien_tuan = ' ''t'' = ''t'' '
	SET @Dieu_kien_nam_hoc = ' ''t'' = ''t'' '
	SET @Dieu_kien_khoa = ' ''t'' = ''t'' '
	-- kiem tra dieu kien tinh trang
	SET @Dieu_kien_tinh_trang = ' ''t'' = ''t'' '
	IF(@Tinh_trang <> '')
		BEGIN
			SET @Dieu_kien_tinh_trang = ' ISNULL(E.Tinh_trang_thuc_hien, 0) = ' + @Tinh_trang
		END
	
	-- kiem tra dieu kien khoa
	/*SELECT @temp = Ma_vai_tro FROM THANHVIEN WHERE ID = @Ma_thanh_vien
	IF (@Khoa = '' AND (@temp = 0 OR @temp = 1 OR @temp = 2 OR @temp = 3 OR @temp = 10 OR @temp = 11))
		BEGIN
			SET @Dieu_kien_khoa = ''
		END
	ELSE IF(@Khoa <> '' AND (@temp = 0 OR @temp = 1 OR @temp = 2 OR @temp = 3 OR @temp = 10 OR @temp = 11))
		BEGIN
			SET @Dieu_kien_khoa = ' AND D.Ma_khoa = ' + @Khoa
		END
	ELSE IF not exists (SELECT * FROM Khoa_TrungTam WHERE Ma_truong_khoa = @Ma_thanh_vien)
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
		END*/
	if(@Khoa <> '')
	BEGIN
		SET @Dieu_kien_khoa = ' D.Ma_khoa = ' + @Khoa
		IF(@Check = '0')
		BEGIN
			SET @Dieu_kien_khoa = ' E.Ma_thanh_vien = ' + @Ma_thanh_vien
		END
	END	
	-- kiem tra dieu kien nam hoc
	IF(@Ma_nam_hoc <> '')
		BEGIN
			SET @Dieu_kien_nam_hoc = ' B.Ma_nam_hoc = ' + @Ma_nam_hoc
		END

	-- kiem tra dieu kien tuan le
	IF(@Tuan_le = '')
		BEGIN
			SET @Dieu_kien_tuan = ' Cast(convert(varchar(10),B.Tu_ngay,110) As DateTime) <= Cast(convert(varchar(10),GETDATE(),110) as datetime) 
										AND Cast(convert(varchar(10),B.Den_ngay,110) as datetime) >= Cast(convert(varchar(10),GETDATE(),110) as datetime) '
		END
	ELSE IF(@Tuan_le < '60')
		BEGIN
			SET @Dieu_kien_tuan = ' H.So_thu_tu = ' + @Tuan_le			
		END
	ELSE IF(@Tuan_le < '80')
		BEGIN
			SET @Dieu_kien_tuan = ' H.User1 = ' + Cast((Cast(@Tuan_le AS Int) - 60) AS VARCHAR)
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
						INNER JOIN TuanLe AS H ON B.Tuan = H.ID
					WHERE 
						' + @Dieu_kien_khoa + ' AND '
						+ @Dieu_kien_nam_hoc + ' AND ' + @Dieu_kien_tuan + ' AND ' + @Dieu_kien_tinh_trang + ' 
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
	@Ma_bo_phan		varchar(5),
	@Ma_truong_khoa	varchar(2),
	@Check			varchar
AS
BEGIN
	DECLARE @sql NVarchar(300)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_bo_phan nvarchar(100)
	DECLARE @Vai_tro_truong_bo_phan varchar(5)
	SET @Vai_tro_truong_bo_phan = ''
	SET @Dieu_kien_tinh_trang = ' ''t'' = ''t'' '
	SET @Dieu_kien_bo_phan = ' ''t'' = ''t'' '
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Dieu_kien_tinh_trang = ' CTDT.Tinh_trang = ' + @Tinh_trang
	END
	if(@Ma_bo_phan <> '')
	BEGIN
		SELECT @Vai_tro_truong_bo_phan = B.Ma_vai_tro FROM Khoa_trungtam AS A INNER JOIN ThanhVien AS B ON A.Ma_truong_khoa = B.ID WHERE B.Ma_bo_phan = @Ma_bo_phan
		if(@Vai_tro_truong_bo_phan = @Ma_truong_khoa)
		BEGIN
			SET @Dieu_kien_bo_phan = ' TV.Ma_bo_phan = ' + @Ma_bo_phan
		END
		else
		BEGIN
			IF(@Check = '1')
			BEGIN
				SET @Dieu_kien_bo_phan = ' CTDT.Tinh_trang <> 0 '
			END
			ELSE
			BEGIN
				SET @Dieu_kien_bo_phan = ' CTDT.Tinh_trang <> 0 AND CTDT.Tinh_trang <> 4 '
			END
		END
	END
	--if(@Ma_nguoi_tao <> '')
	--BEGIN
	--	SET @Where = 'Where '
	--	if not exists(Select * From ChuongTrinhDaoTao Where Ma_nguoi_tao = @Ma_nguoi_tao)
	--	BEGIN	
	--		SET @Dieu_kien_khong_phai_nguoi_tao = ' Tinh_trang <> 0 '
	--	END
	--	else
	--	BEGIN
	--		SET @Dieu_kien_ma_nguoi_tao = ' Ma_nguoi_tao = ' + @Ma_nguoi_tao
	--	END
	--END

	SELECT @sql = ' 
		SELECT COUNT(*) AS Count
		FROM ChuongTrinhDaoTao AS CTDT
		INNER JOIN ThanhVien AS TV ON CTDT.Ma_nguoi_tao = TV.ID 
		Where ' + @Dieu_kien_tinh_trang + ' And ' + @Dieu_kien_bo_phan
	exec sp_executesql @sql
	--PRINT @sql	
END
--exec sp_ISO_GetCountChuongTrinhDaoTao '2',0,5,0
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
	@Ma_nguoi_tao   varchar(10),
	@Ma_bo_phan		varchar(5),
	@Ma_truong_khoa varchar(2),
	@Ma_pho_khoa	varchar(2),
	@Ma_vai_tro		varchar(2),	-- quyền trưởng khoa		
	@Ten_mon_hoc	nvarchar(50)
AS
BEGIN
	DECLARE @sql NVarchar(1000)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	--DECLARE @Dieu_kien_ma_nguoi_tao nvarchar(100)
	DECLARE @Dieu_kien_bo_phan nvarchar(100)
	DECLARE @Dieu_kien_mon_hoc nvarchar(150)
	DECLARE @Vai_tro_truong_bo_phan varchar(5)
	SET @Dieu_kien_tinh_trang = ' ''t'' = ''t'' '
	SET @Dieu_kien_mon_hoc = ' ''t'' = ''t'' '
	--SET @Dieu_kien_ma_nguoi_tao = ''
	SET @Dieu_kien_bo_phan = ' ''t'' = ''t'' '
	SET @Vai_tro_truong_bo_phan = ''
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Dieu_kien_tinh_trang = ' A.Tinh_trang = ' + @Tinh_trang
	END
	--
	if(@Ten_mon_hoc <> '')
	BEGIN
		SET @Dieu_kien_mon_hoc = ' A.Ten LIKE N''%' + @Ten_mon_hoc + '%'' ' 
	END
	--
	if(@Ma_nguoi_tao <> '')
	BEGIN
		IF(@Ma_vai_tro <> @Ma_truong_khoa or @Ma_vai_tro <> @Ma_pho_khoa)--
		BEGIN--
			SET @Dieu_kien_bo_phan = ' A.Ma_nguoi_tao = ' + @Ma_nguoi_tao
		END--
		ELSE
		BEGIN
			SET @Dieu_kien_bo_phan = ' B.Ma_bo_phan = ' + @Ma_bo_phan + ' And ((A.Tinh_trang = 0 and A.Ma_nguoi_tao = ' + @Ma_nguoi_tao + ') Or A.Tinh_trang <> 0) '
		END
	END
	ELSE
	BEGIN
		if(@Ma_bo_phan <> '')
		BEGIN
			SELECT @Vai_tro_truong_bo_phan = B.Ma_vai_tro FROM Khoa_trungtam AS A INNER JOIN ThanhVien AS B ON A.Ma_truong_khoa = B.ID WHERE B.Ma_bo_phan = @Ma_bo_phan
			if(@Vai_tro_truong_bo_phan = @Ma_truong_khoa)
			BEGIN
				SET @Dieu_kien_bo_phan = ' B.Ma_bo_phan = ' + @Ma_bo_phan + ' And A.Tinh_trang <> 0'
			END
			else
			BEGIN
				SET @Dieu_kien_bo_phan = ' A.Tinh_trang <> 0 '
			END
		END
	END

	SELECT @sql = ' 
		SELECT COUNT(*) AS Count
		FROM DeCuongMonHoc AS A
		INNER JOIN ThanhVien As B On A.Ma_nguoi_tao = B.ID 
		INNER JOIN ChiTietThanhVien As C on B.Ten_DN = C.Ten_dang_nhap
		Where ' + @Dieu_kien_tinh_trang + ' And ' + @Dieu_kien_bo_phan + ' And ' + @Dieu_kien_mon_hoc
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
		--+ @Where + @Dieu_kien_tinh_trang + @And + @Dieu_kien_ma_nguoi_tao + @Dieu_kien_khong_phai_nguoi_tao
	PRINT @sql	
	exec sp_executesql @sql
	
END
GO

--sp_ISO_GetCountKeHoachThang.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetCountKeHoachThang]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetCountKeHoachThang]
GO
CREATE PROCEDURE sp_ISO_GetCountKeHoachThang
	@Tinh_trang		varchar(2),
	@Ma_bo_phan		varchar(5),
	@Ma_PHC			varchar(5)
AS
BEGIN
	DECLARE @sql NVarchar(200)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_bo_phan nvarchar(100)
	SET @Dieu_kien_tinh_trang = ' ''t'' = ''t'' '
	SET @Dieu_kien_bo_phan = ' ''t'' = ''t'' '
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Dieu_kien_tinh_trang = ' Tinh_trang = ' + @Tinh_trang
	END

	if(@Ma_bo_phan <> '')
	BEGIN
		if (@Ma_bo_phan <> @Ma_PHC)
		BEGIN	
			SET @Dieu_kien_bo_phan = ' Tinh_trang <> 0 '
		END
	END

	SELECT @sql = ' 
		SELECT COUNT(*) AS Count
		FROM KEHOACHTHANG WHERE '
		+ @Dieu_kien_tinh_trang + ' AND' + @Dieu_kien_bo_phan
	exec sp_executesql @sql
	--PRINT @sql	
END
-- exec sp_ISO_GetCountKeHoachThang '',2,2
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
	@Ma_bo_phan		varchar(5),
	@Ma_PHC			varchar(5)
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
		if (@Ma_bo_phan <> @Ma_PHC)
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
		if (@Ma_bo_phan <> @Ma_PHC)
		BEGIN	
			SET @Where = 'Where '
			SET @Dieu_kien_bo_phan = ' Tinh_trang <> 0 '
		END
	END
	SELECT @sql = ' 
		SELECT COUNT(*) AS Count
		FROM QuyetDinhMoLop '
		+ @Where + @Dieu_kien_tinh_trang + @And + @Dieu_kien_bo_phan
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
	@Ma_bo_phan		varchar(5),
	@Ma_truong_khoa	varchar(2)
AS
BEGIN
	DECLARE @sql NVarchar(200)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_bo_phan nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(5)
	DECLARE @Vai_tro_truong_bo_phan varchar(5)
	SET @Vai_tro_truong_bo_phan = ''
	SET @Dieu_kien_tinh_trang = ''
	SET @Dieu_kien_bo_phan = ''
	SET @And = ''
	SET @Where = ''
	
	if(@Tinh_trang <> '' and @Ma_bo_phan <> '')
	BEGIN
		SET @And = ' and '
	END
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Where = 'Where '
		SET @Dieu_kien_tinh_trang = ' A.Tinh_trang = ' + @Tinh_trang
	END
	if(@Ma_bo_phan <> '')
	BEGIN
		SELECT @Vai_tro_truong_bo_phan = B.Ma_vai_tro FROM Khoa_trungtam AS A INNER JOIN ThanhVien AS B ON A.Ma_truong_khoa = B.ID WHERE B.Ma_bo_phan = @Ma_bo_phan
		SET @Where = 'Where '
		if(@Vai_tro_truong_bo_phan = @Ma_truong_khoa)
		BEGIN
			SET @Dieu_kien_bo_phan = ' B.Ma_bo_phan = ' + @Ma_bo_phan
		END
		else
		BEGIN
			SET @Dieu_kien_bo_phan = ' A.Tinh_trang <> 0 '
		END
	END

	SELECT @sql = ' 
		SELECT COUNT(*) AS Count
		FROM ThoiKhoaBieu AS A
		INNER JOIN ThanhVien AS B ON A.Ma_nguoi_tao = B.ID ' 
		+ @Where + @Dieu_kien_tinh_trang + @And + @Dieu_kien_bo_phan
	--PRINT @sql
	exec  sp_executesql @sql	
END
GO

--sp_ISO_GetDeCuongMonHoc.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetDeCuongMonHoc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetDeCuongMonHoc]
GO
CREATE PROCEDURE sp_ISO_GetDeCuongMonHoc
	@NumRows		VARCHAR(2),
	@TotalRows      varchar(5),
	@CurrentPage	VARCHAR(2),
	@Tinh_trang		varchar(2),
	@Ma_nguoi_tao   varchar(10),
	@Ma_bo_phan		varchar(5),
	@Ma_truong_khoa varchar(2),
	@Ma_pho_khoa	varchar(2),
	@Ma_vai_tro		varchar(2),	-- quyền trưởng khoa	
	@Ten_mon_hoc	nvarchar(50)
AS
BEGIN
	DECLARE @sql NVarchar(1000)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	--DECLARE @Dieu_kien_ma_nguoi_tao nvarchar(100)
	DECLARE @Dieu_kien_bo_phan nvarchar(300)
	DECLARE @Vai_tro_truong_bo_phan varchar(5)
	DECLARE @Dieu_kien_mon_hoc nvarchar(150)
	SET @Dieu_kien_tinh_trang = ' ''t'' = ''t'' '
	SET @Dieu_kien_mon_hoc = ' ''t'' = ''t'' '
	--SET @Dieu_kien_ma_nguoi_tao = ''
	SET @Dieu_kien_bo_phan = ' ''t'' = ''t'' '
	SET @Vai_tro_truong_bo_phan = ''
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Dieu_kien_tinh_trang = ' DCMH.Tinh_trang = ' + @Tinh_trang
	END
	--
	if(@Ten_mon_hoc <> '')
	BEGIN
		SET @Dieu_kien_mon_hoc = ' DCMH.Ten LIKE N''%' + @Ten_mon_hoc + '%'' ' 
	END
	--
	if(@Ma_nguoi_tao <> '')
	BEGIN
		IF(@Ma_vai_tro <> @Ma_truong_khoa or @Ma_vai_tro <> @Ma_pho_khoa)--
		BEGIN--
			SET @Dieu_kien_bo_phan = ' DCMH.Ma_nguoi_tao = ' + @Ma_nguoi_tao
		END--
		ELSE
		BEGIN
			SET @Dieu_kien_bo_phan = ' B.Ma_bo_phan = ' + @Ma_bo_phan + ' And ((DCMH.Tinh_trang = 0 and DCMH.Ma_nguoi_tao = ' + @Ma_nguoi_tao + ') Or DCMH.Tinh_trang <> 0) '
		END
	END
	ELSE
	BEGIN
		if(@Ma_bo_phan <> '')
		BEGIN
			SELECT @Vai_tro_truong_bo_phan = B.Ma_vai_tro FROM Khoa_trungtam AS A INNER JOIN ThanhVien AS B ON A.Ma_truong_khoa = B.ID WHERE B.Ma_bo_phan = @Ma_bo_phan
			if(@Vai_tro_truong_bo_phan = @Ma_truong_khoa)
			BEGIN
				SET @Dieu_kien_bo_phan = ' B.Ma_bo_phan = ' + @Ma_bo_phan + ' And DCMH.Tinh_trang <> 0 '
			END
			ELSE
			BEGIN
				SET @Dieu_kien_bo_phan = ' DCMH.Tinh_trang <> 0 '
			END
		END
	END
	--SELECT @sql = ''
	SELECT @sql = '
		SELECT TOP ' + @NumRows + '* , cast(datepart(mm,TB1.Ngay_Cap_Nhat_Cuoi) as varchar) + ''-'' + cast(datepart(dd,TB1.Ngay_Cap_Nhat_Cuoi) as varchar) + ''-'' + cast(datepart(yy,TB1.Ngay_Cap_Nhat_Cuoi) as varchar) As NgayCapNhatCuoi 
		FROM (
			SELECT TOP ' + Cast(Cast(@TotalRows As Int) - (Cast(@CurrentPage As Int) - 1) * Cast(@NumRows As Int) As Varchar) + ' 
				DCMH.ID As MaDeCuongMonHoc, DCMH.Ten As TenDeCuongMonHoc, (C.Ho + '' '' + C.Ten_Lot + '' '' + C.Ten) As TenNguoiTao, 
				DCMH.Tinh_trang As TinhTrang, DCMH.Ly_do_reject As LyDoReject, D.Tinh_trang As TinhTrangChuongTrinh, DCMH.Ma_nguoi_tao AS MaNguoiTao, DCMH.Ngay_cap_nhat_cuoi AS Ngay_cap_nhat_cuoi
			FROM DeCuongMonHoc AS DCMH 
				INNER JOIN ThanhVien As B On DCMH.Ma_nguoi_tao = B.ID 
				INNER JOIN ChiTietThanhVien As C on B.Ten_DN = C.Ten_dang_nhap
				INNER JOIN ChuongTrinhDaoTao As D ON DCMH.Ma_chuong_trinh = D.ID
			Where ' + @Dieu_kien_tinh_trang + ' And ' + @Dieu_kien_bo_phan + ' And ' + @Dieu_kien_mon_hoc +
			' ORDER BY DCMH.Ngay_cap_nhat_cuoi ASC
		) AS TB1
		ORDER BY TB1.Ngay_cap_nhat_cuoi DESC '
	--ORDER BY TB2.id ASC'
	exec  sp_executesql @sql
	--print @sql
END
--exec sp_ISO_GetDeCuongMonHoc 3,10,1,'0',20,6,5,5
GO

--sp_ISO_GetGiaoAnDelayList.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetGiaoAnDelayList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetGiaoAnDelayList]
GO
CREATE PROCEDURE sp_ISO_GetGiaoAnDelayList
	@Day		int
AS
BEGIN
	if exists (select * from dbo.sysobjects where name='GiaoAnDelayList')
	begin
		drop table GiaoAnDelayList
	end
	
	create table GiaoAnDelayList(
		id_ChiTietKHGD		int,
		Ma_giao_vien		int,
		Ho_ten_giao_vien	nvarchar(50),
		Email				nvarchar(50),
		Ma_lop				int,
		Ten_lop				nvarchar(50),
		Ma_mon_hoc			int,
		Ten_mon_hoc			nvarchar(50),
		Giao_an_so			int,
		Ngay_day			datetime,
		Nhom				int
	)
	
	insert into GiaoAnDelayList
	select
		B.ID AS 'id_ChiTietKHGD', 
		A.Ma_giao_vien,
		D.Ho + ' ' + D.Ten_lot + ' ' + D.Ten as 'Ho_ten_giao_vien',
		D.Email,
		A.Ma_lop,
		E.Ki_hieu as 'Ten_lop',
		A.Ma_mon_hoc,
		F.Ten_mon_hoc,
		B.STT_noi_dung as 'Giao_an_so',
		B.Ngay_BD as 'Ngay_day',
		B.Nhom as 'Nhom'				
	from KeHoachGiangDay A
	inner join ChiTietKHGD B on A.ID=B.Ma_ke_hoach_giang_day
	inner join ThanhVien C on A.Ma_giao_vien=C.ID
	inner join ChiTietThanhVien D on C.Ten_DN=D.Ten_dang_nhap
	inner join LopHoc E on A.Ma_lop=E.ID
	inner join MonHoc F on A.Ma_mon_hoc=F.ID
	where Ma_ke_hoach_giang_day=1
	and ISNULL(B.Ma_giao_an,'')=''
	and DATEDIFF(day, getdate(),B.Ngay_BD) >=0 
	and DATEDIFF(day, getdate(),B.Ngay_BD) <= @Day
	and ISNULL(B.User1,'') = ''		
	
	-- UPDATE COLUMN USER1 TRONG TABLE ChiTietKHGD THANH 1, CO HIEU LA DA EMAIL NHAC NHO GIAOAN DELAY ROI	
	DECLARE @ID_ChiTietKHGD INT		
	DECLARE @C CURSOR		
	SET @C = CURSOR FOR SELECT id_ChiTietKHGD FROM GiaoAnDelayList
		
	OPEN @C
	FETCH NEXT FROM @C INTO @ID_ChiTietKHGD
		
	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE ChiTietKHGD
		SET User1 = '1'
		WHERE ID = @ID_ChiTietKHGD
		
		FETCH NEXT FROM @C INTO @ID_ChiTietKHGD
	END
	/*
	-- LAY DU LIEU TRA VE DE SEND EMAIL
	SELECT
		
		Ma_giao_vien,
		Ho_ten_giao_vien,
		Email,
		Ma_lop,
		Ten_lop,
		Ma_mon_hoc,
		Ten_mon_hoc,
		Giao_an_so,
		Ngay_day,
		Nhom
	FROM GiaoAnDelayList
	
	DROP TABLE GiaoAnDelayList */
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

--sp_ISO_GetGiaoAnTichHop.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetGiaoAnTichHop]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetGiaoAnTichHop]
GO
CREATE PROCEDURE sp_ISO_GetGiaoAnTichHop
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

		Gioi_thieu_chu_de,
		HD_GTCD_GV,
		HD_GTCD_HS,
		Thoi_gian_GTCD,

		Giai_quyet_van_de,
		HD_GQVD_GV,
		HD_GQVD_HS,
		Thoi_gian_GTVD,

		Huong_dan_ket_thuc,
		HD_HDKT_GV,
		HD_HDKT_HS,
		Thoi_gian_HDKT,
		

		Huong_dan_tu_hoc,
		HD_HDTH_GV,
		Thoi_gian_HDTH,

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
--Ma bo phan la cua nguoi tao
--Ma khoa cua chuc nang tim kiem


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetKeHoachGiangDay]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetKeHoachGiangDay]
GO
CREATE PROCEDURE sp_ISO_GetKeHoachGiangDay
	@NumRows		VARCHAR(5),
	@TotalRows      varchar(5),
	@CurrentPage	VARCHAR(5),
	@Tinh_trang		varchar(5),
	@Ma_nguoi_tao   varchar(5),		
	@Ma_Bo_Phan varchar(5),
	@TenMonHoc nvarchar(500),
	@MaKhoa varchar(5),
	@MaHocKi varchar(5),
	@MaNamHoc varchar(5)
AS
BEGIN
	DECLARE @sql NVarchar(1000)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_khong_phai_nguoi_tao nvarchar(100)
	DECLARE @Dieu_kien_ma_nguoi_tao nvarchar(100)
	DECLARE @Dieu_kien_ma_bo_phan nvarchar(100)
	DECLARE @Dieu_kien_hoc_ki varchar(100)
	DECLARE @Dieu_kien_nam_hoc varchar(100)
	DECLARE @Dieu_kien_ma_khoa varchar(100)
	DECLARE @VAITRO INT
	
	SET @Dieu_kien_tinh_trang = ''
	SET @Dieu_kien_khong_phai_nguoi_tao = ''
	SET @Dieu_kien_ma_nguoi_tao = ''
	SET @Dieu_kien_ma_bo_phan=''
	SET	@Dieu_kien_hoc_ki=''
	SET @Dieu_kien_nam_hoc=''
	SET @Dieu_kien_ma_khoa=''


	PRINT @Ma_nguoi_tao

	IF(@Ma_nguoi_tao <> '')
	BEGIN
		SET	@Dieu_kien_ma_bo_phan = ' And B.Ma_bo_phan='+@Ma_Bo_Phan
	END

	IF(@Tinh_trang<>'')
		BEGIN
			SET	@Dieu_kien_tinh_trang = ' AND TB2.Tinh_trang ='+@Tinh_trang 
		END
	IF(@MaHocKi<>'')
		BEGIN
			SET	@Dieu_kien_hoc_ki = ' AND TB2.Hoc_ki LIKE ''%'+@MaHocKi + '%'''
		END
	IF(@MaNamHoc<>'')
		BEGIN
			SET	@Dieu_kien_nam_hoc = ' AND TB2.Ma_nam_hoc LIKE ''%'+@MaNamHoc + '%'''
		END
	IF not exists(SELECT * FROM KeHoachGiangDay WHERE Ma_nguoi_tao = @Ma_nguoi_tao)
	BEGIN	
			SET @Dieu_kien_khong_phai_nguoi_tao = ' AND TB2.Tinh_trang <> 0 '
	END	
	
	SELECT @VAITRO=Ma_vai_tro FROM ThanhVien WHERE ID=@Ma_nguoi_tao
	IF(@VAITRO = 8 AND @Ma_Nguoi_Tao <> '')	
	BEGIN 					
		SET @Dieu_kien_ma_nguoi_tao = ' AND TB2.Ma_nguoi_tao = ' + @Ma_nguoi_tao
	END

	IF(@MaKhoa <> '')	
	BEGIN 					
		SET @Dieu_kien_ma_khoa = ' AND B.Ma_bo_phan like ''%' + @MaKhoa +'%'''
	END



		
	SELECT @sql = '
		SELECT TB2.ID As MaKeHoachGiangDay, D.Ten_Mon_Hoc+'' - ''+E.Ki_Hieu  As TenKeHoachGiangDay, TB2.Ma_nguoi_tao As MaNguoiTao, (C.Ho + '' '' + C.Ten_Lot + '' '' + C.Ten) As TenNguoitao, 
		TB2.Tinh_trang As TinhTrang, TB2.Ly_do_reject As LyDoReject,TINH_TRANG_HT,TB2.Ma_mon_hoc,TB2.Ma_Lop,convert(varchar(20),TB2.Ngay_tao,105) As Ngaytao 
		FROM KeHoachGiangDay AS TB2 		
			INNER JOIN MonHoc As D On D.ID = TB2.Ma_Mon_Hoc And D.Ten_Mon_Hoc like N''%'+@TenMonHoc+'%''   
			INNER JOIN LopHoc As E On E.ID = TB2.Ma_Lop   			
			INNER JOIN ThanhVien As B On TB2.Ma_nguoi_tao = B.ID '+@Dieu_kien_ma_bo_phan+ @Dieu_kien_ma_khoa +' 
			INNER JOIN ChiTietThanhVien As C on B.Ten_DN = C.Ten_dang_nhap 

		WHERE 1=1 ' +
		@Dieu_kien_tinh_trang + @Dieu_kien_ma_nguoi_tao + @Dieu_kien_khong_phai_nguoi_tao + @Dieu_kien_hoc_ki + @Dieu_kien_nam_hoc
	+		'	ORDER BY TB2.id DESC '
		
	--print @sql
	exec  sp_executesql @sql
END


--'SELECT TB2.ID As MaKeHoachGiangDay, D.Ten_Mon_Hoc+'' - ''+E.Ki_Hieu  As TenKeHoachGiangDay, TB2.Ma_nguoi_tao As MaNguoiTao, (C.Ho + '' '' + C.Ten_Lot + '' '' + C.Ten) As TenNguoitao, 
--			TB2.Tinh_trang As TinhTrang, TB2.Ly_do_reject As LyDoReject,TINH_TRANG_HT,TB2.Ma_mon_hoc,TB2.Ma_Lop,
--			convert(varchar(20),TB2.Ngay_tao,105) As Ngaytao 
--			FROM (
--				SELECT TOP ' + @NumRows + '* 
--				FROM (
--					SELECT TOP ' + Cast(Cast(@TotalRows As Int) - (Cast(@CurrentPage As Int) - 1) * Cast(@NumRows As Int) As Varchar) + ' *
--					FROM KeHoachGiangDay WHERE 1=1 ' +
--					@Dieu_kien_tinh_trang + @Dieu_kien_ma_nguoi_tao + @Dieu_kien_khong_phai_nguoi_tao + @Dieu_kien_hoc_ki + @Dieu_kien_nam_hoc
--					+' ORDER BY id ASC
--				) AS TB1
--				ORDER BY TB1.id DESC
--			) AS TB2 
--			INNER JOIN MonHoc As D On D.ID = TB2.Ma_Mon_Hoc And D.Ten_Mon_Hoc like N''%'+@TenMonHoc+'%''   
--			INNER JOIN LopHoc As E On E.ID = TB2.Ma_Lop   			
--			INNER JOIN ThanhVien As B On TB2.Ma_nguoi_tao = B.ID '+@Dieu_kien_ma_bo_phan+ @Dieu_kien_ma_khoa +' 
--			INNER JOIN ChiTietThanhVien As C on B.Ten_DN = C.Ten_dang_nhap 
--			ORDER BY TB2.id DESC'
GO

--sp_ISO_GetKeHoachThang.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetKeHoachThang]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetKeHoachThang]
GO
CREATE PROCEDURE sp_ISO_GetKeHoachThang
	@NumRows		VARCHAR(2),
	@TotalRows      varchar(5),
	@CurrentPage	VARCHAR(2),
	@Tinh_trang		varchar(2),
	@Ma_bo_phan		varchar(5),
	@Ma_PHC			varchar(5)		
AS
BEGIN
	DECLARE @sql NVarchar(1000)
	DECLARE @Dieu_kien_tinh_trang nvarchar(100)
	DECLARE @Dieu_kien_bo_phan nvarchar(100)
	SET @Dieu_kien_tinh_trang = ' ''t'' = ''t'' '
	SET @Dieu_kien_bo_phan = ' ''t'' = ''t'' '
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Dieu_kien_tinh_trang = ' Tinh_trang = ' + @Tinh_trang
	END
	
	if(@Ma_bo_phan <> '')
	BEGIN
		if (@Ma_bo_phan <> @Ma_PHC)
		BEGIN	
			SET @Dieu_kien_bo_phan = ' Tinh_trang <> 0 '
		END
	END
	--SELECT @sql = ''
	SELECT @sql = '
	SELECT TB2.ID As MaKeHoachThang, TB2.Ten_ke_hoach_thang As TenKeHoachThang, (C.Ho + '' '' + C.Ten_Lot + '' '' + C.Ten) As TenNguoiTao, 
	TB2.Tinh_trang As TinhTrang, TB2.Ly_do_reject As LyDoReject,
	cast(datepart(mm,TB2.Ngay_Cap_Nhat_Cuoi) as varchar) + ''-'' + cast(datepart(dd,TB2.Ngay_Cap_Nhat_Cuoi) as varchar) + ''-'' + cast(datepart(yy,TB2.Ngay_Cap_Nhat_Cuoi) as varchar) As NgayCapNhatCuoi
	FROM (
		SELECT TOP ' + @NumRows + '* 
		FROM (
			SELECT TOP ' + Cast(Cast(@TotalRows As Int) - (Cast(@CurrentPage As Int) - 1) * Cast(@NumRows As Int) As Varchar) + ' *
			FROM KeHoachThang WHERE '
			+ @Dieu_kien_tinh_trang + ' AND ' + @Dieu_kien_bo_phan +
			' ORDER BY Ngay_cap_nhat_cuoi ASC
		) AS TB1
		ORDER BY TB1.Ngay_cap_nhat_cuoi DESC
	) AS TB2 
	INNER JOIN ThanhVien As B On TB2.Ma_nguoi_tao = B.ID 
	INNER JOIN ChiTietThanhVien As C on B.Ten_DN = C.Ten_dang_nhap'
	--ORDER BY TB2.Ngay_cap_nhat_cuoi DESC'
	exec  sp_executesql @sql
	--print @sql
END
--exec sp_ISO_GetKeHoachThang 10, 1, 1, '', 2, 2

GO

--sp_ISO_getKhoaByBoPhan.sql
/***********************************************************
* Purpose : insert phong ban
* Author : TuanHQ
* Date: 02-04-2010S
* Description: insert phong ban
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].sp_ISO_GetKhoaByBoPhan') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].sp_ISO_GetKhoaByBoPhan
GO
CREATE PROC sp_ISO_GetKhoaByBoPhan
	@MaBoPhan	int
AS
BEGIN
	DECLARE @boPhanBGH int
	DECLARE @boPhanPHC int
	DECLARE @boPhanDBCL int
	DECLARE @boPhanPDT int
	DECLARE @boPhanAdmin int
	SET @boPhanBGH=0
	SET @boPhanPHC=2
	SET @boPhanDBCL=4
	SET @boPhanPDT=1
	SET @boPhanAdmin=16
	IF(@MaBoPhan	= @boPhanBGH OR
		@MaBoPhan	= @boPhanPDT OR
		@MaBoPhan	= @boPhanDBCL OR
		@MaBoPhan	= @boPhanAdmin OR
		@MaBoPhan	= @boPhanPHC )
	BEGIN
			SELECT ID AS MaKhoa,Ten AS Ten,Ma_truong_khoa As MaTruongKhoa FROM Khoa_trungtam
	END
	ELSE
	BEGIN
			SELECT ID AS MaKhoa,Ten AS Ten,Ma_truong_khoa As MaTruongKhoa FROM Khoa_trungtam WHERE ID=@MaBoPhan
	END
END






GO

--sp_iso_GetLengthOfFindGiaoAn.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].sp_iso_GetLengthOfFindGiaoAn') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].sp_iso_GetLengthOfFindGiaoAn
GO
CREATE PROCEDURE sp_iso_GetLengthOfFindGiaoAn
	@MaNguoiTao varchar(10),
	@MaNamHoc varchar(10),
	@MaLop varchar(10),
	@MaMonHoc varchar(10),
	@HocKi varchar(10),
	@TinhTrang varchar(10),
	@NgayTimBD varchar(11),
	@NgayTimKT varchar(11),
	@MaBoPhan varchar(5),
	@MaKhoa varchar(5)
AS
BEGIN			
	DECLARE @DieuKienMaNguoiTao varchar(100)
	DECLARE @DieuKienMaLop varchar(100)
	DECLARE @DieuKienMaMonHoc varchar(100)
	DECLARE @DieuKienTinhTrang varchar(100)
	DECLARE @DieuKienHocKi varchar(100)
	DECLARE @DieuKienMaNamHoc varchar(100)
	DECLARE @DieuKienTimNgay varchar(100)
	DECLARE @DieuKienMaBoPhan varchar(100)


	SET @DieuKienMaNguoiTao=''
	SET @DieuKienMaLop=''
	SET @DieuKienMaMonHoc=''
	SET @DieuKienTinhTrang=''
	SET @DieuKienHocKi=''
	SET @DieuKienMaNamHoc=''
	SET @DieuKienTimNgay=''

	IF (@MaBoPhan = 0 OR @MaBoPhan = 1 OR @MaBoPhan=16 OR @MaBoPhan=4 OR @MaBoPhan=2)  AND @MaKhoa = ''
	BEGIN
		SET @DieuKienMaBoPhan=''
	END
	ELSE
	BEGIN
		IF @MaKhoa = ''
		BEGIN
			SET @DieuKienMaBoPhan=' AND E.Ma_bo_phan='+@MaBoPhan
		END
		BEGIN
			 SET @DieuKienMaBoPhan=' AND E.Ma_bo_phan='+@MaKhoa
		END 
	END

		
	IF @NgayTimBD = ''
	BEGIN
		SET @NgayTimBD='1/1/1'
	END
	
	IF @NgayTimKT =''
	BEGIN
		SET @DieuKienTimNgay= ' WHERE U.Ngay_BD >= ''' +  @NgayTimBD+'''' 
	END
	ELSE
	BEGIN
		SET @DieuKienTimNgay= ' WHERE U.Ngay_BD >= ''' + @NgayTimBD  + ''' AND U.Ngay_BD <= ''' + @NgayTimKT +''''
	END	

	IF @MaNguoiTao <> ''
	BEGIN
		SET @DieuKienMaNguoiTao=' AND A.Ma_nguoi_tao = '+@MaNguoiTao
	END
	
	IF @MaLop <> ''
	BEGIN
		SET @DieuKienMaLop=' AND Ma_Lop = '+@MaLop
	END
	
	IF @MaMonHoc <> ''
	BEGIN
		SET @DieuKienMaMonHoc =' AND Ma_mon_hoc ='+ @MaMonHoc
	END

	IF @TinhTrang <>''
	BEGIN
		SET @DieuKienTinhTrang =' AND B.Tinh_trang = '+@TinhTrang 
	END

	IF @HocKi <>''
	BEGIN
		SET @DieuKienHocKi=' AND Hoc_ki = '+@HocKi
	END	
	IF @MaNamHoc <>''
	BEGIN
		SET @DieuKienMaNamHoc=' AND Ma_nam_hoc  = '+ @MaNamHoc
	END
	
	DECLARE @sql nvarchar(2000)


SET @sql=' SELECT U.Co_Hieu As CoHieu,U.ID As MaCTKHGD,A.ID As MaKHGD,A.Ma_Nguoi_Tao As MaNguoiTao,A.Ma_mon_hoc As MaMonHoc,U.Ngay_BD As NgayThucHien
		,A.Ma_lop As MaLop,B.ID As MaGiaoAn,B.Tinh_Trang As TinhTrang,B.So_Giao_An As SoGiaoAn 
		,B.NgayGui As NgayGui,B.Ngay_duyet As NgayDuyet,B.Ma_nguoi_duyet As MaNguoiDuyet
,ISNULL(K.Ho+'' ''+'' ''+K.Ten_lot+'' ''+K.Ten,'''') As NguoiDuyet
		,C.Ten_Mon_Hoc As TenMonHoc,D.Ki_hieu As KiHieu,F.Ho+'' ''+'' ''+F.Ten_lot+'' ''+F.Ten As NguoiTao
INTO #TEMP 
FROM KeHoachGiangDay As A
INNER JOIN GiaoAn As B
ON 1=1 '     
			 +@DieuKienMaNguoiTao  
			 +@DieuKienHocKi
			 +@DieuKienMaNamHoc
			 +@DieuKienMaLop
			 +@DieuKienMaMonHoc 
			 +' AND B.Ma_KHGD=A.ID ' 
			 +@DieuKienTinhTrang
			 
+' INNER JOIN MonHoc As C
ON C.ID=A.Ma_Mon_Hoc
INNER JOIN LopHoc As D
ON D.ID=A.Ma_Lop 
INNER JOIN ThanhVien As E
On E.ID=A.Ma_Giao_Vien '+ @DieuKienMaBoPhan +'
INNER JOIN ChiTietThanhVien As F
ON E.Ten_DN=F.Ten_dang_nhap
LEFT JOIN ThanhVien As G
On G.ID=B.Ma_nguoi_duyet
LEFT JOIN ChiTietThanhVien As K
ON G.Ten_DN=K.Ten_dang_nhap
INNER JOIN ChiTietKHGD As U
On U.Ma_giao_an=B.ID '
+@DieuKienTimNgay +
' ORDER BY A.Ma_nguoi_tao DESC,A.Ma_mon_hoc DESC, A.Ma_lop DESC 

SELECT COUNT(*) AS TOTAL FROM #TEMP

'


	
exec sp_executesql @sql
END


	
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
	@Khoa			varchar(5),
	@Mon_hoc		varchar(5)
AS
BEGIN
	DECLARE @sql NVarchar(2000)
	DECLARE @Dieu_kien_phong nvarchar(100)
	DECLARE @Dieu_kien_nam_hoc nvarchar(100)
	DECLARE @Dieu_kien_tuan nvarchar(300)
	DECLARE @Dieu_kien_khoa nvarchar(100)
	DECLARE @Dieu_kien_mon_hoc nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(7)
	SET @Dieu_kien_phong = ' ''t'' = ''t'' '
	SET @Dieu_kien_nam_hoc = ' ''t'' = ''t'' '
	SET @Dieu_kien_tuan = ' ''t'' = ''t'' '
	SET @Dieu_kien_khoa = ' ''t'' = ''t'' '
	SET @Dieu_kien_mon_hoc = ' ''t'' = ''t'' '
	SET @And = ' AND'
	SET @Where = ' WHERE '
	if(@Phong <> '')
	BEGIN
		SET @Dieu_kien_phong = ' H.ID = ' + @Phong
	END

	if(@Nam_hoc <> '')
	BEGIN
		SET @Dieu_kien_nam_hoc = ' A.User1 = ' + @Nam_hoc
	END

	if(@Tuan <> '')
	BEGIN
		if(Cast(@Tuan AS Int) < 61)
		BEGIN
			SET @Dieu_kien_tuan = ' A.Tuan = ' + @Tuan
		END
		if(Cast(@Tuan AS Int) < 81 AND Cast(@Tuan AS Int) > 60)
		BEGIN
			SET @Dieu_kien_tuan = ' Datepart(mm, A.Ngay_hoc) = ' + Cast(Cast(@Tuan AS Int) - 60 AS varchar) 
		END
		if(Cast(@Tuan AS Int) > 80)
		BEGIN
			SET @Dieu_kien_tuan = ' C.Hoc_ki = ' + Cast(Cast(@Tuan AS Int) - 80 AS Varchar)
		END
	END
	else
	BEGIN
		SET @Dieu_kien_tuan = ' Cast(convert(varchar(10),G.Tu_ngay,110) AS Datetime) <= Cast(convert(varchar(10),GETDATE(),110) AS Datetime) AND (Cast(convert(varchar(10),G.Den_ngay,110) AS Datetime) >= Cast(convert(varchar(10),GETDATE(),110) AS Datetime)) '
	END

	if(@Khoa <> '')
	BEGIN
		SET @Dieu_kien_khoa = ' F.ID = ' + @Khoa
	END
	if(@Mon_hoc <> '')
	BEGIN
		SET @Dieu_kien_mon_hoc = ' B.Ma_mon_hoc = ' + @Mon_hoc
	END
	--SELECT @sql = ''
	SELECT @sql = '
	SELECT A.ID, H.Ki_hieu_phong AS KiHieuPhong, A.Nhom AS Nhom, A.Buoi, A.Thu_trong_tuan AS ThuTrongTuan, 
			I.Ten_mon_hoc AS TenMonHoc, ISNULL((K.Ho + '' '' + K.Ten_Lot + '' '' + K.Ten),'''') As TenGiaoVien,
			Convert(varchar(10), A.Ngay_hoc, 110) As NgayHoc, F.Ten As TenKhoa, D.Ki_hieu As KiHieuLop
	FROM ChiTietTKB AS A 
		INNER JOIN MonHocTKB AS B ON B.ID = A.Ma_mon_hoc_TKB 
		INNER JOIN ThoiKhoaBieu AS C ON B.Ma_TKB = C.ID
		INNER JOIN LopHoc AS D ON C.Ma_lop = D.ID
		INNER JOIN ChuyenNganh AS E ON D.Ma_chuyen_nganh = E.ID
		INNER JOIN Khoa_TrungTam AS F ON E.Ma_khoaTT = F.ID
		INNER JOIN Tuanle AS G ON A.User1 = G.Ma_nam_hoc AND A.Tuan = G.So_thu_tu
		INNER JOIN PhongBan AS H ON A.Ma_phong = H.ID
		INNER JOIN MonHoc AS I ON B.Ma_mon_hoc = I.ID
		INNER JOIN ThanhVien AS J ON B.Ma_giao_vien = J.ID
		INNER JOIN ChiTietThanhVien AS K ON J.Ten_DN = K.Ten_dang_nhap'
		--INNER JOIN ChiTietTKB AS L ON A.Ma_mon_hoc_TKB = L.Ma_mon_hoc_TKB AND A.Buoi = L.Buoi AND A.Thu_trong_tuan = L.Thu_trong_tuan AND A.STT_Tuan = L.Tuan AND A.Ma_phong = L.Ma_phong'
		+ @Where + @Dieu_kien_phong + @And + @Dieu_kien_nam_hoc + @And + @Dieu_kien_tuan + @And + @Dieu_kien_khoa + @And + @Dieu_kien_mon_hoc + 
		' ORDER BY A.Ngay_hoc, A.Thu_trong_tuan, A.Buoi DESC, A.Ma_phong, F.ID'
	exec  sp_executesql @sql
	--print @sql
END
--sp_help sp_executesql
--sp_ISO_GetLichSuDungPhong '','','','',''
--select * from sudung

GO

--sp_ISO_getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap]
GO
CREATE PROCEDURE sp_ISO_getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap
	@Ma_nguoi_lap	int,
	@Ma_truong_khoa int,
	@Ma_pho_khoa int
AS
BEGIN
	
	DECLARE @Ma_bo_phan int
	SELECT @Ma_bo_phan = Ma_bo_phan FROM ThanhVien WHERE ID = @Ma_nguoi_lap

	SELECT ISNULL(B.Email,'') AS EMAIL FROM ThanhVien AS A INNER JOIN ChiTietThanhVien AS B ON A.Ten_DN = B.Ten_dang_nhap INNER JOIN Khoa_TrungTam AS C ON A.Ma_bo_phan = C.ID WHERE C.ID = @Ma_bo_phan AND (A.Ma_vai_tro = @Ma_truong_khoa OR A.Ma_vai_tro = @Ma_pho_khoa)

END

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

--sp_ISO_getNgayGioHeThongXML.sql


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_getNgayGioHeThongXML]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_getNgayGioHeThongXML]
GO
CREATE PROCEDURE sp_ISO_getNgayGioHeThongXML

AS
BEGIN
	SELECT Convert(varchar(10),GETDATE(),110) As NgayHeThong ,replace(Convert(varchar(10),GETDATE(),108),':','')  AS GioHeThong				
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
	@Ma_bo_phan		varchar(5),
	@Ma_PHC		varchar(5)	
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
		if (@Ma_bo_phan <> @Ma_PHC)
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
		if (@Ma_bo_phan <> @Ma_PHC)
		BEGIN	
			SET @Where = 'Where '
			SET @Dieu_kien_bo_phan = ' Tinh_trang <> 0 '
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
			+ @Where + @Dieu_kien_tinh_trang + @And + @Dieu_kien_bo_phan +
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
	@TotalRows      varchar(10),
	@CurrentPage	VARCHAR(2),
	@Tinh_trang		varchar(2),
	@Ma_bo_phan		varchar(5),
	@Ma_truong_khoa	varchar(2)		
AS
BEGIN
	DECLARE @sql NVarchar(1000)
	DECLARE @Dieu_kien_tinh_trang_1 nvarchar(100)
	DECLARE @Dieu_kien_tinh_trang_2 nvarchar(100)
	DECLARE @Dieu_kien_bo_phan nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(5)
	DECLARE @Vai_tro_truong_bo_phan varchar(5)
	SET @Vai_tro_truong_bo_phan = ''
	SET @Dieu_kien_tinh_trang_1 = ' ''t'' = ''t'' '
	SET @Dieu_kien_tinh_trang_2 = ' ''t'' = ''t'' '
	SET @Dieu_kien_bo_phan = ' ''t'' = ''t'' '
	SET @And = ' And '
	SET @Where = 'Where'
	
	if(@Tinh_trang <> '')
	BEGIN
		SET @Dieu_kien_tinh_trang_1 = ' TKB.Tinh_trang = ' + @Tinh_trang
	END
	if(@Ma_bo_phan <> '')
	BEGIN
		SELECT @Vai_tro_truong_bo_phan = B.Ma_vai_tro FROM Khoa_trungtam AS A INNER JOIN ThanhVien AS B ON A.Ma_truong_khoa = B.ID WHERE B.Ma_bo_phan = @Ma_bo_phan
		if(@Vai_tro_truong_bo_phan = @Ma_truong_khoa)
		BEGIN
			SET @Dieu_kien_bo_phan = ' B.Ma_bo_phan = ' + @Ma_bo_phan
		END
		else
		BEGIN
			SET @Dieu_kien_tinh_trang_2 = ' TKB.Tinh_trang <> 0 '
		END
	END
	--SELECT @sql = ''
	SELECT @sql = '
			SELECT TOP ' + @NumRows + ' * , cast(datepart(mm,TB1.Ngay_Cap_Nhat_Cuoi) as varchar) + ''-'' + cast(datepart(dd,TB1.Ngay_Cap_Nhat_Cuoi) as varchar) + ''-'' + cast(datepart(yy,TB1.Ngay_Cap_Nhat_Cuoi) as varchar) As NgayCapNhatCuoi
			FROM (
			SELECT TOP ' + Cast(Cast(@TotalRows As Int) - (Cast(@CurrentPage As Int) - 1) * Cast(@NumRows As Int) As Varchar) + '
				TKB.ID As MaThoiKhoaBieu, (C.Ho + '' '' + C.Ten_Lot + '' '' + C.Ten) As TenNguoiTao, TKB.Ten As TenThoiKhoaBieu,
				TKB.Tinh_trang As TinhTrang, TKB.Ly_do_reject As LyDoReject, TKB.Ngay_cap_nhat_cuoi AS Ngay_cap_nhat_cuoi
				FROM ThoiKhoaBieu AS TKB 
				INNER JOIN ThanhVien As B On TKB.Ma_nguoi_tao = B.ID 
				INNER JOIN ChiTietThanhVien As C on B.Ten_DN = C.Ten_dang_nhap '
				+ @WHERE + @Dieu_kien_tinh_trang_1 + @And + @Dieu_kien_tinh_trang_2 + @And + @Dieu_kien_bo_phan +
				' ORDER BY TKB.Ngay_cap_nhat_cuoi ASC
		) AS TB1
		ORDER BY TB1.Ngay_cap_nhat_cuoi DESC '
	
	
	--ORDER BY TB2.id ASC
	exec  sp_executesql @sql
	--PRINT @sql
END
--exec sp_ISO_GetThoiKhoaBieu 3,1,1,'',5,5
GO

--sp_iso_GetTotalKetQuaTimGiaoAn.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_iso_GetTotalKetQuaTimGiaoAn]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_iso_GetTotalKetQuaTimGiaoAn]
GO
create procedure sp_iso_GetTotalKetQuaTimGiaoAn
	
As
begin			
	
	IF EXISTS (SELECT * FROM SYSOBJECTS	WHERE XTYPE='U' AND NAME='KetQuaTimGiaoAn')
			SELECT COUNT(*) As Total FROM KETQUATIMGIAOAN 
	Else
			SELECT 0 As Total
end








GO

--sp_ISO_GetTuanByNgay.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetTuanByNgay]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetTuanByNgay]
GO
CREATE PROC sp_ISO_GetTuanByNgay
	@Kieu_tuan varchar, -- Tuan hien tai hoac tuan sau
	@Ma_tuan int output,
	@Tu_ngay varchar(10) output,
	@Den_ngay varchar(10) output,
	@Thu_tu_tuan varchar(2) output,
	@Ma_nam_hoc int output
AS
BEGIN
	DECLARE @Ngay datetime
	SET @Ngay = getdate()
	IF(@Kieu_tuan = '2')
	BEGIN
		SET @Ngay = DATEADD(DAY, 7, @Ngay)
	END
	SELECT @Ma_tuan = ID, @Tu_ngay = Convert(varchar(10),Tu_ngay,110), @Thu_tu_tuan = So_thu_tu,
				@Den_ngay = Convert(varchar(10),Den_ngay,110), @Ma_nam_hoc = Ma_nam_hoc 
		FROM TuanLe
		WHERE Cast(Convert(varchar(10), Tu_ngay, 110) As datetime) <= Cast(Convert(varchar(10), @Ngay, 110) As datetime)  And Cast(Convert(varchar(10), @Ngay, 110) As datetime) <= Cast(Convert(varchar(10), Den_ngay, 110) As datetime)
print @Tu_ngay
END
GO

--sp_ISO_GetTuanByNgayHienTai.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetTuanByNgayHienTai]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetTuanByNgayHienTai]
GO
CREATE PROC sp_ISO_GetTuanByNgayHienTai
	@Ma_tuan int output,
	@Tu_ngay varchar(10) output,
	@Den_ngay varchar(10) output,
	@Thu_tu_tuan varchar(2) output,
	@Ma_nam_hoc int output
AS
BEGIN
	DECLARE @Ngay_hien_tai datetime
	SET @Ngay_hien_tai = getdate()
	SELECT @Ma_tuan = ID, @Tu_ngay = Convert(varchar(10),Tu_ngay,110), @Thu_tu_tuan = So_thu_tu,
				@Den_ngay = Convert(varchar(10),Den_ngay,110), @Ma_nam_hoc = Ma_nam_hoc 
		FROM TuanLe
		WHERE Cast(Convert(varchar(10), Tu_ngay, 110) As datetime) <= Cast(Convert(varchar(10), @Ngay_hien_tai, 110) As datetime)  And Cast(Convert(varchar(10), @Ngay_hien_tai, 110) As datetime) <= Cast(Convert(varchar(10), Den_ngay, 110) As datetime)
print @Tu_ngay
END
GO

--sp_ISO_GetTuanChiTietKHDT.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetTuanChiTietKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetTuanChiTietKHDT]
GO
CREATE PROCEDURE sp_ISO_GetTuanChiTietKHDT
	@Ngay_bat_dau				datetime,
	@Ngay_ket_thuc				datetime,
	@Kieu_them_dong				int,
	@Ma_nam						int output,
	@Ma_tuan_le					int output,
	@Ngay_bat_dau_tuan_moi		varchar(20) output,
	@Ngay_ket_thuc_tuan_moi		varchar(20) output,
	@Thu_tu_tuan				int output
AS
BEGIN
	IF(@Kieu_them_dong = 1)
	BEGIN
		DECLARE @Ngay varchar(2)
		DECLARE @Thang varchar(2)
		DECLARE	@Nam varchar(4)
		SELECT @Ngay = DATEPART(dd, @Ngay_bat_dau), @Thang = DATEPART(mm, @Ngay_bat_dau), @Nam = DATEPART(yyyy, @Ngay_bat_dau)
		IF(@Ngay = 1)
		BEGIN
			SET @Thang = @Thang - 1
			--PRINT @Thang 
		END
		SELECT TOP 1 @Ma_tuan_le = ID FROM TuanLe WHERE DATEPART(mm, Den_ngay) = @Thang AND DATEPART(yyyy, Den_ngay) = @Nam ORDER BY Den_ngay DESC
		--PRINT @Ma_tuan_le
	END
	ELSE
	BEGIN
		SELECT @Ma_tuan_le = ID FROM TuanLe WHERE Tu_ngay = DATEADD(day,1,@Ngay_ket_thuc)
	END
	SELECT @Ma_tuan_le = ID, @Ma_nam = Ma_nam_hoc, @Thu_tu_tuan = So_thu_tu, 
				@Ngay_bat_dau_tuan_moi = Convert(varchar(20),Tu_ngay, 105),
					@Ngay_ket_thuc_tuan_moi = Convert(varchar(20),Den_ngay,105)
		FROM TuanLe
		WHERE ID = @Ma_tuan_le	
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
	@nhom					int,
	@sTTNoiDung				int,
	@Thu					int,
	@Buoi					nvarchar(10),
	@Ten_phong				nvarchar(40),
	@Muc_Tieu_Bai_Hoc		nvarchar(2000),
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
		@nhom,
		@sTTNoiDung,
		@Thu,
		@Buoi,
		@Ten_phong,
		@Muc_Tieu_Bai_Hoc,
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
	@User1					varchar, --Ma nam hoc
	@User2					varchar,
	@User3					varchar,
	@User4					varchar,
	@User5					varchar,
	@Ten_chuong				nvarchar(4000),
	@Muc_tieu				nvarchar(2000)
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
		@Ten_chuong,
		@Muc_tieu,
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

--sp_ISO_InsertCongTacThang.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertCongTacThang]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertCongTacThang]
GO
CREATE PROCEDURE sp_ISO_InsertCongTacThang
	@ID	int output,
	@Ma_ke_hoach_thang int,
	@Ma_cong_tac int,
	@Ngay_cap_nhat_cuoi datetime,
	@Bao_cao nvarchar(1000),
	@Ghi_chu nvarchar(1000),
	@Bo_phan_thuc_hien nvarchar(200),
	@User1 varchar(40),
	@User2 varchar(40),
	@User3 varchar(40),
	@User4 varchar(40),
	@User5 varchar(40)
AS
BEGIN
	SET @Ngay_cap_nhat_cuoi = GETDATE()
	INSERT INTO CongTacThang VALUES
	(
		@Ma_ke_hoach_thang,
		@Ma_cong_tac,
		@Ngay_cap_nhat_cuoi,
		@Bao_cao,
		@Ghi_chu,
		@Bo_phan_thuc_hien,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	SELECT @ID = ID FROM CongTacThang WHERE Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
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
	@Ngay_tao datetime,
	@Ten_Chuong nvarchar(2000),
	@Ma_Giao_Vien int
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
		Tinh_trang,
		Ten_Chuong,
		Ma_Giao_Vien
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
		0,
		@Ten_Chuong,
		@Ma_Giao_Vien
	)

	SELECT @ID=MAX(ID) FROM GIAOAN 
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
	@Ngay_tao datetime,
	@Ten_Chuong nvarchar(2000),
	@Ma_Giao_Vien int

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
		Tinh_trang,
		Ten_Chuong,
		Ma_Giao_Vien
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
		0,
		@Ten_Chuong,
		@Ma_Giao_Vien

	)
	
	SELECT @ID=MAX(ID) FROM GIAOAN 
END

GO

--sp_ISO_InsertGiaoAnTichHop.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertGiaoAnTichHop]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertGiaoAnTichHop]
GO
CREATE PROCEDURE sp_ISO_InsertGiaoAnTichHop
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

	@Gioi_thieu_chu_de nvarchar(2000),
	@HD_GTCD_GV nvarchar(2000),
	@HD_GTCD_HS nvarchar(2000),
	@Thoi_gian_GTCD int,

	@Giai_quyet_van_de nvarchar(2000),
	@HD_GQVD_GV nvarchar(2000),
	@HD_GQVD_HS nvarchar(2000),
	@Thoi_gian_GTVD int,

	@Ket_thuc_van_de nvarchar(2000),
	@HD_HDKT_GV nvarchar(2000),
	@HD_HDKT_HS nvarchar(2000),
	@Thoi_gian_HDKT int,

	@Huong_dan_tu_hoc nvarchar(2000),
	@HD_HDTH_GV nvarchar(2000),
	@Thoi_gian_HDTH int,

	@Rut_kinh_nghiem nvarchar(2000),
	@Ngay_tao datetime,
	@Ten_Chuong nvarchar(2000),
	@Ma_Giao_Vien int

			
			
			
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

		Gioi_thieu_chu_de,
		HD_GTCD_GV,
		HD_GTCD_HS,
		Thoi_gian_GTCD,

		Giai_quyet_van_de,
		HD_GQVD_GV,
		HD_GQVD_HS,
		Thoi_gian_GTVD,

		Huong_dan_ket_thuc,
		HD_HDKT_GV,
		HD_HDKT_HS,
		Thoi_gian_HDKT,
		

		Huong_dan_tu_hoc,
		HD_HDTH_GV,
		Thoi_gian_HDTH,
		Rut_kinh_nghiem,
		Ngay_tao,
		Tinh_trang,
		Ten_Chuong,
		Ma_Giao_Vien
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

	
	@Gioi_thieu_chu_de,
	@HD_GTCD_GV,
	@HD_GTCD_HS,
	@Thoi_gian_GTCD,

	@Giai_quyet_van_de,
	@HD_GQVD_GV,
	@HD_GQVD_HS,
	@Thoi_gian_GTVD,

	@Ket_thuc_van_de,
	@HD_HDKT_GV,
	@HD_HDKT_HS,
	@Thoi_gian_HDKT,

	@Huong_dan_tu_hoc,
	@HD_HDTH_GV,
	@Thoi_gian_HDTH ,

		@Rut_kinh_nghiem,
		@Ngay_tao,
		0,
		@Ten_Chuong,
		@Ma_Giao_Vien

	)
	
	SELECT @ID=MAX(ID) FROM GIAOAN 
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
GO

--sp_ISO_InsertKeHoachThang.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertKeHoachThang]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertKeHoachThang]
GO
CREATE PROCEDURE sp_ISO_InsertKeHoachThang
	@ID	int output,
	@Thang varchar(2),
	@Noi_nhan nvarchar(1000),
	@Ma_nguoi_tao int,
	@Ngay_cap_nhat_cuoi datetime,
	@Ngay_tao datetime,
	@Ngay_duyet datetime,
	@Ma_nguoi_duyet int,
	@Nam varchar(4),
	@Ten_ke_hoach_thang nvarchar(200),
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
	SET @Ngay_tao = GETDATE()
	SET @Ten_ke_hoach_thang = N'Kế hoạch tháng ' + @Thang + N' năm ' + @Nam
	INSERT INTO KeHoachThang VALUES 
	(
		@Thang,
		@Noi_nhan,
		@Ma_nguoi_tao,
		@Ngay_cap_nhat_cuoi,
		@Ngay_tao,
		@Ma_nguoi_duyet,
		@Ngay_duyet,
		@Nam,
		@Tinh_trang,
		@Ten_ke_hoach_thang,
		@Ngay_gui,
		@Ly_do_reject,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	SELECT @ID = ID FROM KeHoachThang WHERE Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
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
	@Ngay_bat_dau_LT		varchar(30) output,
	@Ngay_bat_dau_TH		varchar(30) output,
	@Ngay_ket_thuc_LT		varchar(30) output, 
	@Ngay_ket_thuc_TH		varchar(30) output,
	@Ghi_chu				nvarchar(1000),
	@Ngay_cap_nhat_cuoi		datetime output,
	@Tuan_bat_dau_LT		int,
	@Tuan_bat_dau_TH		int,
	@Tuan_ket_thuc_LT		int,
	@Tuan_ket_thuc_TH		int,
	--@Ten_mon_hoc			nvarchar(200),
	--@Ten_giao_vien			nvarchar(200),
	@User1					varchar(40), -- Ma phong LT
	@User2					varchar(40), -- Ma phong TH
	@User3					varchar(40), -- so tiet 1 buoi
	@User4					varchar(40),
	@User5					varchar(40)																					
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
	
	--SELECT @Ten_mon_hoc = Ten_mon_hoc FROM MonHoc WHERE ID = @Ma_mon_hoc
	--SELECT @Ten_giao_vien = (B.Ho + ' ' + B.Ten_lot + ' ' + B.Ten) FROM ThanhVien AS A INNER JOIN ChiTietThanhVien As B ON A.Ten_DN = Ten_dang_nhap WHERE A.ID = @Ma_giao_vien
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
		NULL, --Ten_mon_hoc
		NULL, --Ten_giao_vien
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	
	SELECT	@ID = A.ID, @Ngay_cap_nhat_cuoi = Convert(varchar(10), A.Ngay_cap_nhat_cuoi,110),
			@Ngay_bat_dau_LT = Convert(varchar(10), A.Ngay_bat_dau_LT,110),
				@Ngay_bat_dau_TH = Convert(varchar(10), A.Ngay_bat_dau_TH, 110),
					@Ngay_ket_thuc_LT = Convert(varchar(10), A.Ngay_ket_thuc_LT,110), 
						@Ngay_ket_thuc_TH = Convert(varchar(10), A.Ngay_ket_thuc_TH,110)
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
	@User5				varchar(40),
	@Muc_tieu			nvarchar(2000)
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
		@Muc_tieu,
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
	@ID						int output,
	@Ma_mon_hoc_TKB			int,
	@Ma_phong				int,
	@Ma_nam_hoc				int,
	@STT_tuan				int,
	@Thu_trong_tuan			int,
	@Buoi					nvarchar(10),
	@User1					varchar(40), -- Ngay_cap_nhat_cuoi
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN	
	SET @User1 = GETDATE()
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
	SELECT @ID = ID FROM SuDung
		WHERE User1 = @User1
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
	@Ten					nvarchar(200) output,
	@Tinh_trang				int output,
	@Ly_do_reject			nvarchar(2000),
	@Hoc_ki					int,
	@Nam_bat_dau			nvarchar(20),
	@Nam_ket_thuc			nvarchar(20),
	@Ngay_gui				datetime,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40) 
AS
BEGIN 
	--DECLARE @Ma_chuyen_nganh int
	--DECLARE @Ma_quyet_dinh int
	DECLARE @Ki_hieu_lop varchar(15)
	SELECT @Ki_hieu_lop = Ki_hieu FROM LopHoc WHERE ID = @Ma_lop
	--SELECT @Ma_chuyen_nganh = Ma_chuyen_nganh, @Ma_quyet_dinh = Ma_quyet_dinh FROM LopHoc WHERE ID = @Ma_lop
	--DECLARE @Ma_trinh_do int
	--DECLARE @Ten_trinh_do nvarchar(100)
	--DECLARE @Ten_trinh_do_tat varchar(10)
	--SELECT @Ma_trinh_do = Ma_trinh_do FROM ChuongTrinhDaoTao WHERE Ma_nghe = @Ma_chuyen_nganh AND Ma_quyet_dinh = @Ma_quyet_dinh
	--SELECT @Ten_trinh_do = Ten, @Ten_trinh_do_tat = User1 FROM HeDaoTao WHERE ID = @Ma_trinh_do
	--DECLARE @Ten_chuyen_nganh nvarchar(100)
	--DECLARE @Ten_chuyen_nganh_tat nvarchar(10)
	--SELECT @Ten_chuyen_nganh = Ten_chuyen_nganh, @Ten_chuyen_nganh_tat = User1 FROM ChuyenNganh WHERE ID = @Ma_chuyen_nganh
	SET @Ten = N'HỌC KÌ ' + cast(@Hoc_ki As nvarchar) + ' (' + @Nam_bat_dau + '-' + @Nam_ket_thuc + ') - ' +  @Ki_hieu_lop
	SET @Ngay_tao=GETDATE()
	SET @Ngay_cap_nhat_cuoi=GETDATE()
	--SET @User1 = 'TKB HK ' + cast(@Hoc_ki As varchar) + ' HE ' + @Ten_trinh_do_tat + ' NGANH ' + @Ten_chuyen_nganh_tat + ' NH ' + @Nam_bat_dau + '-' + @Nam_ket_thuc
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
	
	SELECT	@ID = A.ID, @Ten = A.Ten,
			@Ngay_cap_nhat_cuoi= Convert(varchar(10),Ngay_cap_nhat_cuoi,110)
	FROM ThoiKhoaBieu A 
	WHERE A.Ngay_tao=@Ngay_tao	
END

GO

--sp_ISO_InsertTinhTrangCongTac.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertTinhTrangCongTac]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertTinhTrangCongTac]
GO
CREATE PROCEDURE sp_ISO_InsertTinhTrangCongTac
	@ID	int output,
	@Ma_cong_tac_thang int,
	@Ngay_cap_nhat_cuoi datetime,
	@Tinh_trang varchar,
	@Thu_tu_tuan varchar,
	@User1 varchar(40),
	@User2 varchar(40),
	@User3 varchar(40),
	@User4 varchar(40),
	@User5 varchar(40)
AS
BEGIN
	SET @Ngay_cap_nhat_cuoi = GETDATE()
	INSERT INTO TinhTrangCongTac VALUES
	(
		@Ma_cong_tac_thang,
		@Tinh_trang,
		@Thu_tu_tuan,
		@Ngay_cap_nhat_cuoi,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	SELECT @ID = ID FROM TinhTrangCongTac WHERE Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
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

--sp_ISO_PhanCa.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_PhanCa]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_PhanCa]
GO
CREATE PROC sp_ISO_PhanCa
	@ID		int,
	@User2	varchar
AS
BEGIN
	DECLARE @Ten_DN varchar(20)
	SELECT @Ten_DN = Ten_DN FROM ThanhVien WHERE ID = @ID
	UPDATE ChiTietThanhVien SET User2 = @User2
		WHERE Ten_dang_nhap = @Ten_DN
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

--sp_iso_SetCVCBKHGD.sql

/***********************************************************
* Purpose : SET "CVCB"
* Author : Tam kute
* Date: 19-12-2010
* Description: Set Cong viec chuan bi for kehoachgiangday
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].sp_iso_SetCVCBKHGD') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].sp_iso_SetCVCBKHGD
GO
CREATE PROCEDURE sp_iso_SetCVCBKHGD
	@CVCB				nvarchar(2000) output
AS
BEGIN
	SET @CVCB=N'- Chuẩn bị bài giảng, slide lý thuyết, bài hướng dẫn thực hành.
- Chuẩn bị câu hỏi trắc nghiệm lý thuyết
- Chuẩn bị máy chiếu, bảng viết'
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
	@User2					varchar(40)
	
AS
BEGIN
	SET @ngayCapNhatCuoi = GETDATE()
	UPDATE ChiTietKHGD
	SET 
		Noi_dung_TH				=	@noiDungTH,
		Cong_viec_chuan_bi		=	@congViecChuanBi,
		Ngay_cap_nhat_cuoi		=	@ngayCapNhatCuoi,
		User1					=	@User1,
		User2					=	@User2
		
	WHERE
		ID						=	@ID

	DECLARE @MaGiaoAn int
	DECLARE @CoHieu int
	SELECT @MaGiaoAN=Ma_giao_an,@CoHieu=Co_hieu FROM ChiTietKHGD WHERE ID=@ID
	IF @CoHieu <> 1 AND @CoHieu<>2
		UPDATE GiaoAn SET Giai_quyet_van_de=@noiDungTH WHERE ID=@MaGiaoAn

	IF @CoHieu=1
		UPDATE GiaoAn Set Huong_dan_ban_dau=@noiDungTH WHERE ID=@MaGiaoAn


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
	@Ten_chuong				nvarchar(4000),
	@User1					varchar,
	@User2					varchar,
	@User3					varchar,
	@User4					varchar,
	@User5					varchar,
	@Muc_tieu				nvarchar(2000)
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
		Ten_chuong			=	@Ten_chuong,
		User1				=	@User1,
		User2				=	@User2,
		User3				=	@User3,
		User4				=	@User4,
		User5				=	@User5,
		Muc_tieu			=	@Muc_tieu
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

--sp_ISO_UpdateCongTacThang.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateCongTacThang]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateCongTacThang]
GO
CREATE PROCEDURE sp_ISO_UpdateCongTacThang
	@ID	int,
	@Ma_ke_hoach_thang int,
	@Ma_cong_tac int,
	@Ngay_cap_nhat_cuoi datetime,
	@Bao_cao nvarchar(1000),
	@Ghi_chu nvarchar(1000),
	@Bo_phan_thuc_hien nvarchar(200),
	@User1 varchar(40),
	@User2 varchar(40),
	@User3 varchar(40),
	@User4 varchar(40),
	@User5 varchar(40)
AS
BEGIN
	SET @Ngay_cap_nhat_cuoi = GETDATE()
	UPDATE CongTacThang 
	SET
		Ma_ke_hoach_thang = @Ma_ke_hoach_thang,
		Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi,
		Bao_cao = @Bao_cao,
		Ghi_chu = @Ghi_chu,
		Bo_phan_thuc_hien = @Bo_phan_thuc_hien,
		User1 = @User1,
		User2 = @User2,
		User3 = @User3,
		User4 = @User4,
		User5 = @User5
	WHERE ID = @ID
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
	DECLARE @Khoa nvarchar(10)
	DECLARE @Ma_trinh_do int
	DECLARE @Ten_trinh_do nvarchar(40)
	SELECT @Ten_mon_hoc = Ten_mon_hoc FROM MonHoc WHERE ID = @Ma_mon_hoc
	SELECT @Ten_chuyen_nganh = A.Ten_nghe, @Khoa = B.Ma_khoa , @Ma_trinh_do = A.Ma_trinh_do FROM ChuongTrinhDaoTao AS A INNER JOIN QuyetDinhMoLop AS B ON A.Ma_quyet_dinh = B.ID WHERE A.ID = @Ma_chuong_trinh
	SELECT @Ten_trinh_do = Ten FROM HeDaoTao WHERE ID = @Ma_trinh_do
	SET @Ten = @Ten_mon_hoc + ' - ' + @Ten_chuyen_nganh + ' - Khóa ' + @Khoa
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

	UPDATE CHITIETKHGD SET Noi_dung_TH=@Huong_dan_ban_dau WHERE Ma_giao_an=@MaGiaoAn


END

GO

--sp_ISO_UpdateGiaoAnTichHop.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateGiaoAnTichHop]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateGiaoAnTichHop]
GO
CREATE PROCEDURE sp_ISO_UpdateGiaoAnTichHop
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

	@Gioi_thieu_chu_de nvarchar(2000),
	@HD_GTCD_GV nvarchar(2000),
	@HD_GTCD_HS nvarchar(2000),
	@Thoi_gian_GTCD int,

	@Giai_quyet_van_de nvarchar(2000),
	@HD_GQVD_GV nvarchar(2000),
	@HD_GQVD_HS nvarchar(2000),
	@Thoi_gian_GTVD int,

	@Ket_thuc_van_de nvarchar(2000),
	@HD_HDKT_GV nvarchar(2000),
	@HD_HDKT_HS nvarchar(2000),
	@Thoi_gian_HDKT int,

	@Huong_dan_tu_hoc nvarchar(2000),
	@HD_HDTH_GV nvarchar(2000),
	@Thoi_gian_HDTH int,	

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

		Gioi_thieu_chu_de=@Gioi_thieu_chu_de,
		HD_GTCD_GV=@HD_GTCD_GV,
		HD_GTCD_HS=@HD_GTCD_HS,
		Thoi_gian_GTCD=@Thoi_gian_GTCD,
		
		Giai_quyet_van_de=@Giai_quyet_van_de,
		HD_GQVD_GV=@HD_GQVD_GV,
		HD_GQVD_HS=@HD_GQVD_HS,
		Thoi_gian_GTVD=@Thoi_gian_GTVD,
		
		Huong_dan_ket_thuc=@Ket_thuc_van_de,
		HD_HDKT_GV=@HD_HDKT_GV,
		HD_HDKT_HS=@HD_HDKT_HS,
		Thoi_gian_HDKT=@Thoi_gian_HDKT,
		
		Huong_dan_tu_hoc=@Huong_dan_tu_hoc,
		HD_HDTH_GV=@HD_HDTH_GV,
		Thoi_gian_HDTH=@Thoi_gian_HDTH,
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

--sp_ISO_UpdateKeHoachThang.sql
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
		--Ten_ke_hoach_thang = @Ten_ke_hoach_thang,
		Tinh_trang = @Tinh_trang,
		Ly_do_reject = @Ly_do_reject,
		User1 = @User1,
		User2 = @User2,
		User3 = @User3,
		User4 = @User4,
		User5 = @User5
	WHERE ID = @ID
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
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateMonHocTKBByID]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateMonHocTKBByID]
GO
CREATE PROCEDURE sp_ISO_UpdateMonHocTKBByID 
	@ID						int,
	@So_noi_dung			int,
	@So_ca_thuc_hanh		int,
	@Ma_TKB					int,
	@Ma_mon_hoc				int,
	@Ma_giao_vien			int,
	@Ngay_bat_dau_LT		varchar(30) output,
	@Ngay_bat_dau_TH		varchar(30) output,
	@Ngay_ket_thuc_LT		varchar(30) output, 
	@Ngay_ket_thuc_TH		varchar(30) output,
	@Ghi_chu				nvarchar(1000),
	@Ngay_cap_nhat_cuoi		datetime,
	@Tuan_bat_dau_LT		int,
	@Tuan_bat_dau_TH		int,
	@Tuan_ket_thuc_LT		int,
	@Tuan_ket_thuc_TH		int,
	--@Ten_mon_hoc			nvarchar(200),
	--@Ten_giao_vien			nvarchar(200),
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)																					
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
		--Ten_mon_hoc				=	@Ten_mon_hoc,
		--Ten_giao_vien			=	@Ten_giao_vien,
		User1					=	@User1, -- Ma phong LT
		User2					=	@User2, -- Ma phong TH
		User3					=	@User3,
		User4					=	@User4,
		User5					=	@User5
	WHERE
		ID						=	@ID
	SELECT	@ID = A.ID, @Ngay_cap_nhat_cuoi = Convert(varchar(10), A.Ngay_cap_nhat_cuoi,110),
			@Ngay_bat_dau_LT = Convert(varchar(10), A.Ngay_bat_dau_LT,110),
				@Ngay_bat_dau_TH = Convert(varchar(10), A.Ngay_bat_dau_TH, 110),
					@Ngay_ket_thuc_LT = Convert(varchar(10), A.Ngay_ket_thuc_LT,110), 
						@Ngay_ket_thuc_TH = Convert(varchar(10), A.Ngay_ket_thuc_TH,110)
	FROM MonHocTKB A 
	WHERE A.ID = @ID
END			
GO

--sp_iso_updateNgayDayKHGD.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].sp_iso_UpdateNgaydayKHGD') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].sp_iso_UpdateNgaydayKHGD
GO

CREATE PROCEDURE sp_iso_UpdateNgaydayKHGD
	@MaKHGD int
AS
BEGIN
	DECLARE @NgayDay varchar(40)
	SELECT TOP 1 @NgayDay=Ngay_BD FROM ChiTietKHGD WHERE Ma_Ke_Hoach_Giang_Day=@MaKHGD
	UPDATE KeHoachGiangDay SET User2=@NgayDay WHERE ID=@MaKHGD
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
	@User5					varchar(40),
	@Gio					int,
	@Phut					int,
	@Thu					int,
	@Ghi_chu				nvarchar(4000),
	@Buoi					int,
	@Ngay					varchar(10),
	@Tinh_trang_phan_cong	varchar
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
		Tinh_trang_phan_cong	=	@Tinh_trang_phan_cong,
		Bo_sung				=	@Bo_sung,
		Gio						=	@Gio,
		Phut					=	@Phut,
		Thu						=	@Thu,
		Ghi_chu					=	@Ghi_chu,
		Buoi					=	@Buoi,
		Ngay					=	@Ngay,
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
	@User5				varchar(40),
	@Muc_tieu			nvarchar(2000)
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
		User5					=	@User5,
		Muc_tieu				=	@Muc_tieu
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
	@Tu_thang			varchar(10),
	@Den_thang			varchar(10),
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
	SET @User1 = GETDATE()
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
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40) 
AS
BEGIN
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
		--User1				=	@User1,
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

--sp_ISO_UpdateTinhTrangCongTac.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateTinhTrangCongTac]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateTinhTrangCongTac]
GO
CREATE PROCEDURE sp_ISO_UpdateTinhTrangCongTac
	@ID	int,
	@Ma_cong_tac_thang int,
	@Ngay_cap_nhat_cuoi datetime,
	@Tinh_trang varchar,
	@Thu_tu_tuan varchar,
	@User1 varchar(40),
	@User2 varchar(40),
	@User3 varchar(40),
	@User4 varchar(40),
	@User5 varchar(40)
AS
BEGIN
	SET @Ngay_cap_nhat_cuoi = GETDATE()
	UPDATE TinhTrangCongTac
	SET
		Ma_cong_tac_thang = @Ma_cong_tac_thang,
		Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi,
		Tinh_trang = @Tinh_trang,
		Thu_tu_tuan = @Thu_tu_tuan,
		User1 = @User1,
		User2 = @User2,
		User3 = @User3,
		User4 = @User4,
		User5 = @User5
	WHERE ID = @ID
END	
GO

--sp_XemDiem_DeleteChiTietDiem.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_XemDiem_DeleteChiTietDiem]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_XemDiem_DeleteChiTietDiem]
GO
CREATE PROCEDURE sp_XemDiem_DeleteChiTietDiem
	@ID	int
AS
BEGIN

	DELETE
	FROM ChiTietDiem
	WHERE ID=@ID
END
GO

--sp_XemDiem_InsertChiTietDiem.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_XemDiem_InsertChiTietDiem]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_XemDiem_InsertChiTietDiem]
GO
CREATE PROC sp_XemDiem_InsertChiTietDiem
	@ID						int output,
	@Ma_dang_ky_mon_hoc		int,
	@Ma_bai_kiem_tra		nvarchar(40),
	@Diem					float,
	@Ghi_chu				nvarchar(40),
	@Ngay_cap_nhat_cuoi		datetime


AS
BEGIN
	set @Ngay_cap_nhat_cuoi = getdate()
	insert into ChiTietDiem(
					Ma_dang_ky_mon_hoc,
					Ma_bai_kiem_tra,
					Diem,
					Ghi_chu,
					Ngay_cap_nhat_cuoi
				)
	values(				
					@Ma_dang_ky_mon_hoc,
					@Ma_bai_kiem_tra,
					@Diem,
					@Ghi_chu,
					@Ngay_cap_nhat_cuoi
	)
	
	SELECT @ID = ID FROM ChiTietDiem WHERE Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
END

GO

--sp_XemDiem_UpdateChiTietDiem.sql
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_XemDiem_UpdateChiTietDiem]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_XemDiem_UpdateChiTietDiem]
GO
CREATE PROC sp_XemDiem_UpdateChiTietDiem
	@ID						int,
	@Ma_dang_ky_mon_hoc		int,
	@Ma_bai_kiem_tra		nvarchar(40),
	@Diem					float,
	@Ghi_chu				nvarchar(40),
	@Ngay_cap_nhat_cuoi		datetime


AS
BEGIN
	set @Ngay_cap_nhat_cuoi = getdate()
	Update ChiTietDiem SET
					Ma_dang_ky_mon_hoc = @Ma_dang_ky_mon_hoc,
					Ma_bai_kiem_tra = @Ma_bai_kiem_tra,
					Diem = @Diem,
					Ghi_chu = @Ghi_chu,
					Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
	Where ID = @ID			
END
GO

--storeGenerateGiaoAn.sql
/***********************************************************
* Purpose : Generate giao an
* Author : Tam Kute
* Date: 21-11-2010S
* Description: Generate giao an
***********************************************************/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[sp_iso_GenerateGiaoAn]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[sp_iso_GenerateGiaoAn]
GO
CREATE PROC [sp_iso_GenerateGiaoAn]
	@MaKHGD int
AS
BEGIN
	DECLARE @MaCTKHGD  int
	DECLARE @TenChuong nvarchar(2000)
	DECLARE @CoHieu int
	DECLARE @NoiDungTH nvarchar(2000)
	DECLARE @CongViecChuanBi nvarchar(2000)
	DECLARE @STTNoiDung int
	DECLARE @Nhom int
	DECLARE @Tuan int
	DECLARE @MaGiaoAn int
	DECLARE @TempSTTND int	
	DECLARE @CoHieuLT int
	DECLARE @CoHieuTH int
	DECLARE @SoGiaoAn int
	DECLARE @MaGiaoVien int
	DECLARE @DateCurrent datetime
	DECLARE @CoHieuTemp int
	DECLARE @Muc_Tieu_Bai_Hoc nvarchar(2000)
	DECLARE @Ngay_BD datetime
	---------SET---------------------------------------
	SET @CoHieuLT=0
	SET @CoHieuTH=1
	SET @SoGiaoAn=1
	SET @DateCurrent=GETDATE()
	---------------SET GIAO AN LY THUYET---------------
	DECLARE @MucTieu nvarchar(2000)
	DECLARE @DoDungPTDH nvarchar(2000)
	DECLARE @OnDinhLH nvarchar(2000)
	DECLARE @ThoiGianOD int	
	DECLARE @ThoiGianTHBH int
	DECLARE @DanNhap nvarchar(2000)
	DECLARE @HDDanNhapGV nvarchar(2000)
	DECLARE @HDDanNhapHS nvarchar(2000)
	DECLARE @ThoiGianDN int 
	DECLARE @NoiDungBaiGiang nvarchar(4000)
	DECLARE @HDGiangBaiMoiGV nvarchar(2000)
	DECLARE @HDGiangBaiMoiHS nvarchar(2000)
	DECLARE @ThoiGianBaiGiang int
	DECLARE @CungCoKienThuc nvarchar(2000)
	DECLARE @HDCungCoGV nvarchar(2000)
	DECLARE @HDCungCoHS nvarchar(2000)
	DECLARE @ThoiGianCungCo int
	DECLARE @HuongDanTuHoc nvarchar(40)
	DECLARE @HDHuongDanTHGV nvarchar(2000)
	DECLARE @HDHuongDanTHHS nvarchar(2000)
	DECLARE @ThoiGianHDTH	int		
	DECLARE @TaiLieuThamKhao nvarchar(40)
	

		--SET @MucTieu=N'Giáo viên update Mục tiêu của bài giảng'
		SET @DoDungPTDH=N'- Bảng viết + viết lông viết bảng ---- Máy tính + Slide trình chiếu ---- Máy chiếu + Màn chiếu '
		SET @OnDinhLH=N'- Setup projector --- Điểm danh lớp'
		SET @ThoiGianOD=10
		SET @ThoiGianTHBH=215
		--SET @DanNhap=N'Giáo viên update nội dung phần DẪN NHẬP'
		SET @HDDanNhapGV=N'- Thuyết trình ---- Trình chiếu ---- Phát vấn ---- Quản lý lớp.'
		SET @HDDanNhapHS=N'- Lắng nghe ---- Quan sát ---- Trả lời câu hỏi ---- Ghi bài.'
		SET @ThoiGianDN=30
		SET @NoiDungBaiGiang=''
		SET @HDGiangBaiMoiGV=N'- Chia nhóm ---- Hướng dẫn chủ đề thảo luận ---- Quản lý lớp ---- Tổng kết nội dung ---- Thuyết trình có minh họa bằng slide trình chiếu ---- Đặt câu hỏi.'
		SET @HDGiangBaiMoiHS=N'- Xem tài liệu về bài học ---- Phân tích dữ liệu thông tin ---- Thảo luận ---- Trình bày kết quả thảo luận ---- Lắng nghe và ghi chép vào tài liệu học tập ---- Trả lời câu hỏi '
		SET @ThoiGianBaiGiang=165
		SET @CungCoKienThuc=N''
		SET @HDCungCoGV=N'- Đặt câu hỏi ---- Thuyết trình hệ thống lại kiến thức.'
		SET @HDCungCoHS=N'- Lắng nghe ---- Trả lời câu hỏi ---- Ghi bài.'
		SET @ThoiGianCungCo=10
		SET @HuongDanTuHoc=N''
		SET @HDHuongDanTHGV=N'- Đặt câu hỏi ---- Hướng dẫn thực hiện.'
		SET @HDHuongDanTHHS=N'- Lắng nghe ghi bài ---- Làm bài tập theo yêu cầu'
		SET @ThoiGianHDTH=10
		SET @TaiLieuThamKhao=N''

	---------------SET GIAO AN THUC HANH---------------
		DECLARE @MucTieu2 nvarchar(2000)
		DECLARE @DoDungPTDH2 nvarchar(2000)
		DECLARE @HinhThucTCDH2 nvarchar(2000)
		DECLARE @OnDinhLH2 nvarchar(2000)
		DECLARE @ThoiGianOnDinh2 int--10
		DECLARE @ThoiGianTHBH2	int--290
		DECLARE @DanNhap2 nvarchar(2000)
		DECLARE @HDDanNhapGV2 nvarchar(2000)
		DECLARE @HDDanNhapHS2 nvarchar(2000)
		DECLARE @ThoiGianDN2 int--20
		DECLARE @HuongDanBanDau2 nvarchar(2000)
		DECLARE @HDHuongDanBDGV2 nvarchar(2000)
		DECLARE @HDHuongDanBDHS2 nvarchar(2000)
		DECLARE @ThoiGianHDBD2 int --50
		DECLARE @HuongDanThuongXuyen2 nvarchar(2000)
		DECLARE @HDHuongDanTXGV2 nvarchar(2000)
		DECLARE @HDHuongDanTXHS2 nvarchar(2000)
		DECLARE @ThoiGianHDTX2 int --190
		DECLARE @HDHuongDanKT2 nvarchar(2000)
		DECLARE @HDHuongDanKTGV2 nvarchar(2000)
		DECLARE @HDHuongDanKTHS2 nvarchar(2000)
		DECLARE @ThoiGianHDKT int --20
		DECLARE @HuongDanRenLuyen2 nvarchar(2000)
		DECLARE @HDHuongDanRLGV2 nvarchar(2000)
		DECLARE @ThoiGianHDRL2 int --10
		DECLARE @RutKinhNghiem2 nvarchar(2000)

			SET @MucTieu2=N'Giáo viên update Mục tiêu của bài giảng'
			SET @DoDungPTDH2=N'- Bảng viết + viết lông viết bảng ---- Máy tính thực hành'
			SET @HinhThucTCDH2=N'- Hướng dẫn ban đầu tập trung ---- Học viên thực hành theo nhóm -> báo cáo kết quả'
			SET @OnDinhLH2=N'Setup projector --- Điểm danh lớp'
			SET @ThoiGianOnDinh2=10
			SET @ThoiGianTHBH2=290
			--SET @DanNhap2=N'Giáo viên update nội dung phần DẪN NHẬP'
			SET @HDDanNhapGV2=N'- Thuyết trình ---- Trình chiếu ---- Phát vấn ---- Quản lý lớp.'
			SET @HDDanNhapHS2=N'- Lắng nghe ---- Quan sát ---- Trả lời câu hỏi ---- Ghi bài.'
			SET @ThoiGianDN2=20
			SET @HuongDanBanDau2=N''
			SET @HDHuongDanBDGV2=N'- Thuyết trình có minh họa bằng Slide trình chiếu ---- Thao tác mẫu nội dung thực hành ---- Cho bài tập thực hành, chia nhóm ---- Chia nhóm.'
			SET @HDHuongDanBDHS2=N'- Nghe nhắc lại nội dung lý thuyết ---- Quan sát giáo viên thao tác mẫu ---- Tìm nhóm thực hành ---- Phân công công việc trong nhóm.'
			SET @ThoiGianHDBD2=50
			SET @HuongDanThuongXuyen2=N'- Kiểm tra các bước thực hiện của từng nhóm, học sinh ---- Xử lý lỗi trong khi thực hiện ---- Hỗ trợ học viên thực hiện thao tác chưa chính xác'
			SET @HDHuongDanTXGV2=N'- Quan sát thao tác học viên ---- Nhắc nhở học viên sửa sai thao tác ---- Làm mẫu lại cho những nhóm yếu.'
			SET @HDHuongDanTXHS2=N'- Thực hành theo bài tập ---- Ghi chú lại những lưu ý quan trọng ---- Ghi nhận lại những lỗi thường xảy ra khi thực hiện.'
			SET @ThoiGianHDTX2=190
			SET @HDHuongDanKT2=N'- Kiểm tra kết quả thực hiện của từng nhóm, học sinh ---- Hệ thống các lỗi thường gặp khi thực hành ---- Những lưu ý cần thiết trong quá trình chuyển đổi hệ đếm'
			SET @HDHuongDanKTGV2=N'- Thuyết trình ---- Quản lý lớp ---- Tổng kết nội dung.'
			SET @HDHuongDanKTHS2=N'- Lắng nghe ---- Ghi chú ---- Quan sát, so sánh kết quả với bài làm.'
			SET @ThoiGianHDKT=20
			SET @HuongDanRenLuyen2=N''
			SET @HDHuongDanRLGV2=N'-Đưa ra các câu hỏi trắc nghiệm lý thuyết, giúp cho học sinh nắm được toàn bộ nội dung bài học. ---- Đưa ra bài thực hành cá nhân để học sinh tự thực hiện.'
			SET @ThoiGianHDRL2=10
			SET @RutKinhNghiem2=N''
	---------------SET GIAO AN TICH HOP----------------
	DECLARE @MucTieu3 nvarchar(2000)
	DECLARE @DoDungPTDH3 nvarchar(2000)
	DECLARE @HinhThucTCDH3 nvarchar(2000)
	DECLARE @OnDinhLH3 nvarchar(2000)
	DECLARE @ThoiGianOnDinh3 int --10
	DECLARE @ThoiGianTHBH3 int --230
	DECLARE @DanNhap3 nvarchar(2000)
	DECLARE @HDDanNhapGV3 nvarchar(2000)
	DECLARE @HDDanNhapHS3 nvarchar(2000)
	DECLARE @ThoiGianDanNhap3 int --10
	DECLARE @GioiThieuChuDe3 nvarchar(2000)
	DECLARE @HDGTCDGV3 nvarchar(2000)
	DECLARE @HDGTCDHS3 nvarchar(2000)
	DECLARE @ThoiGianGTCD3 int --20
	DECLARE @GiaiQuyetVanDe3 nvarchar(2000)
	DECLARE @HDGQVDGV3 nvarchar(2000)
	DECLARE @HDGQVDHS3 nvarchar(2000)
	DECLARE @ThoiGianGTVD3 int --170
	DECLARE @KetThucVanDe3 nvarchar(2000)
	DECLARE @HDHDKTGV3 nvarchar(2000)
	DECLARE @HDHDKTHS3 nvarchar(2000)
	DECLARE @ThoiGianHDKT3 int --30
	DECLARE @HuongDanTuHoc3 nvarchar(2000)
	DECLARE @HDTuHocGV3 nvarchar(2000)
	DECLARE @ThoiGianHDTH3 int --5
	DECLARE @RutKinhNghiem3 nvarchar(2000)

			SET @MucTieu3=N'Giáo viên update Mục tiêu của bài giảng' --Lay Tu Muc_Tieu_Bai_Hoc Cua DeCuongMonHoc
			SET @DoDungPTDH3=N'Laptop, Projector, Bảng ,viết'
			SET @HinhThucTCDH3=N'Sử dụng máy chiếu, chiếu slide trình bày --- Trả lời các câu hỏi của học viên'
			SET @OnDinhLH3=N'Setup projector --- Điểm danh lớp'
			SET @ThoiGianOnDinh3=10
			SET @ThoiGianTHBH3=215
			SET @DanNhap3=N'Giáo viên update nội dung phần DẪN NHẬP' --Lay Tu Ten Chuong Cua ChiTietKHGD, Khong lay order
			SET @HDDanNhapGV3=N'- Đưa ra những đoạn phim, hình ảnh về ứng dụng của bài học.--- -  Đặt câu hỏi cho học sinh.'
			SET @HDDanNhapHS3=N'- Chú ý theo dõi về những đoạn phim, hình ảnh. --- - Nhận xét về tính ứng dụng của bài học trong thực tế. --- - Trả lời các câu hỏi giáo viên đưa ra.'
			SET @ThoiGianDanNhap3=10
			SET @GioiThieuChuDe3=N'Giáo viên update nội dung phần GIỚI THIỆU CHỦ ĐỀ' --Lay tu noi dung ly thuyet bo vao cua ban chi tiet khgd
			SET @HDGTCDGV3=N'- Cho xem trước sản phẩm mẫu của bài học.--- - Phát phiếu hướng dẫn thực hiện cho học sinh xem các bước thực hiện.'
			SET @HDGTCDHS3=N'- Chú ý theo dõi các demo hướng dẫn của giáo viên. --- - Trả lời các câu hỏi của giáo viên đưa ra. --- - Đặt câu hỏi với các kiến thức mới.'
			SET @ThoiGianGTCD3 =20
			SET @GiaiQuyetVanDe3 =N'Giáo viên update nội dung phần GIẢI QUYẾT VẤN ĐỀ' --Lay tu noi dung thuc hanh cua chitietkhgd
			SET @HDGQVDGV3 =N'-Trình chiều slide về các khai niệm cơ bản , các thuật ngữ chuyên môn trong bài học.--- - Làm theo các bước theo phiếu hướng dẫn thực hiện một cách chi tiết, chậm rãi cho học sinh theo dõi. --- - Hướng dẫn cách làm từng bước cho học sinh. --- - Quan sát cách làm của học sinh, hướng dẫn các bạn làm chậm.'
			SET @HDGQVDHS3 =N'- Xem slide và xem các thao tác mẫu của giáo viên. --- -  Đối chiếu theo phiếu hướng dẫn thực hiện. - Thực hành theo hướng dẫn của giáo viên. --- -Thắc mắc các bước cài đặt khó.'
			SET @ThoiGianGTVD3 =150
			SET @KetThucVanDe3 =''
			SET @HDHDKTGV3 =N'-Tóm tắt lại toàn bộ nội dung lý thuyết , thực hành của bài học, các ý chính của từng mục. --- - Thao tác mẫu lại 1 lần nữa để học sinh nắm rõ các bước thực hành.'
			SET @HDHDKTHS3 =N'-Hệ thống hóa lại toàn bộ nội dung của bài học, đặt câu hỏi. --- -Hệ thống hóa lại toàn bộ nội dung của bài học, đặt câu hỏi. --- - Quan sát các thao tác và review lại các thao tác còn thiếu.'
			SET @ThoiGianHDKT3 =30
			SET @HuongDanTuHoc3 =''
			SET @HDTuHocGV3 =N'-Đưa ra các câu hỏi trắc nghiệm lý thuyết, giúp cho học sinh nắm được toàn bộ nội dung bài học. --- - Đưa ra bài thực hành cá nhân để học sinh tự thực hiện.'
			SET @ThoiGianHDTH3 =5
			SET @RutKinhNghiem3 =N''
			
	---------------------------------------------------
	--GET CHITIETKHGD
	DECLARE arrayCTKHGD CURSOR FOR
	(
		SELECT ID As MaCTKHGD,Ngay_BD,Ten_chuong,Co_hieu,Noi_dung_TH,Cong_viec_chuan_bi,STT_Noi_Dung,nhom As Nhom,Tuan,Ma_giao_an,Muc_tieu_bai_hoc
		FROM ChiTietKHGD 
		WHERE Ma_ke_hoach_giang_day=@MaKHGD
	)

	--OPEN ARRAY
	OPEN arrayCTKHGD 

	FETCH NEXT FROM arrayCTKHGD 
	INTO @MaCTKHGD,@Ngay_BD,@TenChuong,@CoHieu,@NoiDungTH,@CongViecChuanBi,@STTNoiDung,@Nhom,@Tuan,@MaGiaoAn,@Muc_Tieu_Bai_Hoc
	

	SET @TempSTTND =-1
	SET @CoHieuTemp=-1
	SELECT @MaGiaoVien=Ma_nguoi_tao FROM KeHoachGiangDay WHERE ID=@MaKHGD
	
	WHILE @@FETCH_STATUS=0
	BEGIN
	
		-------------------------------------------------------------------------------------
		IF ISNULL(@MaGiaoAn,'') ='' 
				AND ( @STTNoiDung <> @TempSTTND OR (@STTNoiDung = @TempSTTND AND @CoHieu <> @CoHieuTemp)) 
		BEGIN
			
			SET @TempSTTND=@STTNoiDung
			SET @CoHieuTemp=@CoHieu
			IF @CoHieu = @CoHieuLT
			BEGIN
				SET	@MucTieu=@Muc_Tieu_Bai_Hoc
				SET @DanNhap=@Muc_Tieu_Bai_Hoc
				SET @NoiDungBaiGiang=@TenChuong
				SET @CungCoKienThuc=@Muc_Tieu_Bai_Hoc
		
				--------------------CALL STORE INSERT GiaoAn LY THUYET--------------------------
				Execute sp_ISO_InsertGiaoAnLyThuyet
						@MaGiaoAn output,@MaKHGD,@SoGiaoAn,@Ngay_BD,@MucTieu,@DoDungPTDH,@OnDinhLH
						,@ThoiGianOD,@ThoiGianTHBH,@DanNhap,@HDDanNhapGV,@HDDanNhapHS,@ThoiGianDN,@NoiDungBaiGiang,@HDGiangBaiMoiGV,@HDGiangBaiMoiHS,@ThoiGianBaiGiang
						,@CungCoKienThuc,@HDCungCoGV,@HDCungCoHS,@ThoiGianCungCo,@HuongDanTuHoc,@HDHuongDanTHGV,@HDHuongDanTHHS
						,@ThoiGianHDTH,@TaiLieuThamKhao,@DateCurrent,@TenChuong,@MaGiaoVien

			END
			ELSE IF @CoHieu = @CoHieuTH			
			BEGIN
				SET	@MucTieu2=@Muc_Tieu_Bai_Hoc
				SET @DanNhap2=@Muc_Tieu_Bai_Hoc
				SET @TenChuong=@NoiDungTH
				SET @HuongDanBanDau2=@NoiDungTH
				--------------------CALL STORE INSERT GiaoAn THUC HANH--------------------------
				Execute sp_ISO_InsertGiaoAnThucHanh
						@MaGiaoAn output,@MaKHGD,@SoGiaoAn,@Ngay_BD,@MucTieu2,@DoDungPTDH2,@HinhThucTCDH2,@OnDinhLH2,@ThoiGianOnDinh2
						,@ThoiGianTHBH2,@DanNhap2,@HDDanNhapGV2,@HDDanNhapHS2,@ThoiGianDN2,@HuongDanBanDau2,@HDHuongDanBDGV2,@HDHuongDanBDHS2
						,@ThoiGianHDBD2,@HuongDanThuongXuyen2,@HDHuongDanTXGV2,@HDHuongDanTXHS2,@ThoiGianHDTX2,@HDHuongDanKT2,@HDHuongDanKTGV2
						,@HDHuongDanKTHS2,@ThoiGianHDKT,@HuongDanRenLuyen2,@HDHuongDanRLGV2,@ThoiGianHDRL2,@RutKinhNghiem2,@DateCurrent,@TenChuong,@MaGiaoVien
			END
			ELSE
			BEGIN
				--------------------CALL STORE INSERT GiaoAn TICH HOP--------------------------
				SET @GiaiQuyetVanDe3=@NoiDungTH
				SET @GioiThieuChuDe3=@TenChuong
				SET	@MucTieu3=@Muc_Tieu_Bai_Hoc
				SET @DanNhap3=@Muc_Tieu_Bai_Hoc
			
				Execute sp_ISO_InsertGiaoAnTichHop
						@MaGiaoAn output,@MaKHGD,@SoGiaoAn,@Ngay_BD,@MucTieu3,@DoDungPTDH3,@HinhThucTCDH3,@OnDinhLH3,@ThoiGianOnDinh3,@ThoiGianTHBH3
						,@DanNhap3,@HDDanNhapGV3,@HDDanNhapHS3,@ThoiGianDanNhap3,@GioiThieuChuDe3,@HDGTCDGV3,@HDGTCDHS3,@ThoiGianGTCD3,@GiaiQuyetVanDe3,@HDGQVDGV3,@HDGQVDHS3
						,@ThoiGianGTVD3,@KetThucVanDe3,@HDHDKTGV3,@HDHDKTHS3,@ThoiGianHDKT3,@HuongDanTuHoc3,@HDTuHocGV3,@ThoiGianHDTH3,@RutKinhNghiem3,@DateCurrent,@TenChuong,@MaGiaoVien
			END

			SET @SoGiaoAn=@SoGiaoAn+1

			IF ISNULL(@MaGiaoAn,-1)<>-1
			BEGIN
				UPDATE ChiTietKHGD SET Ma_giao_an=@MaGiaoAn WHERE ID=@MaCTKHGD
				UPDATE GiaoAn SET User1=@CoHieu WHERE ID=@MaGiaoAn
			END
		END
		-------------------------------------------------------------------------------------
		
		FETCH NEXT FROM arrayCTKHGD 
		INTO @MaCTKHGD,@Ngay_BD,@TenChuong,@CoHieu,@NoiDungTH,@CongViecChuanBi,@STTNoiDung,@Nhom,@Tuan,@MaGiaoAn,@Muc_Tieu_Bai_Hoc				

	END


	--CLOSE ARRAY
	CLOSE arrayCTKHGD
	--FREE ARRAY 			
	DEALLOCATE arrayCTKHGD 
			
END

GO