/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	24/05/2011
	Mục Đích	:	Xóa tiêu chuẩn không thích hợp
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_DeleteTieuChuan')
BEGIN
	DROP PROC sp_NhanSu_DeleteTieuChuan
END
GO
CREATE PROC sp_NhanSu_DeleteTieuChuan
	@ID					INT,
	@KQ					INT OUTPUT
AS  
BEGIN  
	SET @KQ = -1  
	IF EXISTS (SELECT * FROM TieuChuan WHERE ID=@ID)   
	BEGIN  
		DELETE FROM TieuChuan WHERE ID=@ID
		SET @KQ = 1
	END  
END

GO
