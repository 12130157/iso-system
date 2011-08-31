/*
	Người Viết	:	Trần Cẩm thành
	Ngày Viết	:	19/08/2011
	Mục Đích	:	cập nhật đơn xin thôi việc
	SELECT * FROM DONXINTHOIVIEC
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateDonXinThoiViec')
BEGIN
	DROP PROC sp_NhanSu_UpdateDonXinThoiViec
END
GO
CREATE PROC sp_NhanSu_UpdateDonXinThoiViec  
	@ID					INT,
	@Ly_do				NVARCHAR(1000),
	@Ngay_thoi_viec		DATETIME,
	@Tinh_trang			INT,
	@KQ					INT OUTPUT
AS  
BEGIN  
	SET @KQ = -1
	IF EXISTS (SELECT * FROM DonXinThoiViec WHERE ID=@ID)
	BEGIN
		UPDATE DonXinThoiViec SET Ly_do=@Ly_do,Ngay_thoi_viec=@Ngay_thoi_viec,Tinh_trang=@Tinh_trang,Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
		SET @KQ=@ID
	END  
END  
GO

