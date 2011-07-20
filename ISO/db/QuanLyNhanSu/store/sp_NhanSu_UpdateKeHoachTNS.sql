/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	24/05/2011
	Mục Đích	:	Cập nhật cột Tinh_trang( 0 = luu, 1 = gui, 2 = Approve,3 = Reject )
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateKeHoachTNS')
BEGIN
	DROP PROC sp_NhanSu_UpdateKeHoachTNS
END
GO
CREATE PROC sp_NhanSu_UpdateKeHoachTNS
	@ID					INT,
	@Tinh_trang			INT,
	@KQ					INT OUTPUT  
AS  
BEGIN  
	SET @KQ = 0  
	IF EXISTS (SELECT * FROM KeHoachTNS WHERE ID=@ID)   
	BEGIN  
		UPDATE KeHoachTNS SET Tinh_trang=@Tinh_trang,Ly_do_reject=null,Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
		SELECT @KQ = ID FROM KeHoachTNS WHERE ID=@ID
	END  
END
GO

