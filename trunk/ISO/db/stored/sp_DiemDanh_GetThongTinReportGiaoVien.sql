if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_DiemDanh_GetThongTinReportGiaoVien]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_DiemDanh_GetThongTinReportGiaoVien]
GO
CREATE PROCEDURE sp_DiemDanh_GetThongTinReportGiaoVien
	@MaThanhVien		varchar(10),
	@MaVaiTro			varchar(10),
	@MaBoPhan			varchar(10)
AS
BEGIN
	DECLARE @sql NVarchar(2000)
	DECLARE @DK_Khoa			nvarchar(100)
	DECLARE @DK_MaGiaoVien		nvarchar(100)
	SET @DK_Khoa = ''
	SET @DK_MaGiaoVien = ''
	IF(@MaVaiTro = '5' OR @MavaiTro = '6')
	BEGIN
		SET @DK_Khoa = ' AND E.ID = ' + @MaBoPhan
	END
	if(@MaVaiTro = '8')
	BEGIN
		SET @DK_MaGiaoVien = ' AND H.ID = ' + @MaThanhVien
	END
	
	SET @sql = '
		select e.id As MaKhoa, e.Ten as TenKhoa, c.id AS MaLop, c.Ki_hieu AS KiHieuLop,
		d.Ten_chuyen_nganh, b.id as MaNamHoc, b.Nam_bat_dau as NamBatdau, b.Nam_ket_thuc as NamKetThuc,
		a.Hoc_ki as HocKy,f.ID as MaMonHocTKB, g.id AS MaMonHoc, g.Ten_mon_hoc AS TenMonHoc, 
		h.id As MaThanhVien, IsNull(i.Ho,'''') AS Ho, IsNull(i.Ten_Lot,'''') As TenLot, IsNull(i.Ten,'''') As Ten 

		from thoikhoabieu a inner join NamHoc b on b.Nam_bat_dau = a.Nam_bat_dau 
		inner join LopHoc c on c.ID = a.Ma_lop inner join ChuyenNganh d on d.ID = c.Ma_chuyen_nganh 
		inner join Khoa_trungtam e on e.ID = d.Ma_khoaTT inner join monhoctkb as f on a.id = f.Ma_tkb 
		inner join monhoc as g on f.ma_mon_hoc = g.id inner join thanhvien as h on f.ma_giao_vien = h.id 
		inner join chitietthanhvien as i on h.Ten_dn = i.ten_dang_nhap 

		where a.tinh_trang = 2 '+@DK_Khoa+@DK_MaGiaoVien+'

		order by e.Ten, c.Ki_hieu, b.Nam_bat_dau, a.hoc_ki, g.ten_mon_hoc, i.Ho, i.Ten_lot, i.Ten'
	print @sql
	exec sp_executesql @sql
END

--exec sp_DiemDanh_GetGiaoVienByDieuKien 6,0,1,28,15,5
--sp_help sp_executesql
--sp_ISO_GetLichSuDungPhong '1','1','60','',''
--select * from lophoc
--select * from chitiettkb