/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	27/05/2011
	Mục Đích	:	Tiêu Chuẩn Tuyển Nhân Sự
*/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_InsertTieuChuan')
BEGIN
	DROP PROC sp_NhanSu_InsertTieuChuan
END
GO
CREATE PROC sp_NhanSu_InsertTieuChuan
	@Ma_de_nghi			INT,
	@Tieu_chuan			NVARCHAR(500),
	@KQ					INT OUTPUT  
AS  
BEGIN  
	SET @KQ = -1
	IF EXISTS (SELECT * FROM DeNghiNhanSu WHERE ID=@Ma_de_nghi)
	BEGIN
		DECLARE @Tinh_trang INT
		SET @Tinh_trang = (SELECT Tinh_trang FROM DeNghiNhanSu WHERE ID=@Ma_de_nghi)
		IF(@Tinh_trang = 0 OR @Tinh_trang = 6)
		BEGIN  
			INSERT INTO TieuChuan(Ma_de_nghi,Tieu_chuan,Ngay_cap_nhat_cuoi,User1,User2,User3,User4,User5) VALUES(@Ma_de_nghi,@Tieu_chuan,GETDATE(),'','','','','')
			SELECT @KQ=ID FROM TIEUCHUAN WHERE Ma_de_nghi=@Ma_de_nghi AND Tieu_chuan=@Tieu_chuan  
		END 
	END
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_InsertTieuChuan 1,1,'3','1/1/1991','5','6','7','8','9',@KQ OUTPUT
SELECT @KQ

SELECT * FROM TieuChuan

SELECT * FROM DeNghiNhanSu
*/
