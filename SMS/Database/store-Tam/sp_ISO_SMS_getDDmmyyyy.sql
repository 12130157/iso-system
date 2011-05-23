/***********************************************************
* Purpose : GET TKB BY MMYYYY
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: GET TKB BY MMYYYY
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_getDDmmyyyy') 
BEGIN
	DROP PROC sp_ISO_SMS_getDDmmyyyy
END
GO
CREATE PROC sp_ISO_SMS_getDDmmyyyy
	@maSinhVien		varchar(50),
	@mm				int,
	@yyyy			int
AS
BEGIN
	SELECT		E.User1 AS 'Ten_Sinh_Vien',A.Buoi,CAST(DATEPART(DAY,A.Ngay_Hoc) AS VARCHAR)+'/'+
				CAST(DATEPART(MONTH,A.Ngay_Hoc) AS VARCHAR)+'/'+
				CAST(DATEPART(YEAR,A.Ngay_Hoc) AS VARCHAR) AS 'Ngay_Hoc',
				F.User2 AS 'Ten_Mon_Hoc',dbo.fnc_ISO_SMS_statusDiemDanh(A.Tinh_Trang) AS 'Tinh_Trang'				
	FROM		ChiTietDiemDanh		AS A
	INNER JOIN	ThanhVienDiemDanh	AS B	ON	A.Ma_TVDD			= B.ID
	INNER JOIN	DiemDanh			AS C	ON	B.Ma_Diem_Danh		= C.ID
	INNER JOIN	ThanhVien			AS D	ON	B.Ma_Thanh_Vien		= D.ID
	INNER JOIN	ChiTietThanhVien	AS E	ON	D.Ten_DN			= E.Ten_Dang_Nhap
	INNER JOIN	MonHoc				AS F	ON	C.Ma_Mon_Hoc		= F.ID
	WHERE		E.Ten_Dang_Nhap							= @maSinhVien
	AND			CAST(DATEPART(MONTH,A.Ngay_Hoc) AS INT) = @mm 
	AND			CAST(DATEPART(YEAR,A.Ngay_Hoc) AS INT)	= @yyyy
END

--exec sp_ISO_SMS_getDDmmyyyy 'cuong_lc.hv',02,2011
--select * from ChiTietDiemDanh Where Ma_TVDD = 91
--select * from DiemDanh
--select * from ThanhVienDiemDanh where Ma_Diem_Danh = 7
--select * from ThanhVien where id = 38

--select * from ThanhVien Where ID = 65