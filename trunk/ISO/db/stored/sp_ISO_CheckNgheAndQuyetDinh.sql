if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_CheckNgheAndQuyetDinh]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_CheckNgheAndQuyetDinh]
GO
CREATE PROCEDURE sp_ISO_CheckNgheAndQuyetDinh
	@Ma_quyet_dinh int,
	@Ma_nghe int,
	@result varchar(1) output
AS
BEGIN
	If exists(
		SELECT * 
		FROM ChuongTrinhDaoTao
		WHERE Ma_quyet_dinh = @Ma_quyet_dinh and Ma_nghe = @Ma_nghe)
	Begin
		SET @result = '1'
	End
	Else
	Begin
		SET @result = '0'
	End
END
