-- update tinh trang HSDT len 7
/*
	Người Viết	:	Huỳnh Thị Ngọc Mai
	Ngày Viết	:	26/05/2011
	Mục Đích	:	Cập Nhật Hồ sơ dự tuyển khi approve
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateHoSoDuTuyenApprove')
BEGIN
	DROP PROC sp_NhanSu_UpdateHoSoDuTuyenApprove
END
GO
CREATE PROC sp_NhanSu_UpdateHoSoDuTuyenApprove
	@ID					INT,
	@KQ					INT OUTPUT  
AS  
BEGIN  
	SET @KQ = 0  
	IF EXISTS (SELECT * FROM HoSoDuTuyen WHERE ID=@ID)   
	BEGIN  
		UPDATE HoSoDuTuyen SET Tinh_trang='7',Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
		SET @KQ = 1  
	END  
END
GO
/*

DECLARE @KQ INT 
EXEC sp_UpdateHoSoDuTuyenApprove '7',@KQ OUTPUT
SELECT @KQ

SELECT * FROM HoSoDuTuyen

*/

