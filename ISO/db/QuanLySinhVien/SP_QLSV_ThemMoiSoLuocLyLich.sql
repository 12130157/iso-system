/*
Tác giả: La Quốc Chương
Ngày : 28/09/2011
Mô tả : SP_QLSV_ThemMoiSoLuocLyLich dùng để thêm sơ lược lý lịch của sinh viên trong module QuanLySinhVien
*/
if exists (select * from sysobjects where name = 'SP_QLSV_ThemMoiSoLuocLyLich')
begin
	drop proc SP_QLSV_ThemMoiSoLuocLyLich
end
go
create proc SP_QLSV_ThemMoiSoLuocLyLich
--thanh vien
@TenDangNhap varchar(20),
@MatKhau varchar(20),
@MaVaiTro int,
@MaBoPhan int,
--tai khoan
@SoTaiKhoan varchar(20),
@NganHang varchar(20),
@NgayLapThe datetime,
--dia chi
@SoNha nvarchar(20),
@Duong nvarchar(300),
@Phuong nvarchar(50),
@Quan nvarchar(50),
@ThanhPho nvarchar(50),
@DTNha varchar(20),
--bang cap 
@LoaiBang nvarchar(40),
@TruongCap nvarchar(200),
@LoaiTotNghiep nvarchar(10),
--chi tiet thanh vien 
--chu y ma dia chi va ma tinh trang = 1
@Ho nvarchar(40),
@TenLot nvarchar(40),
@Ten nvarchar(40),
@NgaySinh datetime,
@Email varchar(40),
@DTDD varchar(20),
@CMND varchar(15),
--thong tin ca nhan gia dinh
@HoTenKhaiSinh nvarchar(100),
@TenThuongGoi nvarchar(100),
@QueQuan nvarchar(100),
@DanToc nvarchar(100),
@TrinhDoHocVanTruocKhiVaoHoc nvarchar(100),
@NgayChinhThuc datetime,
@HoTenBo nvarchar(100),
@NgheNghiepBo nvarchar(100),
@HoTenMe nvarchar(100),
@NgheNghiepMe nvarchar(100),
@HoTenVoChong nvarchar(100),
@NgheNghiepVoChong nvarchar(100),
@DoiTuongThuocDienChinhSach nvarchar(100),
@NgheNghiepLamTruocKhiVaoHoc nvarchar(100),
@NguyenVong nvarchar(500),
@GioiTinh int,
@NoiSinh nvarchar(100),
@NoiDangKyThuongTru nvarchar(100),
@TonGiao nvarchar(100),
@NgayThamGiaDang datetime,
@NgayKetNapDoan datetime,
@ketQua int output
as
begin
	declare @MaThanhVien int
	declare @MaTaiKhoan int
	declare @MaBangCap int
	declare @MaDiaChi int
	declare @n int
	set @n = 0
	set @MaThanhVien = 0
	set @MaTaiKhoan = 0
	set @MaBangCap = 0
	set @MaDiaChi = 0
	if not exists (select * from ChiTietThanhVien where Ten_dang_nhap = @TenDangnhap)
	begin
		--insert vao thanhvien - select * from thanhvien
		insert into ThanhVien (Ten_DN,Mat_khau,Ma_vai_tro,Ma_bo_phan)
			values (@TenDangNhap,@MatKhau,@MaVaiTro,@MaBoPhan)
		--lay ma thanh vien tu cau insert tren
		set @MaThanhVien = (select id from ThanhVien where Ten_DN = @TenDangNhap)
		--insert vao taikhoanselect * from taikhoan - select * from taiKhoan
		insert into TaiKhoan (So_tai_khoan,Ngan_hang,Ngay_lap_the)
			values (@SoTaiKhoan,@NganHang,@NgayLapThe)
		--lay ma tai khoan tu cau insert tren
		set @MaTaiKhoan = (select top 1 id from TaiKhoan order by id desc)
		--insert vao diachi - select * from diachi
		insert into DiaChi (So_nha,Duong,Phuong_xa,Quan_huyen,Tinh_Thanhpho,Dien_thoai_nha)
			values (@SoNha,@Duong,@Phuong,@Quan,@ThanhPho,@DTNha)
		--lay ma dia chi tu cau insert tren
		set @MaDiaChi = (select top 1 id from DiaChi order by id desc)
		--insert vao bangcap - select * from bangcap
		insert into BangCap (Ma_thanh_vien,Loai_bang,Truong_cap,Loai_tot_nghiep)
			values (@MaThanhVien,@LoaiBang,@TruongCap,@LoaiTotNghiep)
		--lay ma bang cap tu cau insert tren
		set @MaBangCap = (select top 1 id from BangCap where Ma_thanh_vien = @MaThanhVien)
		--insert vao thong tin ca nhan gia dinh - select * from thongtincanhangiadinh
		insert into ThongTinCaNhanGiaDinh values (@TenDangNhap,@HoTenKhaiSinh,@TenThuongGoi,
				@QueQuan,@DanToc,@TrinhDoHocVanTruocKhiVaoHoc,@NgayChinhThuc,@HoTenBo,
				@NgheNghiepBo,@HoTenMe,@NgheNghiepMe,@HoTenVoChong,@NgheNghiepVoChong,
				@DoiTuongThuocDienChinhSach,@NgheNghiepLamTruocKhiVaoHoc,@NguyenVong,
				@GioiTinh,@NoiSinh,@NoiDangKyThuongTru,@TonGiao,@NgayThamGiaDang,
				@NgayKetNapDoan)
		--insert vao chi tiet thanh vien
		insert into ChiTietThanhVien (Ten_dang_nhap,Ho,Ten_lot,Ten,Ngay_sinh,
				Ma_dia_chi,Email,Dien_thoai_dd,Ma_bang_cap,Ma_tai_khoan,Tinh_trang,
				Chung_minh_nhan_dan) values (@TenDangNhap,@Ho,@TenLot,@Ten,
				@NgaySinh,@MaDiaChi,@Email,@DTDD,@MaBangCap,@MaTaiKhoan,1,@CMND)		
		set @n = 1
	end
	set @ketQua = @n
end

/* -- 7,20,29,43,44 là ngày tháng
declare @ketQua int
exec SP_QLSV_ThemMoiSoLuocLyLich 'ThienVD1','123',9,6,'123','123',
							'2011-09-30','123','123','123','123','123',
							'123','123','123','123','123','123',
							'123','2011-09-30','123','123','123','123',
							'123','123','123','123','2011-09-30','123',
							'123','123','123','123','123','123',
							'123','123','123','123',0,'123','2011-09-30',
							'2011-09-30',@ketQua output
print @ketQua
select * from taiKhoan
select * from thanhvien where ten_dn like '%ThienVD2%'
*/