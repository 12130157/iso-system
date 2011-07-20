/*
	Người Viết	:	Huỳnh Thị Ngoc Mai
	Ngày Viết	:	24/05/2011
	Mục Đích	:	STORE INSERT NHAN_XET_KET_QUA_THU_VIEC
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_InsertNhanXetKetQuaThuViec')
BEGIN
	DROP PROC sp_NhanSu_InsertNhanXetKetQuaThuViec
END
GO
CREATE PROC sp_NhanSu_InsertNhanXetKetQuaThuViec  
	@Nguoi_nhan_xet		INT,
	@Thoi_gian_thu_viec	INT,
	@KQ					INT OUTPUT
AS
BEGIN  
	SET @KQ = 0
	IF NOT EXISTS (SELECT * FROM NhanXetKetQuaThuViec WHERE Nguoi_nhan_xet=@Nguoi_nhan_xet)   
	BEGIN  
		INSERT INTO NhanXetKetQuaThuViec VALUES(@Nguoi_nhan_xet,@Thoi_gian_thu_viec,null,null,null,null,'0',null,null,null,null,null,GETDATE(),'','','','','')
		SELECT @KQ=MAX(ID) FROM NhanXetKetQuaThuViec
	END  
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_InsertNhanXetKetQuaThuViec 1,2,3,4,5,6,'1/1/1991','8','9','10','11','12',@KQ OUTPUT
SELECT @KQ

SELECT * FROM NhanXetKetQuaThuViec
*/
