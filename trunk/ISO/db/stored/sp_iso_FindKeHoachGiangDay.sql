if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].sp_iso_FindKeHoachGiangDay') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].sp_iso_FindKeHoachGiangDay
GO
CREATE PROCEDURE sp_iso_FindKeHoachGiangDay
	@MaNguoiTao varchar(10),
	@MaNamHoc varchar(10),
	@MaLop varchar(10),
	@MaMonHoc varchar(10),
	@HocKi varchar(10),
	@TinhTrang varchar(10)
AS
BEGIN			

	SELECT A.ID As MaKHGD,A.Ma_Nguoi_Tao As MaNguoiTao,A.Ma_mon_hoc As MaMonHoc,U.Ngay_BD As NgayThucHien
		,A.Ma_lop As MaLop,B.ID As MaGiaoAn,B.Tinh_Trang As TinhTrang,B.So_Giao_An As SoThuTu 
		,B.NgayGui As NgayGui,B.Ngay_duyet As NgayDuyet,B.Ma_nguoi_duyet As MaNguoiDuyet
,ISNULL(K.Ho+' '+' '+K.Ten_lot+' '+K.Ten,'') As NguoiDuyet
		,C.Ten_Mon_Hoc As TenMonHoc,D.Ki_hieu As KiHieu,F.Ho+' '+' '+F.Ten_lot+' '+F.Ten As NguoiTao
FROM KeHoachGiangDay As A
INNER JOIN GiaoAn As B
ON 1=1  AND Ma_nguoi_tao like '%'+@MaNguoiTao+'%' 
			AND Hoc_ki like '%'+@HocKi+'%'
			AND Ma_nam_hoc like '%'+@MaNamHoc+'%'
			AND Ma_lop like '%'+@MaLop+'%'
			AND Ma_mon_hoc like '%'+@MaMonHoc+'%'
			AND B.Ma_KHGD=A.ID
			AND B.Tinh_trang like '%'+@TinhTrang+'%'
INNER JOIN MonHoc As C
ON C.ID=A.Ma_Mon_Hoc
INNER JOIN LopHoc As D
ON D.ID=A.Ma_Lop 
INNER JOIN ThanhVien As E
On E.ID=A.Ma_Giao_Vien
INNER JOIN ChiTietThanhVien As F
ON E.Ten_DN=F.Ten_dang_nhap
LEFT JOIN ThanhVien As G
On G.ID=B.Ma_nguoi_duyet
LEFT JOIN ChiTietThanhVien As K
ON G.Ten_DN=K.Ten_dang_nhap
INNER JOIN ChiTietKHGD As U
On U.Ma_giao_an=B.ID
END


	
	


