CREATE PROCEDURE sp_ISO_GetChiTietTKBThayDoiByMaToTrinh  
 @ID  int  
AS  
BEGIN  
 DECLARE @Tinh_trang varchar  
 SELECT @Tinh_trang = Tinh_trang FROM ToTrinh WHERE ID = @ID  
 IF(@Tinh_trang = '2')  
 BEGIN  
  SELECT E.ID AS MaChiTietTKBThayDoi, E.Buoi AS BuoiThayDoi, E.Tuan AS TuanThayDoi, E.Thu_trong_tuan AS ThuTrongTuanThayDoi,  
  E.Ma_phong AS MaPhongThayDoi, Convert(varchar(10), E.Ngay_hoc, 103) AS NgayHocThayDoi, S.Ki_hieu_phong AS KiHieuPhongThayDoi,  
  F.Buoi AS Buoi, F.Tuan AS Tuan, F.Thu_trong_tuan AS ThuTrongTuan,  
  F.Ma_phong AS MaPhong, Convert(varchar(10), F.Ngay_hoc, 103) AS NgayHoc, T.Ki_hieu_phong AS KiHieuPhong, H.Ten_mon_hoc AS TenMonHocChiTiet  
  FROM ChiTietTKBThayDoi AS E   
  LEFT JOIN PhongBan AS S ON E.Ma_phong = S.ID  
  LEFT JOIN ChiTietTKBThayDoi AS F ON E.ID_thay_the = F.ID  
  LEFT JOIN PhongBan AS T ON F.Ma_phong = T.ID  
  LEFT JOIN MonHocTKB AS G ON F.Ma_mon_hoc_TKB = G.ID  
  LEFT JOIN MonHoc AS H ON G.Ma_mon_hoc = H.ID  
  WHERE E.Ma_to_trinh = @ID  
 END  
 ELSE  
 BEGIN  
  SELECT E.ID AS MaChiTietTKBThayDoi, E.Buoi AS BuoiThayDoi, E.Tuan AS TuanThayDoi, E.Thu_trong_tuan AS ThuTrongTuanThayDoi,  
  E.Ma_phong AS MaPhongThayDoi, Convert(varchar(10), E.Ngay_hoc, 103) AS NgayHocThayDoi, S.Ki_hieu_phong AS KiHieuPhongThayDoi,  
  F.Buoi AS Buoi, F.Tuan AS Tuan, F.Thu_trong_tuan AS ThuTrongTuan,  
  F.Ma_phong AS MaPhong, Convert(varchar(10), F.Ngay_hoc, 103) AS NgayHoc, T.Ki_hieu_phong AS KiHieuPhong, H.Ten_mon_hoc AS TenMonHocChiTiet,
  (K.Ho + ' ' + K.Ten_lot + ' ' + K.Ten) as TenGiaoVien, J.ID as MaGiaoVien, E.User1 as LyDo
  FROM ChiTietTKBThayDoi AS E  
  LEFT JOIN PhongBan AS S ON E.Ma_phong = S.ID  
  LEFT JOIN ChiTietTKB AS F ON E.Ma_chi_tiet_TKB = F.ID  
  LEFT JOIN PhongBan AS T ON F.Ma_phong = T.ID  
  LEFT JOIN MonHocTKB AS G ON F.Ma_mon_hoc_TKB = G.ID  
  LEFT JOIN MonHoc AS H ON G.Ma_mon_hoc = H.ID  
  LEFT JOIN ThanhVien as J ON G.Ma_giao_vien=J.ID
  LEFT JOIN ChiTietThanhVien as K ON J.Ten_DN=K.Ten_dang_nhap
  WHERE E.Ma_to_trinh = @ID  
 END  
END  