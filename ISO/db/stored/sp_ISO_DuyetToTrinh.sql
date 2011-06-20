if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DuyetToTrinh]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DuyetToTrinh]
GO
CREATE PROCEDURE sp_ISO_DuyetToTrinh
	@Ma_to_trinh	int,
	@Tinh_trang		varchar,
	@Ma_nguoi_tao	int,
	@Ma_nguoi_duyet	int,
	@Ly_do_reject	nvarchar(2000)
AS
BEGIN
	exec sp_ISO_DuyetThayDoiMonHocTKB @Tinh_trang, @Ma_to_trinh, @Ma_nguoi_tao
	exec sp_ISO_DuyetThayDoiTKB @Tinh_trang, @Ma_to_trinh, @Ma_nguoi_tao
	IF(@Tinh_trang = '2')
	BEGIN
		UPDATE ToTrinh SET
			Ma_nguoi_duyet = @Ma_nguoi_duyet,
			Tinh_trang = @Tinh_trang,	
			Ngay_duyet = GETDATE()
		WHERE ID = @Ma_to_trinh
	END
	ELSE
	BEGIN
		UPDATE ToTrinh SET
			Ma_nguoi_duyet = @Ma_nguoi_duyet,
			Ly_do_reject = @Ly_do_reject,
			Tinh_trang = @Tinh_trang,
			Ngay_duyet = GETDATE()
		WHERE ID = @Ma_to_trinh
	END
END