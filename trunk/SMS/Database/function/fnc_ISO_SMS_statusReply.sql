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
