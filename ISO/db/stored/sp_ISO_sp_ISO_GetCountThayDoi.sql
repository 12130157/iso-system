if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetCountThayDoi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetCountThayDoi]
GO
CREATE PROCEDURE sp_ISO_GetCountThayDoi
	@Count	int output
AS
BEGIN
	SET @Count = 0
	DECLARE @Count1 int
	SELECT @Count = COUNT(*) FROM MonHocTKBThayDoi WHERE Ma_to_trinh = -2
	SELECT @Count1 = COUNT(*) FROM ChiTietTKBThayDoi WHERE Ma_to_trinh = -2
	SET @Count = @Count + @Count1
	SELECT @Count AS CountThayDoi
END

