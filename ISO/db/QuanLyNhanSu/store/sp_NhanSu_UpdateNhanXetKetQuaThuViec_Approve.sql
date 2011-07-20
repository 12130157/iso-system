/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	17/06/2011
	Mục Đích	:	Approve Nhận Xét Kết Quả Thử Việc
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateNhanXetKetQuaThuViec_Approve')
BEGIN
	DROP PROC sp_NhanSu_UpdateNhanXetKetQuaThuViec_Approve
END
GO
CREATE PROC sp_NhanSu_UpdateNhanXetKetQuaThuViec_Approve
	@ID					INT,
	@Nguoi_duyet		INT,
	@Ghi_chu			INT,
	@KQ					INT OUTPUT
AS
BEGIN
	SET @KQ = 0  
	IF EXISTS (SELECT * FROM NhanXetKetQuaThuViec WHERE ID=@ID)   
	BEGIN  
		UPDATE NhanXetKetQuaThuViec SET Tinh_trang='2',Nguoi_duyet=@Nguoi_duyet,Ghi_chu=@Ghi_chu,Ngay_duyet=GETDATE(),Ngay_cap_nhat_cuoi=GETDATE() WHERE ID=@ID
		SET @KQ=@ID
	END
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_InsertNhanXetKetQuaThuViec 1,2,3,4,5,6,'1/1/1991','8','9','10','11','12',@KQ OUTPUT
SELECT @KQ

SELECT * FROM NhanXetKetQuaThuViec
*/
