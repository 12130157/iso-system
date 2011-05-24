
--fnc_ISO_SMS_statusDiemDanh.sql
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

GO

--fnc_ISO_SMS_statusReply.sql
IF EXISTS (Select * from dbo.SYSOBJECTS Where name='fnc_ISO_SMS_statusReply')
BEGIN
	 DROP FUNCTION fnc_ISO_SMS_statusReply
END
GO

CREATE FUNCTION fnc_ISO_SMS_statusReply
	(@Ma_Tin_Nhan_Tra_Loi int)
	RETURNS nvarchar(20)
AS
BEGIN
declare @rs nvarchar(20)
IF @Ma_Tin_Nhan_Tra_Loi = ''
	set @rs =  'Not Reply'
ELSE 
	set @rs =  'Replied'
return @rs
END

GO

--fn_statusHopThuDenToString.sql

IF EXISTS (Select * from dbo.SYSOBJECTS Where name='statusToString')
BEGIN
	 DROP FUNCTION statusToString
END
GO

CREATE FUNCTION statusToString
(@status int)
RETURNS nvarchar(20)
AS
BEGIN
declare @rs nvarchar(20)
IF @status = 1
	set @rs =  'Read'
ELSE IF @status = 0
	 set @rs =  'UnRead'
return @rs
END

GO
