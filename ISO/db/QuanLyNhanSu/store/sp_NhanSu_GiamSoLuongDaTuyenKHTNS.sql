/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	09/07/1990
	Mục Đích	:	giảm số lượng đã tuyển thành công
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_GiamSoLuongDaTuyenKHTNS')
BEGIN
	DROP PROC sp_NhanSu_GiamSoLuongDaTuyenKHTNS
END
GO
CREATE PROC sp_NhanSu_GiamSoLuongDaTuyenKHTNS  
	@ID				INT,
	@KQ				INT OUTPUT  
AS  
BEGIN  
	SET @KQ = 0
	IF EXISTS (SELECT * FROM ChiTietKHTNS WHERE ID=@ID)
	BEGIN
		DECLARE @So_luong_da_tuyen INT
		SET @So_luong_da_tuyen = 0
		SELECT @So_luong_da_tuyen=So_luong_da_tuyen FROM ChiTietKHTNS WHERE ID=@ID
		IF (@So_luong_da_tuyen > 0)
		BEGIN
			SET @So_luong_da_tuyen = @So_luong_da_tuyen - 1
			UPDATE ChiTietKHTNS SET So_luong_da_tuyen=@So_luong_da_tuyen, Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
			SET @KQ = @ID 
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
