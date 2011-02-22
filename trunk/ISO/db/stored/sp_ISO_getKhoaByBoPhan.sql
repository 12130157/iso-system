/***********************************************************
* Purpose : insert phong ban
* Author : TuanHQ
* Date: 02-04-2010S
* Description: insert phong ban
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].sp_ISO_GetKhoaByBoPhan') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].sp_ISO_GetKhoaByBoPhan
GO
CREATE PROC sp_ISO_GetKhoaByBoPhan
	@MaBoPhan	int
AS
BEGIN
	DECLARE @boPhanBGH int
	DECLARE @boPhanPHC int
	DECLARE @boPhanDBCL int
	DECLARE @boPhanPDT int
	DECLARE @boPhanAdmin int
	SET @boPhanBGH=0
	SET @boPhanPHC=2
	SET @boPhanDBCL=4
	SET @boPhanPDT=1
	SET @boPhanAdmin=16
	IF(@MaBoPhan	= @boPhanBGH OR
		@MaBoPhan	= @boPhanPDT OR
		@MaBoPhan	= @boPhanDBCL OR
		@MaBoPhan	= @boPhanAdmin OR
		@MaBoPhan	= @boPhanPHC )
	BEGIN
			SELECT ID AS MaKhoa,Ten AS Ten,Ma_truong_khoa As MaTruongKhoa FROM Khoa_trungtam
	END
	ELSE
	BEGIN
			SELECT ID AS MaKhoa,Ten AS Ten,Ma_truong_khoa As MaTruongKhoa FROM Khoa_trungtam WHERE ID=@MaBoPhan
	END
END





