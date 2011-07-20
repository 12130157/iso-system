/*
	Người Viết	:	Huỳnh Thị Ngoc Mai
	Ngày Viết	:	24/05/2011
	Mục Đích	:	STORE INSERT CHI_TIET_KE_HOACH_TUYEN_NHAN_SU
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_InsertChiTietKHTNS')
BEGIN
	DROP PROC sp_NhanSu_InsertChiTietKHTNS
END
GO
CREATE PROC sp_NhanSu_InsertChiTietKHTNS  
	@Ma_ke_hoach		INT,
	@Ma_de_nghi			INT,
	@KQ					INT OUTPUT  
AS  
BEGIN  
	SET @KQ = 0
	IF NOT EXISTS (SELECT * FROM ChiTietKHTNS WHERE Ma_ke_hoach=@Ma_ke_hoach AND Ma_de_nghi=@Ma_de_nghi)
	BEGIN
		DECLARE @Tinh_trang INT
		SET @Tinh_trang = (SELECT Tinh_trang FROM KeHoachTNS WHERE ID=@Ma_ke_hoach)
		IF(@Tinh_trang = 0 or @Tinh_trang = 3)
		BEGIN
		INSERT INTO ChiTietKHTNS VALUES(@Ma_ke_hoach,@Ma_de_nghi,null,GETDATE(),'','','','','')
		SET @KQ = 1  
		END
	END  
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_InsertChiTietKHTNS 4,0,'CHI_TIET_KE_HOACH_TUYEN_NHAN_SU',@KQ OUTPUT
SELECT @KQ

SELECT * FROM ChiTietKHTNS

SELECT * FROM KeHoachTNS

SELECT * FROM DeNghiNhanSu

*/
