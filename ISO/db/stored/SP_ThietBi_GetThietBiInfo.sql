/*
nguoi viet: Quoc Chuong
muc dich: lay thong tin cua thiet bi thong qua id cua thiet bi do.
tham so: vao(@idThietBi)
ket qua se xuat ra thong tin thiet bi gom:
	id,ten_thiet_bi,
	ma,ki_hieu,ten_loai_thiet_bi,
	ki_hieu_phong,ten_tinh_trang,
	ten_hien_trang
*/

if exists (select * from sysobjects where name = 'SP_ThietBi_GetThietBiInfo')
begin
	drop proc SP_ThietBi_GetThietBiInfo
end
go
create proc SP_ThietBi_GetThietBiInfo
@idThietBi int
as
begin
	select t.id, ten_thiet_bi, ma, ki_hieu,ten_loai_thiet_bi,vi_tri_lap_dat as maPhongBan, ki_hieu_phong, ten_tinh_trang, ten_hien_trang  
	from  
	thietbi t inner join loaithietbi l on t.ma_loai_thiet_bi = l.id 
	inner join hientrang h on t.hien_trang = h.id 
	inner join tinhtrang t2 on t.tinh_trang = t2.id 
	inner join phongban p on t.vi_tri_lap_dat = p.id 
	where t.id = @idThietBi
end

/*
exec SP_ThietBi_GetThietBiInfo 1
*/