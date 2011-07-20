/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	26/05/2011
	Mục Đích	:	Cập Nhật Đề Nghị Khoán Thử Việc
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateDeNghiKTV')
BEGIN
	DROP PROC sp_NhanSu_UpdateDeNghiKTV
END
GO
CREATE PROC sp_NhanSu_UpdateDeNghiKTV  
	@ID						INT,
	@Thoi_gian				INT,
	@Bat_dau				DATETIME,
	@Ket_thuc				DATETIME,
	@Luong_khoan			NUMERIC,
	@Tinh_trang				INT,
	@KQ						INT OUTPUT  
AS  
BEGIN  
	SET @KQ = 0 
	IF EXISTS (SELECT * FROM DeNghiKTV WHERE ID=@ID)   
	BEGIN  
		UPDATE DeNghiKTV SET Thoi_gian=@Thoi_gian, Bat_dau=@Bat_dau, Ket_thuc=@Ket_thuc, Luong_khoan=@Luong_khoan,Tinh_trang=@Tinh_trang,Ly_do_reject=null, Ngay_cap_nhat_cuoi=GETDATE() WHERE ID=@ID
		SET @KQ = @ID
	END  
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_InsertDeNghiKTV 0,3,1,'1/1/1991','1/1/1991','1',@KQ OUTPUT
SELECT @KQ

SELECT * FROM DeNghiNhanSu

SELECT * FROM DeNghiKTV

*/
