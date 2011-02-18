
/***********************************************************
* Purpose : Search "Ke Hoach Giang Day" by Lop && MonHoc
* Author : ToanTT
* Date: 15-06-2010
* Description: Search "Ke Hoach Giang Day" by Lop && MonHoc
***********************************************************/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_FindKHGDByLopAndMonHoc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_FindKHGDByLopAndMonHoc]
GO
CREATE PROCEDURE sp_ISO_FindKHGDByLopAndMonHoc
	@maLop			int,
	@maMonHoc		int,
	@result			varchar(1) output
AS
BEGIN
	If exists(
		SELECT Ma_lop, Ma_mon_hoc
		FROM KEHOACHGIANGDAY
		WHERE Ma_lop = @maLop AND Ma_mon_hoc = @maMonHoc)
		Begin
			SET @result = '1'
		End
	Else
		Begin
			SET @result = '0'
		End
END

