if exists (select * from dbo.sysobjects where name = 'sp_DiemDanh_UpdateTinhTrangDiemDanhGV')
drop procedure [dbo].[sp_DiemDanh_UpdateTinhTrangDiemDanhGV]
GO
CREATE PROCEDURE sp_DiemDanh_UpdateTinhTrangDiemDanhGV
	@ID int
AS
BEGIN
	UPDATE chitietdiemdanh 
			SET Tinh_trang = 1
			WHERE ID IN (SELECT E.ID 
							FROM diemdanh C
									INNER JOIN thanhviendiemdanh D on C.ID = D.Ma_diem_danh
									INNER JOIN chitietdiemdanh E on E.Ma_TVDD = D.ID
							WHERE Convert(varchar(10),E.Ngay_hoc,110) = Convert(varchar(10), GetDate(), 110) 
									AND C.Ma_giao_vien = @ID
									AND E.Tinh_trang = 0)
END
