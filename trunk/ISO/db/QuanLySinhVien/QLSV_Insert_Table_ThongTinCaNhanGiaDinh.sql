/*
Tác giả: La Quốc Chương
Ngày: 27/09/2011
Mô tả: dùng để tạo thêm bảng ThongTinCaNhanGiaDinh để phục vụ cho việc tạo mới sơ lược lý lịch trong module QuanLySInhVien
*/
if exists (select * from sysobjects where name = 'ThongTinCaNhanGiaDinh')
begin
	drop table ThongTinCaNhanGiaDinh
end
go
create table ThongTinCaNhanGiaDinh
(
TenDangNhap varchar(20) primary key,
TenKhaiSinh nvarchar(100),
TenThuongGoi nvarchar(100),
QueQuan nvarchar(100),
DanToc nvarchar(100),
TrinhDoHocVanTruocKhiVaoHoc nvarchar(100),
NgayChinhThuc datetime,
HoTenBo nvarchar(100),
NgheNghiepBo nvarchar(100),
HoTenMe nvarchar(100),
NgheNghiepMe nvarchar(100),
HoTenVoChong nvarchar(100),
NgheNghiepVoChong nvarchar(100),
DoiTuongThuocDienChinhSach nvarchar(100),
NgheNghiepLamTruocKhiVaoHoc nvarchar(100),
NguyenVong nvarchar(500),
GioiTinh int,
NoiSinh nvarchar(100),
NoiDangKyThuongTru nvarchar(100),
TonGiao nvarchar(100),
NgayThamGiaDangCSVN datetime,
NgayKetNapDoanTNCS datetime
)