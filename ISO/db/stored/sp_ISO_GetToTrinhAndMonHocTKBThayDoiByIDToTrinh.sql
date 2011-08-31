if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetToTrinhAndMonHocTKBThayDoiByIDToTrinh]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetToTrinhAndMonHocTKBThayDoiByIDToTrinh]
GO
CREATE PROCEDURE sp_ISO_GetToTrinhAndMonHocTKBThayDoiByIDToTrinh
	@ID		int
AS
BEGIN
	DECLARE @Tinh_trang varchar
	SELECT @Tinh_trang = Tinh_trang FROM ToTrinh WHERE ID = @ID
	IF(@Tinh_trang = '2')
	BEGIN
		SELECT A.ID AS MaToTrinh, A.Ten, A.Ma_nguoi_tao AS MaNguoiTao, A.Ma_nguoi_duyet AS MaNguoiDuyet,
		Convert(varchar(10), A.Ngay_cap_nhat_cuoi, 103) AS NgayCapNhatCuoi, Convert(varchar(10), A.Ngay_duyet, 103) AS NgayDuyet,
		A.Tinh_trang AS TinhTrang, ISNULL(J.Ho, '') + ' ' + ISNULL(J.Ten_lot, '') + ' ' + ISNULL(J.Ten, '') AS TenNguoiTao,
		ISNULL(L.Ho, '') + ' ' + ISNULL(L.Ten_lot, '') + ' ' + ISNULL(L.Ten, '') AS TenNguoiDuyet,
		B.ID AS MaMonHocTKBThayDoi, B.Ma_giao_vien AS MaGiaoVienThayDoi, ISNULL(N.Ho, '') + ' ' + ISNULL(N.Ten_lot, '') + ' ' + ISNULL(N.Ten, '') AS TenGiaoVienThayDoi,
		C.Ma_giao_vien AS MaGiaoVien, ISNULL(P.Ho, '') + ' ' + ISNULL(P.Ten_lot, '') + ' ' + ISNULL(P.Ten, '') AS TenGiaoVien,
		D.Ten_mon_hoc AS TenMonHoc
		FROM ToTrinh AS A
		LEFT JOIN MonHocTKBThayDoi AS B ON A.ID = B.Ma_to_trinh
		LEFT JOIN MonHocTKBThayDoi AS C ON B.ID_thay_the = C.ID
		LEFT JOIN MonHocTKB AS X ON C.Ma_mon_hoc_TKB = X.ID
		LEFT JOIN MonHoc AS D ON X.Ma_mon_hoc = D.ID
		LEFT JOIN ThanhVien AS I ON A.Ma_nguoi_tao = I.ID
		LEFT JOIN ChiTietThanhVien AS J ON I.Ten_DN = J.Ten_dang_nhap
		LEFT JOIN ThanhVien AS K ON A.Ma_nguoi_duyet = K.ID
		LEFT JOIN ChiTietThanhVien AS L ON K.Ten_DN = L.Ten_dang_nhap
		LEFT JOIN ThanhVien AS M ON B.Ma_giao_vien = M.ID
		LEFT JOIN ChiTietThanhVien AS N ON M.Ten_DN = N.Ten_dang_nhap
		LEFT JOIN ThanhVien AS O ON C.Ma_giao_vien = O.ID
		LEFT JOIN ChiTietThanhVien AS P ON O.Ten_DN = P.Ten_dang_nhap
		WHERE A.ID = @ID
	END
	ELSE
	BEGIN
		SELECT A.ID AS MaToTrinh, A.Ten, A.Ma_nguoi_tao AS MaNguoiTao, A.Ma_nguoi_duyet AS MaNguoiDuyet,
		Convert(varchar(10), A.Ngay_cap_nhat_cuoi, 103) AS NgayCapNhatCuoi, Convert(varchar(10), A.Ngay_duyet, 103) AS NgayDuyet,
		A.Tinh_trang AS TinhTrang, ISNULL(J.Ho, '') + ' ' + ISNULL(J.Ten_lot, '') + ' ' + ISNULL(J.Ten, '') AS TenNguoiTao,
		ISNULL(L.Ho, '') + ' ' + ISNULL(L.Ten_lot, '') + ' ' + ISNULL(L.Ten, '') AS TenNguoiDuyet,
		B.ID AS MaMonHocTKBThayDoi, B.Ma_giao_vien AS MaGiaoVienThayDoi, ISNULL(N.Ho, '') + ' ' + ISNULL(N.Ten_lot, '') + ' ' + ISNULL(N.Ten, '') AS TenGiaoVienThayDoi,
		C.Ma_giao_vien AS MaGiaoVien, ISNULL(P.Ho, '') + ' ' + ISNULL(P.Ten_lot, '') + ' ' + ISNULL(P.Ten, '') AS TenGiaoVien,
		D.Ten_mon_hoc AS TenMonHoc
		FROM ToTrinh AS A
		LEFT JOIN MonHocTKBThayDoi AS B ON A.ID = B.Ma_to_trinh
		LEFT JOIN MonHocTKB AS C ON B.Ma_mon_hoc_TKB = C.ID
		LEFT JOIN MonHoc AS D ON C.Ma_mon_hoc = D.ID
		LEFT JOIN ThanhVien AS I ON A.Ma_nguoi_tao = I.ID
		LEFT JOIN ChiTietThanhVien AS J ON I.Ten_DN = J.Ten_dang_nhap
		LEFT JOIN ThanhVien AS K ON A.Ma_nguoi_duyet = K.ID
		LEFT JOIN ChiTietThanhVien AS L ON K.Ten_DN = L.Ten_dang_nhap
		LEFT JOIN ThanhVien AS M ON B.Ma_giao_vien = M.ID
		LEFT JOIN ChiTietThanhVien AS N ON M.Ten_DN = N.Ten_dang_nhap
		LEFT JOIN ThanhVien AS O ON C.Ma_giao_vien = O.ID
		LEFT JOIN ChiTietThanhVien AS P ON O.Ten_DN = P.Ten_dang_nhap
		WHERE A.ID = @ID
	END
END