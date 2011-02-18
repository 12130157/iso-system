if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_CheckMonHocAndChuongTrinh]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_CheckMonHocAndChuongTrinh]
GO
CREATE PROCEDURE sp_ISO_CheckMonHocAndChuongTrinh
	@Ma_chuong_trinh int,
	@Ma_mon_hoc int,
	@result varchar(1) output
AS
BEGIN
	If exists(
		SELECT * 
		FROM DeCuongMonHoc
		WHERE Ma_chuong_trinh = @Ma_chuong_trinh and Ma_mon_hoc = @Ma_mon_hoc)
	Begin
		SET @result = '1'
	End
	Else
	Begin
		SET @result = '0'
	End
END
