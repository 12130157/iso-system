IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE NAME='SoTayGiaoVien')
BEGIN
	DROP TABLE SoTayGiaoVien
END
GO
CREATE TABLE SoTayGiaoVien
(
	ID INT PRIMARY KEY IDENTITY(0,1),
	Ma_KHGD INT,
	Quan_ly_hoc_sinh_ca_biet NTEXT,
	Danh_gia_qui_trinh_giang_day NTEXT,
	Tinh_trang INT,
	Ngay_cap_nhat_cuoi DATETIME,
	User1 NVARCHAR(100),
	User2 NVARCHAR(100),
	User3 NVARCHAR(100),
	User4 NVARCHAR(100),
	User5 NVARCHAR(100)
)
GO
IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE NAME='sp_ISO_UpdateSoTayGiaoVien')
BEGIN
	DROP PROC sp_ISO_UpdateSoTayGiaoVien
END
GO
CREATE PROC sp_ISO_UpdateSoTayGiaoVien
	@ID INT,
	@Quan_ly_hoc_sinh_ca_biet NTEXT,
	@Danh_gia_qui_trinh_giang_day NTEXT,
	@Tinh_trang INT,
	@KQ INT OUTPUT
AS
BEGIN
	SET @KQ=-1
	IF EXISTS (SELECT * FROM SoTayGiaoVien WHERE ID=@ID)
	BEGIN
		UPDATE SoTayGiaoVien 
		SET Quan_ly_hoc_sinh_ca_biet=@Quan_ly_hoc_sinh_ca_biet, 
			Danh_gia_qui_trinh_giang_day=@Danh_gia_qui_trinh_giang_day, 
			Tinh_trang=@Tinh_trang, Ngay_cap_nhat_cuoi=GETDATE()
		WHERE ID=@ID
		SET @KQ=@ID
	END
END