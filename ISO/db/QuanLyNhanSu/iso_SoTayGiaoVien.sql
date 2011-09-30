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


