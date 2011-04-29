
--CREATE
--Them 2 bang
--1 bang LoaiPhieuKPPN

CREATE TABLE LoaiChuongTrinh
(
	ID int identity(0,1) primary key,
	Ten_Loai nvarchar(100),
	User1 varchar(20),
	User2 varchar(20),
	User3 varchar(20),
	User4 varchar(20),
	User5 varchar(20)
)


--1 bang DSThuocPhieuKPPN
CREATE TABLE DSThuocPhieuKPPN
(
	Ma_Chuong_Trinh int,
	Ma_Phieu int,
	Ma_Loai int,
	Tinh_Trang int default 0,
	User1 varchar(20),
	User2 varchar(20),
	User3 varchar(20),
	User4 varchar(20),
	User5 varchar(20),
	Primary Key(Ma_Chuong_Trinh,Ma_Phieu,Ma_Loai)
)


--INSERT

INSERT INTO LoaiChuongTrinh(Ten_loai) VALUES(N'Kế hoạch giảng dạy')

INSERT INTO LoaiChuongTrinh(Ten_loai) VALUES(N'Giáo án')

--

--FOREIGN KEY

ALTER TABLE [DSThuocPhieuKPPN] ADD CONSTRAINT [DSThuocPhieuKPPN_MaLoai] 
    FOREIGN KEY ([Ma_Loai]) REFERENCES [LoaiChuongTrinh] ([ID])
GO

ALTER TABLE [DSThuocPhieuKPPN] ADD CONSTRAINT [DSThuocPhieuKPPN_MaPhieu] 
    FOREIGN KEY ([Ma_Phieu]) REFERENCES [PhieuKPPN] ([ID])
GO


