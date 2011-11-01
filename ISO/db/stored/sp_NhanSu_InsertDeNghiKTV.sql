/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	24/05/2011
	Mục Đích	:	Thêm Đề Nghị Khoán Thử Việc
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_InsertDeNghiKTV')
BEGIN
	DROP PROC sp_NhanSu_InsertDeNghiKTV
END
GO
CREATE PROC sp_NhanSu_InsertDeNghiKTV  
	@Nguoi_du_tuyen			INT,
	@Tinh_trang				INT,
	@Ma_truong_khoa			INT,
	@KQ						INT OUTPUT  
AS  
BEGIN  
	SET @KQ = -1
	IF NOT EXISTS (SELECT * FROM DeNghiKTV WHERE Nguoi_du_tuyen=@Nguoi_du_tuyen)   
	BEGIN  
		INSERT INTO DeNghiKTV(Nguoi_du_tuyen,Tinh_trang,Ngay_lap,Truong_khoa,Ngay_cap_nhat_cuoi,User1,User2,User3,User4,User5) VALUES(@Nguoi_du_tuyen,@Tinh_trang,GETDATE(),@Ma_truong_khoa,GETDATE(),'','','','','')
		SELECT @KQ=MAX(ID) FROM DeNghiKTV
	END  
	ELSE
	BEGIN
		UPDATE DeNghiKTV SET Tinh_trang=@Tinh_trang WHERE Nguoi_du_tuyen=@Nguoi_du_tuyen
		SELECT @KQ=ID FROM DeNghiKTV WHERE Nguoi_du_tuyen=@Nguoi_du_tuyen
	END
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_InsertDeNghiKTV '1','0',@KQ OUTPUT
SELECT @KQ

SELECT * FROM DeNghiNhanSu

SELECT * FROM DeNghiKTV

*/
