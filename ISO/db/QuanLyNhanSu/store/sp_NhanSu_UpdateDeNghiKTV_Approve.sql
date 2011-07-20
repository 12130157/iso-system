/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	26/05/2011
	Mục Đích	:	Duyệt Đề Nghị Khoán Thử Việc
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateDeNghiKTV_Approve')
BEGIN
	DROP PROC sp_NhanSu_UpdateDeNghiKTV_Approve
END
GO
CREATE PROC sp_NhanSu_UpdateDeNghiKTV_Approve  
	@ID					INT,
	@Ma_nguoi_duyet		INT,
	@KQ					INT OUTPUT
AS  
BEGIN  
	SET @KQ = 0
	IF EXISTS (SELECT * FROM DeNghiKTV WHERE ID=@ID)   
	BEGIN
		DECLARE @Tinh_trang INT
		SET @Tinh_trang = (SELECT Tinh_trang FROM DeNghiKTV WHERE ID=@ID)
		IF(@Tinh_trang=1)
		BEGIN
			UPDATE DeNghiKTV SET Tinh_trang='2',Truong_khoa=@Ma_nguoi_duyet,Ngay_TK_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
			SET @KQ = 1
		END
		IF(@Tinh_trang=2)
		BEGIN
			UPDATE DeNghiKTV SET Tinh_trang='3',Phong_DT=@Ma_nguoi_duyet,Ngay_DT_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
			SET @KQ = 1
		END
		IF(@Tinh_trang=3)
		BEGIN
			UPDATE DeNghiKTV SET Tinh_trang='4',Phong_HC=@Ma_nguoi_duyet,Ngay_HC_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
			SET @KQ = 1
		END
		IF(@Tinh_trang=4)
		BEGIN
			UPDATE DeNghiKTV SET Tinh_trang='5',Hieu_truong=@Ma_nguoi_duyet,Ngay_HT_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
			SET @KQ = 1
		END
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
