/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	31/05/2011
	Mục Đích	:	Cập nhật Chi Tiết Kế Hoạch Tuyển Nhân Sự
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateChiTietKHTNS')
BEGIN
	DROP PROC sp_NhanSu_UpdateChiTietKHTNS
END
GO
CREATE PROC sp_NhanSu_UpdateChiTietKHTNS  
	@ID					INT,
	@Ghi_chu			NVARCHAR(500),
	@KQ					INT OUTPUT  
AS  
BEGIN  
	SET @KQ = -1
	IF EXISTS (SELECT * FROM ChiTietKHTNS WHERE ID=@ID)
	BEGIN
		BEGIN
			UPDATE ChiTietKHTNS SET Ghi_chu=@Ghi_chu,Ngay_cap_nhat_cuoi=GETDATE() WHERE ID=@ID
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
