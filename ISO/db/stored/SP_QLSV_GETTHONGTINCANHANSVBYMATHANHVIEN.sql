/*
Nguoi viet: LQChuong
Ngay viet: 14/11/2011
Muc dich: lay thong tin ca nhan gia dinh sinh vien by Ten_dang_nhap

*/
if exists (select * from sysobjects where name = 'SP_QLSV_GETTHONGTINCANHANSVBYMATHANHVIEN')
begin
	drop proc SP_QLSV_GETTHONGTINCANHANSVBYMATHANHVIEN
end
go
create proc SP_QLSV_GETTHONGTINCANHANSVBYMATHANHVIEN 
@maThanhVien varchar(20)
as
begin
declare @TenDN nvarchar(100)
set @TenDN = (select Ten_DN from ThanhVien where id = @maThanhVien)
declare @MaDChi varchar(100)
SET @MaDChi = (SELECT cast(Ma_dia_chi as varchar(100)) FROM chitietthanhvien WHERE ten_dang_nhap = @TenDN)
declare @count int
set @count = (select count(*) from thongtincanhangiadinh where TenDangNhap = @TenDN)
Declare @sql nvarchar(2000)
declare @kq int
set @kq = 0
if(@MaDChi is not null and @count != 0)
begin
	set @kq = 1
	set @sql = 'select c.Ten_dang_nhap,t.GioiTinh,t.TenKhaiSinh,t.TenThuongGoi,
	(cast(DatePart(dd,c.Ngay_sinh) as varchar)+''-''+cast(DatePart(mm,c.Ngay_sinh) as varchar)+''-''+cast(DatePart(yyyy,c.Ngay_sinh) as varchar)) as [Ngay_Sinh],
	t.NoiSinh,t.QueQuan,t.NoiDangKyThuongTru,t.DanToc,
	t.TonGiao,t.TrinhDoHocVanTruocKhiVaoHoc,
	(cast(datepart(dd,t.NgayThamGiaDangCSVN) as varchar)+''-''+cast(datepart(mm,t.NgayThamGiaDangCSVN) as varchar)+''-''+cast(datepart(yyyy,t.NgayThamGiaDangCSVN) as varchar) ) as [NgayThamGiaDangCSVN],
	(cast(datepart(dd,t.NgayChinhThuc) as varchar)+''-''+cast(datepart(mm,t.NgayChinhThuc) as varchar)+''-''+cast(datepart(yyyy,t.NgayChinhThuc) as varchar) ) as [NgayChinhThuc],
	(cast(datepart(dd,t.NgayKetNapDoanTNCS) as varchar)+''-''+cast(datepart(mm,t.NgayKetNapDoanTNCS) as varchar)+''-''+cast(datepart(yyyy,t.NgayKetNapDoanTNCS) as varchar) ) as [NgayKetNapDoanTNCS],
	t.HoTenBo,t.NgheNghiepBo,t.HoTenMe,t.NgheNghiepMe,
	t.HoTenVoChong,t.NgheNghiepVoChong,t.DoiTuongThuocDienChinhSach,
	t.NgheNghiepLamTruocKhiVaoHoc,d.So_nha+'' ''+d.Duong+'' ''+d.Phuong_xa+'' ''+d.Quan_huyen+
	'' ''+d.Tinh_Thanhpho as [DiaChi],c.Dien_thoai_dd,t.NguyenVong
	from ThongTinCaNhanGiaDinh t inner join ChiTietThanhVien c
	on t.TenDangNhap = c.Ten_dang_nhap 
	inner join DiaChi d 
	on c.Ma_dia_chi = d.ID
	where c.Ten_dang_nhap = '''+@TenDN+''''
end
else if(@MaDChi is null and @count = 0)
begin
	set @kq = 2
	set @sql = 'select c.Ten_dang_nhap,''NULL'' as GioiTinh,''NULL'' as TenKhaiSinh,''NULL'' as TenThuongGoi,
	''NULL'' as [Ngay_Sinh],
	''NULL'' as NoiSinh,''NULL'' as QueQuan,''NULL'' as NoiDangKyThuongTru,''NULL'' as DanToc,
	''NULL'' as TonGiao,''NULL'' as TrinhDoHocVanTruocKhiVaoHoc,
	''NULL'' as [NgayThamGiaDangCSVN],
	''NULL'' as [NgayChinhThuc],
	''NULL'' as [NgayKetNapDoanTNCS],
	''NULL'' as HoTenBo,''NULL'' as NgheNghiepBo,''NULL'' as HoTenMe,''NULL'' as NgheNghiepMe,
	''NULL'' as HoTenVoChong,''NULL'' as NgheNghiepVoChong,''NULL'' as DoiTuongThuocDienChinhSach,
	''NULL'' as NgheNghiepLamTruocKhiVaoHoc,''NULL'' as [DiaChi],c.Dien_thoai_dd,''NULL'' as NguyenVong
	from ChiTietThanhVien c
	where c.Ten_dang_nhap = '''+@TenDN+''''
end
else if(@MaDChi is null or @count = 0)
begin
	set @kq = 3
	if(@MaDChi is null)
	begin
		set @kq =4
		set @sql = 'select c.Ten_dang_nhap,t.GioiTinh,t.TenKhaiSinh,t.TenThuongGoi,
		(cast(DatePart(dd,c.Ngay_sinh) as varchar)+''-''+cast(DatePart(mm,c.Ngay_sinh) as varchar)+''-''+cast(DatePart(yyyy,c.Ngay_sinh) as varchar)) as [Ngay_Sinh],
		t.NoiSinh,t.QueQuan,t.NoiDangKyThuongTru,t.DanToc,
		t.TonGiao,t.TrinhDoHocVanTruocKhiVaoHoc,
		(cast(datepart(dd,t.NgayThamGiaDangCSVN) as varchar)+''-''+cast(datepart(mm,t.NgayThamGiaDangCSVN) as varchar)+''-''+cast(datepart(yyyy,t.NgayThamGiaDangCSVN) as varchar) ) as [NgayThamGiaDangCSVN],
		(cast(datepart(dd,t.NgayChinhThuc) as varchar)+''-''+cast(datepart(mm,t.NgayChinhThuc) as varchar)+''-''+cast(datepart(yyyy,t.NgayChinhThuc) as varchar) ) as [NgayChinhThuc],
		(cast(datepart(dd,t.NgayKetNapDoanTNCS) as varchar)+''-''+cast(datepart(mm,t.NgayKetNapDoanTNCS) as varchar)+''-''+cast(datepart(yyyy,t.NgayKetNapDoanTNCS) as varchar) ) as [NgayKetNapDoanTNCS],
		t.HoTenBo,t.NgheNghiepBo,t.HoTenMe,t.NgheNghiepMe,
		t.HoTenVoChong,t.NgheNghiepVoChong,t.DoiTuongThuocDienChinhSach,
		t.NgheNghiepLamTruocKhiVaoHoc,''NULL'' as [DiaChi],c.Dien_thoai_dd,t.NguyenVong
		from ThongTinCaNhanGiaDinh t inner join ChiTietThanhVien c
		on t.TenDangNhap = c.Ten_dang_nhap 		
		where c.Ten_dang_nhap = '''+@TenDN+''''
	end
	else if(@count = 0)
	begin
		set @kq = 5
		set @sql = 'select c.Ten_dang_nhap,''NULL'' as GioiTinh,''NULL'' as TenKhaiSinh,''NULL'' as TenThuongGoi,
		''NULL'' as [Ngay_Sinh],''NULL'' as NoiSinh,''NULL'' as QueQuan,''NULL'' as NoiDangKyThuongTru,
		''NULL'' as DanToc,
		''NULL'' as TonGiao,''NULL'' as TrinhDoHocVanTruocKhiVaoHoc,
	    ''NULL'' as [NgayThamGiaDangCSVN],
		''NULL'' as [NgayChinhThuc],
		''NULL'' as [NgayKetNapDoanTNCS],
		''NULL'' as HoTenBo,''NULL'' as NgheNghiepBo,''NULL'' as HoTenMe,''NULL'' as NgheNghiepMe,
		''NULL'' as HoTenVoChong,''NULL'' as NgheNghiepVoChong,''NULL'' as DoiTuongThuocDienChinhSach,
		''NULL'' as NgheNghiepLamTruocKhiVaoHoc,d.So_nha+'' ''+d.Duong+'' ''+d.Phuong_xa+'' ''+d.Quan_huyen+
		'' ''+d.Tinh_Thanhpho as [DiaChi],c.Dien_thoai_dd,''NULL'' as NguyenVong
		from ChiTietThanhVien c inner join DiaChi d 
		on c.Ma_dia_chi = d.ID 		
		where c.Ten_dang_nhap = '''+@TenDN+''''
	end
end
else
begin
	set @kq = 6
	set @sql = 'select 1'
end
print @sql
print cast(@kq as varchar)
--print 'Count : '+cast(@count as varchar)
exec sp_executesql @sql
--select @sql
end

--select cast(datepart(day,'2009-1-2') as char(2))+'-'+cast(datepart(month,'2009-1-2') as varchar(2))+'-'+cast(datepart(year,'2009-1-2') as varchar(4))
--exec SP_QLSV_GETTHONGTINCANHANSVBYMATHANHVIEN 56                              '10KTHN1.02'
--select * from thongtincanhangiadinh where tendangnhap = '10kthl1.10'
--select * from chitietthanhvien where ten_dang_nhap = '10kthl1.10'

-------kiem tra cac dieu kien trong store co chinh xac ?
--thanh_tc -->data 2 bang
--hung_lq -->data dia chi co dia chi la 21, ko co thong tin ca nhan gia dinh
--10kthl1.10 -->data thong tin ca nhan gia dinh, ko co dia chi = null
--10KTHD1.06 -->2 bang deu rong,
-----------------------------------------------------------------------------------

/* insert du lieu mau
insert into thongtincanhangiadinh
values 
(
'10KTHD2.18',N'Võ Thanh Sang','Sang','HCM','Kinh','12/12','2011-05-05',
'Vo Tuan Thanh','Cong nhan','Ly Hue Man','Noi tro',
'...','...','Binh thuong','sinh vien','...',1,'HCM','HCM','Khong','2000-08-09','1999-08-09'
)
insert into thongtincanhangiadinh
values 
(
'thanh_tc',N'Võ Thanh Sang','Sang','HCM','Kinh','12/12','2011-05-05',
'Vo Tuan Thanh','Cong nhan','Ly Hue Man','Noi tro',
'...','...','Binh thuong','sinh vien','...',1,'HCM','HCM','Khong','2000-08-09','1999-08-09'
)

select * from thongtincanhangiadinh
*/
