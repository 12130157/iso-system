/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	25/05/2011
	Mục Đích	:	Cập Nhật Thời Gian Tuyển Dụng
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_DeleteThoiGianTuyenDung')
BEGIN
	DROP PROC sp_NhanSu_DeleteThoiGianTuyenDung
END
GO
CREATE PROC sp_NhanSu_DeleteThoiGianTuyenDung
	@Ma_CTKHTDNS	INT,
	@KQ				INT OUTPUT  
AS  
BEGIN
	SET @KQ = -1
	IF EXISTS (SELECT * FROM ThoiGianTuyenDung WHERE Ma_CTKHTDNS=@Ma_CTKHTDNS)
	BEGIN
		DELETE FROM ThoiGianTuyenDung WHERE Ma_CTKHTDNS=@Ma_CTKHTDNS
		SET @KQ = 1  
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
