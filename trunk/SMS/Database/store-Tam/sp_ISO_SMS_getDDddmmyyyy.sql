/***********************************************************
* Purpose : GET TKB BY MMYYYY
* Author : Nguyen Chi Tam
* Date: 6 -4 - 2011
* Description: GET TKB BY MMYYYY
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_ISO_SMS_getDDddmmyyyy') 
BEGIN
	DROP PROC sp_ISO_SMS_getDDddmmyyyy
END
GO
CREATE PROC sp_ISO_SMS_getDDddmmyyyy
	@maSinhVien		varchar(50),
	@dd				int,
	@mm				int,
	@yyyy			int
AS
BEGIN
	SELECT		H.Buoi,CAST(DATEPART(DAY,A.Ngay_Hoc) AS VARCHAR)+'/'+
				CAST(DATEPART(MONTH,A.Ngay_Hoc) AS VARCHAR)+'/'+
				CAST(DATEPART(YEAR,A.Ngay_Hoc) AS VARCHAR) AS 'Ngay Hoc',
				G.User2,dbo.fnc_ISO_SMS_statusDiemDanh(A.Tinh_Trang)				
	FROM		ChiTietDiemDanh		AS A
	INNER JOIN	ThanhVienDiemDanh	AS B	ON A.Ma_TVDD		= B.ID
	INNER JOIN	DiemDanh			AS C	ON B.Ma_Diem_Danh	= C.ID
	INNER JOIN	ThoiKhoaBieu		AS D	ON C.Ma_CT_TKB		= D.ID
	INNER JOIN	LopHoc				AS E	ON D.Ma_Lop			= E.ID
	INNER JOIN	ChiTietThanhVien	AS F	ON E.ID				= F.Ma_Lop_Hoc
	INNER JOIN	MonHoc				AS G	ON C.Ma_Mon_Hoc		= G.ID
	INNER JOIN	ChiTietTKB			AS H	ON D.ID				= H.Ma_TKB
											AND A.Ngay_Hoc	= H.Ngay_Hoc
	WHERE		F.Ten_Dang_Nhap							= @maSinhVien
	AND			CAST(DATEPART(DAY,A.Ngay_Hoc) AS INT)	= @mm 
	AND			CAST(DATEPART(MONTH,A.Ngay_Hoc) AS INT) = @mm 
	AND			CAST(DATEPART(YEAR,A.Ngay_Hoc) AS INT)	= @yyyy
END