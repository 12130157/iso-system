IF EXISTS (Select * from dbo.SYSOBJECTS Where name='fnc_ISO_SMS_statusReply')
BEGIN
	 DROP FUNCTION fnc_ISO_SMS_statusReply
END
GO

CREATE FUNCTION fnc_ISO_SMS_statusReply
	(@SoDienThoai int)
	RETURNS nvarchar(20)
AS
BEGIN
declare @rs nvarchar(20)
IF @SoDienThoai = null
	set @rs =  'Not Reply'
ELSE 
	set @rs =  'Replied'
return @rs
END
