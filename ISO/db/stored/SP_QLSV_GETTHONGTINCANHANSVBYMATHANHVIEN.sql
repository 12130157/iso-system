/*
Nguoi viet: LQChuong
Ngay viet: 14/11/2011
Muc dich: lay thong tin ca nhan gia dinh sinh vien by maThanhVien
Luu y: insert du lieu mau va cap nhat lai du lieu de co the print theo SP_QLSV_GETTHONGTINCANHANSVBYMATHANHVIEN và SP_QLSV_GETDIEMSVTHEOHOCKI
insert và cap nhat lai du lieu cuoi file SP_QLSV_GETTHONGTINCANHANSVBYMATHANHVIEN
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
	(cast(DatePart(dd,c.Ngay_sinh) as varchar)+''-''+cast(DatePart(mm,c.Ngay_sinh) as varchar)+''-''+cast(DatePart(yyyy,c.Ngay_sinh) as varchar)) as [Ngay_Sinh],
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
--exec SP_QLSV_GETTHONGTINCANHANSVBYMATHANHVIEN 56            '10KTHN1.02'
--select * from thongtincanhangiadinh where tendangnhap = '10kthl1.10'
--select * from chitietthanhvien where ten_dang_nhap = '10kthl1.10'

-------kiem tra cac dieu kien trong store co chinh xac ?
--thanh_tc -->data 2 bang
--hung_lq -->data dia chi co dia chi la 21, ko co thong tin ca nhan gia dinh
--10kthl1.10 -->data thong tin ca nhan gia dinh, ko co dia chi = null
--10KTHD1.06 -->2 bang deu rong,
-----------------------------------------------------------------------------------


/*
--insert du lieu mau
--56 la luong hoai bao
insert into thongtincanhangiadinh
values 
(
'10KTHN1.02',N'Lương Hoài Bảo',N'Bảo',N'Hồ Chí Minh',N'Kinh','12/12','2011-05-05',
N'Lương Tuấn Anh',N'Bác sĩ',N'Nguyễn Mai',N'Nội trợ',
'...','...',N'Bình thường',N'Sinh viên','...',1,N'Hồ Chí Minh',N'Hồ Chí Minh',N'Không','2000-08-09','1999-08-09'
)
--106 là vu tien binh
insert into thongtincanhangiadinh
values 
(
'binh_vt.hv',N'Vũ Tiến Bình',N'Bình',N'Hồ Chí Minh',N'Kinh','12/12','2011-05-08',
N'Vũ Tuấn Anh',N'Bác sĩ',N'Nguyễn Mẫn',N'Nội trợ',
'...','...',N'Bình thường',N'Sinh viên','...',1,N'Hồ Chí Minh',N'Hồ Chí Minh',N'Không','2000-08-09','1999-08-09'
)
--434 la tran mai truong
insert into thongtincanhangiadinh
values 
(
'10SCM2.25',N'Trần Mai Trường',N'Trường',N'Hồ Chí Minh',N'Kinh','12/12','2011-09-08',
N'Trần Tuấn Anh',N'Bác sĩ',N'Nguyễn Linh',N'Nội trợ',
'...','...',N'Bình thường',N'Sinh viên','...',1,N'Hồ Chí Minh',N'Hồ Chí Minh',N'Không','2000-08-09','1999-08-09'
)
--187 la tran cam an
insert into thongtincanhangiadinh
values 
(
'10KTHD1.02',N'Trần Cẩm A',N'An',N'Hồ Chí Minh',N'Kinh','12/12','2011-12-15',
N'Trần Anh Tuấn',N'Bác sĩ',N'Nguyễn Thu',N'Nội trợ',
'...','...',N'Bình thường',N'Sinh viên','...',1,N'Hồ Chí Minh',N'Hồ Chí Minh',N'Không','2000-08-09','1999-08-09'
)

--UPDATE DULIEU MATHANHVIEN = 56 MUC DICH LA SET LAI USER1 THEO LUAT
UPDATE THOIKHOABIEU SET USER1 = N'HỌC KÌ 1(2010-2011-10KTHN)' WHERE ID = 6 AND MA_LOP = 8
UPDATE THOIKHOABIEU SET USER1 = N'HỌC KÌ 2(2010-2011-10KTHN)' WHERE ID = 8 AND MA_LOP = 8
--SELECT * FROM THOIKHOABIEU WHERE MA_LOP = 8
--SELECT * FROM THOIKHOABIEU WHERE USER1 = N'HỌC KÌ 1(2010-2011-10KTHN)'

--UPDATE DULIEU MATHANHVIEN = 434 MUC DICH LA SET LAI USER1 THEO LUAT
UPDATE THOIKHOABIEU SET USER1 = N'HỌC KÌ 1(2010-2011)-10SCM' WHERE ID = 15 AND MA_LOP = 6
UPDATE THOIKHOABIEU SET USER1 = N'HỌC KÌ 2(2010-2011)-10SCM' WHERE ID = 16 AND MA_LOP = 6
UPDATE THOIKHOABIEU SET USER1 = N'HỌC KÌ 3(2011-2012)-10SCM' WHERE ID = 17 AND MA_LOP = 6

--UPDATE DULIEU MATHANHVIEN = 187 MUC DICH LA SET LAI USER1 THEO LUAT
UPDATE THOIKHOABIEU SET USER1 = N'HỌC KÌ 1(2010-2011)-10KTHD' WHERE ID = 4 AND MA_LOP = 7
UPDATE THOIKHOABIEU SET USER1 = N'HỌC KÌ 2(2010-2011)-10KTHD' WHERE ID = 7 AND MA_LOP = 7
UPDATE THOIKHOABIEU SET USER1 = N'HỌC KÌ 3(2011-2012)-10KTHD' WHERE ID = 19 AND MA_LOP = 7

--INSERT DULIEU MAU CHO THANHVIEN CO MATHANHVIEN = 56
--SELECT * FROM THANHVIEN WHERE ID = 56 --TEN_DN = '10KTHN1.02'
--SELECT * FROM CHITIETTHANHVIEN WHERE TEN_DANG_NHAP = '10KTHN1.02'
--SELECT * FROM THOIKHOABIEU WHERE MA_LOP = 8 --6,8,20
--SELECT * FROM MONHOCTKB WHERE MA_TKB IN (6) --30,31,32,34,35,40
--SELECT * FROM MONHOCTKB WHERE MA_TKB IN (8) --48,49,50,78,81,90,94
--SELECT * FROM MONHOCTKB WHERE MA_TKB IN (20)--163,177,178,179,180,181,182
--SELECT DISTINCT MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH FROM DANGKYMONHOC WHERE MA_MON_HOC_TKB IN (30,31,32,34,35,40)  AND MA_HOC_VIEN = 56
--SELECT DISTINCT MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH FROM DANGKYMONHOC WHERE MA_MON_HOC_TKB IN (48,49,50,78,81,90,94)  AND MA_HOC_VIEN = 56
--SELECT DISTINCT MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH FROM DANGKYMONHOC WHERE MA_MON_HOC_TKB IN (163,177,178,179,180,181,182)  AND MA_HOC_VIEN = 56


--SELECT * FROM DANGKYMONHOC
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (30,56,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (31,56,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (32,56,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (34,56,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (35,56,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (40,56,0)
--DELETE FROM DANGKYMONHOC WHERE MA_MON_HOC_TKB IN (30,31,32,34,35,40) AND MA_HOC_VIEN = 56

INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (48,56,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (49,56,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (50,56,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (78,56,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (81,56,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (90,56,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (94,56,0)
--DELETE FROM DANGKYMONHOC WHERE MA_MON_HOC_TKB IN (48,49,50,78,81,90,94) AND MA_HOC_VIEN = 56

INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (163,56,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (177,56,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (178,56,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (179,56,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (180,56,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (181,56,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (182,56,0)
--DELETE FROM DANGKYMONHOC WHERE MA_MON_HOC_TKB IN (163,177,178,179,180,181,182) AND MA_HOC_VIEN = 56



---------------------------------------------------------------------------
--INSERT DULIEU MAU MATHANHVIEN = 434
--SELECT * FROM THANHVIEN WHERE ID = 434 --TEN_DN = '10SCM2.25'
--SELECT * FROM CHITIETTHANHVIEN WHERE TEN_DANG_NHAP = '10SCM2.25' --MA_LOP = 6
--SELECT * FROM THOIKHOABIEU WHERE MA_LOP = 6 --15,16,17
--SELECT * FROM MONHOCTKB WHERE MA_TKB IN (15)--112,113,114,115,116,122
--SELECT * FROM MONHOCTKB WHERE MA_TKB IN (16)--117,118,119,120,121
--SELECT * FROM MONHOCTKB WHERE MA_TKB IN (17)--126,128,129,132,133,142,143
--SELECT DISTINCT MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH FROM DANGKYMONHOC WHERE MA_MON_HOC_TKB IN (112,113,114,115,116,122) AND MA_HOC_VIEN = 434
--SELECT DISTINCT MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH FROM DANGKYMONHOC WHERE MA_MON_HOC_TKB IN (117,118,119,120,121) AND MA_HOC_VIEN = 434
--SELECT DISTINCT MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH FROM DANGKYMONHOC WHERE MA_MON_HOC_TKB IN (126,128,129,132,133,142,143) AND MA_HOC_VIEN = 434

INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (112,434,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (113,434,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (114,434,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (115,434,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (116,434,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (122,434,0)
--DELETE FROM DANGKYMONHOC WHERE MA_MON_HOC_TKB IN (112,113,114,115,116,122) AND MA_HOC_VIEN = 434

INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (117,434,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (118,434,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (119,434,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (120,434,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (121,434,0)
--DELETE FROM DANGKYMONHOC WHERE MA_MON_HOC_TKB IN (117,118,119,120,121) AND MA_HOC_VIEN = 434

INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (126,434,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (128,434,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (129,434,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (132,434,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (133,434,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (142,434,0)
INSERT INTO DANGKYMONHOC (MA_MON_HOC_TKB,MA_HOC_VIEN,DIEM_TRUNG_BINH) VALUES (143,434,0)
--DELETE FROM DANGKYMONHOC WHERE MA_MON_HOC_TKB IN (126,128,129,132,133,142,143) AND MA_HOC_VIEN = 434



-----------------------------------------------------------------------------
--INSERT DULIEU MAU MATHANHVIEN = 187
--SELECT * FROM THANHVIEN WHERE ID = 187 --TEN_DN = '10KTHD1.02'
--SELECT * FROM CHITIETTHANHVIEN WHERE TEN_DANG_NHAP = '10KTHD1.02' --MA_LOP = 7
--SELECT * FROM THOIKHOABIEU WHERE MA_LOP = 7 --4,7,19
--SELECT * FROM MONHOCTKB WHERE MA_TKB IN (4)--24,25,26,38,42,43
--SELECT * FROM MONHOCTKB WHERE MA_TKB IN (7)--44,45,46,47,55,83,84
--SELECT * FROM MONHOCTKB WHERE MA_TKB IN (19)--154,173,176,191,192,193,194
--SELECT DISTINCT MA_MON_HOC_TKB, MA_HOC_VIEN,DIEM_TRUNG_BINH FROM DANGKYMONHOC WHERE MA_MON_HOC_TKB IN (24,25,26,38,42,43) AND MA_HOC_VIEN = 187
--SELECT DISTINCT MA_MON_HOC_TKB, MA_HOC_VIEN,DIEM_TRUNG_BINH FROM DANGKYMONHOC WHERE MA_MON_HOC_TKB IN (44,45,46,47,55,83,84) AND MA_HOC_VIEN = 187
--SELECT DISTINCT MA_MON_HOC_TKB, MA_HOC_VIEN,DIEM_TRUNG_BINH FROM DANGKYMONHOC WHERE MA_MON_HOC_TKB IN (154,173,176,191,192,193,194) AND MA_HOC_VIEN = 187
--DULIEU MAU DA CO SAN




*/
*/
