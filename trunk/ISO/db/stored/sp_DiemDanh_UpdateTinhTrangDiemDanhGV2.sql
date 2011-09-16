if exists (select * from dbo.sysobjects where name = 'sp_DiemDanh_UpdateTinhTrangDiemDanhGV2')
drop procedure [dbo].[sp_DiemDanh_UpdateTinhTrangDiemDanhGV2]
GO
CREATE PROCEDURE sp_DiemDanh_UpdateTinhTrangDiemDanhGV2
	@ID int
AS
BEGIN
	DECLARE @H INT
	SET @H = DATEPART(HOUR,GETDATE())
	IF(@H >=7 AND @H <= 12)
	BEGIN
		UPDATE chitietdiemdanh 
			SET Tinh_trang = 3
			WHERE ID IN (SELECT E.ID 
							FROM diemdanh C
									INNER JOIN thanhviendiemdanh D on C.ID = D.Ma_diem_danh
									INNER JOIN chitietdiemdanh E on E.Ma_TVDD = D.ID
							WHERE Convert(varchar(10),E.Ngay_hoc,105) = Convert(varchar(10), GetDate(), 105) 
									AND C.Ma_giao_vien = @ID
									AND E.Tinh_trang = 2 AND E.Buoi LIKE N'%Sáng%')

		UPDATE chitietdiemdanh 
			SET Gio_ket_thuc=getdate()
			WHERE ID IN (SELECT E.ID 
							FROM diemdanh C
									INNER JOIN thanhviendiemdanh D on C.ID = D.Ma_diem_danh
									INNER JOIN chitietdiemdanh E on E.Ma_TVDD = D.ID
							WHERE Convert(varchar(10),E.Ngay_hoc,105) = Convert(varchar(10), GetDate(), 105) 
									AND C.Ma_giao_vien = @ID AND E.Buoi LIKE N'%Sáng%')
	END
	IF(@H >=13 AND @H <= 18)
	BEGIN
		UPDATE chitietdiemdanh 
			SET Tinh_trang = 3
			WHERE ID IN (SELECT E.ID 
							FROM diemdanh C
									INNER JOIN thanhviendiemdanh D on C.ID = D.Ma_diem_danh
									INNER JOIN chitietdiemdanh E on E.Ma_TVDD = D.ID
							WHERE Convert(varchar(10),E.Ngay_hoc,105) = Convert(varchar(10), GetDate(), 105) 
									AND C.Ma_giao_vien = @ID
									AND E.Tinh_trang = 2 AND E.Buoi LIKE N'%Chiều%')

		UPDATE chitietdiemdanh 
			SET Gio_ket_thuc=getdate()
			WHERE ID IN (SELECT E.ID 
							FROM diemdanh C
									INNER JOIN thanhviendiemdanh D on C.ID = D.Ma_diem_danh
									INNER JOIN chitietdiemdanh E on E.Ma_TVDD = D.ID
							WHERE Convert(varchar(10),E.Ngay_hoc,105) = Convert(varchar(10), GetDate(), 105) 
									AND C.Ma_giao_vien = @ID AND E.Buoi LIKE N'%Chiều%')
	END

	
END
