/*
	Người Viết	:	Huỳnh Thị Ngoc Mai
	Ngày Viết	:	24/05/2011
	Mục Đích	:	STORE INSERT NHAN_XET_KET_QUA_THU_VIEC
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateNhanXetKetQuaThuViec')
BEGIN
	DROP PROC sp_NhanSu_UpdateNhanXetKetQuaThuViec
END
GO
CREATE PROC sp_NhanSu_UpdateNhanXetKetQuaThuViec
	@ID					INT,
	@NoiDung1			NVARCHAR(500),
	@NoiDung2			NVARCHAR(500),
	@NoiDung3			NVARCHAR(500),
	@NoiDung4			NVARCHAR(500),
	@Tinh_trang			INT,
	@KQ					INT OUTPUT
AS
BEGIN
	SET @KQ = 0  
	IF EXISTS (SELECT * FROM NhanXetKetQuaThuViec WHERE ID=@ID)   
	BEGIN  
		UPDATE NhanXetKetQuaThuViec SET Ngay_nhan_xet=GETDATE(),Ly_do_reject=null,NoiDung1=@NoiDung1,NoiDung2=@NoiDung2,NoiDung3=@NoiDung3,NoiDung4=@NoiDung4,Tinh_trang=@Tinh_trang,Ngay_cap_nhat_cuoi=GETDATE() WHERE ID=@ID
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
