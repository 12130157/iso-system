
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
--http://aa.usno.navy.mil/faq/docs/easter.php
declare @rs nvarchar(20)
IF @status = 1
	set @rs =  'Read'
ELSE set @rs =  'UnRead'
return @rs
END
