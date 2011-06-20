if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GuiLaiToTrinh]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GuiLaiToTrinh]
GO
CREATE PROCEDURE sp_ISO_GuiLaiToTrinh
	@ID		int,
	@Tinh_trang_gui		int,
	@Ngay_gui_output	varchar(10) output,
	@Gio_gui_output		varchar(10) output
AS
BEGIN
	UPDATE ToTrinh SET Tinh_trang = @Tinh_trang_gui, Ly_do_reject = NULL, Ngay_gui = GETDATE() WHERE ID = @ID
	UPDATE MonHocTKBThayDoi SET Tinh_trang = @Tinh_trang_gui WHERE Ma_to_trinh = @ID
	UPDATE ChiTietTKBThayDoi SET Tinh_trang = @Tinh_trang_gui WHERE Ma_to_trinh = @ID

	SELECT @Ngay_gui_output = Convert(varchar(10), Ngay_gui, 103), @Gio_gui_output = Convert(varchar(10), Ngay_gui, 108) 
		FROM ToTrinh WHERE ID = @ID 
END