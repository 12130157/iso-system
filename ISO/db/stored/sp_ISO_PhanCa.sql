if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_PhanCa]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_PhanCa]
GO
CREATE PROC sp_ISO_PhanCa
	@ID		int,
	@User2	varchar
AS
BEGIN
	DECLARE @Ten_DN varchar(20)
	SELECT @Ten_DN = Ten_DN FROM ThanhVien WHERE ID = @ID
	UPDATE ChiTietThanhVien SET User2 = @User2
		WHERE Ten_dang_nhap = @Ten_DN
END