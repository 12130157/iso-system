
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_ThayDoiThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_ThayDoiThietBi]
GO
CREATE PROC sp_QLTB_ThayDoiThietBi
	@ID	int,
	@Ma_phong int
AS
BEGIN
	DECLARE @Ma_khoa int
	SELECT @Ma_khoa = 
	UPDATE ThietBi 
		SET Ma_phong = @Ma_phong
END
--select * from phongban