--AUTHOR : LA QUOC CHUONG
--DATETIME : 6/9/2011
--PURPOSE : UPDATE PERSONAL INFORMATION IN QUANLYSINHVIEN MODULE
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'SP_QLSV_UPDATE_SINHVIEN')
BEGIN
	DROP PROC SP_QLSV_UPDATE_SINHVIEN
END
GO
CREATE PROC SP_QLSV_UPDATE_SINHVIEN
@MaThanhVien nvarchar(100),
@HoThanhVien nvarchar(100),
@SoNha nvarchar(100),
@TenLot nvarchar(100),
@Duong nvarchar(100),
@Ten nvarchar(100),
@Phuong nvarchar(100),
@NgaySinh datetime,
@Quan nvarchar(100),
@Email nvarchar(100),
@ThanhPho nvarchar(100),
@CMND nvarchar(100),
@DTNha nvarchar(100),
@DTDD nvarchar(100),
@SoTK nvarchar(100),
@NganHang nvarchar(100),
@LoaiBang nvarchar(100),
@TruongCap nvarchar(100),
@NgayLapThe datetime,
@LoaiTotNghiep nvarchar(100)
AS
BEGIN
	declare @TenDangNhap nvarchar(100)
	set @TenDangNhap = (select ten_dn from thanhvien where id = @MaThanhVien)
	declare @MaDiaChi nvarchar(100)
	set @MaDiaChi  = (select ma_dia_chi from chitietthanhvien where ten_dang_nhap = @TenDangNhap)
	declare @MaTaiKhoan nvarchar(100)
	set @MaTaiKhoan = (select ma_tai_khoan from chitietthanhvien where ten_dang_nhap = @TenDangNhap)
	declare @MaBangCap nvarchar(100)
	set @MaBangCap = (select ma_bang_cap from chitietthanhvien where ten_dang_nhap = @TenDangNhap)

	--kiểm tra mã địa chỉ
	if(@MaDiaChi is null)
	begin
		insert into diachi (so_nha,duong,phuong_xa,quan_huyen,tinh_thanhpho,dien_thoai_nha)	values(@SoNha,@Duong,@Phuong,@Quan,@ThanhPho,@DTNha)
		set @MaDiaChi = (select top(1) id from diachi order by id desc)
	end
	else 
	begin
		update diachi set so_nha = @SoNha, duong = @Duong, phuong_xa = @Phuong, quan_huyen = @Quan, tinh_thanhpho = @ThanhPho, dien_thoai_nha = @DTNha where id = @MaDiaChi
	end
	
	--kiểm tra mã tài khoản
	if(@MaTaiKhoan is null)
	begin
		insert into taikhoan (so_tai_khoan,ngan_hang,ngay_lap_the) values(@SoTK,@NganHang,@NgayLapThe)
		set @MaTaiKhoan = (select top(1) id from taikhoan order by id desc)
	end
	else
	begin
		update taikhoan set so_tai_khoan = @SoTK, ngan_hang = @NganHang, ngay_lap_the = @NgayLapThe where id = @MaTaiKhoan
	end

	--kiểm tra mã bằng cấp
	if(@MaBangCap is null)
	begin
		insert into bangcap (loai_bang,truong_cap,loai_tot_nghiep) values(@LoaiBang,@TruongCap,@LoaiTotNghiep)
		set @MaBangCap = (select top(1) id from bangcap order by id desc)
	end
	else
	begin
		update bangcap set loai_bang = @LoaiBang, truong_cap = @TruongCap, loai_tot_nghiep = @LoaiTotNghiep where id = @MaBangCap
	end

	--update chi tiết thành viên
	update chitietthanhvien set ho = @HoThanhVien, ten_lot = @TenLot, ten = @Ten, ngay_sinh = @NgaySinh,
				ma_dia_chi = @MaDiaChi, email = @Email, dien_thoai_dd = @DTDD, ma_bang_cap = @MaBangCap,
				ma_tai_khoan = @MaTaiKhoan, chung_minh_nhan_dan = @CMND
	where ten_dang_nhap = @TenDangNhap
END