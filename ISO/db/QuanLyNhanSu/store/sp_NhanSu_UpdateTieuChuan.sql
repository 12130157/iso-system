/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	24/05/2011
	Mục Đích	:	Xóa tiêu chuẩn không thích hợp
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateTieuChuan')
BEGIN
	DROP PROC sp_NhanSu_UpdateTieuChuan
END
GO
CREATE PROC sp_NhanSu_UpdateTieuChuan
	@ID					INT,
	@Tieu_chuan			NVARCHAR(500),
	@KQ					INT OUTPUT
AS  
BEGIN  
	SET @KQ = 0 
	IF EXISTS (SELECT * FROM TieuChuan WHERE ID=@ID)   
	BEGIN  
		UPDATE TieuChuan SET Tieu_chuan=@Tieu_chuan,Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
		SET @KQ = 1
	END  
END

GO
