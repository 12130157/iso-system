/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	25/05/2011
	Mục Đích	:	Thời Gian Tuyển Dụng Nhân Sự
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_InsertThoiGianTuyenDung')
BEGIN
	DROP PROC sp_NhanSu_InsertThoiGianTuyenDung
END
GO
CREATE PROC sp_NhanSu_InsertThoiGianTuyenDung  
	@Ma_CTKHTDNS				INT,
	@Thoi_gian					INT,
	@KQ							INT OUTPUT  
AS  
BEGIN  
	
	SET @KQ = 0
	IF EXISTS (SELECT * FROM ChiTietKHTNS WHERE ID=@Ma_CTKHTDNS)
	BEGIN
		DECLARE @Tinh_trang INT
		SET @Tinh_trang = (SELECT Tinh_trang FROM KeHoachTNS WHERE ID=(SELECT Ma_ke_hoach FROM ChiTietKHTNS WHERE ID=@Ma_CTKHTDNS))
		IF(@Tinh_trang = 0 OR @Tinh_trang = 3)
		BEGIN
			INSERT INTO ThoiGianTuyenDung VALUES(@Ma_CTKHTDNS,@Thoi_gian,GETDATE(),'','','','','')
			SET @KQ = 1
		END
	END
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_InsertThoiGianTuyenDung '14','2',@KQ OUTPUT
SELECT @KQ

SELECT * FROM DeNghiNhanSu
SELECT * FROM HinhThuc_DT
SELECT * FROM DeNghiDTNS
SELECT * FROM THOIGIANTUYENDUNG
SELECT * FROM CHITIETKHTNS
*/
