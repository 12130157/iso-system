if exists (select * from dbo.sysobjects where name = 'sp_DiemDanh_UpdateTinhTrangDiemDanhGV')
drop procedure [dbo].[sp_DiemDanh_UpdateTinhTrangDiemDanhGV]
GO
CREATE PROCEDURE sp_DiemDanh_UpdateTinhTrangDiemDanhGV
	@ID int
AS
BEGIN
	DECLARE @H INT
	SET @H = DATEPART(HOUR,GETDATE())
	IF(@H >=7 AND @H <= 12)
	BEGIN
		UPDATE chitietdiemdanh 
			SET Tinh_trang = 1, Gio_bat_dau=getdate()
			WHERE ID IN (SELECT E.ID 
							FROM diemdanh C
									INNER JOIN thanhviendiemdanh D on C.ID = D.Ma_diem_danh
									INNER JOIN chitietdiemdanh E on E.Ma_TVDD = D.ID
							WHERE Convert(varchar(10),E.Ngay_hoc,105) = Convert(varchar(10), GetDate(), 105) 
									AND C.Ma_giao_vien = @ID
									AND E.Tinh_trang = 0 AND E.Buoi LIKE N'%Sáng%')
	END
	IF(@H >=13 AND @H <= 18)
	BEGIN
		UPDATE chitietdiemdanh 
			SET Tinh_trang = 1, Gio_bat_dau=getdate()
			WHERE ID IN (SELECT E.ID 
							FROM diemdanh C
									INNER JOIN thanhviendiemdanh D on C.ID = D.Ma_diem_danh
									INNER JOIN chitietdiemdanh E on E.Ma_TVDD = D.ID
							WHERE Convert(varchar(10),E.Ngay_hoc,105) = Convert(varchar(10), GetDate(), 105) 
									AND C.Ma_giao_vien = @ID
									AND E.Tinh_trang = 0 AND E.Buoi LIKE N'%Chiều%')
	END

END


--select * from chitietdiemdanh
--EXEC sp_DiemDanh_UpdateTinhTrangDiemDanhGV '0'