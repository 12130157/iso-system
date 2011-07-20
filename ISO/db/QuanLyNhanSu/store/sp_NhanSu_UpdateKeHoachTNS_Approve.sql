/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	24/05/2011
	Mục Đích	:	Cập nhật cột Tinh_trang( 0 = luu, 1 = gui, 2 = Hieu Truong Da Duyet )
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateKeHoachTNS_Approve')
BEGIN
	DROP PROC sp_NhanSu_UpdateKeHoachTNS_Approve
END
GO
CREATE PROC sp_NhanSu_UpdateKeHoachTNS_Approve
	@ID					INT,
	@Nguoi_duyet		INT,
	@KQ					INT OUTPUT  
AS  
BEGIN  
	SET @KQ = 0  
	IF EXISTS (SELECT * FROM KeHoachTNS WHERE ID=@ID)   
	BEGIN  
		UPDATE KeHoachTNS SET Tinh_trang='2',Nguoi_duyet=@Nguoi_duyet,Ngay_duyet=GETDATE(),Ngay_cap_nhat_cuoi=GETDATE() WHERE ID=@ID
		SELECT @KQ = ID FROM KeHoachTNS WHERE ID=@ID
	END  
END
GO

--DECLARE @KQ INT
--EXEC sp_UpdateKeHoachTNS_Approve '1','2','1',@KQ OUTPUT
--SELECT @KQ

