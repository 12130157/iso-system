/*
	Người Viết	:	Huỳnh Thị Ngoc Mai
	Ngày Viết	:	24/05/2011
	Mục Đích	:	xét lương
	SELECT * FROM LUONG
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_InsertLuong')
BEGIN
	DROP PROC sp_NhanSu_InsertLuong
END
GO
CREATE PROC sp_NhanSu_InsertLuong  
	@Ma_thanh_vien		INT,
	@Loai_vien_chuc		VARCHAR(10),
	@Ma_ngach			VARCHAR(20),
	@Bac_luong			INT,
	@He_so_luong		FLOAT,
	@Ghi_chu			NVARCHAR(1000),
	@KQ					INT OUTPUT  
AS  
BEGIN  
	SET @KQ = -1
	IF EXISTS (SELECT * FROM THANHVIEN WHERE ID=@Ma_thanh_vien)
	BEGIN
		INSERT INTO LUONG(Ma_thanh_vien,Loai_vien_chuc,Ma_ngach,Bac_luong,He_so_luong,Ngay_xep_luong,Ngay_cap_nhat_cuoi,Ghi_chu) 
		VALUES (@Ma_thanh_vien,@Loai_vien_chuc,@Ma_ngach,@Bac_luong,@He_so_luong,getdate(),getdate(),@Ghi_chu)
		SELECT @KQ=MAX(ID) FROM LUONG
	END  
END  
GO

