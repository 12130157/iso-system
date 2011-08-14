if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_FindBangPhanCongDaTao]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_FindBangPhanCongDaTao]
GO
CREATE PROCEDURE sp_ISO_FindBangPhanCongDaTao
	@Ma_nam_hoc varchar(4),
	@Hoc_ki		varchar,
	@Ma_khoa	int,
	@result varchar(1) output
AS
BEGIN
	If exists(SELECT * FROM BangPhanCong WHERE Ma_nam_hoc = @Ma_nam_hoc AND Hoc_ki = @Hoc_ki AND Ma_khoa = @Ma_khoa)
	Begin
		SET @result = '1'
	End
	Else
	Begin
		SET @result = '0'
	End
END

