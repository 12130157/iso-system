IF EXISTS (Select * from dbo.SYSOBJECTS Where name='fnc_ISO_SMS_statusDiemDanh')
BEGIN
	 DROP FUNCTION fnc_ISO_SMS_statusDiemDanh
END
GO

CREATE FUNCTION fnc_ISO_SMS_statusDiemDanh
	(@tinhTrangDiemDanh int)
	RETURNS nvarchar(20)
AS
BEGIN
declare @rs nvarchar(20)
IF @tinhTrangDiemDanh = 4
	set @rs =  'Co'
ELSE 
	set @rs =  'Vang'
return @rs
END
