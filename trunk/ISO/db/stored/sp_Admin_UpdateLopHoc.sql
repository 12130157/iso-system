
/***********************************************************
* Purpose : update lop hoc
* Author : TuanHQ
* Date: 18-04-2010S
* Description: update lop hoc
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_UpdateLopHoc]'))
drop proc [sp_Admin_UpdateLopHoc]
GO
CREATE PROC sp_Admin_UpdateLopHoc
	@ID				int,
	@Ki_hieu		nvarchar(80),
	@Ma_lop_truong	int
AS
BEGIN
	Update LopHoc 
		Set 
			Ki_hieu = @Ki_hieu , 
			Ma_lop_truong = @Ma_lop_truong 
	where ID = @ID
END