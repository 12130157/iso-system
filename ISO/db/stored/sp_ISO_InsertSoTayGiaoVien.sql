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
IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE NAME='sp_ISO_InsertSoTayGiaoVien')
BEGIN
	DROP PROC sp_ISO_InsertSoTayGiaoVien
END
GO
CREATE PROC sp_ISO_InsertSoTayGiaoVien
	@Ma_KHGD INT,
	@KQ INT OUTPUT
AS
BEGIN
	SET @KQ=-1
	IF NOT EXISTS (SELECT * FROM SoTayGiaoVien WHERE Ma_KHGD=@Ma_KHGD)
	BEGIN
		INSERT INTO SoTayGiaoVien(Ma_KHGD,Tinh_trang,Ngay_cap_nhat_cuoi) VALUES (@Ma_KHGD,'0',GETDATE())
		SELECT @KQ=MAX(ID) FROM SoTayGiaoVien
	END
	ELSE
	BEGIN
		SELECT @KQ=ID FROM SoTayGiaoVien WHERE Ma_KHGD=@Ma_KHGD
	END
END