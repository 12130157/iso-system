

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_getNgayGioHeThong]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_getNgayGioHeThong]
GO
CREATE PROCEDURE sp_ISO_getNgayGioHeThong

AS
BEGIN
	SELECT Convert(varchar(10),GETDATE(),110) As NgayHeThong ,Convert(varchar(10),GETDATE(),108)  AS GioHeThong				
END