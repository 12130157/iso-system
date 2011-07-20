/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	24/05/2011
	Mục Đích	:	Cập nhật cột Tinh_trang ( 0 = mặc định, 1 = đạt, 2 = rớt )
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateHoSoDuTuyen')
BEGIN
	DROP PROC sp_NhanSu_UpdateHoSoDuTuyen
END
GO
CREATE PROC sp_NhanSu_UpdateHoSoDuTuyen
	@ID					INT,
	@Ghi_chu			NVARCHAR(500),
	@Tinh_trang			INT,
	@KQ					INT OUTPUT  
AS  
BEGIN  
	SET @KQ = 0  
	IF EXISTS (SELECT * FROM HoSoDuTuyen WHERE ID=@ID)   
	BEGIN  
		UPDATE HoSoDuTuyen SET Ghi_chu=@Ghi_chu,Tinh_trang=@Tinh_trang,Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
		SET @KQ = 1  
	END  
END
GO

