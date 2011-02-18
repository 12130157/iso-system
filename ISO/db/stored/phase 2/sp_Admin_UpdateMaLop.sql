
/***********************************************************
* Purpose : updat ma lop
* Author : TuanHQ
* Date: 20-09-2010S
* Description: update ma lop
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_UpdateMaLop]'))
drop proc [sp_Admin_UpdateMaLop]
GO
CREATE PROC sp_Admin_UpdateMaLop
	@ID			int,
	@Ma_lop_hoc int

AS
BEGIN
	Update chitietthanhvien INNER JOIN THANHVIEN as B ON A.Ten_dang_nhap = B.Ten_dn
	set
		Ma_lop_hoc = @Ma_lop_hoc
	where B.ID = @ID	

END