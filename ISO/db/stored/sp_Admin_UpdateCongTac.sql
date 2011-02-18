
/***********************************************************
* Purpose : updat cong tac
* Author : TuanHQ
* Date: 30-07-2010S
* Description: update cong tac
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_UpdateCongTac]'))
drop proc [sp_Admin_UpdateCongTac]
GO
CREATE PROC sp_Admin_UpdateCongTac
	@ID			int,
	@Noi_dung	nvarchar(4000),
	@Ghi_chu	nvarchar(400)
AS
BEGIN
	Update congtac 
	set
		Noi_dung = @Noi_dung,
		Ghi_chu = @Ghi_chu
	where ID = @ID	
	UPDATE NoiDungChiTietKHDT
	SET 
		Noi_dung_cong_tac = @Noi_dung
	WHERE Ma_cong_tac = @ID
END